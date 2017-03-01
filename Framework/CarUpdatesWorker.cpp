
#include <QTime>
#include <QMutex>
#include <QThread>
#include <QDateTime>
#include <QCoreApplication>

#ifndef Q_PROCESSOR_ARM
#include <QCommandLineParser>
#endif

#include "CarUpdatesWorker.hpp"

CARFOX_BEGIN_NAMESPACE

CarUpdatesWorker::CarUpdatesWorker()
{

}

CarUpdatesWorkerStateData &CarUpdatesWorker::data()
{
    return mStateData;
}

// 开始工作,线程启动的时候会调用
void CarUpdatesWorker::onStarted()
{
    if (!mSerialPort) {
        mSerialPort = std::make_shared<QSerialPort>(nullptr);
    }

    initializeSerialPort();

    mLongPressDetectionTimer = std::make_shared<QTimer>();
    connect(mLongPressDetectionTimer.get(), &QTimer::timeout, this, &CarUpdatesWorker::handleLongPressTimeout);

    startTimer(3 * 1000); // 3 * 1000 ms 定时,  执行timerEvent ， 目的是发送心跳包
}

// 打开串口
void CarUpdatesWorker::activate()
{
    static QMutex activateMutex;
    activateMutex.lock();

    qDebug() << "Activate serial port";

    if (!mSerialPort->isOpen()) {
        if (mSerialPort->open(QIODevice::ReadWrite) && mSerialPort->clear(QSerialPort::AllDirections)) {
            qDebug() << "Open serial port successfully";
            mSerialEnabled = true;
            mSerialPort->clear(QSerialPort::AllDirections);
            // 当程序退出时，关闭串口
            connect(qApp, &QCoreApplication::aboutToQuit, mSerialPort.get(), &QSerialPort::close,
                    static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
            // 当串口数据过来的时候，执行receriveData。直接调用。
            connect(mSerialPort.get(), &QSerialPort::readyRead, this, &CarUpdatesWorker::receiveData,
                    static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));

            // 向MCU发送第一帧
            sendDefaultSettingsFrame();
            QCoreApplication::processEvents();
        }
        else {
            qWarning() << "Open serial port failed";
        }
    }
    else {
        mSerialEnabled = true;
    }

    activateMutex.unlock();
}

// 暂时没啥作用
void CarUpdatesWorker::deactivate()
{
    qDebug() << "Deactivate serial port";
    mSerialEnabled = false;
}

void CarUpdatesWorker::updateSignals()
{
    checkCarUpdatesSignals();
}

/*
 * 重要函数： 解析串口过来的数据
 * 返回值：数据解析状态标志位
 * 参数： 帧头 长度 crc magic 数度段
 */
CarUpdatesWorker::DataParseStatus CarUpdatesWorker::parseData(MagicFrame *magicFrame, QByteArray &byteArray)
{
    if (magicFrame->length == GENERAL_INFO_LEN && magicFrame->magic == MAGIC_GENERAL_UP) {
        if (byteArray.length() >= GENERAL_FRAME_LEN && (quint8)0x55 == (quint8)byteArray[GENERAL_FRAME_LEN - 1]) { // 表明有一帧数据, fixme：这里的> 可能有问题。
            QByteArray bf = byteArray.left(GENERAL_FRAME_LEN);
            byteArray.remove(0, GENERAL_FRAME_LEN);
            GeneralFrame *generalFrame = (GeneralFrame*)bf.data();
            if (generalFrame->crc == crc16Check((quint8*)(&(generalFrame->magic)), MAGIC_LEN + GENERAL_INFO_LEN)) {
                updateCarUpdates(generalFrame->generalInfo);
            }
            return CarUpdatesWorker::Successded;
        }
        else {
            if (byteArray.length() < GENERAL_FRAME_LEN) {
                return CarUpdatesWorker::LengthFailed;
            }
            else {
                byteArray.remove(0, 1);
                return CarUpdatesWorker::TailFlagFailed;
            }
        }
    }
    return CarUpdatesWorker::MagicFailed;
}

/*
 * 重要函数： 发送数据
 */
void CarUpdatesWorker::sendData(const QByteArray &data, uint frameType)
{
    MagicFrame magicFrame;
    memset(&magicFrame, 0, MAGIC_FRAME_LEN);

    magicFrame.head = 0xAA;
    magicFrame.length = data.length();
    magicFrame.crc = 0;
    magicFrame.magic = frameType;

    QByteArray sData((char*)&magicFrame, MAGIC_FRAME_LEN);
    sData.push_back(data);
    sData.push_back(0x55);

    quint16 *crc = (quint16*)(sData.data() + 2);
    *crc = crc16Check((quint8*)sData.data() + 4, MAGIC_LEN + magicFrame.length);

    if (mSerialPort->write(sData) != -1) {
        // send ok.
    }
    else {
        qWarning() << "Send frame data failed!";
    }
}

void CarUpdatesWorker::checkCarUpdatesSignals()
{
    mSignalDataInitialized = false;
}

/*
 * 重要函数： 收到MCU的第一帧通用帧/专用帧
 */
void CarUpdatesWorker::initializeFirstFrame(CarUpdatesWorker::InitializeType type)
{
    if (!mGeneralFrameInitialized && type == GeneralFrameInitialized) {
        qDebug() << "GeneralFrameInitialized";
        mGeneralFrameInitialized = true;
    }
    else if (!mSpecialFrameInitialized && type == SpecialFrameInitialized) {
        qDebug() << "SpecialFrameInitialized";
        mSpecialFrameInitialized = true;
    }
    else {
        return;
    }

    if (mGeneralFrameInitialized && mSpecialFrameInitialized) {
        qDebug() << "initialized, deactivate serial port";
        this->deactivate();
        emit initialized();
    }
}

bool CarUpdatesWorker::isInitialized()
{
    return mGeneralFrameInitialized && mSpecialFrameInitialized;
}

bool CarUpdatesWorker::isSerialPortOpened()
{
    return mSerialPort->isOpen();
}

void CarUpdatesWorker::sendCommandReq(bool commandReq)
{
    if (!this->isSerialPortOpened()) {
        return;
    }

    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.closeReq = commandReq;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendCloseReq(bool closeReq)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.closeReq = closeReq;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendTripClean(bool tripClean)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.tripClean = tripClean;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendAvgSpeedClean(bool avgSpeedClean)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.avgSpeedClean = avgSpeedClean;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendAvgFuelClean(bool avgFuelClean)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.avgFuelClean = avgFuelClean;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendProjectMode(bool projectMode)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.projectMode = projectMode;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendAlarmInterface(uint alarmInterface)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.alarmInterface = alarmInterface;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendInterfaceSoundSync(uint interfaceSoundSync)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.interfaceSoundSync = interfaceSoundSync;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::sendDateTimeSet(uint dateTimeSet)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    settingsInfo.dateTimeSet = dateTimeSet;
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

/*
 * 重要函数： 根据串口过来的数据(parseData函数)更新通用帧, 这个发射到CarUpdates里面的槽函数
 */
void CarUpdatesWorker::updateCarUpdates(GeneralInfo data)
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    if (!this->isEnabled()) {
        return;
    }

    updateStatus<quint8>(mStateData.tmpVersion.data, data.tmpVersion, [this](quint8 value){emit this->tmpVersionChanged(value);});
    updateStatus<quint8>(mStateData.relVersion.data, data.relVersion, [this](quint8 value){emit this->relVersionChanged(value);});
    updateStatus<quint8>(mStateData.hwVersion.data, data.hwVersion, [this](quint8 value){emit this->hwVersionChanged(value);});

    static bool hasPrintVersion = false;
    if (!hasPrintVersion) {
        QString MCUVersion = QString("v%1.%2.%3.").arg(data.hwVersion).arg(data.relVersion).arg(data.tmpVersion);
        qWarning() << "MCU Version:\t" << MCUVersion;
        hasPrintVersion = true;
    }
    QString MCUVersion = QString("v%1.%2.%3").arg(data.hwVersion).arg(data.relVersion).arg(data.tmpVersion);
    this->strMcuVersionChanged(MCUVersion);

    updateStatus<quint16>(mStateData.rpm.data, data.rpm, mStateData.rpm.min, mStateData.rpm.max, [=](quint16 value){
        emit this->rpmChanged(value);
    });
    updateStatus<quint32>(mStateData.dateTime.data, data.dateTime, mStateData.dateTime.min, mStateData.dateTime.max,[=](quint32 value){
            if(!mSignalData.isFirstSignal) {
                stime((long*)&value);
                mSignalData.isFirstSignal = true;
            }
            emit this->qDateTimeChanged(QDateTime::fromTime_t(value));
            emit this->dateTimeChanged(value);
        } );
        updateStatus<quint8>(mStateData.speed.data, data.speed, mStateData.speed.min, mStateData.speed.max, [this](quint8 value){
            emit this->speedChanged(value);
        });
        updateStatus<quint8>(mStateData.waterTemp.data, data.waterTemp, mStateData.waterTemp.min, mStateData.waterTemp.max, [=](quint8 value){
            emit this->waterTempChanged(value);
        });
        updateStatus<bool>(mStateData.igOn.data, data.igOn, [this](bool value){
            if (this->isInitialized()) {
                qDebug() << "Ign off now, deactivate serial port";
                this->deactivate();
            }
            emit this->igOnChanged(value);
        });
        updateStatus<quint8>(mStateData.gear.data, data.gear, mStateData.gear.min, mStateData.gear.max, [this](quint8 value){emit this->gearChanged(value);});
        updateStatus<quint8>(mStateData.gearMode.data, data.gearMode,mStateData.gearMode.min, mStateData.gearMode.max,
                             [this](quint8 value){emit this->gearModeChanged(value);});
        updateStatus<bool>(mStateData.lfDoor.data, data.lfDoor, [this](bool value){emit this->lfDoorChanged(value);});
        updateStatus<bool>(mStateData.rfDoor.data, data.rfDoor, [this](bool value){emit this->rfDoorChanged(value);});
        updateStatus<bool>(mStateData.lrDoor.data, data.lrDoor, [this](bool value){emit this->lrDoorChanged(value);});
        updateStatus<bool>(mStateData.rrDoor.data, data.rrDoor, [this](bool value){emit this->rrDoorChanged(value);});
        updateStatus<bool>(mStateData.hoodDoor.data, data.hoodDoor, [this](bool value){emit this->hoodDoorChanged(value);});
        updateStatus<bool>(mStateData.trunkDoor.data, data.trunkDoor, [this](bool value){emit this->trunkDoorChanged(value);});
        updateStatus<quint32>(mStateData.odo.data, data.odo, mStateData.odo.min, mStateData.odo.max, mStateData.odo.invalid,
                              [this](quint32 value){emit this->odoChanged(value);});
        updateStatus<quint8>(mStateData.avgSpeed.data, data.avgSpeed, mStateData.avgSpeed.min, mStateData.avgSpeed.max,
                             [this](quint8 value){emit this->avgSpeedChanged(value);});
        updateStatus<quint16>(mStateData.remainMileage.data, data.remainMileage, mStateData.remainMileage.min, mStateData.remainMileage.max,
                              mStateData.remainMileage.invalid, [this](quint16 value){emit this->remainMileageChanged(value);});
        updateStatus<quint32>(mStateData.trip1.data, data.trip1, mStateData.trip1.min, mStateData.trip1.max, mStateData.trip1.invalid,
                              [this](quint32 value){emit this->trip1Changed(value);});
        updateStatus<quint8>(mStateData.fuel.data, data.fuel, mStateData.fuel.min, mStateData.fuel.max, mStateData.fuel.invalid,
                             [=](quint8 value){emit this->fuelChanged(value);});
        updateStatus<quint32>(mStateData.trip2.data, data.trip2, mStateData.trip2.min, mStateData.trip2.max, mStateData.trip2.invalid,
                              [this](quint32 value){ emit this->trip2Changed(value);});
        updateStatus<quint8>(mStateData.soc.data, data.soc, mStateData.soc.min, mStateData.soc.max, [this](quint8 value){emit this->socChanged(value);});
        updateStatus<quint16>(mStateData.maintenanceMileage.data, data.maintenanceMileage, mStateData.maintenanceMileage.min,
                              mStateData.maintenanceMileage.max, [this](quint16 value){ emit this->maintenanceMileageChanged(value);});
        updateStatus<quint16>(mStateData.outTemp.data, data.outTemp, mStateData.outTemp.min, mStateData.outTemp.max, mStateData.outTemp.invalid,
                              [this](quint16 value){emit this->outTempChanged(value);});
        updateStatus<quint16>(mStateData.avgFuel.data, data.avgFuel, mStateData.avgFuel.min, mStateData.avgFuel.max, mStateData.avgFuel.invalid,
                              [this](quint16 value){emit this->avgFuelChanged(value);});
        updateStatus<quint16>(mStateData.instantFuel.data, data.instantFuel, mStateData.instantFuel.min, mStateData.instantFuel.max,
                              mStateData.instantFuel.invalid, [this](quint16 value){emit this->instantFuelChanged(value);});
        updateStatus<quint16>(mStateData.batteryCurrent.data, data.batteryCurrent, mStateData.batteryCurrent.min,
                              mStateData.batteryCurrent.max, mStateData.batteryCurrent.invalid,
                              [this](quint16 value){emit this->batteryCurrentChanged(value);});
        updateStatus<quint16>(mStateData.batteryVoltage.data, data.batteryVoltage, mStateData.batteryVoltage.min,
                              mStateData.batteryVoltage.max, mStateData.batteryVoltage.invalid,
                              [this](quint16 value){emit this->batteryVoltageChanged(value);});

        updateSignalData(data);
        initializeFirstFrame(GeneralFrameInitialized);
}

void CarUpdatesWorker::updateSignalData(GeneralInfo data)
{
    if (!mSignalDataInitialized) {
           updateStatus<bool>(mSignalData.mKey1, data.key1);
           updateStatus<bool>(mSignalData.mKey2, data.key2);
           updateStatus<bool>(mSignalData.mKey3, data.key3);
           updateStatus<bool>(mSignalData.mKey4, data.key4);
           updateStatus<uint>(mSignalData.mKeyStatus, data.keyStatus, (quint8) 0, (quint8) 3);
           mSignalDataInitialized = true;
           return;
       }

       updateStatus<bool>(mSignalData.mKey1, data.key1, [this](bool value){
           this->detectKeyEvent(value, 1);
       });
       updateStatus<bool>(mSignalData.mKey2, data.key2, [this](bool value){
           this->detectKeyEvent(value, 2);
       });
       updateStatus<bool>(mSignalData.mKey3, data.key3, [this](bool value){
           this->detectKeyEvent(value, 3);
       });
       updateStatus<bool>(mSignalData.mKey4, data.key4, [this](bool value){
           this->detectKeyEvent(value, 4);
       });
}

/*
 * 初始化串口
 */
void CarUpdatesWorker::initializeSerialPort()
{
    QString serialPort = "ttymxc1";
#ifndef Q_PROCESSOR_ARM
    QCommandLineParser parser;
        QCommandLineOption serialOption(QStringList() << "s" << "ttyS device name", "specify ttyS device", "tty", "ttymxc1");
        parser.addOption(serialOption);
        parser.process(*qApp);

        if (parser.isSet(serialOption))
            serialPort = parser.value(serialOption);
#endif
        mSerialPort->setPortName(serialPort);
        mSerialPort->setReadBufferSize(2048);
        mSerialPort->setBaudRate(SERIAL_BAUD_RATE);
        mSerialPort->setDataBits(QSerialPort::Data8);
        mSerialPort->setParity(QSerialPort::NoParity);
        mSerialPort->setStopBits(QSerialPort::OneStop);
        mSerialPort->setFlowControl(QSerialPort::NoFlowControl);

        connect(mSerialPort.get(), static_cast<void(QSerialPort::*)(QSerialPort::SerialPortError)>(&QSerialPort::error),
                    this, &CarUpdatesWorker::handleError, static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
}

void CarUpdatesWorker::lookingFor0xAA(bool &found)
{
    for (int i = 0; i < mReceivedData.length(); ++i) {
        if ((quint8)0xAA == (quint8)mReceivedData[i]) {
            mReceivedData.remove(0, i);
            found = true;
            break;
        }
    }
    found = false;
}

/*
 * 发送默认设置给MCU
 */
void CarUpdatesWorker::sendDefaultSettingsFrame()
{
    if(!this->isSerialPortOpened()) {
        return;
    }
    qDebug() << "Send Default Settings Frame!";
    SettingsInfo settingsInfo;
    setDefaultSettingsFrame(settingsInfo);
    sendData(QByteArray((char*)&settingsInfo, SETTINGS_INFO_LEN), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::setDefaultSettingsFrame(SettingsInfo &settingsInfo)
{
    memset(&settingsInfo, 0, SETTINGS_INFO_LEN);
    settingsInfo.commandReq = true;
    settingsInfo.alarmInterface = mAlarmInterface;
}

/*
 *  涉及到 长按 短按两次
 */
void CarUpdatesWorker::detectKeyEvent(bool value, int key)
{
    if (value) {
        emit this->keyPressed(key);
        auto currentTime = QTime::currentTime().msecsSinceStartOfDay();
        if (mSignalData.mPreviousPressedKey == key && (currentTime = mSignalData.mPreviousKeyPressedTime < 500)) {
            emit this->keyDoublePressed(key);
        }
        else if (currentTime - mSignalData.mPreviousKeyPressedTime < 500) {
            emit this->doubleKeysPressed(mSignalData.mPreviousPressedKey, key);
        }
        mSignalData.mPreviousPressedKey = key;
        mSignalData.mPreviousKeyPressedTime = currentTime;
        mLongPressDetectionTimer->start(2000);
    }
    else {
        emit this->keyReleased(key);
        mSignalData.mPreviousKeyPressedTime = 0;
        if (mLongPressDetectionTimer->isActive()) {
            mLongPressDetectionTimer->stop();
            emit this->keyShortPressed(key);
        }
    }
}

/*
 * 重要函数： 串口接收的槽函数, 这个是头
 */
void CarUpdatesWorker::receiveData()
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    mReceivedData += mSerialPort->readAll();

    while (mReceivedData.length() >= MAGIC_FRAME_LEN + 1) {
        if ((quint8)0xAA != (quint8)mReceivedData[0]) {
            bool found0xAA = false;
            lookingFor0xAA(found0xAA); // 该函数中会处理mReceivedData
            if(!found0xAA) {
                mReceivedData.clear();
            }
        }
        else { //如果mReceivedData的第一项是0xAA
            QByteArray bf = mReceivedData.left(MAGIC_FRAME_LEN);
            MagicFrame *magicFrame = (MagicFrame *)bf.data();

            CarUpdatesWorker::DataParseStatus status = parseData(magicFrame, mReceivedData); //该函数会处理mReceivedData
            if (CarUpdatesWorker::LengthFailed == status) { // 收到的数据还不够长
                break;
            }
            else if (CarUpdatesWorker::TailFlagFailed == status) { // 数据不完整
                continue;
            }
            else if (CarUpdatesWorker::MagicFailed == status) { //magic 不对
                mReceivedData.remove(0, 1);
            }
        }
    }
}

void CarUpdatesWorker::handleLongPressTimeout()
{
    emit this->keyLongPressed(mSignalData.mPreviousPressedKey);
    mLongPressDetectionTimer->stop();
}

void CarUpdatesWorker::handleError(QSerialPort::SerialPortError error)
{
    if (QSerialPort::NoError != error)
        qWarning() << "SerialPort Error: " << mSerialPort->errorString();
}

void CarUpdatesWorker::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event);
    sendHeartBeatPacket();
}

void CarUpdatesWorker::sendHeartBeatPacket()
{
    if (!this->isSerialPortOpened()) {
        return;
    }
    sendData(QByteArray((char *)0, 0), MAGIC_GENERAL_DOWN);
}

void CarUpdatesWorker::printHwVersion()
{
//    qDebug() << "virtual function will print Hardware Version in subClass";
}

CARFOX_END_NAMESPACE

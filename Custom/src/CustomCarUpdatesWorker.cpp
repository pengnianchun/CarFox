#include <QDir>
#include <QThread>
#include <QProcess>

#include <regex>
#include <iterator>
#include <unistd.h>
#include <iostream>
#include <sys/mount.h>

#include "CustomCarUpdatesWorker.hpp"

CustomCarUpdatesWorker::CustomCarUpdatesWorker()
{
}

void CustomCarUpdatesWorker::onIgOnChanged(bool status)
{
    Q_UNUSED(status);
}


// 发送主题ID给MCU,当前主题ID保存在MCU的Flash中
void CustomCarUpdatesWorker::sendThemeSet(int offset)
{
/*
 *    int id;
 *    if (!isSerialPortOpened())
 *        return;
 *    if (offset == 0) return;
 *
 *    SpecSettingsInfo specSettingsInfo;
 *    setDefaultSettingFrame(specSettingsInfo);
 *
 *    id = specSettingsInfo.themeSet + offset;
 *    id = (id+4)%4;
 *
 *    specSettingsInfo.themeSet = id;
 *    sendData(QByteArray((char *)&specSettingsInfo, SPECSETTINGS_INFO_LEN), MAGIC_SPECIAL_DOWN);
 */
}

// 发送界面语言ID给MCU，当前语言ID保存在MCU的Flash中
void CustomCarUpdatesWorker::sendLanguageSet(uint languageSet)
{
/*
 *    if (!isSerialPortOpened())
 *        return;
 *
 *    SpecSettingsInfo specSettingsInfo;
 *    setDefaultSettingFrame(specSettingsInfo);
 *    specSettingsInfo.languageSet = languageSet;
 *    sendData(QByteArray((char *)&specSettingsInfo, SPECSETTINGS_INFO_LEN), MAGIC_SPECIAL_DOWN);
 */
}

void CustomCarUpdatesWorker::sendUiVersion(const QString uiVersion)
{
    if (!isSerialPortOpened())
        return;

    if (!isInitialized())
        return;

    std::smatch sm;
    std::string tmpUiVersion = uiVersion.toStdString();

    if (std::regex_search(tmpUiVersion, sm,
                          std::regex("v(\\d+).(\\d+).(\\d+)"))) {

        SpecSettingsInfo specSettingsInfo;
        mQtVersionI = stol(sm[3]);
        mQtVersionII = stol(sm[2]);
        mQtVersionIII = stol(sm[1]);
        setDefaultSettingFrame(specSettingsInfo);
        sendData(QByteArray((char *)&specSettingsInfo, SPECSETTINGS_INFO_LEN), MAGIC_SPECIAL_DOWN);
    }
}

// 先调用carfox的parseData解析通用帧，再自行解析专用帧
carfox::CarUpdatesWorker::DataParseStatus CustomCarUpdatesWorker::parseData(carfox::MagicFrame *magicFrame, QByteArray &byteArray)
{
    auto status = CarUpdatesWorker::parseData(magicFrame, byteArray);
    if (CarUpdatesWorker::MagicFailed != status) {
        return status;
    }

    if (magicFrame->length == SPECIAL_INFO_LEN && magicFrame->magic == MAGIC_SPECIAL_UP) {
        if (byteArray.length() >= SPECIAL_FRAME_LEN && (quint8)0x55 == (quint8)byteArray[SPECIAL_FRAME_LEN-1]) {
            QByteArray bf = byteArray.left(SPECIAL_FRAME_LEN);
            byteArray.remove(0, SPECIAL_FRAME_LEN);
            // 拿到一帧Special Frame
            SpecialFrame *specialFrame = (SpecialFrame *)bf.data();
            if (specialFrame->crc == carfox::crc16Check((quint8 *)(&(specialFrame->magic)), MAGIC_LEN + SPECIAL_INFO_LEN)) {
//                if (!updateOnlyRpm()) {
//                    updateCarUpdates(specialFrame->specialInfo);
//                }
//                else {
//                    updateSelfCheck(specialFrame->specialInfo);
//                }
                updateCarUpdates(specialFrame->specialInfo);
            }
            return CarUpdatesWorker::Successed;
        } else {
            if (byteArray.length() < SPECIAL_FRAME_LEN){
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

void CustomCarUpdatesWorker::checkCarUpdatesSignals()
{
    CarUpdatesWorker::checkCarUpdatesSignals();
}

void CustomCarUpdatesWorker::updateCarUpdates(SpecialInfo data)
{
    if (!this->isSerialPortOpened()) {
        return;
    }

    if (!this->isEnabled()) return ;

    updateStatus<qreal>(mStateData.lfTirePressure, data.lfTirePressure, 0, 0xff, [this](qreal value){emit this->lfTirePressureChanged(value);});
    updateStatus<quint8>(mStateData.lfTirePressureWarn, data.lfTirePressureWarn, 0, 7, [=](quint8 value){
        checkTirePressure();
        emit this->lfTirePressureWarnChanged(value);
        switch (value) {
        case 0:
            removeTireWarnText(1);
            break;
        case 1:
            addTireWarnText(1, "Left front tire high pressure");         // 左前轮高压报警！
            break;
        case 2:
            addTireWarnText(1, "Left front tire low pressure");     // 左前轮低压报警！
            break;
        case 3:
            addTireWarnText(1, "Left front tire quick leak");       // 左前轮快速漏气报警！
            break;
        case 4:
            addTireWarnText(1, "Left front tire sensor loss");      // 左前轮传感器丢失报警！
            break;
        case 5:
            addTireWarnText(1, "Left front tire sensor low power"); // 左前轮传感器电池电量低报警！
            break;
        case 6:
            addTireWarnText(1, "Left front tire sensor error");     // 左前轮传感器故障报警！
            break;
        default:
            break;
        }
    });

    auto currentThemeMode = mStateData.themeMode;
    updateStatus<quint8>(mStateData.themeMode, data.themeMode, [=](uint value){
        emit this->themeModeChanged(value);
        if (this->isInitialized() && this->data().igOn.data) {
            qDebug() << "thememode changed, deactivate serial port";
            this->deactivate();
        }
        qDebug() << "emit themeModeChanged";
    });
    if (currentThemeMode != mStateData.themeMode) {
        return;
    }
}

void CustomCarUpdatesWorker::updateCarUpdates(QByteArray data)
{
//    if (!isFirstLogSignal) {
//        isFirstLogSignal = true;
//        mLogToFile.create();
//    }
//    mLogToFile.addLogToFile(data);
}

void CustomCarUpdatesWorker::printHwVersion()
{
//    qWarning() << "HW Version:\t" << QString("v%1.%2.%3").arg(mStateData.lowHardWare).arg(mStateData.midHardWare).arg(mStateData.highHardWare);
}

void CustomCarUpdatesWorker::updateSelfCheck(SpecialInfo data)
{
}

void CustomCarUpdatesWorker::setDefaultSettingFrame(SpecSettingsInfo &specSettingsInfo)
{
    memset(&specSettingsInfo, 0, SPECSETTINGS_INFO_LEN);
    specSettingsInfo.qtVersionI = mQtVersionI;
    specSettingsInfo.qtVersionII = mQtVersionII;
    specSettingsInfo.qtVersionIII = mQtVersionIII;
}

void CustomCarUpdatesWorker::checkTirePressure()
{
    bool tirePressureWarning = false;
    if ( mStateData.lfTirePressureWarn != 0) {
        tirePressureWarning =  true;
    }

    if (tirePressureWarning != mTirePressureWarning) {
        mTirePressureWarning = tirePressureWarning;
        emit tirePressureWarningChanged(mTirePressureWarning);
    }
}

void CustomCarUpdatesWorker::addTireWarnText(int priority, const QString &text)
{
    if (!mTireWarningsTextsMap.contains(priority)) {
        mTireWarningsTextsMap[priority] = text;
        emit tireWarningsTextsChanged(mTireWarningsTextsMap.values());
    }
}

void CustomCarUpdatesWorker::removeTireWarnText(int priority)
{
    if (mTireWarningsTextsMap.contains(priority)) {
        mTireWarningsTextsMap.remove(priority);
        emit tireWarningsTextsChanged(mTireWarningsTextsMap.values());
    }
}


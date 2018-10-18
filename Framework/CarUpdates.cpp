
#include <QCoreApplication>

#include "CarUpdates.hpp"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef Q_PROCESSOR_ARM
//#include <utsrelease.h>
#endif

#ifdef __cplusplus
}
#endif

CARFOX_BEGIN_NAMESPACE


CarUpdates::CarUpdates(CarUpdatesWorker *worker)
    : mWorker(worker)
{
    if (!mWorker) {
        return;
    }

    //移动worker对象到一个线程中，即他的槽执行都在这个指定的线程中
    worker->moveToThread(mThread.get());

    connect(mThread.get(), &QThread::started, worker, &CarUpdatesWorker::onStarted);
    connect(mThread.get(), &QThread::finished, worker, &QObject::deleteLater);
    connect(worker, &CarUpdatesWorker::tmpVersionChanged, this, &CarUpdates::updateTmpVersion);
    connect(worker, &CarUpdatesWorker::relVersionChanged, this, &CarUpdates::updateRelVersion);
    connect(worker, &CarUpdatesWorker::hwVersionChanged, this, &CarUpdates::updateHwVersion);
    connect(worker, &CarUpdatesWorker::rpmChanged, this, &CarUpdates::updateRpm);
    connect(worker, &CarUpdatesWorker::dateTimeChanged, this, &CarUpdates::updateDateTime);
    connect(worker, &CarUpdatesWorker::qDateTimeChanged, this, &CarUpdates::updateQdateTime);
    connect(worker, &CarUpdatesWorker::speedChanged, this, &CarUpdates::updateSpeed);
    connect(worker, &CarUpdatesWorker::waterTempChanged, this, &CarUpdates::updateWaterTemp);
    connect(worker, &CarUpdatesWorker::igOnChanged, this, &CarUpdates::updateIgOn);
    connect(worker, &CarUpdatesWorker::gearChanged, this, &CarUpdates::updateGear);
    connect(worker, &CarUpdatesWorker::gearModeChanged, this, &CarUpdates::updateGearMode);
    connect(worker, &CarUpdatesWorker::lfDoorChanged, this, &CarUpdates::updateLfDoor);
    connect(worker, &CarUpdatesWorker::rfDoorChanged, this, &CarUpdates::updateRfDoor);
    connect(worker, &CarUpdatesWorker::lrDoorChanged, this, &CarUpdates::updateLrDoor);
    connect(worker, &CarUpdatesWorker::rrDoorChanged, this, &CarUpdates::updateRrDoor);
    connect(worker, &CarUpdatesWorker::hoodDoorChanged, this, &CarUpdates::updateHoodDoor);
    connect(worker, &CarUpdatesWorker::trunkDoorChanged, this, &CarUpdates::updateTrunkDoor);
    connect(worker, &CarUpdatesWorker::odoChanged, this, &CarUpdates::updateOdo);
    connect(worker, &CarUpdatesWorker::avgSpeedChanged, this, &CarUpdates::updateAvgSpeed);
    connect(worker, &CarUpdatesWorker::remainMileageChanged, this, &CarUpdates::updateRemainMileage);
    connect(worker, &CarUpdatesWorker::trip1Changed, this, &CarUpdates::updateTrip1);
    connect(worker, &CarUpdatesWorker::fuelChanged, this, &CarUpdates::updateFuel);
    connect(worker, &CarUpdatesWorker::trip2Changed, this, &CarUpdates::updateTrip2);
    connect(worker, &CarUpdatesWorker::socChanged, this, &CarUpdates::updateSoc);
    connect(worker, &CarUpdatesWorker::maintenanceMileageChanged, this, &CarUpdates::updateMaintenanceMileage);
    connect(worker, &CarUpdatesWorker::outTempChanged, this, &CarUpdates::updateOutTemp);
    connect(worker, &CarUpdatesWorker::avgFuelChanged, this, &CarUpdates::updateAvgFuel);
    connect(worker, &CarUpdatesWorker::instantFuelChanged, this, &CarUpdates::updateInstantFuel);
    connect(worker, &CarUpdatesWorker::batteryCurrentChanged, this, &CarUpdates::updateBatteryCurrent);
    connect(worker, &CarUpdatesWorker::batteryVoltageChanged, this, &CarUpdates::updateBatteryVoltage);
    connect(worker, &CarUpdatesWorker::strMcuVersionChanged, this, &CarUpdates::updateStrMcuVersion);

    // 下行
    connect(this, &CarUpdates::commandReqChanged, worker, &CarUpdatesWorker::sendCommandReq);
    connect(this, &CarUpdates::closeReqChanged, worker, &CarUpdatesWorker::sendCloseReq);
    connect(this, &CarUpdates::tripCleanChanged, worker, &CarUpdatesWorker::sendTripClean);
    connect(this, &CarUpdates::avgSpeedCleanChanged, worker, &CarUpdatesWorker::sendAvgSpeedClean);
    connect(this, &CarUpdates::avgFuelCleanChanged, worker, &CarUpdatesWorker::sendAvgFuelClean);
    connect(this, &CarUpdates::projectModeChanged, worker, &CarUpdatesWorker::sendProjectMode);
    connect(this, &CarUpdates::alarmInterfaceChanged, worker, &CarUpdatesWorker::sendAlarmInterface);
    connect(this, &CarUpdates::interfaceSoundSyncChanged, worker, &CarUpdatesWorker::sendInterfaceSoundSync);
    connect(this, &CarUpdates::dateTimeSetChanged, worker, &CarUpdatesWorker::sendDateTimeSet);

    connect(this, &CarUpdates::activate, worker, &CarUpdatesWorker::activate);
    connect(this, &CarUpdates::deactivate, worker, &CarUpdatesWorker::deactivate);
    connect(this, &CarUpdates::updateSignals, worker, &CarUpdatesWorker::updateSignals);


    connect(this, &CarUpdates::strUiVersionChanged, this, &CarUpdates::updateStrUiVersion);
}


/*
 * 工作线程启动
 */
void CarUpdates::startCarUpdatesSendReceiveThread()
{
    mThread->start();
}

void CarUpdates::enableKeys(bool enable)
{
    disconnect(mWorker, &CarUpdatesWorker::keyPressed, this, &CarUpdates::keyPressed);
    disconnect(mWorker, &CarUpdatesWorker::keyReleased, this, &CarUpdates::keyReleased);
    disconnect(mWorker, &CarUpdatesWorker::keyDoublePressed, this, &CarUpdates::keyDoublePressed);
    disconnect(mWorker, &CarUpdatesWorker::doubleKeysPressed, this, &CarUpdates::doubleKeysPressed);
    disconnect(mWorker, &CarUpdatesWorker::keyLongPressed, this, &CarUpdates::keyLongPressed);
    disconnect(mWorker, &CarUpdatesWorker::keyShortPressed, this, &CarUpdates::keyShortPressed);

    if (enable) {
        connect(mWorker, &CarUpdatesWorker::keyPressed, this, &CarUpdates::keyPressed);
        connect(mWorker, &CarUpdatesWorker::keyReleased, this, &CarUpdates::keyReleased);
        connect(mWorker, &CarUpdatesWorker::keyDoublePressed, this, &CarUpdates::keyDoublePressed);
        connect(mWorker, &CarUpdatesWorker::doubleKeysPressed, this, &CarUpdates::doubleKeysPressed);
        connect(mWorker, &CarUpdatesWorker::keyLongPressed, this, &CarUpdates::keyLongPressed);
        connect(mWorker, &CarUpdatesWorker::keyShortPressed, this, &CarUpdates::keyShortPressed);
    }
}

void CarUpdates::updateTmpVersion(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(tmpVersion, data);
}

void CarUpdates::updateRelVersion(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(relVersion, data);
}

void CarUpdates::updateHwVersion(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(hwVersion, data);
}

void CarUpdates::updateStrMcuVersion(const QString data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(mcuVersion, data);
}

void CarUpdates::updateRpm(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(rpm, data);
}

void CarUpdates::updateQdateTime(QDateTime data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(dateTime, data);
}

void CarUpdates::updateDateTime(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(intDateTime, data);
}

void CarUpdates::updateSpeed(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(speed, data);
}

void CarUpdates::updateWaterTemp(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(waterTemp, data);
}

void CarUpdates::updateIgOn(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(igOn, data);
}

void CarUpdates::updateGear(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(gear, data);
}

void CarUpdates::updateGearMode(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(gearMode, data);
}

void CarUpdates::updateLfDoor(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(lfDoor, data);
}

void CarUpdates::updateRfDoor(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(rfDoor, data);
}

void CarUpdates::updateLrDoor(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(lrDoor, data);
}

void CarUpdates::updateRrDoor(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(rrDoor, data);
}

void CarUpdates::updateHoodDoor(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(hoodDoor, data);
}

void CarUpdates::updateTrunkDoor(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(trunkDoor, data);
}

void CarUpdates::updateOdo(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(odo, data);
}

void CarUpdates::updateAvgSpeed(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(avgSpeed, data);
}

void CarUpdates::updateRemainMileage(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(remainMileage, data);
}

void CarUpdates::updateTrip1(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(trip1, data);
}

void CarUpdates::updateFuel(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(fuel, data);
}

void CarUpdates::updateTrip2(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(trip2, data);
}

void CarUpdates::updateSoc(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(soc, data);
}

void CarUpdates::updateMaintenanceMileage(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(maintenanceMileage, data);
}

void CarUpdates::updateOutTemp(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(outTemp, data);
}

void CarUpdates::updateAvgFuel(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(avgFuel, data);
}

void CarUpdates::updateInstantFuel(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(instantFuel, data);
}

void CarUpdates::updateBatteryCurrent(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(batteryCurrent, data);
}

void CarUpdates::updateBatteryVoltage(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(batteryVoltage, data);
}

void CarUpdates::updateStrUiVersion(QString data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(uiVersion, data);
}

void CarUpdates::sendUiVersion(const QString ui)
{
    qWarning() << ui;
}

void CarUpdates::printReleaseVersion(const QString ui)
{
    sendUiVersion(ui);
    QByteArray uiVersion = ui.toLatin1();
#ifdef Q_PROCESSOR_ARM
//    uiVersion += QString::fromLatin1("+");
//    uiVersion += QString::fromLatin1(UTS_RELEASE);
#endif

    QString qtCompileVersion = QString::fromLatin1("v") + QString::fromLatin1(QT_VERSION_STR);
    QString qtRunningVersion = QString::fromLatin1("v") + QString::fromLatin1(qVersion());

    qWarning() << "UI Version:\t" << uiVersion
               << "\nUboot Version:" << QString::fromLatin1("v2014.10")
               << "\nKernel Version:" << kernelVersion()
               << "\nQt Compile Version: " << qtCompileVersion
               << "\nQt Running Version: " << qtRunningVersion;
    this->strUiVersionChanged(ui);
}

QString CarUpdates::kernelVersion()
{
#ifdef Q_PROCESSOR_ARM
    std::string content;
    readFile(content, "/proc/version");

    std::smatch sm;
    QString kernelVersion("v");

    if(std::regex_search(content, sm, std::regex("\\b\\d(\\.\\d{1,2}){2,3}-generic\\b")))
        kernelVersion += QString::fromStdString(sm.str());

    kernelVersion += QString::fromLatin1("+");

    if(std::regex_search(content, sm, std::regex("AUTOINC\\+\\w+")))
        kernelVersion += QString::fromStdString(sm.str());

    return kernelVersion;
#else
    return QString::fromLatin1("x.y.z-generic+pc");
#endif
}

bool CarUpdates::readFile(std::string &content, const std::string &fileName)
{
    FILE *fp;
    char buffer[256];

    if ((fp = fopen(fileName.c_str(), "r")) == NULL) {
        return false;
    }

    content.clear();
    if (fgets(buffer, 255, fp) == NULL) {
	fclose(fp);
        return false;
    }
    content = buffer;

    fclose(fp);

    return true;
}


CARFOX_END_NAMESPACE

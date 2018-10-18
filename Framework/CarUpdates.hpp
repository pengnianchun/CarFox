#pragma once

#include <QThread>
#include <QObject>
#include <QString>
#include <QProcess>
#include <QDateTime>

#include <regex>
#include <string>
#include <cstdlib>
#include <iostream>

#include "Global.hpp"
#include "CarUpdatesWorker.hpp"

CARFOX_BEGIN_NAMESPACE

class CarUpdates : public QObject
{
    Q_OBJECT

    // 通用上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML
    MEMBER_PROPERTY_WITH_NOTIFY(int, tmpVersion, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, relVersion, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, hwVersion, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(QString, mcuVersion, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, rpm, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, intDateTime, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(QDateTime, dateTime, QDateTime::fromTime_t(0))
    MEMBER_PROPERTY_WITH_NOTIFY(int, speed, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, waterTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, igOn, true)
    MEMBER_PROPERTY_WITH_NOTIFY(int, gear, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, gearMode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lfDoor, false)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, rfDoor, false)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lrDoor, false)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, rrDoor, false)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, hoodDoor, false)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, trunkDoor, false)
    MEMBER_PROPERTY_WITH_NOTIFY(int, odo, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, avgSpeed, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, remainMileage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, trip1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, fuel, 0xff)
    MEMBER_PROPERTY_WITH_NOTIFY(int, trip2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, soc, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, maintenanceMileage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, outTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, avgFuel, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, instantFuel, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batteryCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batteryVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(QString, uiVersion, 0)

public:
    CarUpdates(CarUpdatesWorker *worker);

    void startCarUpdatesSendReceiveThread();

    CarUpdatesWorker *worker() {
        return mWorker;
    }

    Q_INVOKABLE void enableKeys(bool enable);

    QString kernelVersion();

    void printReleaseVersion(const QString ui);
    virtual void sendUiVersion(const QString ui);

signals:
    void keyPressed(int key);
        void keyReleased(int key);
        void keyDoublePressed(int key);
        void doubleKeysPressed(int key1, int key2);
        void keyLongPressed(int key);
        void keyShortPressed(int key);
        void downButtonChanged();

        void activate();
        void deactivate();
        void updateSignals();
        void activateOnlyRpm(bool onlyRpm);
        void strUiVersionChanged(QString ui);

        // 通用下行帧 数据变更信号
        void commandReqChanged(bool commandReq);
        void closeReqChanged(bool closeReq);
        void tripCleanChanged(bool tripClean);
        void avgSpeedCleanChanged(bool avgSpeedClean);
        void avgFuelCleanChanged(bool avgFuelClean);
        void projectModeChanged(bool projectMode);
        void alarmInterfaceChanged(uint alarmInterface);
        void interfaceSoundSyncChanged(uint interfaceSoundSync);
        void dateTimeSetChanged(uint dateTimeSet);

private slots:
    // 通用上行帧 更新数据槽函数
    void updateTmpVersion(int data);
    void updateRelVersion(int data);
    void updateHwVersion(int data);
    void updateStrMcuVersion(const QString mcuVersion);
    void updateRpm(int rpm);
    void updateQdateTime(const QDateTime data);
    void updateDateTime(const int data);
    void updateSpeed(int speed);
    void updateWaterTemp(int waterTemp);
    void updateIgOn(bool igOn);
    void updateGear(int gear);
    void updateGearMode(int gearMode);
    void updateLfDoor(bool lfDoor);
    void updateRfDoor(bool rfDoor);
    void updateLrDoor(bool lrDoor);
    void updateRrDoor(bool rrDoor);
    void updateHoodDoor(bool hoodDoor);
    void updateTrunkDoor(bool trunkDoor);
    void updateOdo(int odo);
    void updateAvgSpeed(int avgSpeed);
    void updateRemainMileage(int remainMileage);
    void updateTrip1(int trip1);
    void updateFuel(int fuel);
    void updateTrip2(int trip2);
    void updateSoc(int soc);
    void updateMaintenanceMileage(int maintenanceMileage);
    void updateOutTemp(int outTemp);
    void updateAvgFuel(int avgFuel);
    void updateInstantFuel(int instantFuel);
    void updateBatteryCurrent(int batteryCurrent);
    void updateBatteryVoltage(int batteryVoltage);

    void updateStrUiVersion(QString ui);

    bool readFile(std::string &content, const std::string &fileName);

private:
   std::shared_ptr<QThread> mThread = std::make_shared<QThread>();
   CarUpdatesWorker *mWorker = nullptr;

};

CARFOX_END_NAMESPACE

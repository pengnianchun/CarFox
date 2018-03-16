#pragma once

#include "Global.hpp"
#include "CarUpdatesData.hpp"

CARFOX_BEGIN_NAMESPACE

struct CarUpdatesWorkerStateData {
    CarUpdatesData<quint8> tmpVersion = CarUpdatesData<quint8>(0);          // byte0: 0 ~ 7
    CarUpdatesData<quint8> relVersion = CarUpdatesData<quint8>(0);          // byte0: 8 ~ 12
    CarUpdatesData<quint8> hwVersion = CarUpdatesData<quint8>(0);           // byte1: 13 ~ 15
    CarUpdatesData<quint16> rpm = CarUpdatesData<quint16>(0, 0, 7000);               // byte2-3: 0 ~ 15
    CarUpdatesData<quint32> dateTime = CarUpdatesData<quint32>(0, 0, UINT32_MAX);          // byte4-7: 0 ~ 31
    CarUpdatesData<quint8> speed = CarUpdatesData<quint8>(0, 0, 240);               // byte8: 0 ~ 7
    CarUpdatesData<quint8> waterTemp = CarUpdatesData<quint8>(0, 50, 130);           // byte9: 0 ~ 7
    CarUpdatesData<bool> lfDoor = CarUpdatesData<bool>(false);    // byte10: 0
    CarUpdatesData<bool> rfDoor = CarUpdatesData<bool>(false);    // byte10: 1
    CarUpdatesData<bool> lrDoor = CarUpdatesData<bool>(false);    // byte10: 2
    CarUpdatesData<bool> rrDoor = CarUpdatesData<bool>(false);    // byte10: 3
    CarUpdatesData<bool> hoodDoor = CarUpdatesData<bool>(false);  // byte10: 4
    CarUpdatesData<bool> trunkDoor = CarUpdatesData<bool>(false); // byte10: 5
    CarUpdatesData<bool> igOn = CarUpdatesData<bool>(true);                         // byte10: 7 默认是true
    CarUpdatesData<quint8> gear = CarUpdatesData<quint8>(0, 0, 0x0F);               // byte11: 0 ~ 3
    CarUpdatesData<quint8> gearMode = CarUpdatesData<quint8>(0, 0, 1);              // byte11: 4 ~ 5

    CarUpdatesData<quint32> odo = CarUpdatesData<quint32>(0, 0, 999999, 0xFFFFFF);           // byte13: 0 ~ 23
    CarUpdatesData<quint8> avgSpeed = CarUpdatesData<quint8>(0, 0, 240);                     // byte16: 24 ~ 31
    CarUpdatesData<quint16> remainMileage = CarUpdatesData<quint16>(0, 0, 999, 0xFFFF);      // byte18: 0 ~ 15
    CarUpdatesData<quint32> trip1 = CarUpdatesData<quint32>(0, 0, 9999, 0xFFFF);             // byte20: 0 ~ 23
    CarUpdatesData<quint8> fuel = CarUpdatesData<quint8>(0xff, 0, 100, 0xFF);                // byte23: 24 ~ 31
    CarUpdatesData<quint32> trip2 = CarUpdatesData<quint32>(0, 0, 9999, 0xFFFF);             // byte24: 0 ~ 23
    CarUpdatesData<quint8> soc = CarUpdatesData<quint8>(0, 0, 100);                          // byte27: 24 ~ 31
    CarUpdatesData<quint16> maintenanceMileage = CarUpdatesData<quint16>(0, 0, 50000);       // byte28: 0 ~ 15
    CarUpdatesData<quint16> outTemp = CarUpdatesData<quint16>(0, 0, 2045, 0xFFFF);           // byte30: 0 ~ 15
    CarUpdatesData<quint16> avgFuel = CarUpdatesData<quint16>(0, 0, 300, 0xFFFF);            // byte32: 0 ~ 15
    CarUpdatesData<quint16> instantFuel = CarUpdatesData<quint16>(0, 0, 450, 0xFFFF);        // byte34: 0 ~ 15
    CarUpdatesData<quint16> batteryCurrent = CarUpdatesData<quint16>(0, 0, 25000, 0xFFFF);   // byte36: 0 ~ 15
    CarUpdatesData<quint16> batteryVoltage = CarUpdatesData<quint16>(0, 0, 1000, 0xFFFF);    // byte38: 0 ~ 15
};

struct CarUpdatesWorkerSignalData {
    bool mKey1 = false;    // byte10: 0
    bool mKey2 = false;    // byte10: 1
    bool mKey3 = false;    // byte10: 2
    bool mKey4 = false;    // byte10: 3
    uint mKeyStatus = 0;

    int mPreviousPressedKey = 0;
    int mPreviousKeyPressedTime = 0;
    bool isFirstSignal = false;
};

CARFOX_END_NAMESPACE

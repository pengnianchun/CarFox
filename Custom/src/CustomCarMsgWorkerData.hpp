#pragma once

struct CarUpdatesWorkerStateData {
    CarUpdatesData<quint8> tmpVersion = CarUpdatesData<quint8>(0);          // byte0: 0 ~ 7

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

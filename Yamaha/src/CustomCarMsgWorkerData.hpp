#pragma once

#include "CarMsgData.hpp"

//Car 信息 状态数据
struct CarMsgWorkerStateData {
    carfox::CarMsgData<quint8> tmpVersion = carfox::CarMsgData<quint8>(0);
    carfox::CarMsgData<qint8> themeMode = carfox::CarMsgData<qint8>(-1);
    carfox::CarMsgData<qint8> carMode = carfox::CarMsgData<qint8>(-1); // 汽车模式： 1. igOn 2. alarmOn 3. igOff

};

struct CarMSgWorkerSignalData {
    bool mKey1 = false;    // byte10: 0
    bool mKey2 = false;    // byte10: 1
    bool mKey3 = false;    // byte10: 2
    bool mKey4 = false;    // byte10: 3
    uint mKeyStatus = 0;

    int mPreviousPressedKey = 0;
    int mPreviousKeyPressedTime = 0;
    bool isFirstSignal = false;
};

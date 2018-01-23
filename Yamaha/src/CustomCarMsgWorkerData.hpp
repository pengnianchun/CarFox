#pragma once

#include "CarMsgData.hpp"

//Car 信息 状态数据
struct CarMsgWorkerStateData {
    carfox::CarMsgData<quint8> tmpVersion = carfox::CarMsgData<quint8>(0);
    carfox::CarMsgData<qint8> themeMode = carfox::CarMsgData<qint8>(-1);
    carfox::CarMsgData<qint8> carMode = carfox::CarMsgData<qint8>(-1);             // 汽车模式： 1. igOn 2. alarmOn 3. igOff

    carfox::CarMsgData<qint16> carSpeed = carfox::CarMsgData<qint16>(-1);          //车速
    carfox::CarMsgData<qint16> rpm = carfox::CarMsgData<qint16>(-1);               //转速
    carfox::CarMsgData<qint16> totalVoltage = carfox::CarMsgData<qint16>(-1);      //总电压, 0 V
    carfox::CarMsgData<qint16> totalCurrent = carfox::CarMsgData<qint16>(-1);      //总电流, 0 A
    carfox::CarMsgData<qint16> gear = carfox::CarMsgData<qint16>(-1);              //档位, 0
    carfox::CarMsgData<quint16> odo = carfox::CarMsgData<quint16>(-1);             //总里程, 0 Km
    carfox::CarMsgData<float> trip = carfox::CarMsgData<float>(-1);                //小计里程, 0.0 Km
    carfox::CarMsgData<quint16> soc = carfox::CarMsgData<quint16>(-1);             //系统SOC,0 %
    carfox::CarMsgData<float> apVol1 = carfox::CarMsgData<float>(-1);              //气压1, 0.00 Mpa,协议收到为Kpa，需要除以1000
    carfox::CarMsgData<float> apVol2 = carfox::CarMsgData<float>(-1);              //气压2, 0.00 Mpa,协议收到为Kpa，需要除以1000
    carfox::CarMsgData<qint16> moter_control_temp = carfox::CarMsgData<qint16>(-1);//电机控制器温度, 0 ℃
    carfox::CarMsgData<qint16> moter_temp = carfox::CarMsgData<qint16>(-1);        //电机温度, 0 ℃
    carfox::CarMsgData<qint16> battery = carfox::CarMsgData<qint16>(-1);           //蓄电池电压
    carfox::CarMsgData<qint16> spn = carfox::CarMsgData<qint16>(-1);               //SPN值
    carfox::CarMsgData<qint16> engine_water_temp = carfox::CarMsgData<qint16>(-1); //发动机水温
    carfox::CarMsgData<qint16> urea_level = carfox::CarMsgData<qint16>(-1);        //尿素液位
    carfox::CarMsgData<quint16> fault_level = carfox::CarMsgData<quint16>(-1);     //故障等级
    carfox::CarMsgData<qint16> fault_code = carfox::CarMsgData<qint16>(-1);        //故障代码
    carfox::CarMsgData<quint16> oil_level = carfox::CarMsgData<quint16>(-1);       //油量百分比
    carfox::CarMsgData<float> engine_oil_pressure = carfox::CarMsgData<float>(-1); //发动机机油压力
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

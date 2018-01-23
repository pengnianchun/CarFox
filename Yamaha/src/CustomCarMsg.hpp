#pragma once

#include <CarMsg.hpp>
#include "KeyManager.hpp"
class CustomCarMsgWorker;

class CustomCarMsg : public carfox::CarMsg
{
    Q_OBJECT

    // 上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML, 还有定义
    MEMBER_PROPERTY_WITH_NOTIFY(int, themeMode, 0)             //主题设置
    MEMBER_PROPERTY_WITH_NOTIFY(int, carMode, 0)               //汽车状态信号

    //通用帧
    MEMBER_PROPERTY_WITH_NOTIFY(int, carSpeed, 0)               //车速
    MEMBER_PROPERTY_WITH_NOTIFY(int, rpm, 0)                    //转速
    MEMBER_PROPERTY_WITH_NOTIFY(int, totalVoltage, 0)           //总电压, 0 V
    MEMBER_PROPERTY_WITH_NOTIFY(int, totalCurrent, 0)           //总电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(int, gear, 0)                   //档位, 0
    MEMBER_PROPERTY_WITH_NOTIFY(uint, odo, 0)                   //总里程, 0 Km
    MEMBER_PROPERTY_WITH_NOTIFY(float, trip, 0)                 //小计里程, 0.0 Km
    MEMBER_PROPERTY_WITH_NOTIFY(uint, soc, 0)                   //系统SOC,0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, apVol1, 0)               //气压1, 0.00 Mpa,协议收到为Kpa，需要除以1000
    MEMBER_PROPERTY_WITH_NOTIFY(float, apVol2, 0)               //气压2, 0.00 Mpa,协议收到为Kpa，需要除以1000
    MEMBER_PROPERTY_WITH_NOTIFY(int, moter_control_temp, 0)     //电机控制器温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, moter_temp, 0)             //电机温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, battery, 0)                //蓄电池电压
    MEMBER_PROPERTY_WITH_NOTIFY(int, spn, 0)                    //SPN值
    MEMBER_PROPERTY_WITH_NOTIFY(int, engine_water_temp, 0)      //发动机水温
    MEMBER_PROPERTY_WITH_NOTIFY(int, urea_level, 0)             //尿素液位
    MEMBER_PROPERTY_WITH_NOTIFY(uint, fault_level, 0)           //故障等级
    MEMBER_PROPERTY_WITH_NOTIFY(int, fault_code, 0)             //故障代码
    MEMBER_PROPERTY_WITH_NOTIFY(uint, oil_level, 0)             //油量百分比
    MEMBER_PROPERTY_WITH_NOTIFY(float, engine_oil_pressure, 0)  //发动机机油压力

public:
    explicit CustomCarMsg(CustomCarMsgWorker *worker);


private:
    void connectWorkerToMsg(CustomCarMsgWorker *worker);
    void connectMsgToWorker(CustomCarMsgWorker *worker);

public slots:


private slots:
    // 上行帧 更新数据槽函数, worker to msg
    void updateThemeMode (qint8 data); // test
    void updateCarMode(qint8 data);

    void updateCarSpeed(int value);
    void updateRpm(int value);
    void updateTotalVoltage(int value);
    void updateTotalCurrent(int value);
    void updateGear(int value);
    void updateOdo(uint value);
    void updateTrip(float value);
    void updateSoc(uint value);
    void updateApVol1(float value);
    void updateApVol2(float value);
    void updateMoter_control_temp(int value);
    void updateMoter_temp(int value);
    void updateBattery(int value);
    void updateSpn(int value);
    void updateEngine_water_temp(int value);
    void updateUrea_level(int value);
    void updateFault_level(uint value);
    void updateFault_code(int value);
    void updateOil_level(uint value);
    void updateEngine_oil_pressure(float value);

signals:
    // 上行帧 worker to msg
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);
    void downButtonChanged();




    // 下行帧 数据变更信号
    void sendEnableKeys(bool enable);
    void sendThemeSetChanged(qint8 themeNo);

private:
    bool mEnableKeys = false;
};

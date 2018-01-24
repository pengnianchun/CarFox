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

    //控制系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, motor_in_voltage, 0)		//电机输入电压, 0 V
    MEMBER_PROPERTY_WITH_NOTIFY(float, motor_in_current, 0)		//电机输入电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(int, motor_temp, 0)			    //电机温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, motor_controller_temp, 0)	//电机控制器温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, car_mode, 0)			    //整车模式, 0
    MEMBER_PROPERTY_WITH_NOTIFY(float, version, 0)			    //程序版本, 0.00
    MEMBER_PROPERTY_WITH_NOTIFY(int, car_life, 0)			    //整车控制器Life, 0
    MEMBER_PROPERTY_WITH_NOTIFY(float, accel_pedal_percent, 0) 	//加速踏板百分比,0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, brake_pedal_percent, 0)	//制动踏板百分比,0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din1, 0)		    	    //数字量输入1, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din2, 0)			        //数字量输入2, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din3, 0)			        //数字量输入3, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout1, 0)			        //数字量输出1, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout2, 0)			        //数字量输出2, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout3, 0)			        //数字量输出3, 00000000（2进制显示）

    //发动机系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, engine_fuel_consumption, 0)	//发动机油耗, 0.00 L/H
    MEMBER_PROPERTY_WITH_NOTIFY(float, engine_load, 0)				//发动机负荷, 0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, engine_target_throttle, 0)	//发动机目标油门, 0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, engine_actual_throttle, 0)	//发动机实际油门, 0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(int, engine_inlet_temperature, 0)   //发动机进气温度, 0 ℃

    //辅助系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, oil_pump_dcac_w_output_current, 0)    //油泵DC/AC W相输出电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, oil_pump_dcac_v_output_current, 0)    //油泵DC/AC V相输出电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, oil_pump_dcac_u_output_current, 0)    //油泵DC/AC U相输出电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(int, radiator_temperature, 0)                //散热器温度, 0 ℃

    //TCU系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(int, actual_clutch_position, 0)		//离合实际位置, 0
    MEMBER_PROPERTY_WITH_NOTIFY(uint, tcu_fault_code, 0)			//TCU故障信息, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(int, axis_rpm, 0)                   //变速箱输出轴转速, 0 RPM
    MEMBER_PROPERTY_WITH_NOTIFY(int, fmi, 0)                        //FMI值, 0
    MEMBER_PROPERTY_WITH_NOTIFY(int, cm, 0)                         //CM值, 0
    MEMBER_PROPERTY_WITH_NOTIFY(uint, oc, 0)			        	//OC, 0（16进制显示）

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

    void updateMotor_in_voltage(float value);
    void updateMotor_in_current(float value);
    void updateMotor_temp(int value);
    void updateMotor_controller_temp(int value);
    void updateCar_mode(int value);
    void updateVersion(double value);
    void updateCar_life(int value);
    void updateAccel_pedal_percent(float value);
    void updateBrake_pedal_percent(float value);
    void updateDin1(uint value);
    void updateDin2(uint value);
    void updateDin3(uint value);
    void updateDout1(uint value);
    void updateDout2(uint value);
    void updateDout3(uint value);

    void updateEngine_fuel_consumption(float value);
    void updateEngine_load(float value);
    void updateEngine_target_throttle(float value);
    void updateEngine_actual_throttle(float value);
    void updateEngine_inlet_temperature(int value);

    void updateOil_pump_dcac_w_output_current(float value);
    void updateOil_pump_dcac_v_output_current(float value);
    void updateOil_pump_dcac_u_output_current(float value);
    void updateRadiator_temperature(int value);

    void updateActual_clutch_position(int value);
    void updateTcu_fault_code(uint value);
    void updateAxis_rpm(int value);
    void updateFmi(int value);
    void updateCm(int value);
    void updateOc(uint value);

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

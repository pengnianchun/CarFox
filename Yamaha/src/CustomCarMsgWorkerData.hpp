#pragma once

#include "CarMsgData.hpp"

//Car 信息 状态数据
struct CarMsgWorkerStateData {
    carfox::CarMsgData<quint8> tmpVersion = carfox::CarMsgData<quint8>(0);
    carfox::CarMsgData<qint8> themeMode = carfox::CarMsgData<qint8>(-1);
    carfox::CarMsgData<qint8> carMode = carfox::CarMsgData<qint8>(-1);             // 汽车模式： 1. igOn 2. alarmOn 3. igOff

    //通用帧数据
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

    //控制系统信息
    carfox::CarMsgData<float> motor_in_voltage = carfox::CarMsgData<float>(-1);		   //电机输入电压, 0 V
    carfox::CarMsgData<float> motor_in_current = carfox::CarMsgData<float>(-1);		   //电机输入电流, 0 A
    carfox::CarMsgData<qint16> motor_temp = carfox::CarMsgData<qint16>(-1);			   //电机温度, 0 ℃
    carfox::CarMsgData<qint16> motor_controller_temp = carfox::CarMsgData<qint16>(-1); //电机控制器温度, 0 ℃
    carfox::CarMsgData<qint16> car_mode = carfox::CarMsgData<qint16>(-1);			   //整车模式, 0
    carfox::CarMsgData<double> version = carfox::CarMsgData<double>(-1);			   //程序版本, 0.00
    carfox::CarMsgData<qint16> car_life = carfox::CarMsgData<qint16>(-1);			   //整车控制器Life, 0
    carfox::CarMsgData<float> accel_pedal_percent = carfox::CarMsgData<float>(-1); 	   //加速踏板百分比,0.0 %
    carfox::CarMsgData<float> brake_pedal_percent = carfox::CarMsgData<float>(-1);	   //制动踏板百分比,0.0 %
    carfox::CarMsgData<quint16> din1 = carfox::CarMsgData<quint16>(-1);			       //数字量输入1, 00000000（2进制显示）
    carfox::CarMsgData<quint16> din2 = carfox::CarMsgData<quint16>(-1);			       //数字量输入2, 00000000（2进制显示）
    carfox::CarMsgData<quint16> din3 = carfox::CarMsgData<quint16>(-1);			       //数字量输入3, 00000000（2进制显示）
    carfox::CarMsgData<quint16> dout1 = carfox::CarMsgData<quint16>(-1);			   //数字量输出1, 00000000（2进制显示）
    carfox::CarMsgData<quint16> dout2 = carfox::CarMsgData<quint16>(-1);			   //数字量输出2, 00000000（2进制显示）
    carfox::CarMsgData<quint16> dout3 = carfox::CarMsgData<quint16>(-1);			   //数字量输出3, 00000000（2进制显示）

    //发动机系统信息
    carfox::CarMsgData<float> engine_fuel_consumption = carfox::CarMsgData<float>(-1);   	//发动机油耗, 0.00 L/H
    carfox::CarMsgData<float> engine_load = carfox::CarMsgData<float>(-1);			        //发动机负荷, 0 %
    carfox::CarMsgData<float> engine_target_throttle = carfox::CarMsgData<float>(-1);		//发动机目标油门, 0.0 %
    carfox::CarMsgData<float> engine_actual_throttle = carfox::CarMsgData<float>(-1);		//发动机实际油门, 0.0 %
    carfox::CarMsgData<qint16> engine_inlet_temperature = carfox::CarMsgData<qint16>(-1);	//发动机进气温度, 0 ℃

    //辅助系统信息
    carfox::CarMsgData<float> oil_pump_dcac_w_output_current = carfox::CarMsgData<float>(-1);      //油泵DC/AC W相输出电流, 0 A
    carfox::CarMsgData<float> oil_pump_dcac_v_output_current = carfox::CarMsgData<float>(-1);      //油泵DC/AC V相输出电流, 0 A
    carfox::CarMsgData<float> oil_pump_dcac_u_output_current = carfox::CarMsgData<float>(-1);      //油泵DC/AC U相输出电流, 0 A
    carfox::CarMsgData<qint16> radiator_temperature = carfox::CarMsgData<qint16>(-1);              //散热器温度, 0 ℃

    //TCU系统信息
    carfox::CarMsgData<qint16> actual_clutch_position = carfox::CarMsgData<qint16>(-1);		//离合实际位置, 0
    carfox::CarMsgData<quint16> tcu_fault_code = carfox::CarMsgData<quint16>(-1);			//TCU故障信息, 00000000（2进制显示）
    carfox::CarMsgData<qint16> axis_rpm = carfox::CarMsgData<qint16>(-1);                   //变速箱输出轴转速, 0 RPM
    carfox::CarMsgData<qint16> fmi = carfox::CarMsgData<qint16>(-1);                        //FMI值, 0
    carfox::CarMsgData<qint16> cm = carfox::CarMsgData<qint16>(-1);                         //CM值, 0
    carfox::CarMsgData<quint16> oc = carfox::CarMsgData<quint16>(-1);			        	//OC, 0（16进制显示）
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

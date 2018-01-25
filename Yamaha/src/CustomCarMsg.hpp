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

    //电池管理系统
    MEMBER_PROPERTY_WITH_NOTIFY(float, bat_max_charge_current, 0)		//最大允许充电电流,, 0.0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, bat_max_discharge_current, 0)	//最大允许放电电流,, 0.0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, bat_average_voltage, 0)          //单体平均电压, 0.00 V
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bat_status1, 0)                   //电池状态1, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bat_status2, 0)                   //电池状态2, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bat_status3, 0)                   //电池状态3, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(float, irm_ohm_positive, 0)             //总正绝缘阻值, 0 KΩ
    MEMBER_PROPERTY_WITH_NOTIFY(float, irm_ohm_negative, 0)             //总负绝缘阻值, 0 KΩ
    MEMBER_PROPERTY_WITH_NOTIFY(float, bat_max_voltage, 0)              //单体最高电压, 0.00 V
    MEMBER_PROPERTY_WITH_NOTIFY(float, bat_min_voltage, 0)              //单体最低电压, 0.00 V
    MEMBER_PROPERTY_WITH_NOTIFY(float, battery_highest_temp, 0)         //单体最高温度, 0.0 ℃

    //空调系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(uint, ac_fault_code, 0)                 //空调故障代码, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, ac_fan_status, 0)                 //空调风机状态, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, ac_work_status, 0)                //空调工作状态, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, ac_life, 0)                       //空调Life, 0
    MEMBER_PROPERTY_WITH_NOTIFY(int, ac_out_temp, 0)                    //车外实际温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, ac_in_temp, 0)                     //车内实际温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, ac_set_temp, 0)                    //设定温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(uint, ac_refrigere_req, 0)              //空调制冷请求, 00000000（2进制显示）

    //仪表信息
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_01, 0)        //左转向开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_02, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_03, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_04, 0)        //钥匙ST开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_05, 0)        //右转向开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_06, 0)        //小灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_07, 0)        //远光灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_08, 0)        //近光灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_09, 0)        //前雾灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_10, 0)        //后雾灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_11, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_12, 0)        //广告灯箱开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_13, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_14, 0)        //雨刮低档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_15, 0)        //雨刮间歇档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_16, 0)        //雨刮高档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_17, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_18, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_19, 0)        //路牌开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_20, 0)        //前门开开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_21, 0)        //雨刮喷水档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_22, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_23, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_24, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_25, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_26, 0)        //中门关开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_27, 0)        //中门开开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_28, 0)        //前门关开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_29, 0)        //燃油量过低报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_30, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_31, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_32, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_33, 0)        //危险报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_34, 0)        //电源唤醒
    MEMBER_PROPERTY_WITH_NOTIFY(int, input_ctrl_35, 0)        //钥匙ON

    //符号片显示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_key_on, 0)                     //钥匙ON开关(总电源指示)
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_air_filter, 0)                 //空滤指示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_asr, 0)                        //ASR指示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_high_voltage_maintenance, 0)   //高压检修
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_defroster, 0)                  //除霜器
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_dryere, 0)                     //干燥器
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_abs, 0)                        //ABS指示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_ac, 0)                         //AC空调指示
    MEMBER_PROPERTY_WITH_NOTIFY(string, power_supply, "")                //Power模式符号片(纯电动模式 or 混动模式 or 插电模式)
    MEMBER_PROPERTY_WITH_NOTIFY(int, climbing_mode, 0)                   //爬坡模式符号片
    MEMBER_PROPERTY_WITH_NOTIFY(int, diagnostic_mode, 0)                 //诊断模式符号片

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_turn_left, 0)         	     //左转向
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_turn_right, 0)       	         //右转向

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_double_flash, 0)      	     //双闪开启
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_front_fog, 0)         	     //前雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_rear_fog, 0)         	         //后雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_high_beam, 0)        	         //远光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_head_light, 0)       	         //近光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_reverse_gear, 0)               //倒车灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_position_light, 0)             //位置灯

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_gate1, 0)            	         //前门开
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_gate2, 0)                      //中门开
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_rear_door_open, 0)             //后舱门开指示

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_brake, 0)                      //刹车制动
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_parking_brake, 0)              //驻车制动

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_left_low_air_pressure, 0)      //左气压低报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_right_low_air_pressure, 0)     //右气压低报警

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_left_shoe_wear, 0)             //左前摩擦片(刹车蹄片)报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_right_shoe_wear, 0)            //右前摩擦片(刹车蹄片)报警

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_charge_confirm, 0)             //充电确认
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_battery_main_contact, 0)       //电池主接触器KT

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_water_temp_high, 0)            //水温高报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_water_level_low, 0)            //水位低指示

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_low_service_wl, 0)             //轻微故障报警STOP
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_heavy_stop_wl, 0)              //重大故障报警STOP
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_serious_stop_wl, 0)            //严重故障报警STOP

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_oil_level_low, 0)              //油量低报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_oil_pressure_low, 0)           //机油压力低
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_engine_fault, 0)               //发动机故障

    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_motor_out_of_service, 0)       //24V发电机未工作
    MEMBER_PROPERTY_WITH_NOTIFY(int, lamp_moter_fire_igon, 0)            //发电机点火指示


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

    void updateBat_max_charge_current(float value);
    void updateBat_max_discharge_current(float value);
    void updateBat_average_voltage(float value);
    void updateBat_status1(uint value);
    void updateBat_status2(uint value);
    void updateBat_status3(uint value);
    void updateIrm_ohm_positive(float value);
    void updateIrm_ohm_negative(float value);
    void updateBat_max_voltage(float value);
    void updateBat_min_voltage(float value);
    void updateBattery_highest_temp(float value);

    void updateAc_fault_code(uint value);
    void updateAc_fan_status(uint value);
    void updateAc_work_status(uint value);
    void updateAc_life(uint value);
    void updateAc_out_temp(int value);
    void updateAc_in_temp(int value);
    void updateAc_set_temp(int value);
    void updateAc_refrigere_req(uint value);

    void updateInput_ctrl_01(int value);
    void updateInput_ctrl_02(int value);
    void updateInput_ctrl_03(int value);
    void updateInput_ctrl_04(int value);
    void updateInput_ctrl_05(int value);
    void updateInput_ctrl_06(int value);
    void updateInput_ctrl_07(int value);
    void updateInput_ctrl_08(int value);
    void updateInput_ctrl_09(int value);
    void updateInput_ctrl_10(int value);
    void updateInput_ctrl_11(int value);
    void updateInput_ctrl_12(int value);
    void updateInput_ctrl_13(int value);
    void updateInput_ctrl_14(int value);
    void updateInput_ctrl_15(int value);
    void updateInput_ctrl_16(int value);
    void updateInput_ctrl_17(int value);
    void updateInput_ctrl_18(int value);
    void updateInput_ctrl_19(int value);
    void updateInput_ctrl_20(int value);
    void updateInput_ctrl_21(int value);
    void updateInput_ctrl_22(int value);
    void updateInput_ctrl_23(int value);
    void updateInput_ctrl_24(int value);
    void updateInput_ctrl_25(int value);
    void updateInput_ctrl_26(int value);
    void updateInput_ctrl_27(int value);
    void updateInput_ctrl_28(int value);
    void updateInput_ctrl_29(int value);
    void updateInput_ctrl_30(int value);
    void updateInput_ctrl_31(int value);
    void updateInput_ctrl_32(int value);
    void updateInput_ctrl_33(int value);
    void updateInput_ctrl_34(int value);
    void updateInput_ctrl_35(int value);

    void updateLamp_key_on(int value);
    void updateLamp_air_filter(int value);
    void updateLamp_asr(int value);
    void updateLamp_high_voltage_maintenance(int value);
    void updateLamp_defroster(int value);
    void updateLamp_dryere(int value);
    void updateLamp_abs(int value);
    void updateLamp_ac(int value);
    void updatePower_supply(string value);
    void updateClimbing_mode(int value);
    void updateDiagnostic_mode(int value);

    void updateLamp_turn_left(int value);
    void updateLamp_turn_right(int value);

    void updateLamp_double_flash(int value);
    void updateLamp_front_fog(int value);
    void updateLamp_rear_fog(int value);
    void updateLamp_high_beam(int value);
    void updateLamp_head_light(int value);
    void updateLamp_reverse_gear(int value);
    void updateLamp_position_light(int value);

    void updateLamp_gate1(int value);
    void updateLamp_gate2(int value);
    void updateLamp_rear_door_open(int value);

    void updateLamp_brake(int value);
    void updateLamp_parking_brake(int value);

    void updateLamp_left_low_air_pressure(int value);
    void updateLamp_right_low_air_pressure(int value);

    void updateLamp_left_shoe_wear(int value);
    void updateLamp_right_shoe_wear(int value);

    void updateLamp_charge_confirm(int value);
    void updateLamp_battery_main_contact(int value);

    void updateLamp_water_temp_high(int value);
    void updateLamp_water_level_low(int value);

    void updateLamp_low_service_wl(int value);
    void updateLamp_heavy_stop_wl(int value);
    void updateLamp_serious_stop_wl(int value);

    void updateLamp_oil_level_low(int value);
    void updateLamp_oil_pressure_low(int value);
    void updateLamp_engine_fault(int value);

    void updateLamp_motor_out_of_service(int value);
    void updateLamp_moter_fire_igon(int value);

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

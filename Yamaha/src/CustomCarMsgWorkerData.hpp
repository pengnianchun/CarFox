#pragma once

#include "CarMsgData.hpp"

//Car 信息 状态数据
struct CarMsgWorkerStateData {
    carfox::CarMsgData<quint8> tmpVersion = carfox::CarMsgData<quint8>(0);
    carfox::CarMsgData<qint8> themeMode = carfox::CarMsgData<qint8>(-1);
    carfox::CarMsgData<qint32> dateTime = carfox::CarMsgData<qint32>(-1);          // 系统时间
    carfox::CarMsgData<qint8> upgradeMsgId = carfox::CarMsgData<qint8>(-1);        // 升级消息ID
    carfox::CarMsgData<QString> upgradeMsgCtx = carfox::CarMsgData<QString>("");   // 升级消息内容
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

    //电池管理系统
    carfox::CarMsgData<float> bat_max_charge_current = carfox::CarMsgData<float>(-1);		//最大允许充电电流,, 0.0 A
    carfox::CarMsgData<float> bat_max_discharge_current = carfox::CarMsgData<float>(-1);	//最大允许放电电流,, 0.0 A
    carfox::CarMsgData<float> bat_average_voltage = carfox::CarMsgData<float>(-1);          //单体平均电压, 0.00 V
    carfox::CarMsgData<quint16> bat_status1 = carfox::CarMsgData<quint16>(-1);              //电池状态1, 00000000（2进制显示）
    carfox::CarMsgData<quint16> bat_status2 = carfox::CarMsgData<quint16>(-1);              //电池状态2, 00000000（2进制显示）
    carfox::CarMsgData<quint16> bat_status3 = carfox::CarMsgData<quint16>(-1);              //电池状态3, 00000000（2进制显示）
    carfox::CarMsgData<float> irm_ohm_positive = carfox::CarMsgData<float>(-1);             //总正绝缘阻值, 0 KΩ
    carfox::CarMsgData<float> irm_ohm_negative = carfox::CarMsgData<float>(-1);             //总负绝缘阻值, 0 KΩ
    carfox::CarMsgData<float> bat_max_voltage = carfox::CarMsgData<float>(-1);              //单体最高电压, 0.00 V
    carfox::CarMsgData<float> bat_min_voltage = carfox::CarMsgData<float>(-1);              //单体最低电压, 0.00 V
    carfox::CarMsgData<float> battery_highest_temp = carfox::CarMsgData<float>(-1);         //单体最高温度, 0.0 ℃

    //空调系统信息
    carfox::CarMsgData<quint16> ac_fault_code = carfox::CarMsgData<quint16>(-1);            //空调故障代码, 00000000（2进制显示）
    carfox::CarMsgData<quint16> ac_fan_status = carfox::CarMsgData<quint16>(-1);            //空调风机状态, 00000000（2进制显示）
    carfox::CarMsgData<quint16> ac_work_status = carfox::CarMsgData<quint16>(-1);           //空调工作状态, 00000000（2进制显示）
    carfox::CarMsgData<quint16> ac_life = carfox::CarMsgData<quint16>(-1);                  //空调Life, 0
    carfox::CarMsgData<qint16> ac_out_temp = carfox::CarMsgData<qint16>(-1);                //车外实际温度, 0 ℃
    carfox::CarMsgData<qint16> ac_in_temp = carfox::CarMsgData<qint16>(-1);                 //车内实际温度, 0 ℃
    carfox::CarMsgData<qint16> ac_set_temp = carfox::CarMsgData<qint16>(-1);                //设定温度, 0 ℃
    carfox::CarMsgData<quint16> ac_refrigere_req = carfox::CarMsgData<quint16>(-1);         //空调制冷请求, 00000000（2进制显示）

    //仪表信息
    carfox::CarMsgData<qint8> input_ctrl_01 = carfox::CarMsgData<qint8>(-1);        //左转向开关
    carfox::CarMsgData<qint8> input_ctrl_02 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_03 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_04 = carfox::CarMsgData<qint8>(-1);        //钥匙ST开关
    carfox::CarMsgData<qint8> input_ctrl_05 = carfox::CarMsgData<qint8>(-1);        //右转向开关
    carfox::CarMsgData<qint8> input_ctrl_06 = carfox::CarMsgData<qint8>(-1);        //小灯开关
    carfox::CarMsgData<qint8> input_ctrl_07 = carfox::CarMsgData<qint8>(-1);        //远光灯开关
    carfox::CarMsgData<qint8> input_ctrl_08 = carfox::CarMsgData<qint8>(-1);        //近光灯开关
    carfox::CarMsgData<qint8> input_ctrl_09 = carfox::CarMsgData<qint8>(-1);        //前雾灯开关
    carfox::CarMsgData<qint8> input_ctrl_10 = carfox::CarMsgData<qint8>(-1);        //后雾灯开关
    carfox::CarMsgData<qint8> input_ctrl_11 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_12 = carfox::CarMsgData<qint8>(-1);        //广告灯箱开关
    carfox::CarMsgData<qint8> input_ctrl_13 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_14 = carfox::CarMsgData<qint8>(-1);        //雨刮低档开关
    carfox::CarMsgData<qint8> input_ctrl_15 = carfox::CarMsgData<qint8>(-1);        //雨刮间歇档开关
    carfox::CarMsgData<qint8> input_ctrl_16 = carfox::CarMsgData<qint8>(-1);        //雨刮高档开关
    carfox::CarMsgData<qint8> input_ctrl_17 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_18 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_19 = carfox::CarMsgData<qint8>(-1);        //路牌开关
    carfox::CarMsgData<qint8> input_ctrl_20 = carfox::CarMsgData<qint8>(-1);        //前门开开关
    carfox::CarMsgData<qint8> input_ctrl_21 = carfox::CarMsgData<qint8>(-1);        //雨刮喷水档开关
    carfox::CarMsgData<qint8> input_ctrl_22 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_23 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_24 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_25 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_26 = carfox::CarMsgData<qint8>(-1);        //中门关开关
    carfox::CarMsgData<qint8> input_ctrl_27 = carfox::CarMsgData<qint8>(-1);        //中门开开关
    carfox::CarMsgData<qint8> input_ctrl_28 = carfox::CarMsgData<qint8>(-1);        //前门关开关
    carfox::CarMsgData<qint8> input_ctrl_29 = carfox::CarMsgData<qint8>(-1);        //燃油量过低报警
    carfox::CarMsgData<qint8> input_ctrl_30 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_31 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_32 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> input_ctrl_33 = carfox::CarMsgData<qint8>(-1);        //危险报警
    carfox::CarMsgData<qint8> input_ctrl_34 = carfox::CarMsgData<qint8>(-1);        //电源唤醒
    carfox::CarMsgData<qint8> input_ctrl_35 = carfox::CarMsgData<qint8>(-1);        //钥匙ON

    //符号片显示
    carfox::CarMsgData<qint8> lamp_key_on = carfox::CarMsgData<qint8>(-1);                     //钥匙ON开关(总电源指示)
    carfox::CarMsgData<qint8> lamp_air_filter = carfox::CarMsgData<qint8>(-1);                 //空滤指示
    carfox::CarMsgData<qint8> lamp_asr = carfox::CarMsgData<qint8>(-1);                        //ASR指示
    carfox::CarMsgData<qint8> lamp_high_voltage_maintenance = carfox::CarMsgData<qint8>(-1);   //高压检修
    carfox::CarMsgData<qint8> lamp_defroster = carfox::CarMsgData<qint8>(-1);                  //除霜器
    carfox::CarMsgData<qint8> lamp_dryere = carfox::CarMsgData<qint8>(-1);                     //干燥器
    carfox::CarMsgData<qint8> lamp_abs = carfox::CarMsgData<qint8>(-1);                        //ABS指示
    carfox::CarMsgData<qint8> lamp_ac = carfox::CarMsgData<qint8>(-1);                         //AC空调指示
    carfox::CarMsgData<QString> power_supply = carfox::CarMsgData<QString>("");                //Power模式符号片(纯电动模式 or 混动模式 or 插电模式)
    carfox::CarMsgData<qint8> climbing_mode = carfox::CarMsgData<qint8>(-1);                   //爬坡模式符号片
    carfox::CarMsgData<qint8> diagnostic_mode = carfox::CarMsgData<qint8>(-1);                 //诊断模式符号片

    carfox::CarMsgData<qint8> lamp_turn_left = carfox::CarMsgData<qint8>(-1);         	       //左转向
    carfox::CarMsgData<qint8> lamp_turn_right = carfox::CarMsgData<qint8>(-1);       	       //右转向

    carfox::CarMsgData<qint8> lamp_double_flash = carfox::CarMsgData<qint8>(-1);      	       //双闪开启
    carfox::CarMsgData<qint8> lamp_front_fog = carfox::CarMsgData<qint8>(-1);         	       //前雾灯
    carfox::CarMsgData<qint8> lamp_rear_fog = carfox::CarMsgData<qint8>(-1);         	       //后雾灯
    carfox::CarMsgData<qint8> lamp_high_beam = carfox::CarMsgData<qint8>(-1);        	       //远光灯
    carfox::CarMsgData<qint8> lamp_head_light = carfox::CarMsgData<qint8>(-1);       	       //近光灯
    carfox::CarMsgData<qint8> lamp_reverse_gear = carfox::CarMsgData<qint8>(-1);               //倒车灯
    carfox::CarMsgData<qint8> lamp_position_light = carfox::CarMsgData<qint8>(-1);             //位置灯

    carfox::CarMsgData<qint8> lamp_gate1 = carfox::CarMsgData<qint8>(-1);            	       //前门开
    carfox::CarMsgData<qint8> lamp_gate2 = carfox::CarMsgData<qint8>(-1);                      //中门开
    carfox::CarMsgData<qint8> lamp_rear_door_open = carfox::CarMsgData<qint8>(-1);             //后舱门开指示

    carfox::CarMsgData<qint8> lamp_brake = carfox::CarMsgData<qint8>(-1);                      //刹车制动
    carfox::CarMsgData<qint8> lamp_parking_brake = carfox::CarMsgData<qint8>(-1);              //驻车制动

    carfox::CarMsgData<qint8> lamp_left_low_air_pressure = carfox::CarMsgData<qint8>(-1);      //左气压低报警
    carfox::CarMsgData<qint8> lamp_right_low_air_pressure = carfox::CarMsgData<qint8>(-1);     //右气压低报警

    carfox::CarMsgData<qint8> lamp_left_shoe_wear = carfox::CarMsgData<qint8>(-1);             //左前摩擦片(刹车蹄片)报警
    carfox::CarMsgData<qint8> lamp_right_shoe_wear = carfox::CarMsgData<qint8>(-1);            //右前摩擦片(刹车蹄片)报警

    carfox::CarMsgData<qint8> lamp_charge_confirm = carfox::CarMsgData<qint8>(-1);             //充电确认
    carfox::CarMsgData<qint8> lamp_battery_main_contact = carfox::CarMsgData<qint8>(-1);       //电池主接触器KT

    carfox::CarMsgData<qint8> lamp_water_temp_high = carfox::CarMsgData<qint8>(-1);            //水温高报警
    carfox::CarMsgData<qint8> lamp_water_level_low = carfox::CarMsgData<qint8>(-1);            //水位低指示

    carfox::CarMsgData<qint8> lamp_low_service_wl = carfox::CarMsgData<qint8>(-1);             //轻微故障报警STOP
    carfox::CarMsgData<qint8> lamp_heavy_stop_wl = carfox::CarMsgData<qint8>(-1);              //重大故障报警STOP
    carfox::CarMsgData<qint8> lamp_serious_stop_wl = carfox::CarMsgData<qint8>(-1);            //严重故障报警STOP

    carfox::CarMsgData<qint8> lamp_oil_level_low = carfox::CarMsgData<qint8>(-1);              //油量低报警
    carfox::CarMsgData<qint8> lamp_oil_pressure_low = carfox::CarMsgData<qint8>(-1);           //机油压力低
    carfox::CarMsgData<qint8> lamp_engine_fault = carfox::CarMsgData<qint8>(-1);               //发动机故障

    carfox::CarMsgData<qint8> lamp_motor_out_of_service = carfox::CarMsgData<qint8>(-1);       //24V发电机未工作
    carfox::CarMsgData<qint8> lamp_moter_fire_igon = carfox::CarMsgData<qint8>(-1);            //发电机点火指示

    //前模块
    carfox::CarMsgData<float> front_output_current_01 = carfox::CarMsgData<float>(-1); //雨刮快档电机
    carfox::CarMsgData<float> front_output_current_02 = carfox::CarMsgData<float>(-1); //雨刮慢档电机
    carfox::CarMsgData<float> front_output_current_03 = carfox::CarMsgData<float>(-1); //喷水电机
    carfox::CarMsgData<float> front_output_current_04 = carfox::CarMsgData<float>(-1); //左前雾灯
    carfox::CarMsgData<float> front_output_current_05 = carfox::CarMsgData<float>(-1); //倒车灯

    carfox::CarMsgData<float> front_output_current_06 = carfox::CarMsgData<float>(-1); //右转向灯
    carfox::CarMsgData<float> front_output_current_07 = carfox::CarMsgData<float>(-1); //左转相灯
    carfox::CarMsgData<float> front_output_current_08 = carfox::CarMsgData<float>(-1); //液位显示电源
    carfox::CarMsgData<float> front_output_current_09 = carfox::CarMsgData<float>(-1); //左远光灯
    carfox::CarMsgData<float> front_output_current_10 = carfox::CarMsgData<float>(-1); //右前雾灯

    carfox::CarMsgData<float> front_output_current_11 = carfox::CarMsgData<float>(-1); //右远光灯
    carfox::CarMsgData<float> front_output_current_12 = carfox::CarMsgData<float>(-1); //行车记录仪电源
    carfox::CarMsgData<float> front_output_current_13 = carfox::CarMsgData<float>(-1); //左近光灯
    carfox::CarMsgData<float> front_output_current_14 = carfox::CarMsgData<float>(-1); //位置灯
    carfox::CarMsgData<float> front_output_current_15 = carfox::CarMsgData<float>(-1); //右近光灯

    carfox::CarMsgData<qint8> front_switch_01 = carfox::CarMsgData<qint8>(-1);         //雨刮快档电机
    carfox::CarMsgData<qint8> front_switch_02 = carfox::CarMsgData<qint8>(-1);         //雨刮慢档电机
    carfox::CarMsgData<qint8> front_switch_03 = carfox::CarMsgData<qint8>(-1);         //喷水电机
    carfox::CarMsgData<qint8> front_switch_04 = carfox::CarMsgData<qint8>(-1);         //左前雾灯
    carfox::CarMsgData<qint8> front_switch_05 = carfox::CarMsgData<qint8>(-1);         //倒车灯
    carfox::CarMsgData<qint8> front_switch_06 = carfox::CarMsgData<qint8>(-1);         //右转向灯
    carfox::CarMsgData<qint8> front_switch_07 = carfox::CarMsgData<qint8>(-1);         //左转相灯
    carfox::CarMsgData<qint8> front_switch_08 = carfox::CarMsgData<qint8>(-1);         //液位显示电源
    carfox::CarMsgData<qint8> front_switch_09 = carfox::CarMsgData<qint8>(-1);         //左远光灯
    carfox::CarMsgData<qint8> front_switch_10 = carfox::CarMsgData<qint8>(-1);         //右前雾灯
    carfox::CarMsgData<qint8> front_switch_11 = carfox::CarMsgData<qint8>(-1);         //右远光灯
    carfox::CarMsgData<qint8> front_switch_12 = carfox::CarMsgData<qint8>(-1);         //行车记录仪电源
    carfox::CarMsgData<qint8> front_switch_13 = carfox::CarMsgData<qint8>(-1);         //左近光灯
    carfox::CarMsgData<qint8> front_switch_14 = carfox::CarMsgData<qint8>(-1);         //位置灯
    carfox::CarMsgData<qint8> front_switch_15 = carfox::CarMsgData<qint8>(-1);         //右近光灯
    carfox::CarMsgData<qint8> front_switch_16 = carfox::CarMsgData<qint8>(-1);         //备用

    carfox::CarMsgData<qint8> front_switch_17 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_18 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_19 = carfox::CarMsgData<qint8>(-1);         //左前摩擦片报警开关
    carfox::CarMsgData<qint8> front_switch_20 = carfox::CarMsgData<qint8>(-1);         //右前摩擦片报警开关
    carfox::CarMsgData<qint8> front_switch_21 = carfox::CarMsgData<qint8>(-1);         //制动灯开关
    carfox::CarMsgData<qint8> front_switch_22 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_23 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_24 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_25 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_26 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_27 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_28 = carfox::CarMsgData<qint8>(-1);         //地址选择1
    carfox::CarMsgData<qint8> front_switch_29 = carfox::CarMsgData<qint8>(-1);         //地址选择2
    carfox::CarMsgData<qint8> front_switch_30 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_31 = carfox::CarMsgData<qint8>(-1);         //倒车灯开关
    carfox::CarMsgData<qint8> front_switch_32 = carfox::CarMsgData<qint8>(-1);         //备用

    carfox::CarMsgData<qint8> front_switch_33 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_34 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_35 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_36 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_37 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_38 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_39 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_40 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_41 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> front_switch_42 = carfox::CarMsgData<qint8>(-1);         //备用

    //中模块
    carfox::CarMsgData<float> middle_output_current_01 = carfox::CarMsgData<float>(-1);   //广告灯箱
    carfox::CarMsgData<float> middle_output_current_02 = carfox::CarMsgData<float>(-1);   //右转向灯
    carfox::CarMsgData<float> middle_output_current_03 = carfox::CarMsgData<float>(-1);   //车内指示灯电源
    carfox::CarMsgData<float> middle_output_current_04 = carfox::CarMsgData<float>(-1);   //制动灯
    carfox::CarMsgData<float> middle_output_current_05 = carfox::CarMsgData<float>(-1);   //前门开门电磁阀

    carfox::CarMsgData<float> middle_output_current_06 = carfox::CarMsgData<float>(-1);   //前路牌
    carfox::CarMsgData<float> middle_output_current_07 = carfox::CarMsgData<float>(-1);   //前门关门电磁阀
    carfox::CarMsgData<float> middle_output_current_08 = carfox::CarMsgData<float>(-1);   //侧路牌
    carfox::CarMsgData<float> middle_output_current_09 = carfox::CarMsgData<float>(-1);   //中门开门电磁阀
    carfox::CarMsgData<float> middle_output_current_10 = carfox::CarMsgData<float>(-1);   //后路牌

    carfox::CarMsgData<float> middle_output_current_11 = carfox::CarMsgData<float>(-1);   //中门关门电磁阀
    carfox::CarMsgData<float> middle_output_current_12 = carfox::CarMsgData<float>(-1);   //电子滚动屏
    carfox::CarMsgData<float> middle_output_current_13 = carfox::CarMsgData<float>(-1);   //小灯电源
    carfox::CarMsgData<float> middle_output_current_14 = carfox::CarMsgData<float>(-1);   //后广告屏
    carfox::CarMsgData<float> middle_output_current_15 = carfox::CarMsgData<float>(-1);   //左转向灯

    carfox::CarMsgData<qint8> middle_switch_01 = carfox::CarMsgData<qint8>(-1);          //广告灯箱
    carfox::CarMsgData<qint8> middle_switch_02 = carfox::CarMsgData<qint8>(-1);          //右转向灯
    carfox::CarMsgData<qint8> middle_switch_03 = carfox::CarMsgData<qint8>(-1);          //车内指示灯电源
    carfox::CarMsgData<qint8> middle_switch_04 = carfox::CarMsgData<qint8>(-1);          //制动灯
    carfox::CarMsgData<qint8> middle_switch_05 = carfox::CarMsgData<qint8>(-1);          //前门开门电磁阀
    carfox::CarMsgData<qint8> middle_switch_06 = carfox::CarMsgData<qint8>(-1);          //前路牌
    carfox::CarMsgData<qint8> middle_switch_07 = carfox::CarMsgData<qint8>(-1);          //前门关门电磁阀
    carfox::CarMsgData<qint8> middle_switch_08 = carfox::CarMsgData<qint8>(-1);          //侧路牌
    carfox::CarMsgData<qint8> middle_switch_09 = carfox::CarMsgData<qint8>(-1);          //中门开门电磁阀
    carfox::CarMsgData<qint8> middle_switch_10 = carfox::CarMsgData<qint8>(-1);          //后路牌
    carfox::CarMsgData<qint8> middle_switch_11 = carfox::CarMsgData<qint8>(-1);          //中门关门电磁阀
    carfox::CarMsgData<qint8> middle_switch_12 = carfox::CarMsgData<qint8>(-1);          //电子滚动屏
    carfox::CarMsgData<qint8> middle_switch_13 = carfox::CarMsgData<qint8>(-1);          //小灯电源
    carfox::CarMsgData<qint8> middle_switch_14 = carfox::CarMsgData<qint8>(-1);          //后广告屏
    carfox::CarMsgData<qint8> middle_switch_15 = carfox::CarMsgData<qint8>(-1);          //左转向灯
    carfox::CarMsgData<qint8> middle_switch_16 = carfox::CarMsgData<qint8>(-1);          //备用

    carfox::CarMsgData<qint8> middle_switch_17 = carfox::CarMsgData<qint8>(-1);          //门铃开关
    carfox::CarMsgData<qint8> middle_switch_18 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_19 = carfox::CarMsgData<qint8>(-1);          //应急阀开启报警
    carfox::CarMsgData<qint8> middle_switch_20 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_21 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_22 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_23 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_24 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_25 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_26 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_27 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_28 = carfox::CarMsgData<qint8>(-1);          //地址选择1
    carfox::CarMsgData<qint8> middle_switch_29 = carfox::CarMsgData<qint8>(-1);          //地址选择2
    carfox::CarMsgData<qint8> middle_switch_30 = carfox::CarMsgData<qint8>(-1);          //前门踏步灯开关
    carfox::CarMsgData<qint8> middle_switch_31 = carfox::CarMsgData<qint8>(-1);          //中门踏步灯开关
    carfox::CarMsgData<qint8> middle_switch_32 = carfox::CarMsgData<qint8>(-1);          //备用

    carfox::CarMsgData<qint8> middle_switch_33 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_34 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_35 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_36 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_37 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_38 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_39 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_40 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_41 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middle_switch_42 = carfox::CarMsgData<qint8>(-1);          //备用


    //后模块
    carfox::CarMsgData<float> back_output_current_01 = carfox::CarMsgData<float>(-1);    //制动灯
    carfox::CarMsgData<float> back_output_current_02 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> back_output_current_03 = carfox::CarMsgData<float>(-1);    //后雾灯
    carfox::CarMsgData<float> back_output_current_04 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> back_output_current_05 = carfox::CarMsgData<float>(-1);    //左转向灯

    carfox::CarMsgData<float> back_output_current_06 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> back_output_current_07 = carfox::CarMsgData<float>(-1);    //右转向灯
    carfox::CarMsgData<float> back_output_current_08 = carfox::CarMsgData<float>(-1);    //干燥器电源
    carfox::CarMsgData<float> back_output_current_09 = carfox::CarMsgData<float>(-1);    //倒车灯
    carfox::CarMsgData<float> back_output_current_10 = carfox::CarMsgData<float>(-1);    //备用

    carfox::CarMsgData<float> back_output_current_11 = carfox::CarMsgData<float>(-1);    //前门踏步灯
    carfox::CarMsgData<float> back_output_current_12 = carfox::CarMsgData<float>(-1);    //位置灯
    carfox::CarMsgData<float> back_output_current_13 = carfox::CarMsgData<float>(-1);    //中门踏步灯
    carfox::CarMsgData<float> back_output_current_14 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> back_output_current_15 = carfox::CarMsgData<float>(-1);    //备用

    carfox::CarMsgData<qint8> back_switch_01 = carfox::CarMsgData<qint8>(-1);           //制动灯
    carfox::CarMsgData<qint8> back_switch_02 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_03 = carfox::CarMsgData<qint8>(-1);           //后雾灯
    carfox::CarMsgData<qint8> back_switch_04 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_05 = carfox::CarMsgData<qint8>(-1);           //左转向灯
    carfox::CarMsgData<qint8> back_switch_06 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_07 = carfox::CarMsgData<qint8>(-1);           //右转向灯
    carfox::CarMsgData<qint8> back_switch_08 = carfox::CarMsgData<qint8>(-1);           //干燥器电源
    carfox::CarMsgData<qint8> back_switch_09 = carfox::CarMsgData<qint8>(-1);           //倒车灯
    carfox::CarMsgData<qint8> back_switch_10 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_11 = carfox::CarMsgData<qint8>(-1);           //前门踏步灯
    carfox::CarMsgData<qint8> back_switch_12 = carfox::CarMsgData<qint8>(-1);           //位置灯
    carfox::CarMsgData<qint8> back_switch_13 = carfox::CarMsgData<qint8>(-1);           //中门踏步灯
    carfox::CarMsgData<qint8> back_switch_14 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_15 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_16 = carfox::CarMsgData<qint8>(-1);           //水位传感器开关

    carfox::CarMsgData<qint8> back_switch_17 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_18 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_19 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_20 = carfox::CarMsgData<qint8>(-1);           //空滤阻塞报警开关
    carfox::CarMsgData<qint8> back_switch_21 = carfox::CarMsgData<qint8>(-1);           //制动灯开关
    carfox::CarMsgData<qint8> back_switch_22 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_23 = carfox::CarMsgData<qint8>(-1);           //驻车制动开关
    carfox::CarMsgData<qint8> back_switch_24 = carfox::CarMsgData<qint8>(-1);           //水温报警开关
    carfox::CarMsgData<qint8> back_switch_25 = carfox::CarMsgData<qint8>(-1);           //低气压1报警开关
    carfox::CarMsgData<qint8> back_switch_26 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_27 = carfox::CarMsgData<qint8>(-1);           //低气压2报警开关
    carfox::CarMsgData<qint8> back_switch_28 = carfox::CarMsgData<qint8>(-1);           //地址开关1
    carfox::CarMsgData<qint8> back_switch_29 = carfox::CarMsgData<qint8>(-1);           //地址开关2
    carfox::CarMsgData<qint8> back_switch_30 = carfox::CarMsgData<qint8>(-1);           //后舱门开关
    carfox::CarMsgData<qint8> back_switch_31 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_32 = carfox::CarMsgData<qint8>(-1);           //备用

    carfox::CarMsgData<qint8> back_switch_33 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_34 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_35 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_36 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_37 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_38 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_39 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_40 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_41 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> back_switch_42 = carfox::CarMsgData<qint8>(-1);           //备用

    //警告提示
    carfox::CarMsgData<QString> warning_01 = carfox::CarMsgData<QString>("");     //水位低报警
    carfox::CarMsgData<QString> warning_02 = carfox::CarMsgData<QString>("");     //左气压低报警
    carfox::CarMsgData<QString> warning_03 = carfox::CarMsgData<QString>("");     //右气压低报警
    carfox::CarMsgData<QString> warning_04 = carfox::CarMsgData<QString>("");     //水温传感器报警
    carfox::CarMsgData<QString> warning_05 = carfox::CarMsgData<QString>("");     //油量传感器报警
    carfox::CarMsgData<QString> warning_06 = carfox::CarMsgData<QString>("");     //机油压力传感器报警
    carfox::CarMsgData<QString> warning_07 = carfox::CarMsgData<QString>("");     //电池电压传感器报警
    carfox::CarMsgData<QString> warning_08 = carfox::CarMsgData<QString>("");     //气压一传感器报警
    carfox::CarMsgData<QString> warning_09 = carfox::CarMsgData<QString>("");     //气压二传感器报警
    carfox::CarMsgData<QString> warning_10 = carfox::CarMsgData<QString>("");     //J1939通信故障
    carfox::CarMsgData<QString> warning_11 = carfox::CarMsgData<QString>("");     //机油压力低，油量低报警
    carfox::CarMsgData<QString> warning_12 = carfox::CarMsgData<QString>("");     //左刹车蹄片报警
    carfox::CarMsgData<QString> warning_13 = carfox::CarMsgData<QString>("");     //右刹车蹄片报警
    carfox::CarMsgData<QString> warning_14 = carfox::CarMsgData<QString>("");     //空滤报警
    carfox::CarMsgData<QString> warning_15 = carfox::CarMsgData<QString>("");     //后处理故障
    carfox::CarMsgData<QString> warning_16 = carfox::CarMsgData<QString>("");     //水温信息丢失
    carfox::CarMsgData<QString> warning_17 = carfox::CarMsgData<QString>("");     //机油压力数据丢失
    carfox::CarMsgData<QString> warning_18 = carfox::CarMsgData<QString>("");     //总线通信故障
    carfox::CarMsgData<QString> warning_19 = carfox::CarMsgData<QString>("");     //单体模块电压过高
    carfox::CarMsgData<QString> warning_20 = carfox::CarMsgData<QString>("");     //单体模块电压过低
    carfox::CarMsgData<QString> warning_21 = carfox::CarMsgData<QString>("");     //SOC过高
    carfox::CarMsgData<QString> warning_22 = carfox::CarMsgData<QString>("");     //SOC过低
    carfox::CarMsgData<QString> warning_23 = carfox::CarMsgData<QString>("");     //内部通讯失败
    carfox::CarMsgData<QString> warning_24 = carfox::CarMsgData<QString>("");     //总电压欠压
    carfox::CarMsgData<QString> warning_25 = carfox::CarMsgData<QString>("");     //总电压过压
    carfox::CarMsgData<QString> warning_26 = carfox::CarMsgData<QString>("");     //电池不均衡故障
    carfox::CarMsgData<QString> warning_27 = carfox::CarMsgData<QString>("");     //电池热失控
    carfox::CarMsgData<QString> warning_28 = carfox::CarMsgData<QString>("");     //DCDC故障报警（1故障，0正常）
    carfox::CarMsgData<QString> warning_29 = carfox::CarMsgData<QString>("");     //绝缘报警
    carfox::CarMsgData<QString> warning_30 = carfox::CarMsgData<QString>("");     //放电电流过大
    carfox::CarMsgData<QString> warning_31 = carfox::CarMsgData<QString>("");     //充电电流过大
    carfox::CarMsgData<QString> warning_32 = carfox::CarMsgData<QString>("");     //温度过高
    carfox::CarMsgData<QString> warning_33 = carfox::CarMsgData<QString>("");     //温度报警
    carfox::CarMsgData<QString> warning_34 = carfox::CarMsgData<QString>("");     //温度差过大
    carfox::CarMsgData<QString> warning_35 = carfox::CarMsgData<QString>("");     //内部接触器信号
    carfox::CarMsgData<QString> warning_36 = carfox::CarMsgData<QString>("");     //有内阻偏大电池
    carfox::CarMsgData<QString> warning_37 = carfox::CarMsgData<QString>("");     //有容量偏小电池
    carfox::CarMsgData<QString> warning_38 = carfox::CarMsgData<QString>("");     //水温高报警
    carfox::CarMsgData<QString> warning_39 = carfox::CarMsgData<QString>("");     //油量低报警
    carfox::CarMsgData<QString> warning_40 = carfox::CarMsgData<QString>("");     //保留
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

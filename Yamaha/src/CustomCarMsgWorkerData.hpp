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
    carfox::CarMsgData<qint16> moterControlTemp = carfox::CarMsgData<qint16>(-1);  //电机控制器温度, 0 ℃
    carfox::CarMsgData<qint16> moterTemp = carfox::CarMsgData<qint16>(-1);         //电机温度, 0 ℃
    carfox::CarMsgData<qint16> battery = carfox::CarMsgData<qint16>(-1);           //蓄电池电压
    carfox::CarMsgData<qint16> spn = carfox::CarMsgData<qint16>(-1);               //SPN值
    carfox::CarMsgData<qint16> engineWaterTemp = carfox::CarMsgData<qint16>(-1);   //发动机水温
    carfox::CarMsgData<qint16> ureaLevel = carfox::CarMsgData<qint16>(-1);          //尿素液位
    carfox::CarMsgData<quint16> faultLevel = carfox::CarMsgData<quint16>(-1);       //故障等级
    carfox::CarMsgData<qint16> faultCode = carfox::CarMsgData<qint16>(-1);          //故障代码
    carfox::CarMsgData<quint16> oilLevel = carfox::CarMsgData<quint16>(-1);         //油量百分比
    carfox::CarMsgData<float> engineOilPressure = carfox::CarMsgData<float>(-1);    //发动机机油压力

    //控制系统信息
    carfox::CarMsgData<float> motorInVoltage = carfox::CarMsgData<float>(-1);		   //电机输入电压, 0 V
    carfox::CarMsgData<float> motorInCurrent = carfox::CarMsgData<float>(-1);		   //电机输入电流, 0 A
    carfox::CarMsgData<qint16> motorTemp = carfox::CarMsgData<qint16>(-1);			   //电机温度, 0 ℃
    carfox::CarMsgData<qint16> motorControllerTemp = carfox::CarMsgData<qint16>(-1); //电机控制器温度, 0 ℃
    carfox::CarMsgData<qint16> carVcuMode = carfox::CarMsgData<qint16>(-1);			   //整车模式, 0
    carfox::CarMsgData<double> version = carfox::CarMsgData<double>(-1);			   //程序版本, 0.00
    carfox::CarMsgData<qint16> carLife = carfox::CarMsgData<qint16>(-1);			   //整车控制器Life, 0
    carfox::CarMsgData<float> accelPedalPercent = carfox::CarMsgData<float>(-1); 	   //加速踏板百分比,0.0 %
    carfox::CarMsgData<float> brakePedalPercent = carfox::CarMsgData<float>(-1);	   //制动踏板百分比,0.0 %
    carfox::CarMsgData<quint16> din1 = carfox::CarMsgData<quint16>(-1);			       //数字量输入1, 00000000（2进制显示）
    carfox::CarMsgData<quint16> din2 = carfox::CarMsgData<quint16>(-1);			       //数字量输入2, 00000000（2进制显示）
    carfox::CarMsgData<quint16> din3 = carfox::CarMsgData<quint16>(-1);			       //数字量输入3, 00000000（2进制显示）
    carfox::CarMsgData<quint16> dout1 = carfox::CarMsgData<quint16>(-1);			   //数字量输出1, 00000000（2进制显示）
    carfox::CarMsgData<quint16> dout2 = carfox::CarMsgData<quint16>(-1);			   //数字量输出2, 00000000（2进制显示）
    carfox::CarMsgData<quint16> dout3 = carfox::CarMsgData<quint16>(-1);			   //数字量输出3, 00000000（2进制显示）

    //发动机系统信息
    carfox::CarMsgData<float> engineFuelConsumption = carfox::CarMsgData<float>(-1);   	//发动机油耗, 0.00 L/H
    carfox::CarMsgData<float> engineLoad = carfox::CarMsgData<float>(-1);			        //发动机负荷, 0 %
    carfox::CarMsgData<float> engineTargetThrottle = carfox::CarMsgData<float>(-1);		//发动机目标油门, 0.0 %
    carfox::CarMsgData<float> engineActualThrottle = carfox::CarMsgData<float>(-1);		//发动机实际油门, 0.0 %
    carfox::CarMsgData<qint16> engineInletTemperature = carfox::CarMsgData<qint16>(-1);	//发动机进气温度, 0 ℃

    //辅助系统信息
    carfox::CarMsgData<float> oilPumpDcacWoutputCurrent = carfox::CarMsgData<float>(-1);      //油泵DC/AC W相输出电流, 0 A
    carfox::CarMsgData<float> oilPumpDcacVoutputCurrent = carfox::CarMsgData<float>(-1);      //油泵DC/AC V相输出电流, 0 A
    carfox::CarMsgData<float> oilPumpDcacUoutputCurrent = carfox::CarMsgData<float>(-1);      //油泵DC/AC U相输出电流, 0 A
    carfox::CarMsgData<qint16> radiatorTemperature = carfox::CarMsgData<qint16>(-1);              //散热器温度, 0 ℃

    //TCU系统信息
    carfox::CarMsgData<qint16> actualClutchPosition = carfox::CarMsgData<qint16>(-1);		//离合实际位置, 0
    carfox::CarMsgData<quint16> tcuFaultCode = carfox::CarMsgData<quint16>(-1);			//TCU故障信息, 00000000（2进制显示）
    carfox::CarMsgData<qint16> axisRpm = carfox::CarMsgData<qint16>(-1);                   //变速箱输出轴转速, 0 RPM
    carfox::CarMsgData<qint16> fmi = carfox::CarMsgData<qint16>(-1);                        //FMI值, 0
    carfox::CarMsgData<qint16> cm = carfox::CarMsgData<qint16>(-1);                         //CM值, 0
    carfox::CarMsgData<quint16> oc = carfox::CarMsgData<quint16>(-1);			        	//OC, 0（16进制显示）

    //电池管理系统
    carfox::CarMsgData<float> batMaxChargeCurrent = carfox::CarMsgData<float>(-1);		//最大允许充电电流,, 0.0 A
    carfox::CarMsgData<float> batMaxDischargeCurrent = carfox::CarMsgData<float>(-1);	//最大允许放电电流,, 0.0 A
    carfox::CarMsgData<float> batAverageVoltage = carfox::CarMsgData<float>(-1);          //单体平均电压, 0.00 V
    carfox::CarMsgData<quint16> batStatus1 = carfox::CarMsgData<quint16>(-1);              //电池状态1, 00000000（2进制显示）
    carfox::CarMsgData<quint16> batStatus2 = carfox::CarMsgData<quint16>(-1);              //电池状态2, 00000000（2进制显示）
    carfox::CarMsgData<quint16> batStatus3 = carfox::CarMsgData<quint16>(-1);              //电池状态3, 00000000（2进制显示）
    carfox::CarMsgData<float> irmOhmPositive = carfox::CarMsgData<float>(-1);             //总正绝缘阻值, 0 KΩ
    carfox::CarMsgData<float> irmOhmNegative = carfox::CarMsgData<float>(-1);             //总负绝缘阻值, 0 KΩ
    carfox::CarMsgData<float> batMaxVoltage = carfox::CarMsgData<float>(-1);              //单体最高电压, 0.00 V
    carfox::CarMsgData<float> batMinVoltage = carfox::CarMsgData<float>(-1);              //单体最低电压, 0.00 V
    carfox::CarMsgData<float> batteryHighestTemp = carfox::CarMsgData<float>(-1);         //单体最高温度, 0.0 ℃

    //空调系统信息
    carfox::CarMsgData<quint16> acFaultCode = carfox::CarMsgData<quint16>(-1);            //空调故障代码, 00000000（2进制显示）
    carfox::CarMsgData<quint16> acFanStatus = carfox::CarMsgData<quint16>(-1);            //空调风机状态, 00000000（2进制显示）
    carfox::CarMsgData<quint16> acWorkStatus = carfox::CarMsgData<quint16>(-1);           //空调工作状态, 00000000（2进制显示）
    carfox::CarMsgData<quint16> acLife = carfox::CarMsgData<quint16>(-1);                  //空调Life, 0
    carfox::CarMsgData<qint16> acOutTemp = carfox::CarMsgData<qint16>(-1);                //车外实际温度, 0 ℃
    carfox::CarMsgData<qint16> acInTemp = carfox::CarMsgData<qint16>(-1);                 //车内实际温度, 0 ℃
    carfox::CarMsgData<qint16> acSetTemp = carfox::CarMsgData<qint16>(-1);                //设定温度, 0 ℃
    carfox::CarMsgData<quint16> acRefrigereReq = carfox::CarMsgData<quint16>(-1);         //空调制冷请求, 00000000（2进制显示）

    //仪表信息
    carfox::CarMsgData<qint8> inputCtrl01 = carfox::CarMsgData<qint8>(-1);        //左转向开关
    carfox::CarMsgData<qint8> inputCtrl02 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl03 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl04 = carfox::CarMsgData<qint8>(-1);        //钥匙ST开关
    carfox::CarMsgData<qint8> inputCtrl05 = carfox::CarMsgData<qint8>(-1);        //右转向开关
    carfox::CarMsgData<qint8> inputCtrl06 = carfox::CarMsgData<qint8>(-1);        //小灯开关
    carfox::CarMsgData<qint8> inputCtrl07 = carfox::CarMsgData<qint8>(-1);        //远光灯开关
    carfox::CarMsgData<qint8> inputCtrl08 = carfox::CarMsgData<qint8>(-1);        //近光灯开关
    carfox::CarMsgData<qint8> inputCtrl09 = carfox::CarMsgData<qint8>(-1);        //前雾灯开关
    carfox::CarMsgData<qint8> inputCtrl10 = carfox::CarMsgData<qint8>(-1);        //后雾灯开关
    carfox::CarMsgData<qint8> inputCtrl11 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl12 = carfox::CarMsgData<qint8>(-1);        //广告灯箱开关
    carfox::CarMsgData<qint8> inputCtrl13 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl14 = carfox::CarMsgData<qint8>(-1);        //雨刮低档开关
    carfox::CarMsgData<qint8> inputCtrl15 = carfox::CarMsgData<qint8>(-1);        //雨刮间歇档开关
    carfox::CarMsgData<qint8> inputCtrl16 = carfox::CarMsgData<qint8>(-1);        //雨刮高档开关
    carfox::CarMsgData<qint8> inputCtrl17 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl18 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl19 = carfox::CarMsgData<qint8>(-1);        //路牌开关
    carfox::CarMsgData<qint8> inputCtrl20 = carfox::CarMsgData<qint8>(-1);        //前门开开关
    carfox::CarMsgData<qint8> inputCtrl21 = carfox::CarMsgData<qint8>(-1);        //雨刮喷水档开关
    carfox::CarMsgData<qint8> inputCtrl22 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl23 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl24 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl25 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl26 = carfox::CarMsgData<qint8>(-1);        //中门关开关
    carfox::CarMsgData<qint8> inputCtrl27 = carfox::CarMsgData<qint8>(-1);        //中门开开关
    carfox::CarMsgData<qint8> inputCtrl28 = carfox::CarMsgData<qint8>(-1);        //前门关开关
    carfox::CarMsgData<qint8> inputCtrl29 = carfox::CarMsgData<qint8>(-1);        //燃油量过低报警
    carfox::CarMsgData<qint8> inputCtrl30 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl31 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl32 = carfox::CarMsgData<qint8>(-1);        //备用
    carfox::CarMsgData<qint8> inputCtrl33 = carfox::CarMsgData<qint8>(-1);        //危险报警
    carfox::CarMsgData<qint8> inputCtrl34 = carfox::CarMsgData<qint8>(-1);        //电源唤醒
    carfox::CarMsgData<qint8> inputCtrl35 = carfox::CarMsgData<qint8>(-1);        //钥匙ON

    //符号片显示
    carfox::CarMsgData<qint8> lampKeyOn = carfox::CarMsgData<qint8>(-1);                     //钥匙ON开关(总电源指示)
    carfox::CarMsgData<qint8> lampAirFilter = carfox::CarMsgData<qint8>(-1);                 //空滤指示
    carfox::CarMsgData<qint8> lampAsr = carfox::CarMsgData<qint8>(-1);                        //ASR指示
    carfox::CarMsgData<qint8> lampHighVoltageMaintenance = carfox::CarMsgData<qint8>(-1);   //高压检修
    carfox::CarMsgData<qint8> lampDefroster = carfox::CarMsgData<qint8>(-1);                  //除霜器
    carfox::CarMsgData<qint8> lampDryere = carfox::CarMsgData<qint8>(-1);                     //干燥器
    carfox::CarMsgData<qint8> lampAbs = carfox::CarMsgData<qint8>(-1);                        //ABS指示
    carfox::CarMsgData<qint8> lampAc = carfox::CarMsgData<qint8>(-1);                         //AC空调指示
    carfox::CarMsgData<QString> powerSupply = carfox::CarMsgData<QString>("");                //Power模式符号片(纯电动模式 or 混动模式 or 插电模式)
    carfox::CarMsgData<qint8> climbingMode = carfox::CarMsgData<qint8>(-1);                   //爬坡模式符号片
    carfox::CarMsgData<qint8> diagnosticMode = carfox::CarMsgData<qint8>(-1);                 //诊断模式符号片

    carfox::CarMsgData<qint8> lampTurnLeft = carfox::CarMsgData<qint8>(-1);         	       //左转向
    carfox::CarMsgData<qint8> lampTurnRight = carfox::CarMsgData<qint8>(-1);       	       //右转向

    carfox::CarMsgData<qint8> lampDoubleFlash = carfox::CarMsgData<qint8>(-1);      	       //双闪开启
    carfox::CarMsgData<qint8> lampFrontFog = carfox::CarMsgData<qint8>(-1);         	       //前雾灯
    carfox::CarMsgData<qint8> lampRearFog = carfox::CarMsgData<qint8>(-1);         	       //后雾灯
    carfox::CarMsgData<qint8> lampHighBeam = carfox::CarMsgData<qint8>(-1);        	       //远光灯
    carfox::CarMsgData<qint8> lampHeadLight = carfox::CarMsgData<qint8>(-1);       	       //近光灯
    carfox::CarMsgData<qint8> lampReverseGear = carfox::CarMsgData<qint8>(-1);               //倒车灯
    carfox::CarMsgData<qint8> lampPositionLight = carfox::CarMsgData<qint8>(-1);             //位置灯

    carfox::CarMsgData<qint8> lampGate1 = carfox::CarMsgData<qint8>(-1);            	       //前门开
    carfox::CarMsgData<qint8> lampGate2 = carfox::CarMsgData<qint8>(-1);                      //中门开
    carfox::CarMsgData<qint8> lampRearDoorOpen = carfox::CarMsgData<qint8>(-1);             //后舱门开指示

    carfox::CarMsgData<qint8> lampBrake = carfox::CarMsgData<qint8>(-1);                      //刹车制动
    carfox::CarMsgData<qint8> lampParkingBrake = carfox::CarMsgData<qint8>(-1);              //驻车制动

    carfox::CarMsgData<qint8> lampLeftLowAirPressure = carfox::CarMsgData<qint8>(-1);      //左气压低报警
    carfox::CarMsgData<qint8> lampRightLowAirPressure = carfox::CarMsgData<qint8>(-1);     //右气压低报警

    carfox::CarMsgData<qint8> lampLeftShoeWear = carfox::CarMsgData<qint8>(-1);             //左前摩擦片(刹车蹄片)报警
    carfox::CarMsgData<qint8> lampRightShoeWear = carfox::CarMsgData<qint8>(-1);            //右前摩擦片(刹车蹄片)报警

    carfox::CarMsgData<qint8> lampChargeConfirm = carfox::CarMsgData<qint8>(-1);             //充电确认
    carfox::CarMsgData<qint8> lampBatteryMainContact = carfox::CarMsgData<qint8>(-1);       //电池主接触器KT

    carfox::CarMsgData<qint8> lampWaterTempHigh = carfox::CarMsgData<qint8>(-1);            //水温高报警
    carfox::CarMsgData<qint8> lampWaterLevelLow = carfox::CarMsgData<qint8>(-1);            //水位低指示

    carfox::CarMsgData<qint8> lampLowServiceWl = carfox::CarMsgData<qint8>(-1);             //轻微故障报警STOP
    carfox::CarMsgData<qint8> lampHeavyStopWl = carfox::CarMsgData<qint8>(-1);              //重大故障报警STOP
    carfox::CarMsgData<qint8> lampSeriousStopWl = carfox::CarMsgData<qint8>(-1);            //严重故障报警STOP

    carfox::CarMsgData<qint8> lampOilLevelLow = carfox::CarMsgData<qint8>(-1);              //油量低报警
    carfox::CarMsgData<qint8> lampOilPressureLow = carfox::CarMsgData<qint8>(-1);           //机油压力低
    carfox::CarMsgData<qint8> lampEngineFault = carfox::CarMsgData<qint8>(-1);               //发动机故障

    carfox::CarMsgData<qint8> lampMotorOutOfService = carfox::CarMsgData<qint8>(-1);       //24V发电机未工作
    carfox::CarMsgData<qint8> lampMoterFireIgon = carfox::CarMsgData<qint8>(-1);            //发电机点火指示

    //前模块
    carfox::CarMsgData<float> frontOutputCurrent01 = carfox::CarMsgData<float>(-1); //雨刮快档电机
    carfox::CarMsgData<float> frontOutputCurrent02 = carfox::CarMsgData<float>(-1); //雨刮慢档电机
    carfox::CarMsgData<float> frontOutputCurrent03 = carfox::CarMsgData<float>(-1); //喷水电机
    carfox::CarMsgData<float> frontOutputCurrent04 = carfox::CarMsgData<float>(-1); //左前雾灯
    carfox::CarMsgData<float> frontOutputCurrent05 = carfox::CarMsgData<float>(-1); //倒车灯

    carfox::CarMsgData<float> frontOutputCurrent06 = carfox::CarMsgData<float>(-1); //右转向灯
    carfox::CarMsgData<float> frontOutputCurrent07 = carfox::CarMsgData<float>(-1); //左转相灯
    carfox::CarMsgData<float> frontOutputCurrent08 = carfox::CarMsgData<float>(-1); //液位显示电源
    carfox::CarMsgData<float> frontOutputCurrent09 = carfox::CarMsgData<float>(-1); //左远光灯
    carfox::CarMsgData<float> frontOutputCurrent10 = carfox::CarMsgData<float>(-1); //右前雾灯

    carfox::CarMsgData<float> frontOutputCurrent11 = carfox::CarMsgData<float>(-1); //右远光灯
    carfox::CarMsgData<float> frontOutputCurrent12 = carfox::CarMsgData<float>(-1); //行车记录仪电源
    carfox::CarMsgData<float> frontOutputCurrent13 = carfox::CarMsgData<float>(-1); //左近光灯
    carfox::CarMsgData<float> frontOutputCurrent14 = carfox::CarMsgData<float>(-1); //位置灯
    carfox::CarMsgData<float> frontOutputCurrent15 = carfox::CarMsgData<float>(-1); //右近光灯

    carfox::CarMsgData<qint8> frontSwitch01 = carfox::CarMsgData<qint8>(-1);         //雨刮快档电机
    carfox::CarMsgData<qint8> frontSwitch02 = carfox::CarMsgData<qint8>(-1);         //雨刮慢档电机
    carfox::CarMsgData<qint8> frontSwitch03 = carfox::CarMsgData<qint8>(-1);         //喷水电机
    carfox::CarMsgData<qint8> frontSwitch04 = carfox::CarMsgData<qint8>(-1);         //左前雾灯
    carfox::CarMsgData<qint8> frontSwitch05 = carfox::CarMsgData<qint8>(-1);         //倒车灯
    carfox::CarMsgData<qint8> frontSwitch06 = carfox::CarMsgData<qint8>(-1);         //右转向灯
    carfox::CarMsgData<qint8> frontSwitch07 = carfox::CarMsgData<qint8>(-1);         //左转相灯
    carfox::CarMsgData<qint8> frontSwitch08 = carfox::CarMsgData<qint8>(-1);         //液位显示电源
    carfox::CarMsgData<qint8> frontSwitch09 = carfox::CarMsgData<qint8>(-1);         //左远光灯
    carfox::CarMsgData<qint8> frontSwitch10 = carfox::CarMsgData<qint8>(-1);         //右前雾灯
    carfox::CarMsgData<qint8> frontSwitch11 = carfox::CarMsgData<qint8>(-1);         //右远光灯
    carfox::CarMsgData<qint8> frontSwitch12 = carfox::CarMsgData<qint8>(-1);         //行车记录仪电源
    carfox::CarMsgData<qint8> frontSwitch13 = carfox::CarMsgData<qint8>(-1);         //左近光灯
    carfox::CarMsgData<qint8> frontSwitch14 = carfox::CarMsgData<qint8>(-1);         //位置灯
    carfox::CarMsgData<qint8> frontSwitch15 = carfox::CarMsgData<qint8>(-1);         //右近光灯
    carfox::CarMsgData<qint8> frontSwitch16 = carfox::CarMsgData<qint8>(-1);         //备用

    carfox::CarMsgData<qint8> frontSwitch17 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch18 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch19 = carfox::CarMsgData<qint8>(-1);         //左前摩擦片报警开关
    carfox::CarMsgData<qint8> frontSwitch20 = carfox::CarMsgData<qint8>(-1);         //右前摩擦片报警开关
    carfox::CarMsgData<qint8> frontSwitch21 = carfox::CarMsgData<qint8>(-1);         //制动灯开关
    carfox::CarMsgData<qint8> frontSwitch22 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch23 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch24 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch25 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch26 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch27 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch28 = carfox::CarMsgData<qint8>(-1);         //地址选择1
    carfox::CarMsgData<qint8> frontSwitch29 = carfox::CarMsgData<qint8>(-1);         //地址选择2
    carfox::CarMsgData<qint8> frontSwitch30 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch31 = carfox::CarMsgData<qint8>(-1);         //倒车灯开关
    carfox::CarMsgData<qint8> frontSwitch32 = carfox::CarMsgData<qint8>(-1);         //备用

    carfox::CarMsgData<qint8> frontSwitch33 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch34 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch35 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch36 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch37 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch38 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch39 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch40 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch41 = carfox::CarMsgData<qint8>(-1);         //备用
    carfox::CarMsgData<qint8> frontSwitch42 = carfox::CarMsgData<qint8>(-1);         //备用

    //中模块
    carfox::CarMsgData<float> middleOutputCurrent01 = carfox::CarMsgData<float>(-1);   //广告灯箱
    carfox::CarMsgData<float> middleOutputCurrent02 = carfox::CarMsgData<float>(-1);   //右转向灯
    carfox::CarMsgData<float> middleOutputCurrent03 = carfox::CarMsgData<float>(-1);   //车内指示灯电源
    carfox::CarMsgData<float> middleOutputCurrent04 = carfox::CarMsgData<float>(-1);   //制动灯
    carfox::CarMsgData<float> middleOutputCurrent05 = carfox::CarMsgData<float>(-1);   //前门开门电磁阀

    carfox::CarMsgData<float> middleOutputCurrent06 = carfox::CarMsgData<float>(-1);   //前路牌
    carfox::CarMsgData<float> middleOutputCurrent07 = carfox::CarMsgData<float>(-1);   //前门关门电磁阀
    carfox::CarMsgData<float> middleOutputCurrent08 = carfox::CarMsgData<float>(-1);   //侧路牌
    carfox::CarMsgData<float> middleOutputCurrent09 = carfox::CarMsgData<float>(-1);   //中门开门电磁阀
    carfox::CarMsgData<float> middleOutputCurrent10 = carfox::CarMsgData<float>(-1);   //后路牌

    carfox::CarMsgData<float> middleOutputCurrent11 = carfox::CarMsgData<float>(-1);   //中门关门电磁阀
    carfox::CarMsgData<float> middleOutputCurrent12 = carfox::CarMsgData<float>(-1);   //电子滚动屏
    carfox::CarMsgData<float> middleOutputCurrent13 = carfox::CarMsgData<float>(-1);   //小灯电源
    carfox::CarMsgData<float> middleOutputCurrent14 = carfox::CarMsgData<float>(-1);   //后广告屏
    carfox::CarMsgData<float> middleOutputCurrent15 = carfox::CarMsgData<float>(-1);   //左转向灯

    carfox::CarMsgData<qint8> middleSwitch01 = carfox::CarMsgData<qint8>(-1);          //广告灯箱
    carfox::CarMsgData<qint8> middleSwitch02 = carfox::CarMsgData<qint8>(-1);          //右转向灯
    carfox::CarMsgData<qint8> middleSwitch03 = carfox::CarMsgData<qint8>(-1);          //车内指示灯电源
    carfox::CarMsgData<qint8> middleSwitch04 = carfox::CarMsgData<qint8>(-1);          //制动灯
    carfox::CarMsgData<qint8> middleSwitch05 = carfox::CarMsgData<qint8>(-1);          //前门开门电磁阀
    carfox::CarMsgData<qint8> middleSwitch06 = carfox::CarMsgData<qint8>(-1);          //前路牌
    carfox::CarMsgData<qint8> middleSwitch07 = carfox::CarMsgData<qint8>(-1);          //前门关门电磁阀
    carfox::CarMsgData<qint8> middleSwitch08 = carfox::CarMsgData<qint8>(-1);          //侧路牌
    carfox::CarMsgData<qint8> middleSwitch09 = carfox::CarMsgData<qint8>(-1);          //中门开门电磁阀
    carfox::CarMsgData<qint8> middleSwitch10 = carfox::CarMsgData<qint8>(-1);          //后路牌
    carfox::CarMsgData<qint8> middleSwitch11 = carfox::CarMsgData<qint8>(-1);          //中门关门电磁阀
    carfox::CarMsgData<qint8> middleSwitch12 = carfox::CarMsgData<qint8>(-1);          //电子滚动屏
    carfox::CarMsgData<qint8> middleSwitch13 = carfox::CarMsgData<qint8>(-1);          //小灯电源
    carfox::CarMsgData<qint8> middleSwitch14 = carfox::CarMsgData<qint8>(-1);          //后广告屏
    carfox::CarMsgData<qint8> middleSwitch15 = carfox::CarMsgData<qint8>(-1);          //左转向灯
    carfox::CarMsgData<qint8> middleSwitch16 = carfox::CarMsgData<qint8>(-1);          //备用

    carfox::CarMsgData<qint8> middleSwitch17 = carfox::CarMsgData<qint8>(-1);          //门铃开关
    carfox::CarMsgData<qint8> middleSwitch18 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch19 = carfox::CarMsgData<qint8>(-1);          //应急阀开启报警
    carfox::CarMsgData<qint8> middleSwitch20 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch21 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch22 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch23 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch24 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch25 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch26 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch27 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch28 = carfox::CarMsgData<qint8>(-1);          //地址选择1
    carfox::CarMsgData<qint8> middleSwitch29 = carfox::CarMsgData<qint8>(-1);          //地址选择2
    carfox::CarMsgData<qint8> middleSwitch30 = carfox::CarMsgData<qint8>(-1);          //前门踏步灯开关
    carfox::CarMsgData<qint8> middleSwitch31 = carfox::CarMsgData<qint8>(-1);          //中门踏步灯开关
    carfox::CarMsgData<qint8> middleSwitch32 = carfox::CarMsgData<qint8>(-1);          //备用

    carfox::CarMsgData<qint8> middleSwitch33 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch34 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch35 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch36 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch37 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch38 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch39 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch40 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch41 = carfox::CarMsgData<qint8>(-1);          //备用
    carfox::CarMsgData<qint8> middleSwitch42 = carfox::CarMsgData<qint8>(-1);          //备用


    //后模块
    carfox::CarMsgData<float> backOutputCurrent01 = carfox::CarMsgData<float>(-1);    //制动灯
    carfox::CarMsgData<float> backOutputCurrent02 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> backOutputCurrent03 = carfox::CarMsgData<float>(-1);    //后雾灯
    carfox::CarMsgData<float> backOutputCurrent04 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> backOutputCurrent05 = carfox::CarMsgData<float>(-1);    //左转向灯

    carfox::CarMsgData<float> backOutputCurrent06 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> backOutputCurrent07 = carfox::CarMsgData<float>(-1);    //右转向灯
    carfox::CarMsgData<float> backOutputCurrent08 = carfox::CarMsgData<float>(-1);    //干燥器电源
    carfox::CarMsgData<float> backOutputCurrent09 = carfox::CarMsgData<float>(-1);    //倒车灯
    carfox::CarMsgData<float> backOutputCurrent10 = carfox::CarMsgData<float>(-1);    //备用

    carfox::CarMsgData<float> backOutputCurrent11 = carfox::CarMsgData<float>(-1);    //前门踏步灯
    carfox::CarMsgData<float> backOutputCurrent12 = carfox::CarMsgData<float>(-1);    //位置灯
    carfox::CarMsgData<float> backOutputCurrent13 = carfox::CarMsgData<float>(-1);    //中门踏步灯
    carfox::CarMsgData<float> backOutputCurrent14 = carfox::CarMsgData<float>(-1);    //备用
    carfox::CarMsgData<float> backOutputCurrent15 = carfox::CarMsgData<float>(-1);    //备用

    carfox::CarMsgData<qint8> backSwitch01 = carfox::CarMsgData<qint8>(-1);           //制动灯
    carfox::CarMsgData<qint8> backSwitch02 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch03 = carfox::CarMsgData<qint8>(-1);           //后雾灯
    carfox::CarMsgData<qint8> backSwitch04 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch05 = carfox::CarMsgData<qint8>(-1);           //左转向灯
    carfox::CarMsgData<qint8> backSwitch06 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch07 = carfox::CarMsgData<qint8>(-1);           //右转向灯
    carfox::CarMsgData<qint8> backSwitch08 = carfox::CarMsgData<qint8>(-1);           //干燥器电源
    carfox::CarMsgData<qint8> backSwitch09 = carfox::CarMsgData<qint8>(-1);           //倒车灯
    carfox::CarMsgData<qint8> backSwitch10 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch11 = carfox::CarMsgData<qint8>(-1);           //前门踏步灯
    carfox::CarMsgData<qint8> backSwitch12 = carfox::CarMsgData<qint8>(-1);           //位置灯
    carfox::CarMsgData<qint8> backSwitch13 = carfox::CarMsgData<qint8>(-1);           //中门踏步灯
    carfox::CarMsgData<qint8> backSwitch14 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch15 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch16 = carfox::CarMsgData<qint8>(-1);           //水位传感器开关

    carfox::CarMsgData<qint8> backSwitch17 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch18 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch19 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch20 = carfox::CarMsgData<qint8>(-1);           //空滤阻塞报警开关
    carfox::CarMsgData<qint8> backSwitch21 = carfox::CarMsgData<qint8>(-1);           //制动灯开关
    carfox::CarMsgData<qint8> backSwitch22 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch23 = carfox::CarMsgData<qint8>(-1);           //驻车制动开关
    carfox::CarMsgData<qint8> backSwitch24 = carfox::CarMsgData<qint8>(-1);           //水温报警开关
    carfox::CarMsgData<qint8> backSwitch25 = carfox::CarMsgData<qint8>(-1);           //低气压1报警开关
    carfox::CarMsgData<qint8> backSwitch26 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch27 = carfox::CarMsgData<qint8>(-1);           //低气压2报警开关
    carfox::CarMsgData<qint8> backSwitch28 = carfox::CarMsgData<qint8>(-1);           //地址开关1
    carfox::CarMsgData<qint8> backSwitch29 = carfox::CarMsgData<qint8>(-1);           //地址开关2
    carfox::CarMsgData<qint8> backSwitch30 = carfox::CarMsgData<qint8>(-1);           //后舱门开关
    carfox::CarMsgData<qint8> backSwitch31 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch32 = carfox::CarMsgData<qint8>(-1);           //备用

    carfox::CarMsgData<qint8> backSwitch33 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch34 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch35 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch36 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch37 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch38 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch39 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch40 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch41 = carfox::CarMsgData<qint8>(-1);           //备用
    carfox::CarMsgData<qint8> backSwitch42 = carfox::CarMsgData<qint8>(-1);           //备用

    //警告提示
    carfox::CarMsgData<QString> warning01 = carfox::CarMsgData<QString>("");     //水位低报警
    carfox::CarMsgData<QString> warning02 = carfox::CarMsgData<QString>("");     //左气压低报警
    carfox::CarMsgData<QString> warning03 = carfox::CarMsgData<QString>("");     //右气压低报警
    carfox::CarMsgData<QString> warning04 = carfox::CarMsgData<QString>("");     //水温传感器报警
    carfox::CarMsgData<QString> warning05 = carfox::CarMsgData<QString>("");     //油量传感器报警
    carfox::CarMsgData<QString> warning06 = carfox::CarMsgData<QString>("");     //机油压力传感器报警
    carfox::CarMsgData<QString> warning07 = carfox::CarMsgData<QString>("");     //电池电压传感器报警
    carfox::CarMsgData<QString> warning08 = carfox::CarMsgData<QString>("");     //气压一传感器报警
    carfox::CarMsgData<QString> warning09 = carfox::CarMsgData<QString>("");     //气压二传感器报警
    carfox::CarMsgData<QString> warning10 = carfox::CarMsgData<QString>("");     //J1939通信故障
    carfox::CarMsgData<QString> warning11 = carfox::CarMsgData<QString>("");     //机油压力低，油量低报警
    carfox::CarMsgData<QString> warning12 = carfox::CarMsgData<QString>("");     //左刹车蹄片报警
    carfox::CarMsgData<QString> warning13 = carfox::CarMsgData<QString>("");     //右刹车蹄片报警
    carfox::CarMsgData<QString> warning14 = carfox::CarMsgData<QString>("");     //空滤报警
    carfox::CarMsgData<QString> warning15 = carfox::CarMsgData<QString>("");     //后处理故障
    carfox::CarMsgData<QString> warning16 = carfox::CarMsgData<QString>("");     //水温信息丢失
    carfox::CarMsgData<QString> warning17 = carfox::CarMsgData<QString>("");     //机油压力数据丢失
    carfox::CarMsgData<QString> warning18 = carfox::CarMsgData<QString>("");     //总线通信故障
    carfox::CarMsgData<QString> warning19 = carfox::CarMsgData<QString>("");     //单体模块电压过高
    carfox::CarMsgData<QString> warning20 = carfox::CarMsgData<QString>("");     //单体模块电压过低
    carfox::CarMsgData<QString> warning21 = carfox::CarMsgData<QString>("");     //SOC过高
    carfox::CarMsgData<QString> warning22 = carfox::CarMsgData<QString>("");     //SOC过低
    carfox::CarMsgData<QString> warning23 = carfox::CarMsgData<QString>("");     //内部通讯失败
    carfox::CarMsgData<QString> warning24 = carfox::CarMsgData<QString>("");     //总电压欠压
    carfox::CarMsgData<QString> warning25 = carfox::CarMsgData<QString>("");     //总电压过压
    carfox::CarMsgData<QString> warning26 = carfox::CarMsgData<QString>("");     //电池不均衡故障
    carfox::CarMsgData<QString> warning27 = carfox::CarMsgData<QString>("");     //电池热失控
    carfox::CarMsgData<QString> warning28 = carfox::CarMsgData<QString>("");     //DCDC故障报警（1故障，0正常）
    carfox::CarMsgData<QString> warning29 = carfox::CarMsgData<QString>("");     //绝缘报警
    carfox::CarMsgData<QString> warning30 = carfox::CarMsgData<QString>("");     //放电电流过大
    carfox::CarMsgData<QString> warning31 = carfox::CarMsgData<QString>("");     //充电电流过大
    carfox::CarMsgData<QString> warning32 = carfox::CarMsgData<QString>("");     //温度过高
    carfox::CarMsgData<QString> warning33 = carfox::CarMsgData<QString>("");     //温度报警
    carfox::CarMsgData<QString> warning34 = carfox::CarMsgData<QString>("");     //温度差过大
    carfox::CarMsgData<QString> warning35 = carfox::CarMsgData<QString>("");     //内部接触器信号
    carfox::CarMsgData<QString> warning36 = carfox::CarMsgData<QString>("");     //有内阻偏大电池
    carfox::CarMsgData<QString> warning37 = carfox::CarMsgData<QString>("");     //有容量偏小电池
    carfox::CarMsgData<QString> warning38 = carfox::CarMsgData<QString>("");     //水温高报警
    carfox::CarMsgData<QString> warning39 = carfox::CarMsgData<QString>("");     //油量低报警
    carfox::CarMsgData<QString> warning40 = carfox::CarMsgData<QString>("");     //保留
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

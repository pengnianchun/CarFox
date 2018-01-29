#pragma once

#include <CarMsg.hpp>
#include "KeyManager.hpp"
class CustomCarMsgWorker;

class CustomCarMsg : public carfox::CarMsg
{
    Q_OBJECT

    // 上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML, 还有定义
    MEMBER_PROPERTY_WITH_NOTIFY(int, themeMode, 0)             //主题设置
    MEMBER_PROPERTY_WITH_NOTIFY(int, dateTime, 0)              //系统时间
    MEMBER_PROPERTY_WITH_NOTIFY(int, upgradeMsgId, 0)          //升级消息ID
    MEMBER_PROPERTY_WITH_NOTIFY(QString, upgradeMsgCtx, 0)     //升级消息内容
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
    MEMBER_PROPERTY_WITH_NOTIFY(int, moterControlTemp, 0)       //电机控制器温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, moterTemp, 0)             //电机温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, battery, 0)                //蓄电池电压
    MEMBER_PROPERTY_WITH_NOTIFY(int, spn, 0)                    //SPN值
    MEMBER_PROPERTY_WITH_NOTIFY(int, engineWaterTemp, 0)      //发动机水温
    MEMBER_PROPERTY_WITH_NOTIFY(int, ureaLevel, 0)             //尿素液位
    MEMBER_PROPERTY_WITH_NOTIFY(uint, faultLevel, 0)           //故障等级
    MEMBER_PROPERTY_WITH_NOTIFY(int, faultCode, 0)             //故障代码
    MEMBER_PROPERTY_WITH_NOTIFY(uint, oilLevel, 0)             //油量百分比
    MEMBER_PROPERTY_WITH_NOTIFY(float, engineOilPressure, 0)  //发动机机油压力

    //控制系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, motorInVoltage, 0)		//电机输入电压, 0 V
    MEMBER_PROPERTY_WITH_NOTIFY(float, motorInCurrent, 0)		//电机输入电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(int, motorTemp, 0)			    //电机温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, motorControllerTemp, 0)	//电机控制器温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, carVcuMode, 0)			    //整车模式, 0
    MEMBER_PROPERTY_WITH_NOTIFY(float, version, 0)			    //程序版本, 0.00
    MEMBER_PROPERTY_WITH_NOTIFY(int, carLife, 0)			    //整车控制器Life, 0
    MEMBER_PROPERTY_WITH_NOTIFY(float, accelPedalPercent, 0) 	//加速踏板百分比,0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, brakePedalPercent, 0)	//制动踏板百分比,0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din1, 0)		    	    //数字量输入1, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din2, 0)			        //数字量输入2, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din3, 0)			        //数字量输入3, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout1, 0)			        //数字量输出1, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout2, 0)			        //数字量输出2, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout3, 0)			        //数字量输出3, 00000000（2进制显示）

    //发动机系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, engineFuelConsumption, 0)	//发动机油耗, 0.00 L/H
    MEMBER_PROPERTY_WITH_NOTIFY(float, engineLoad, 0)				//发动机负荷, 0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, engineTargetThrottle, 0)	//发动机目标油门, 0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(float, engineActualThrottle, 0)	//发动机实际油门, 0.0 %
    MEMBER_PROPERTY_WITH_NOTIFY(int, engineInletTemperature, 0)   //发动机进气温度, 0 ℃

    //辅助系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, oilPumpDcacWoutputCurrent, 0)    //油泵DC/AC W相输出电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, oilPumpDcacVoutputCurrent, 0)    //油泵DC/AC V相输出电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, oilPumpDcacUoutputCurrent, 0)    //油泵DC/AC U相输出电流, 0 A
    MEMBER_PROPERTY_WITH_NOTIFY(int, radiatorTemperature, 0)                //散热器温度, 0 ℃

    //TCU系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(int, actualClutchPosition, 0)		//离合实际位置, 0
    MEMBER_PROPERTY_WITH_NOTIFY(uint, tcuFaultCode, 0)			//TCU故障信息, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(int, axisRpm, 0)                   //变速箱输出轴转速, 0 RPM
    MEMBER_PROPERTY_WITH_NOTIFY(int, fmi, 0)                        //FMI值, 0
    MEMBER_PROPERTY_WITH_NOTIFY(int, cm, 0)                         //CM值, 0
    MEMBER_PROPERTY_WITH_NOTIFY(uint, oc, 0)			        	//OC, 0（16进制显示）

    //电池管理系统
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMaxChargeCurrent, 0)		//最大允许充电电流,, 0.0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMaxDischargeCurrent, 0)	//最大允许放电电流,, 0.0 A
    MEMBER_PROPERTY_WITH_NOTIFY(float, batAverageVoltage, 0)          //单体平均电压, 0.00 V
    MEMBER_PROPERTY_WITH_NOTIFY(uint, batStatus1, 0)                   //电池状态1, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, batStatus2, 0)                   //电池状态2, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, batStatus3, 0)                   //电池状态3, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(float, irmOhmPositive, 0)             //总正绝缘阻值, 0 KΩ
    MEMBER_PROPERTY_WITH_NOTIFY(float, irmOhmNegative, 0)             //总负绝缘阻值, 0 KΩ
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMaxVoltage, 0)              //单体最高电压, 0.00 V
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMinVoltage, 0)              //单体最低电压, 0.00 V
    MEMBER_PROPERTY_WITH_NOTIFY(float, batteryHighestTemp, 0)         //单体最高温度, 0.0 ℃

    //空调系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acFaultCode, 0)                 //空调故障代码, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acFanStatus, 0)                 //空调风机状态, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acWorkStatus, 0)                //空调工作状态, 00000000（2进制显示）
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acLife, 0)                       //空调Life, 0
    MEMBER_PROPERTY_WITH_NOTIFY(int, acOutTemp, 0)                    //车外实际温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, acInTemp, 0)                     //车内实际温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(int, acSetTemp, 0)                    //设定温度, 0 ℃
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acRefrigereReq, 0)              //空调制冷请求, 00000000（2进制显示）

    //仪表信息
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl01, 0)        //左转向开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl02, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl03, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl04, 0)        //钥匙ST开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl05, 0)        //右转向开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl06, 0)        //小灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl07, 0)        //远光灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl08, 0)        //近光灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl09, 0)        //前雾灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl10, 0)        //后雾灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl11, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl12, 0)        //广告灯箱开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl13, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl14, 0)        //雨刮低档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl15, 0)        //雨刮间歇档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl16, 0)        //雨刮高档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl17, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl18, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl19, 0)        //路牌开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl20, 0)        //前门开开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl21, 0)        //雨刮喷水档开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl22, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl23, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl24, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl25, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl26, 0)        //中门关开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl27, 0)        //中门开开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl28, 0)        //前门关开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl29, 0)        //燃油量过低报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl30, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl31, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl32, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl33, 0)        //危险报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl34, 0)        //电源唤醒
    MEMBER_PROPERTY_WITH_NOTIFY(int, inputCtrl35, 0)        //钥匙ON

    //符号片显示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampKeyOn, 0)                     //钥匙ON开关(总电源指示)
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampAirFilter, 0)                 //空滤指示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampAsr, 0)                        //ASR指示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampHighVoltageMaintenance, 0)   //高压检修
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampDefroster, 0)                  //除霜器
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampDryere, 0)                     //干燥器
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampAbs, 0)                        //ABS指示
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampAc, 0)                         //AC空调指示
    MEMBER_PROPERTY_WITH_NOTIFY(QString, powerSupply, "")               //Power模式符号片(纯电动模式 or 混动模式 or 插电模式)
    MEMBER_PROPERTY_WITH_NOTIFY(int, climbingMode, 0)                   //爬坡模式符号片
    MEMBER_PROPERTY_WITH_NOTIFY(int, diagnosticMode, 0)                 //诊断模式符号片

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampTurnLeft, 0)         	     //左转向
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampTurnRight, 0)       	         //右转向

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampDoubleFlash, 0)      	     //双闪开启
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampFrontFog, 0)         	     //前雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampRearFog, 0)         	         //后雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampHighBeam, 0)        	         //远光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampHeadLight, 0)       	         //近光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampReverseGear, 0)               //倒车灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampPositionLight, 0)             //位置灯

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampGate1, 0)            	         //前门开
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampGate2, 0)                      //中门开
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampRearDoorOpen, 0)             //后舱门开指示

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampBrake, 0)                      //刹车制动
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampParkingBrake, 0)              //驻车制动

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampLeftLowAirPressure, 0)      //左气压低报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampRightLowAirPressure, 0)     //右气压低报警

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampLeftShoeWear, 0)             //左前摩擦片(刹车蹄片)报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampRightShoeWear, 0)            //右前摩擦片(刹车蹄片)报警

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampChargeConfirm, 0)             //充电确认
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampBatteryMainContact, 0)       //电池主接触器KT

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampWaterTempHigh, 0)            //水温高报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampWaterLevelLow, 0)            //水位低指示

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampLowServiceWl, 0)             //轻微故障报警STOP
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampHeavyStopWl, 0)              //重大故障报警STOP
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampSeriousStopWl, 0)            //严重故障报警STOP

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampOilLevelLow, 0)              //油量低报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampOilPressureLow, 0)           //机油压力低
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampEngineFault, 0)               //发动机故障

    MEMBER_PROPERTY_WITH_NOTIFY(int, lampMotorOutOfService, 0)       //24V发电机未工作
    MEMBER_PROPERTY_WITH_NOTIFY(int, lampMoterFireIgon, 0)            //发电机点火指示

    //前模块
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent01, 0)   //雨刮快档电机
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent02, 0)   //雨刮慢档电机
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent03, 0)   //喷水电机
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent04, 0)   //左前雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent05, 0)   //倒车灯

    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent06, 0)   //右转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent07, 0)   //左转相灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent08, 0)   //液位显示电源
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent09, 0)   //左远光灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent10, 0)   //右前雾灯

    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent11, 0)   //右远光灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent12, 0)   //行车记录仪电源
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent13, 0)   //左近光灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent14, 0)   //位置灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent15, 0)   //右近光灯

    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch01, 0)        //雨刮快档电机
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch02, 0)        //雨刮慢档电机
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch03, 0)        //喷水电机
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch04, 0)        //左前雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch05, 0)        //倒车灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch06, 0)        //右转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch07, 0)        //左转相灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch08, 0)        //液位显示电源
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch09, 0)        //左远光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch10, 0)        //右前雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch11, 0)        //右远光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch12, 0)        //行车记录仪电源
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch13, 0)        //左近光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch14, 0)        //位置灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch15, 0)        //右近光灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch16, 0)        //备用

    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch17, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch18, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch19, 0)        //左前摩擦片报警开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch20, 0)        //右前摩擦片报警开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch21, 0)        //制动灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch22, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch23, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch24, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch25, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch26, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch27, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch28, 0)        //地址选择1
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch29, 0)        //地址选择2
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch30, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch31, 0)        //倒车灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch32, 0)        //备用

    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch33, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch34, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch35, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch36, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch37, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch38, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch39, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch40, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch41, 0)        //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontSwitch42, 0)        //备用

    //中模块
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent01, 0)   //广告灯箱
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent02, 0)   //右转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent03, 0)   //车内指示灯电源
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent04, 0)   //制动灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent05, 0)   //前门开门电磁阀

    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent06, 0)   //前路牌
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent07, 0)   //前门关门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent08, 0)   //侧路牌
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent09, 0)   //中门开门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent10, 0)   //后路牌

    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent11, 0)   //中门关门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent12, 0)   //电子滚动屏
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent13, 0)   //小灯电源
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent14, 0)   //后广告屏
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent15, 0)   //左转向灯

    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch01, 0)           //广告灯箱
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch02, 0)           //右转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch03, 0)           //车内指示灯电源
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch04, 0)           //制动灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch05, 0)           //前门开门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch06, 0)           //前路牌
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch07, 0)           //前门关门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch08, 0)           //侧路牌
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch09, 0)           //中门开门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch10, 0)           //后路牌
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch11, 0)           //中门关门电磁阀
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch12, 0)           //电子滚动屏
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch13, 0)           //小灯电源
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch14, 0)           //后广告屏
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch15, 0)           //左转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch16, 0)           //备用

    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch17, 0)           //门铃开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch18, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch19, 0)           //应急阀开启报警
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch20, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch21, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch22, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch23, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch24, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch25, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch26, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch27, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch28, 0)           //地址选择1
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch29, 0)           //地址选择2
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch30, 0)           //前门踏步灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch31, 0)           //中门踏步灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch32, 0)           //备用

    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch33, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch34, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch35, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch36, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch37, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch38, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch39, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch40, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch41, 0)           //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleSwitch42, 0)           //备用


    //后模块
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent01, 0)    //制动灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent02, 0)    //备用
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent03, 0)    //后雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent04, 0)    //备用
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent05, 0)    //左转向灯

    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent06, 0)    //备用
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent07, 0)    //右转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent08, 0)    //干燥器电源
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent09, 0)    //倒车灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent10, 0)    //备用

    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent11, 0)    //前门踏步灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent12, 0)    //位置灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent13, 0)    //中门踏步灯
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent14, 0)    //备用
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent15, 0)    //备用

    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch01, 0)            //制动灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch02, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch03, 0)            //后雾灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch04, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch05, 0)            //左转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch06, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch07, 0)            //右转向灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch08, 0)            //干燥器电源
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch09, 0)            //倒车灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch10, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch11, 0)            //前门踏步灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch12, 0)            //位置灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch13, 0)            //中门踏步灯
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch14, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch15, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch16, 0)            //水位传感器开关

    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch17, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch18, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch19, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch20, 0)            //空滤阻塞报警开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch21, 0)            //制动灯开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch22, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch23, 0)            //驻车制动开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch24, 0)            //水温报警开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch25, 0)            //低气压1报警开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch26, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch27, 0)            //低气压2报警开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch28, 0)            //地址开关1
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch29, 0)            //地址开关2
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch30, 0)            //后舱门开关
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch31, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch32, 0)            //备用

    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch33, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch34, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch35, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch36, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch37, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch38, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch39, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch40, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch41, 0)            //备用
    MEMBER_PROPERTY_WITH_NOTIFY(int, backSwitch42, 0)            //备用

    //警告提示
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning01, "")      //水位低报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning02, "")      //左气压低报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning03, "")      //右气压低报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning04, "")      //水温传感器报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning05, "")      //油量传感器报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning06, "")      //机油压力传感器报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning07, "")      //电池电压传感器报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning08, "")      //气压一传感器报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning09, "")      //气压二传感器报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning10, "")      //J1939通信故障
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning11, "")      //机油压力低，油量低报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning12, "")      //左刹车蹄片报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning13, "")      //右刹车蹄片报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning14, "")      //空滤报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning15, "")      //后处理故障
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning16, "")      //水温信息丢失
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning17, "")      //机油压力数据丢失
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning18, "")      //总线通信故障
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning19, "")      //单体模块电压过高
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning20, "")      //单体模块电压过低
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning21, "")      //SOC过高
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning22, "")      //SOC过低
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning23, "")      //内部通讯失败
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning24, "")      //总电压欠压
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning25, "")      //总电压过压
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning26, "")      //电池不均衡故障
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning27, "")      //电池热失控
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning28, "")      //DCDC故障报警（1故障，0正常）
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning29, "")      //绝缘报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning30, "")      //放电电流过大
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning31, "")      //充电电流过大
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning32, "")      //温度过高
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning33, "")      //温度报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning34, "")      //温度差过大
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning35, "")      //内部接触器信号
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning36, "")      //有内阻偏大电池
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning37, "")      //有容量偏小电池
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning38, "")      //水温高报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning39, "")      //油量低报警
    MEMBER_PROPERTY_WITH_NOTIFY(QString, warning40, "")      //保留

    MEMBER_PROPERTY_WITH_NOTIFY(QVariantMap, batVoltage, QVariantMap())  //电池组电压
    MEMBER_PROPERTY_WITH_NOTIFY(QVariantMap, batTemp, QVariantMap())     //电池组温度

public:
    explicit CustomCarMsg(CustomCarMsgWorker *worker);


private:
    void connectWorkerToMsg(CustomCarMsgWorker *worker);
    void connectMsgToWorker(CustomCarMsgWorker *worker);

public slots:


private slots:
    // 上行帧 更新数据槽函数, worker to msg
    void updateThemeMode(qint8 data); // test
    void updateDateTime(qint32 data);
    void updateUpgradeMsgId(qint8 data);
    void updateUpgradeMsgCtx(QString data);
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
    void updateMoterControlTemp(int value);
    void updateMoterTemp(int value);
    void updateBattery(int value);
    void updateSpn(int value);
    void updateEngineWaterTemp(int value);
    void updateUreaLevel(int value);
    void updateFaultLevel(uint value);
    void updateFaultCode(int value);
    void updateOilLevel(uint value);
    void updateEngineOilPressure(float value);

    void updateMotorInVoltage(float value);
    void updateMotorInCurrent(float value);
    void updateMotorTemp(int value);
    void updateMotorControllerTemp(int value);
    void updateCarVcuMode(int value);
    void updateVersion(double value);
    void updateCarLife(int value);
    void updateAccelPedalPercent(float value);
    void updateBrakePedalPercent(float value);
    void updateDin1(uint value);
    void updateDin2(uint value);
    void updateDin3(uint value);
    void updateDout1(uint value);
    void updateDout2(uint value);
    void updateDout3(uint value);

    void updateEngineFuelConsumption(float value);
    void updateEngineLoad(float value);
    void updateEngineTargetThrottle(float value);
    void updateEngineActualThrottle(float value);
    void updateEngineInletTemperature(int value);

    void updateOilPumpDcacWoutputCurrent(float value);
    void updateOilPumpDcacVoutputCurrent(float value);
    void updateOilPumpDcacUoutputCurrent(float value);
    void updateRadiatorTemperature(int value);

    void updateActualClutchPosition(int value);
    void updateTcuFaultCode(uint value);
    void updateAxisRpm(int value);
    void updateFmi(int value);
    void updateCm(int value);
    void updateOc(uint value);

    void updateBatMaxChargeCurrent(float value);
    void updateBatMaxDischargeCurrent(float value);
    void updateBatAverageVoltage(float value);
    void updateBatStatus1(uint value);
    void updateBatStatus2(uint value);
    void updateBatStatus3(uint value);
    void updateIrmOhmPositive(float value);
    void updateIrmOhmNegative(float value);
    void updateBatMaxVoltage(float value);
    void updateBatMinVoltage(float value);
    void updateBatteryHighestTemp(float value);

    void updateBatVoltage(QVariantMap value);
    void updateBatTemp(QVariantMap value);

    void updateAcFaultCode(uint value);
    void updateAcFanStatus(uint value);
    void updateAcWorkStatus(uint value);
    void updateAcLife(uint value);
    void updateAcOutTemp(int value);
    void updateAcInTemp(int value);
    void updateAcSetTemp(int value);
    void updateAcRefrigereReq(uint value);

    void updateInputCtrl01(int value);
    void updateInputCtrl02(int value);
    void updateInputCtrl03(int value);
    void updateInputCtrl04(int value);
    void updateInputCtrl05(int value);
    void updateInputCtrl06(int value);
    void updateInputCtrl07(int value);
    void updateInputCtrl08(int value);
    void updateInputCtrl09(int value);
    void updateInputCtrl10(int value);
    void updateInputCtrl11(int value);
    void updateInputCtrl12(int value);
    void updateInputCtrl13(int value);
    void updateInputCtrl14(int value);
    void updateInputCtrl15(int value);
    void updateInputCtrl16(int value);
    void updateInputCtrl17(int value);
    void updateInputCtrl18(int value);
    void updateInputCtrl19(int value);
    void updateInputCtrl20(int value);
    void updateInputCtrl21(int value);
    void updateInputCtrl22(int value);
    void updateInputCtrl23(int value);
    void updateInputCtrl24(int value);
    void updateInputCtrl25(int value);
    void updateInputCtrl26(int value);
    void updateInputCtrl27(int value);
    void updateInputCtrl28(int value);
    void updateInputCtrl29(int value);
    void updateInputCtrl30(int value);
    void updateInputCtrl31(int value);
    void updateInputCtrl32(int value);
    void updateInputCtrl33(int value);
    void updateInputCtrl34(int value);
    void updateInputCtrl35(int value);

    void updateLampKeyOn(int value);
    void updateLampAirFilter(int value);
    void updateLampAsr(int value);
    void updateLampHighVoltageMaintenance(int value);
    void updateLampDefroster(int value);
    void updateLampDryere(int value);
    void updateLampAbs(int value);
    void updateLampAc(int value);
    void updatePowerSupply(QString value);
    void updateClimbingMode(int value);
    void updateDiagnosticMode(int value);

    void updateLampTurnLeft(int value);
    void updateLampTurnRight(int value);

    void updateLampDoubleFlash(int value);
    void updateLampFrontFog(int value);
    void updateLampRearFog(int value);
    void updateLampHighBeam(int value);
    void updateLampHeadLight(int value);
    void updateLampReverseGear(int value);
    void updateLampPositionLight(int value);

    void updateLampGate1(int value);
    void updateLampGate2(int value);
    void updateLampRearDoorOpen(int value);

    void updateLampBrake(int value);
    void updateLampParkingBrake(int value);

    void updateLampLeftLowAirPressure(int value);
    void updateLampRightLowAirPressure(int value);

    void updateLampLeftShoeWear(int value);
    void updateLampRightShoeWear(int value);

    void updateLampChargeConfirm(int value);
    void updateLampBatteryMainContact(int value);

    void updateLampWaterTempHigh(int value);
    void updateLampWaterLevelLow(int value);

    void updateLampLowServiceWl(int value);
    void updateLampHeavyStopWl(int value);
    void updateLampSeriousStopWl(int value);

    void updateLampOilLevelLow(int value);
    void updateLampOilPressureLow(int value);
    void updateLampEngineFault(int value);

    void updateLampMotorOutOfService(int value);
    void updateLampMoterFireIgon(int value);

    void updateFrontOutputCurrent01(float value);
    void updateFrontOutputCurrent02(float value);
    void updateFrontOutputCurrent03(float value);
    void updateFrontOutputCurrent04(float value);
    void updateFrontOutputCurrent05(float value);

    void updateFrontOutputCurrent06(float value);
    void updateFrontOutputCurrent07(float value);
    void updateFrontOutputCurrent08(float value);
    void updateFrontOutputCurrent09(float value);
    void updateFrontOutputCurrent10(float value);

    void updateFrontOutputCurrent11(float value);
    void updateFrontOutputCurrent12(float value);
    void updateFrontOutputCurrent13(float value);
    void updateFrontOutputCurrent14(float value);
    void updateFrontOutputCurrent15(float value);

    void updateFrontSwitch01(int value);
    void updateFrontSwitch02(int value);
    void updateFrontSwitch03(int value);
    void updateFrontSwitch04(int value);
    void updateFrontSwitch05(int value);
    void updateFrontSwitch06(int value);
    void updateFrontSwitch07(int value);
    void updateFrontSwitch08(int value);
    void updateFrontSwitch09(int value);
    void updateFrontSwitch10(int value);
    void updateFrontSwitch11(int value);
    void updateFrontSwitch12(int value);
    void updateFrontSwitch13(int value);
    void updateFrontSwitch14(int value);
    void updateFrontSwitch15(int value);
    void updateFrontSwitch16(int value);

    void updateFrontSwitch17(int value);
    void updateFrontSwitch18(int value);
    void updateFrontSwitch19(int value);
    void updateFrontSwitch20(int value);
    void updateFrontSwitch21(int value);
    void updateFrontSwitch22(int value);
    void updateFrontSwitch23(int value);
    void updateFrontSwitch24(int value);
    void updateFrontSwitch25(int value);
    void updateFrontSwitch26(int value);
    void updateFrontSwitch27(int value);
    void updateFrontSwitch28(int value);
    void updateFrontSwitch29(int value);
    void updateFrontSwitch30(int value);
    void updateFrontSwitch31(int value);
    void updateFrontSwitch32(int value);

    void updateFrontSwitch33(int value);
    void updateFrontSwitch34(int value);
    void updateFrontSwitch35(int value);
    void updateFrontSwitch36(int value);
    void updateFrontSwitch37(int value);
    void updateFrontSwitch38(int value);
    void updateFrontSwitch39(int value);
    void updateFrontSwitch40(int value);
    void updateFrontSwitch41(int value);
    void updateFrontSwitch42(int value);

    void updateMiddleOutputCurrent01(float value);
    void updateMiddleOutputCurrent02(float value);
    void updateMiddleOutputCurrent03(float value);
    void updateMiddleOutputCurrent04(float value);
    void updateMiddleOutputCurrent05(float value);

    void updateMiddleOutputCurrent06(float value);
    void updateMiddleOutputCurrent07(float value);
    void updateMiddleOutputCurrent08(float value);
    void updateMiddleOutputCurrent09(float value);
    void updateMiddleOutputCurrent10(float value);

    void updateMiddleOutputCurrent11(float value);
    void updateMiddleOutputCurrent12(float value);
    void updateMiddleOutputCurrent13(float value);
    void updateMiddleOutputCurrent14(float value);
    void updateMiddleOutputCurrent15(float value);

    void updateMiddleSwitch01(int value);
    void updateMiddleSwitch02(int value);
    void updateMiddleSwitch03(int value);
    void updateMiddleSwitch04(int value);
    void updateMiddleSwitch05(int value);
    void updateMiddleSwitch06(int value);
    void updateMiddleSwitch07(int value);
    void updateMiddleSwitch08(int value);
    void updateMiddleSwitch09(int value);
    void updateMiddleSwitch10(int value);
    void updateMiddleSwitch11(int value);
    void updateMiddleSwitch12(int value);
    void updateMiddleSwitch13(int value);
    void updateMiddleSwitch14(int value);
    void updateMiddleSwitch15(int value);
    void updateMiddleSwitch16(int value);

    void updateMiddleSwitch17(int value);
    void updateMiddleSwitch18(int value);
    void updateMiddleSwitch19(int value);
    void updateMiddleSwitch20(int value);
    void updateMiddleSwitch21(int value);
    void updateMiddleSwitch22(int value);
    void updateMiddleSwitch23(int value);
    void updateMiddleSwitch24(int value);
    void updateMiddleSwitch25(int value);
    void updateMiddleSwitch26(int value);
    void updateMiddleSwitch27(int value);
    void updateMiddleSwitch28(int value);
    void updateMiddleSwitch29(int value);
    void updateMiddleSwitch30(int value);
    void updateMiddleSwitch31(int value);
    void updateMiddleSwitch32(int value);

    void updateMiddleSwitch33(int value);
    void updateMiddleSwitch34(int value);
    void updateMiddleSwitch35(int value);
    void updateMiddleSwitch36(int value);
    void updateMiddleSwitch37(int value);
    void updateMiddleSwitch38(int value);
    void updateMiddleSwitch39(int value);
    void updateMiddleSwitch40(int value);
    void updateMiddleSwitch41(int value);
    void updateMiddleSwitch42(int value);

    void updateBackOutputCurrent01(float value);
    void updateBackOutputCurrent02(float value);
    void updateBackOutputCurrent03(float value);
    void updateBackOutputCurrent04(float value);
    void updateBackOutputCurrent05(float value);

    void updateBackOutputCurrent06(float value);
    void updateBackOutputCurrent07(float value);
    void updateBackOutputCurrent08(float value);
    void updateBackOutputCurrent09(float value);
    void updateBackOutputCurrent10(float value);

    void updateBackOutputCurrent11(float value);
    void updateBackOutputCurrent12(float value);
    void updateBackOutputCurrent13(float value);
    void updateBackOutputCurrent14(float value);
    void updateBackOutputCurrent15(float value);

    void updateBackSwitch01(int value);
    void updateBackSwitch02(int value);
    void updateBackSwitch03(int value);
    void updateBackSwitch04(int value);
    void updateBackSwitch05(int value);
    void updateBackSwitch06(int value);
    void updateBackSwitch07(int value);
    void updateBackSwitch08(int value);
    void updateBackSwitch09(int value);
    void updateBackSwitch10(int value);
    void updateBackSwitch11(int value);
    void updateBackSwitch12(int value);
    void updateBackSwitch13(int value);
    void updateBackSwitch14(int value);
    void updateBackSwitch15(int value);
    void updateBackSwitch16(int value);

    void updateBackSwitch17(int value);
    void updateBackSwitch18(int value);
    void updateBackSwitch19(int value);
    void updateBackSwitch20(int value);
    void updateBackSwitch21(int value);
    void updateBackSwitch22(int value);
    void updateBackSwitch23(int value);
    void updateBackSwitch24(int value);
    void updateBackSwitch25(int value);
    void updateBackSwitch26(int value);
    void updateBackSwitch27(int value);
    void updateBackSwitch28(int value);
    void updateBackSwitch29(int value);
    void updateBackSwitch30(int value);
    void updateBackSwitch31(int value);
    void updateBackSwitch32(int value);

    void updateBackSwitch33(int value);
    void updateBackSwitch34(int value);
    void updateBackSwitch35(int value);
    void updateBackSwitch36(int value);
    void updateBackSwitch37(int value);
    void updateBackSwitch38(int value);
    void updateBackSwitch39(int value);
    void updateBackSwitch40(int value);
    void updateBackSwitch41(int value);
    void updateBackSwitch42(int value);

    void updateWarning01(QString value);
    void updateWarning02(QString value);
    void updateWarning03(QString value);
    void updateWarning04(QString value);
    void updateWarning05(QString value);
    void updateWarning06(QString value);
    void updateWarning07(QString value);
    void updateWarning08(QString value);
    void updateWarning09(QString value);
    void updateWarning10(QString value);
    void updateWarning11(QString value);
    void updateWarning12(QString value);
    void updateWarning13(QString value);
    void updateWarning14(QString value);
    void updateWarning15(QString value);
    void updateWarning16(QString value);
    void updateWarning17(QString value);
    void updateWarning18(QString value);
    void updateWarning19(QString value);
    void updateWarning20(QString value);
    void updateWarning21(QString value);
    void updateWarning22(QString value);
    void updateWarning23(QString value);
    void updateWarning24(QString value);
    void updateWarning25(QString value);
    void updateWarning26(QString value);
    void updateWarning27(QString value);
    void updateWarning28(QString value);
    void updateWarning29(QString value);
    void updateWarning30(QString value);
    void updateWarning31(QString value);
    void updateWarning32(QString value);
    void updateWarning33(QString value);
    void updateWarning34(QString value);
    void updateWarning35(QString value);
    void updateWarning36(QString value);
    void updateWarning37(QString value);
    void updateWarning38(QString value);
    void updateWarning39(QString value);
    void updateWarning40(QString value);

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
    void sendDateTime(qint32 msec);
    void sendMenuInfo(qint64 MenuNo, qint64 pageNo);
    void sendUpgradeStart();
    void sendTripMilesClear();

private:
    bool mEnableKeys = false;
};

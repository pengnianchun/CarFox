#pragma once

#include <CarMsg.hpp>
#include "KeyManager.hpp"
class CustomCarMsgWorker;

class CustomCarMsg : public carfox::CarMsg
{
    Q_OBJECT
    //通用信息
    MEMBER_PROPERTY_WITH_NOTIFY(uint, tmpVersion, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, themeMode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, carMode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, dateTime, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, carSpeed, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, rpm, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, totalVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, totalCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, gear, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, odo, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, trip, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, soc, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, apVol1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, apVol2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, moterControlTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, moterTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, battery, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, spn, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, engineWaterTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, ureaLevel, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, faultLevel, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, faultCode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, oilLevel, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, engineOilPressure, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, aloneBatteryLowVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, aloneBatteryHighVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batteryHighTemperature, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batteryLowTemperature, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batteryPackEnergy, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, velocityRatio, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, buzzerStatus, true)
    //设置模块信息
    MEMBER_PROPERTY_WITH_NOTIFY(bool, tripMilesClear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, checkMilesClear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(int, upgradeMsgId, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(QString, upgradeMsgCtx, "")
    MEMBER_PROPERTY_WITH_NOTIFY(bool, closeBuzzerClear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, checkCloseBuzzerClear, true)
    //控制系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, motorInVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, motorInCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, motorTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, motorControllerTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, carVcuMode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(double, version, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, carLife, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, accelPedalPercent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, brakePedalPercent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, din3, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dout3, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, driveSystemStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, driveMotorStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, mechanicalBrakeStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, keyAcc, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, keyOn, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, highVoltageInterLock, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, highVoltagePowerUp, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airCompressorWork, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, boosterPumpWork, true)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, airCompressorMotorSpeed, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, steeringAssistMotorSpeed, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, steeringAssistMotorTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, airCompressorMotorTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, airCompressorControlTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, steeringControlDeviceTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, airPress3, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, airPress4, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, airPress5, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, highestAlarmGrade, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, faultAlarmSituation, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, driveGearsMode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bduSwitch, 0)
    //仪表信息
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl03, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl04, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl05, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl06, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl07, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl08, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl09, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl10, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl11, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl12, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl13, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl14, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl15, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl16, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl17, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl18, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl19, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl20, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl21, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl22, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl23, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl24, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl25, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl26, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl27, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl28, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl29, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl30, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl31, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl32, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl33, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl34, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, inputCtrl35, true)
    //前模块信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent01, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent02, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent03, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent04, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent05, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent06, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent07, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent08, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent09, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent10, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent11, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent12, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent13, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent14, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontOutputCurrent15, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault01, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault02, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault03, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault04, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault05, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault06, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault07, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault08, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault09, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault10, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault11, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault12, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault13, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault14, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontOutputFault15, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch03, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch04, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch05, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch06, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch07, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch08, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch09, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch10, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch11, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch12, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch13, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch14, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch15, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSwitch16, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontAnalogInput01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontAnalogInput02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontHzInput, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontSpeedInput, true)
    //中模块信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent01, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent02, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent03, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent04, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent05, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent06, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent07, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent08, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent09, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent10, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent11, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent12, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent13, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent14, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, middleOutputCurrent15, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault01, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault02, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault03, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault04, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault05, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault06, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault07, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault08, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault09, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault10, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault11, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault12, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault13, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault14, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, middleOutputFault15, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch03, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch04, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch05, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch06, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch07, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch08, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch09, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch10, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch11, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch12, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch13, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch14, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch15, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSwitch16, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleAnalogInput01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleAnalogInput02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleHzInput, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleSpeedInput, true)
    //后模块信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent01, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent02, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent03, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent04, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent05, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent06, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent07, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent08, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent09, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent10, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent11, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent12, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent13, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent14, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backOutputCurrent15, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault01, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault02, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault03, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault04, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault05, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault06, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault07, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault08, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault09, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault10, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault11, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault12, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault13, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault14, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backOutputFault15, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch03, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch04, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch05, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch06, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch07, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch08, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch09, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch10, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch11, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch12, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch13, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch14, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch15, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSwitch16, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backAnalogInput01, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backAnalogInput02, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backHzInput, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, backSpeedInput, true)
    //警告提示
    MEMBER_PROPERTY_WITH_NOTIFY(int, warningId, 0)
    //发动机系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float,  engineFuelConsumption, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float,  engineLoad, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float,  engineTargetThrottle, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float,  engineActualThrottle, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int,  engineInletTemperature, 0)
    //辅助系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, oilPumpDcacWoutputCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, oilPumpDcacVoutputCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, oilPumpDcacUoutputCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, radiatorTemperature, 0)
    //TCU系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(int, actualClutchPosition , 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, tcuFaultCode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, axisRpm, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, fmi, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, cm, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, oc, 0)
    //电池管理系统
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMaxChargeCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMaxDischargeCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, batAverageVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batStatus1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batStatus2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, batStatus3, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, irmOhmPositive, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, irmOhmNegative, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMaxVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, batMinVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, batteryHighestTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, bmsVersion, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bmsModuleAmount, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bmsLife, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, batteryPackHighestTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, batteryPackMinTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, batteryManagePackEnergy, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, bmsControlStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, batAmount, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, rechargeStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, tempStyletAmount, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, outletPositiveTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, outletNegativeTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, powerBatteryType, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, powerBatteryRecharge, 0)
    //电池组电压信息
    MEMBER_PROPERTY_WITH_NOTIFY(uint, addrNumberVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, addrNumberVoltageValue, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, boxNumberVoltage, 0)
    //MEMBER_PROPERTY_WITH_NOTIFY(QVariantMap, voltageInfo, QVariantMap())
    //电池组温度信息
    MEMBER_PROPERTY_WITH_NOTIFY(uint, addrNumberTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, addrNumberTempValue, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, boxNumberTemp, 0)
    //MEMBER_PROPERTY_WITH_NOTIFY(QVariantMap, tempInfo, QVariantMap())
    //空调系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acFaultCode, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acFanStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acWorkStatus, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acLife, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, acOutTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, acInTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, acSetTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, acRefrigereReq, 0)
    //DCDC状态信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, dcLowVoltage, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, dcLowCurrent, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dcTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(uint, dcStatus2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dcUndervoltage, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dcOvervoltage, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dcOverheating, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dcShortCircuit, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dcWorkStatus, true)
    //符号片显示
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampKeyOn, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampAirFilter, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampAsr, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampHighVoltageMaintenance, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampDefroster, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampDryere, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampAbs, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampAc, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerSupply, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerPlugInMode, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerByvridMode, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, climbingMode, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, diagnosticMode, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampTurnLeft, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampTurnRight, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampDoubleFlash, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampFrontFog, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampRearFog, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampHighBeam, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampHeadLight, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampReverseGear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampPositionLight, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampGate1, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampGate2, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampRearDoorOpen, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampBrake, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampParkingBrake, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampLeftLowAirPressure, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampRightLowAirPressure, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampLeftShoeWear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampRightShoeWear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampChargeConfirm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampBatteryMainContact, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampWaterTempHigh, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampWaterLevelLow, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampLowServiceWl, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampHeavyStopWl, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampSeriousStopWl, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampOilLevelLow, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampOilPressureLow, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampEngineFault, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampMotorOutOfService, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampMoterFireIgon, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampAfterTreat, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lampWarningLed, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airPress1Lamp, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airPress2Lamp, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airPress3Lamp, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airPress4Lamp, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airPress5Lamp, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerDoorsOpen, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerBatteryCutOff, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, seatbeltNotFastened, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, forwardGear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, neutralGear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, reverseGear, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, electronicInSlope, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, ascd, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, ready, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerAccumulatorsChargeStatus, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, cableConnect, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlMotorOverheating, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, powerAccumulatorsFault, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, driverSystemFault, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, severityInsulationFault, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, slightInsulationFault, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, motorPowerLimitation, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, bmsAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, socLowAram, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, safetySystemAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, leftDoorsOpenAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, rightDoorsOpenAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, barrierFreeMarchReach, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, gateChargeOpen, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, driverSeatAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, ecasSystemFaultLed, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, ecasAlarmLed, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, ecasKneelingStatusLed, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, ecasSpecialHeightLed, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dropOffDoorbell, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, wait, false)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, frontDoorExigencyAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, middleDoorExigencyAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, stop, false)
    //胎压模块信息
    MEMBER_PROPERTY_WITH_NOTIFY(float, frontLeftTirePress, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, fronRightTirePress, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backLeftTirePress1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backRightTirePress1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backLeftTirePress2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(float, backRightTirePress2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontLeftTireTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, frontRightTireTemp, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backLeftTireTemp1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backRightTireTemp1, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backLeftTireTemp2, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, backRightTireTemp2, 0)
    //控制系统诊断信息
    MEMBER_PROPERTY_WITH_NOTIFY(bool, driveFaultAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlOvervoltageAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlUndervoltageAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlEncodingFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlHighTempAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlHighTempAbortAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlMainContactorFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlOvercurrentAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, motorHighTempAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, motorHigtTempAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, motorRotaryFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlMotorPowerLimitation , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, motorRotaryLimitation , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, motorWaterTempOvertop , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, acceleratorPedalFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, brakePedalFaule, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, seatbeltAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, seatSwitchAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlRightDoorsOpenAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, controlLeftDoorsOpenAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, chauffeurDoorsNotClose, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, highTensionSwitchOpen , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, chargeDoorOpen , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, safetyDoorOpen , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, lowVoltageSwitchOpen , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, absSystemFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airCompressorControlHighTemp , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, airCompressorMotorHighTemp , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, boosterPumpControlHighTemp , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, boosterPumpMotorHighTemp , true)
    MEMBER_PROPERTY_WITH_NOTIFY(float, vcuVersion , 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, vcuLife , 0)
    //动力电池诊断系统信息
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batVoltageMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batVoltageMaxAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batVoltageMinAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batVoltageMinAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, chargeCurrentMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dischargeCurrentMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dischargeCurrentMaxAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dischargeCurrentTempMinAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dischargeCurrentTempMinAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, chargeCurrentTempMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, chargeCurrentTempMaxAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batTempMaxAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batTempMaxAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dropoutVoltageMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, dropoutVoltageMaxAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, chargeVoltageMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batTempDifferentAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batChargeTempMinAbortAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batChargeTempMinAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, socMinAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, socMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batModuleCommunicationFail, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, bmsSystemFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, batteryFault , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, energyRecoveryCurrentMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, energyRecoveryVoltageMaxAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, energyRecoveryVoltageMaxAbort , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, energyRecoveryCancel , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, socJumpAlarm , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, mismatchingAlarm, true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, vehicleMountedTypeMax , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, vehicleMountedTypeMin , true)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, vehicleMountedTypeOvercharge , true)

public:
    explicit CustomCarMsg(CustomCarMsgWorker *worker);

private:
    void connectWorkerToMsg(CustomCarMsgWorker *worker);
    void connectMsgToWorker(CustomCarMsgWorker *worker);

public slots:

private slots:
    //基本模块信息
    void updateThemeMode(int data);
    void updateDateTime(int data);
    void updateCarMode(int data);
    void updateCarSpeed(float value);
    void updateRpm(float value);
    void updateTotalVoltage(float value);
    void updateTotalCurrent(float value);
    void updateGear(int value);
    void updateOdo(uint value);
    void updateTrip(float value);
    void updateSoc(float value);
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
    void updateAloneBatteryLowVoltage(float value);
    void updateAloneBatteryHighVoltage(float value);
    void updateBatteryHighTemperature(int value);
    void updateBatteryLowTemperature(int value);
    void updateBatteryPackEnergy(int value);
    void updateVelocityRatio(int value);
    void updateVuzzerStatus(bool value);
    //设置模块信息
    void updateTripMilesClear(bool data);
    void updateCheckMilesClear(bool data);
    void updateUpgradeMsgId(int data);
    void updateUpgradeMsgCtx(QString data);
    void updateCloseBuzzerClear(bool data);
    void updateCheckCloseBuzzerClear(bool data);
    //控制系统信息
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
    void updateDriveSystemStatus(uint value);
    void updateDriveMotorStatus(uint value);
    void updateMechanicalBrakeStatus(uint value);
    void updateKeyAcc(bool value);
    void updateKeyOn(bool value);
    void updateHighVoltageInterlock(bool value);
    void updateHighVoltagePowerUp(bool value);
    void updateAirCompressorWork(bool value);

    void updateBoosterPumpWork(bool value);
    void updateAirCompressorMotorSpeed(uint value);
    void updateSteeringAssistMotorSpeed(uint value);
    void updateSteeringAssistMotorTemp(uint value);
    void updateAirCompressorMotorTemp(uint value);
    void updateAirCompressorControlTemp(uint value);
    void updateSteeringControlDeviceTemp(uint value);
    void updateAirPress3(float value);
    void updateAirPress4(float value);
    void updateAirPress5(float value);
    void updateHighestAlarmGrade(uint value);
    void updateFaultAlarmSituation(uint value);
    void updateDriveGearsMode(uint value);
    void updateBduSwitch(uint value);
    //仪表信息
    void updateInputCtrl01(bool value);
    void updateInputCtrl02(bool value);
    void updateInputCtrl03(bool value);
    void updateInputCtrl04(bool value);
    void updateInputCtrl05(bool value);
    void updateInputCtrl06(bool value);
    void updateInputCtrl07(bool value);
    void updateInputCtrl08(bool value);
    void updateInputCtrl09(bool value);
    void updateInputCtrl10(bool value);
    void updateInputCtrl11(bool value);
    void updateInputCtrl12(bool value);
    void updateInputCtrl13(bool value);
    void updateInputCtrl14(bool value);
    void updateInputCtrl15(bool value);
    void updateInputCtrl16(bool value);
    void updateInputCtrl17(bool value);
    void updateInputCtrl18(bool value);
    void updateInputCtrl19(bool value);
    void updateInputCtrl20(bool value);
    void updateInputCtrl21(bool value);
    void updateInputCtrl22(bool value);
    void updateInputCtrl23(bool value);
    void updateInputCtrl24(bool value);
    void updateInputCtrl25(bool value);
    void updateInputCtrl26(bool value);
    void updateInputCtrl27(bool value);
    void updateInputCtrl28(bool value);
    void updateInputCtrl29(bool value);
    void updateInputCtrl30(bool value);
    void updateInputCtrl31(bool value);
    void updateInputCtrl32(bool value);
    void updateInputCtrl33(bool value);
    void updateInputCtrl34(bool value);
    void updateInputCtrl35(bool value);
    //前模块信息
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
    void updateFrontOutputFault01(int value);
    void updateFrontOutputFault02(int value);
    void updateFrontOutputFault03(int value);
    void updateFrontOutputFault04(int value);
    void updateFrontOutputFault05(int value);
    void updateFrontOutputFault06(int value);
    void updateFrontOutputFault07(int value);
    void updateFrontOutputFault08(int value);
    void updateFrontOutputFault09(int value);
    void updateFrontOutputFault10(int value);
    void updateFrontOutputFault11(int value);
    void updateFrontOutputFault12(int value);
    void updateFrontOutputFault13(int value);
    void updateFrontOutputFault14(int value);
    void updateFrontOutputFault15(int value);
    void updateFrontSwitch01(bool value);
    void updateFrontSwitch02(bool value);
    void updateFrontSwitch03(bool value);
    void updateFrontSwitch04(bool value);
    void updateFrontSwitch05(bool value);
    void updateFrontSwitch06(bool value);
    void updateFrontSwitch07(bool value);
    void updateFrontSwitch08(bool value);
    void updateFrontSwitch09(bool value);
    void updateFrontSwitch10(bool value);
    void updateFrontSwitch11(bool value);
    void updateFrontSwitch12(bool value);
    void updateFrontSwitch13(bool value);
    void updateFrontSwitch14(bool value);
    void updateFrontSwitch15(bool value);
    void updateFrontSwitch16(bool value);
    void updateFrontAnalogInput01(bool value);
    void updateFrontAnalogInput02(bool value);
    void updateFrontHzInput(bool value);
    void updateFrontSpeedInput(bool value);
    //中模块信息
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
    void updateMiddleOutputFault01(int value);
    void updateMiddleOutputFault02(int value);
    void updateMiddleOutputFault03(int value);
    void updateMiddleOutputFault04(int value);
    void updateMiddleOutputFault05(int value);
    void updateMiddleOutputFault06(int value);
    void updateMiddleOutputFault07(int value);
    void updateMiddleOutputFault08(int value);
    void updateMiddleOutputFault09(int value);
    void updateMiddleOutputFault10(int value);
    void updateMiddleOutputFault11(int value);
    void updateMiddleOutputFault12(int value);
    void updateMiddleOutputFault13(int value);
    void updateMiddleOutputFault14(int value);
    void updateMiddleOutputFault15(int value);
    void updateMiddleSwitch01(bool value);
    void updateMiddleSwitch02(bool value);
    void updateMiddleSwitch03(bool value);
    void updateMiddleSwitch04(bool value);
    void updateMiddleSwitch05(bool value);
    void updateMiddleSwitch06(bool value);
    void updateMiddleSwitch07(bool value);
    void updateMiddleSwitch08(bool value);
    void updateMiddleSwitch09(bool value);
    void updateMiddleSwitch10(bool value);
    void updateMiddleSwitch11(bool value);
    void updateMiddleSwitch12(bool value);
    void updateMiddleSwitch13(bool value);
    void updateMiddleSwitch14(bool value);
    void updateMiddleSwitch15(bool value);
    void updateMiddleSwitch16(bool value);
    void updateMiddleAnalogInput01(bool value);
    void updateMiddleAnalogInput02(bool value);
    void updateMiddleHzInput(bool value);
    void updateMiddleSpeedInput(bool value);
    //后模块信息
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
    void updateBackOutputFault01(int value);
    void updateBackOutputFault02(int value);
    void updateBackOutputFault03(int value);
    void updateBackOutputFault04(int value);
    void updateBackOutputFault05(int value);
    void updateBackOutputFault06(int value);
    void updateBackOutputFault07(int value);
    void updateBackOutputFault08(int value);
    void updateBackOutputFault09(int value);
    void updateBackOutputFault10(int value);
    void updateBackOutputFault11(int value);
    void updateBackOutputFault12(int value);
    void updateBackOutputFault13(int value);
    void updateBackOutputFault14(int value);
    void updateBackOutputFault15(int value);
    void updateBackSwitch01(bool value);
    void updateBackSwitch02(bool value);
    void updateBackSwitch03(bool value);
    void updateBackSwitch04(bool value);
    void updateBackSwitch05(bool value);
    void updateBackSwitch06(bool value);
    void updateBackSwitch07(bool value);
    void updateBackSwitch08(bool value);
    void updateBackSwitch09(bool value);
    void updateBackSwitch10(bool value);
    void updateBackSwitch11(bool value);
    void updateBackSwitch12(bool value);
    void updateBackSwitch13(bool value);
    void updateBackSwitch14(bool value);
    void updateBackSwitch15(bool value);
    void updateBackSwitch16(bool value);
    void updateBackAnalogInput01(bool value);
    void updateBackAnalogInput02(bool value);
    void updateBackHzInput(bool value);
    void updateBackSpeedInput(bool value);
    //警告提示
    void updateWarningId(int value);
    //发动机系统信息
    void updateEngineFuelConsumption(float value);
    void updateEngineLoad(float value);
    void updateEngineTargetThrottle(float value);
    void updateEngineActualThrottle(float value);
    void updateEngineInletTemperature(int value);
    //辅助系统信息
    void updateOilPumpDcacWoutputCurrent(float value);
    void updateOilPumpDcacVoutputCurrent(float value);
    void updateOilPumpDcacUoutputCurrent(float value);
    void updateRadiatorTemperature(int value);
    //TCU系统信息
    void updateActualClutchPosition(int value);
    void updateTcuFaultCode(uint value);
    void updateAxisRpm(int value);
    void updateFmi(int value);
    void updateCm(int value);
    void updateOc(uint value);
    //电池管理系统
    void updateBatMaxChargeCurrent(float value);
    void updateBatMaxDischargeCurrent(float value);
    void updateBatAverageVoltage(float value);
    void updateBatStatus1(int value);
    void updateBatStatus2(int value);
    void updateBatStatus3(int value);
    void updateIrmOhmPositive(float value);
    void updateIrmOhmNegative(float value);
    void updateBatMaxVoltage(float value);
    void updateBatMinVoltage(float value);
    void updateBatteryHighestTemp(float value);
    void updateBmsVersion(float value);
    void updateBmsModuleAmount(uint value);
    void updateBmsLife(uint value);
    void updateBatteryPackHighestTemp(uint value);
    void updateBatteryPackMinTemp(uint value);
    void updateBatteryManagePackEnergy(float value);
    void updateBmsControlStatus(uint value);
    void updateBatAmount(uint value);
    void updateRechargeStatus(uint value);
    void updateTempStyletAmount(uint value);
    void updateOutletPositiveTemp(uint value);
    void updateOutletNegativeTemp(uint value);
    void updatePowerBatteryType(uint value);
    void updatePowerBatteryRecharge(uint value);
    //电池组电压信息
    void updateAddrNumberVoltage(uint value);
    void updateAddrNumberVoltageValue(float value);
    void updateBoxNumberVoltage(uint value);
    //void updateVoltageInfo(QVariantMap value);
    //电池组温度信息
    void updateAddrNumberTemp(uint value);
    void updateAddrNumberTempValue(float value);
    void updateBoxNumberTemp(uint value);
    //void updateTempInfo(QVariantMap value);
    //空调系统信息
    void updateAcFaultCode(uint value);
    void updateAcFanStatus(uint value);
    void updateAcWorkStatus(uint value);
    void updateAcLife(uint value);
    void updateAcOutTemp(int value);
    void updateAcInTemp(int value);
    void updateAcSetTemp(int value);
    void updateAcRefrigereReq(uint value);
    //DCDC状态信息
    void updateDcLowVoltage(float value);
    void updateDcLowCurrent(float value);
    void updateDcTemp(uint value);
    void updateDcStatus2(uint value);
    void updateDcUndervoltage(bool value);
    void updateDcOvervoltage(bool value);
    void updateDcOverheating(bool value);
    void updateDcShortCircuit(bool value);
    void updateDcWorkStatus(bool value);
    //符号片显示
    void updateLampKeyOn(bool value);
    void updateLampAirFilter(bool value);
    void updateLampAsr(bool value);
    void updateLampHighVoltageMaintenance(bool value);
    void updateLampDefroster(bool value);
    void updateLampDryere(bool value);
    void updateLampAbs(bool value);
    void updateLampAc(bool value);
    void updatePowerSupply(bool value);
    void updatePowerPlugInMode(bool value);
    void updatePowerByvridMode(bool value);
    void updateClimbingMode(bool value);
    void updateDiagnosticMode(bool value);
    void updateLampTurnLeft(bool value);
    void updateLampTurnRight(bool value);
    void updateLampDoubleFlash(bool value);
    void updateLampFrontFog(bool value);
    void updateLampRearFog(bool value);
    void updateLampHighBeam(bool value);
    void updateLampHeadLight(bool value);
    void updateLampReverseGear(bool value);
    void updateLampPositionLight(bool value);
    void updateLampGate1(bool value);
    void updateLampGate2(bool value);
    void updateLampRearDoorOpen(bool value);
    void updateLampBrake(bool value);
    void updateLampParkingBrake(bool value);
    void updateLampLeftLowAirPressure(bool value);
    void updateLampRightLowAirPressure(bool value);
    void updateLampLeftShoeWear(bool value);
    void updateLampRightShoeWear(bool value);
    void updateLampChargeConfirm(bool value);
    void updateLampBatteryMainContact(bool value);
    void updateLampWaterTempHigh(bool value);
    void updateLampWaterLevelLow(bool value);
    void updateLampLowServiceWl(bool value);
    void updateLampHeavyStopWl(bool value);
    void updateLampSeriousStopWl(bool value);
    void updateLampOilLevelLow(bool value);
    void updateLampOilPressureLow(bool value);
    void updateLampEngineFault(bool value);
    void updateLampMotorOutOfService(bool value);
    void updateLampMoterFireIgon(bool value);
    void updateLampAfterTreat(bool value);
    void updateLampWarningLed(bool value);
    void updateAirPress1Lamp(bool value);
    void updateAirPress2Lamp(bool value);
    void updateAirPress3Lamp(bool value);
    void updateAirPress4Lamp(bool value);
    void updateAirPress5Lamp(bool value);
    void updatePowerDoorsOpen(bool value);
    void updatePowerBatteryCutOff(bool value);
    void updateSeatbeltNotFastened(bool value);
    void updateForwardGear(bool value);
    void updateNeutralGear(bool value);
    void updateReverseGear(bool value);
    void updateElectronicInSlope(bool value);
    void updateAscd(bool value);
    void updateReady(bool value);
    void updatePowerAccumulatorsChargeStatus(bool value);
    void updateCableConnect(bool value);
    void updateControlMotorOverheating(bool value);
    void updatePowerAccumulatorsFault(bool value);
    void updateDriverSystemFault(bool value);
    void updateSeverityInsulationFault(bool value);
    void updateSlightInsulationFault(bool value);
    void updateMotorPowerLimitation(bool value);
    void updateBmsAlarm(bool value);
    void updateSocLowAram(bool value);
    void updateSafetySystemAlarm(bool value);
    void updateLeftDoorsOpenAlarm(bool value);
    void updateRightDoorsOpenAlarm(bool value);
    void updateBarrierFreeMarchReach(bool value);
    void updateGateChargeOpen(bool value);
    void updateDriverSeatAlarm(bool value);
    void updateEcasSystemFaultLed(bool value);
    void updateEcasAlarmLed(bool value);
    void updateEcasKneelingStatusLed(bool value);
    void updateEcasSpecialHeightLed(bool value);
    void updateDropOffDoorbell(bool value);
    void updateWait(bool value);
    void updateFrontDoorExigencyAlarm(bool value);
    void updateMiddleDoorExigencyAlarm(bool value);
    void updateStop(bool value);
    //胎压模块信息
    void updateFrontLeftTirePress(float value);
    void updateFronRightTirePress(float value);
    void updateBackLeftTirePress1(float value);
    void updateBackRightTirePress1(float value);
    void updateBackLeftTirePress2(float value);
    void updateBackRightTirePress2(float value);
    void updateFrontLeftTireTemp(int value);
    void updateFrontRightTireTemp(int value);
    void updateBackLeftTireTemp1(int value);
    void updateBackRightTireTemp1(int value);
    void updateBackLeftTireTemp2(int value);
    void updateBackRightTireTemp2(int value);
    //控制系统诊断信息
    void updateDriveFaultAlarm(bool value);
    void updateControlOvervoltageAlarm(bool value);
    void updateControlUndervoltageAlarm(bool value);
    void updateControlEncodingFault(bool value);
    void updateControlHighTempAlarm(bool value);
    void updateControlHighTempAbortAlarm(bool value);
    void updateControlMainContactorFault(bool value);
    void updateControlOvercurrentAlarm(bool value);
    void updateMotorHighTempAlarm(bool value);
    void updateMotorHigtTempAbortAlarm(bool value);
    void updateMotorRotaryFault(bool value);
    void updateControlMotorPowerLimitation(bool value);
    void updateMotorRotaryLimitation(bool value);
    void updateMotorWaterTempOvertop(bool value);
    void updateAcceleratorPedalFault(bool value);
    void updateBrakePedalFaule(bool value);
    void updateSeatbeltAlarm(bool value);
    void updateSeatSwitchAlarm(bool value);
    void updateControlRightDoorsOpenAlarm(bool value);
    void updateControlLeftDoorsOpenAlarm(bool value);
    void updateChauffeurDoorsNotClose(bool value);
    void updateHighTensionSwitchOpen(bool value);
    void updateChargeDoorOpen(bool value);
    void updateSafetyDoorOpen(bool value);
    void updateLowVoltageSwitchOpen(bool value);
    void updateAbsSystemFault(bool value);
    void updateAirCompressorControlHighTemp(bool value);
    void updateAirCompressorMotorHighTemp(bool value);
    void updateBoosterPumpControlHighTemp(bool value);
    void updateBoosterPumpMotorHighTemp(bool value);
    void updateVcuVersion(float value);
    void updateVcuLife(int value);
    //动力电池诊断系统信息
    void updateBatVoltageMaxAlarm(bool value);
    void updateBatVoltageMaxAbortAlarm(bool value);
    void updateBatVoltageMinAlarm(bool value);
    void updateBatVoltageMinAbortAlarm(bool value);
    void updateChargeCurrentMaxAlarm(bool value);
    void updateDischargeCurrentMaxAlarm(bool value);
    void updateDischargeCurrentMaxAbortAlarm(bool value);
    void updateDischargeCurrentTempMinAlarm(bool value);
    void updateDischargeCurrentTempMinAbortAlarm(bool value);
    void updateChargeCurrentTempMaxAlarm(bool value);
    void updateChargeCurrentTempMaxAbortAlarm(bool value);
    void updateBatTempMaxAlarm(bool value);
    void updateBatTempMaxAbortAlarm(bool value);
    void updateDropoutVoltageMaxAlarm(bool value);
    void updateDropoutVoltageMaxAbortAlarm(bool value);
    void updateChargeVoltageMaxAlarm(bool value);
    void updateBatTempDifferentAlarm(bool value);
    void updateBatChargeTempMinAbortAlarm(bool value);
    void updateBatChargeTempMinAlarm(bool value);
    void updateSocMinAlarm(bool value);
    void updateSocMaxAlarm(bool value);
    void updateBatModuleCommunicationFail(bool value);
    void updateBmsSystemFault(bool value);
    void updateBatteryFault(bool value);
    void updateEnergyRecoveryCurrentMaxAlarm(bool value);
    void updateEnergyRecoveryVoltageMaxAlarm(bool value);
    void updateEnergyRecoveryVoltageMaxAbort(bool value);
    void updateEnergyRecoveryCancel(bool value);
    void updateSocJumpAlarm(bool value);
    void updateMismatchingAlarm(bool value);
    void updateVehicleMountedTypeMax(bool value);
    void updateVehicleMountedTypeMin(bool value);
    void updateVehicleMountedTypeOvercharge(bool value);

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

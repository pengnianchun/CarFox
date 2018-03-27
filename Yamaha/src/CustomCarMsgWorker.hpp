#pragma once

#include <CarMsgWorker.hpp>
#include "KeyManager.hpp"
#include "ThemeConfig.hpp"
#include "CustomCarMsgWorkerData.hpp"

#include "protoheader.h"

class CustomCarMsgWorker : public carfox::CarMsgWorker
{
    Q_OBJECT

public:
    CustomCarMsgWorker();

public slots:
    virtual void onStarted(); // 线程启动的时候调用, 这个在次线程下

    // 下行帧，Msg to Worker
    void enableKeys(bool enable);
    void themeSet(qint8 setNo);

    void handleThemeModeChanged(qint8 themeNo);
    void menuInfoRequest(qint64 MenuNo, qint64 pageNo = 0);
    void yxMenuIdRequest(qint64 MenuNo, qint64 pageNo = 0);
    void datetimeInfoRequest(qint64 msec = 0);
    void upgradeStartRequest();
    void tripMilesClearRequest();

signals:
    // 上行帧 Worker to Msg
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);
    void themeModeChanged(int themeNo);
    void dateTimeChanged(uint dateTime);
    void carModeChanged(int modeNo);
    void carSpeedChanged(float value);
    void rpmChanged(float value);
    void totalVoltageChanged(float value);
    void totalCurrentChanged(float value);
    void gearChanged(int value);
    void odoChanged(uint value);
    void tripChanged(float value);
    void socChanged(uint value);
    void apVol1Changed(float value);
    void apVol2Changed(float value);
    void moterControlTempChanged(int value);
    void moterTempChanged(int value);
    void batteryChanged(int value);
    void spnChanged(int value);
    void engineWaterTempChanged(int value);
    void ureaLevelChanged(int value);
    void faultLevelChanged(uint value);
    void faultCodeChanged(int value);
    void oilLevelChanged(uint value);
    void engineOilPressureChanged(float value);
    void aloneBatteryLowVoltageChanged(float value);
    void aloneBatteryHighVoltageChanged(float value);
    void batteryHighTemperatureChanged(int value);
    void batteryLowTemperatureChanged(int value);
    void batteryPackEnergyChanged(float value);
    void velocityRatioChanged(int value);
    void buzzerStatusChanged(bool value);
    //设置模块信息
    void tripMilesClearChanged(bool value);
    void checkMilesClearChanged(bool value);
    void upgradeMsgIdChanged(int upgradeMsgId);
    void upgradeMsgCtxChanged(QString upgradeMsgCtx);
    void closeBuzzerClearChanged(bool value);
    void checkCloseBuzzerClearChanged(bool value);
    void checkDateTimeChanged(bool value);
    void yxCheckRequestMenuChanged(bool value);
    //控制模块信息
    void motorInVoltageChanged(float value);
    void motorInCurrentChanged(float value);
    void motorTempChanged(int value);
    void motorControllerTempChanged(int value);
    void carVcuModeChanged(int value);
    void versionChanged(double value);
    void carLifeChanged(int value);
    void accelPedalPercentChanged(float value);
    void brakePedalPercentChanged(float value);
    void din1Changed(uint value);
    void din2Changed(uint value);
    void din3Changed(uint value);
    void dout1Changed(uint value);
    void dout2Changed(uint value);
    void dout3Changed(uint value);
    void driveSystemStatusChanged(int value);
    void driveMotorStatusChanged(int value);
    void mechanicalBrakeStatusChanged(int value);
    void keyAccChanged(bool value);
    void keyOnChanged(bool value);
    void highVoltageInterlockChanged(bool value);
    void highVoltagePowerUpChanged(bool value);
    void airCompressorWorkChanged(bool value);
    void boosterPumpWorkChanged(bool value);
    void airCompressorMotorSpeedChanged(float value);
    void steeringAssistMotorSpeedChanged(float value);
    void steeringAssistMotorTempChanged(int value);
    void airCompressorMotorTempChanged(int value);
    void airCompressorControlTempChanged(int value);
    void steeringControlDeviceTempChanged(int value);
    void airPress3Changed(float value);
    void airPress4Changed(float value);
    void airPress5Changed(float value);
    void highestAlarmGradeChanged(int value);
    void faultAlarmSituationChanged(int value);
    void driveGearsModeChanged(int value);
    void bduSwitchChanged(int value);
    //仪表模块信息
    void inputCtrl01Changed(bool value);
    void inputCtrl02Changed(bool value);
    void inputCtrl03Changed(bool value);
    void inputCtrl04Changed(bool value);
    void inputCtrl05Changed(bool value);
    void inputCtrl06Changed(bool value);
    void inputCtrl07Changed(bool value);
    void inputCtrl08Changed(bool value);
    void inputCtrl09Changed(bool value);
    void inputCtrl10Changed(bool value);
    void inputCtrl11Changed(bool value);
    void inputCtrl12Changed(bool value);
    void inputCtrl13Changed(bool value);
    void inputCtrl14Changed(bool value);
    void inputCtrl15Changed(bool value);
    void inputCtrl16Changed(bool value);
    void inputCtrl17Changed(bool value);
    void inputCtrl18Changed(bool value);
    void inputCtrl19Changed(bool value);
    void inputCtrl20Changed(bool value);
    void inputCtrl21Changed(bool value);
    void inputCtrl22Changed(bool value);
    void inputCtrl23Changed(bool value);
    void inputCtrl24Changed(bool value);
    void inputCtrl25Changed(bool value);
    void inputCtrl26Changed(bool value);
    void inputCtrl27Changed(bool value);
    void inputCtrl28Changed(bool value);
    void inputCtrl29Changed(bool value);
    void inputCtrl30Changed(bool value);
    void inputCtrl31Changed(bool value);
    void inputCtrl32Changed(bool value);
    void inputCtrl33Changed(bool value);
    void inputCtrl34Changed(bool value);
    void inputCtrl35Changed(bool value);
    //前模块信息
    void frontOutputCurrent01Changed(float value);
    void frontOutputCurrent02Changed(float value);
    void frontOutputCurrent03Changed(float value);
    void frontOutputCurrent04Changed(float value);
    void frontOutputCurrent05Changed(float value);
    void frontOutputCurrent06Changed(float value);
    void frontOutputCurrent07Changed(float value);
    void frontOutputCurrent08Changed(float value);
    void frontOutputCurrent09Changed(float value);
    void frontOutputCurrent10Changed(float value);
    void frontOutputCurrent11Changed(float value);
    void frontOutputCurrent12Changed(float value);
    void frontOutputCurrent13Changed(float value);
    void frontOutputCurrent14Changed(float value);
    void frontOutputCurrent15Changed(float value);
    void frontOutputFault01Changed(int value);
    void frontOutputFault02Changed(int value);
    void frontOutputFault03Changed(int value);
    void frontOutputFault04Changed(int value);
    void frontOutputFault05Changed(int value);
    void frontOutputFault06Changed(int value);
    void frontOutputFault07Changed(int value);
    void frontOutputFault08Changed(int value);
    void frontOutputFault09Changed(int value);
    void frontOutputFault10Changed(int value);
    void frontOutputFault11Changed(int value);
    void frontOutputFault12Changed(int value);
    void frontOutputFault13Changed(int value);
    void frontOutputFault14Changed(int value);
    void frontOutputFault15Changed(int value);
    void frontSwitch01Changed(bool value);
    void frontSwitch02Changed(bool value);
    void frontSwitch03Changed(bool value);
    void frontSwitch04Changed(bool value);
    void frontSwitch05Changed(bool value);
    void frontSwitch06Changed(bool value);
    void frontSwitch07Changed(bool value);
    void frontSwitch08Changed(bool value);
    void frontSwitch09Changed(bool value);
    void frontSwitch10Changed(bool value);
    void frontSwitch11Changed(bool value);
    void frontSwitch12Changed(bool value);
    void frontSwitch13Changed(bool value);
    void frontSwitch14Changed(bool value);
    void frontSwitch15Changed(bool value);
    void frontSwitch16Changed(bool value);
    void frontAnalogInput01Changed(float value);
    void frontAnalogInput02Changed(float value);
    void frontHzInputChanged(int value);
    void frontSpeedInputChanged(int value);
    //中模块信息
    void middleOutputCurrent01Changed(float value);
    void middleOutputCurrent02Changed(float value);
    void middleOutputCurrent03Changed(float value);
    void middleOutputCurrent04Changed(float value);
    void middleOutputCurrent05Changed(float value);
    void middleOutputCurrent06Changed(float value);
    void middleOutputCurrent07Changed(float value);
    void middleOutputCurrent08Changed(float value);
    void middleOutputCurrent09Changed(float value);
    void middleOutputCurrent10Changed(float value);
    void middleOutputCurrent11Changed(float value);
    void middleOutputCurrent12Changed(float value);
    void middleOutputCurrent13Changed(float value);
    void middleOutputCurrent14Changed(float value);
    void middleOutputCurrent15Changed(float value);
    void middleOutputFault01Changed(int value);
    void middleOutputFault02Changed(int value);
    void middleOutputFault03Changed(int value);
    void middleOutputFault04Changed(int value);
    void middleOutputFault05Changed(int value);
    void middleOutputFault06Changed(int value);
    void middleOutputFault07Changed(int value);
    void middleOutputFault08Changed(int value);
    void middleOutputFault09Changed(int value);
    void middleOutputFault10Changed(int value);
    void middleOutputFault11Changed(int value);
    void middleOutputFault12Changed(int value);
    void middleOutputFault13Changed(int value);
    void middleOutputFault14Changed(int value);
    void middleOutputFault15Changed(int value);
    void middleSwitch01Changed(bool value);
    void middleSwitch02Changed(bool value);
    void middleSwitch03Changed(bool value);
    void middleSwitch04Changed(bool value);
    void middleSwitch05Changed(bool value);
    void middleSwitch06Changed(bool value);
    void middleSwitch07Changed(bool value);
    void middleSwitch08Changed(bool value);
    void middleSwitch09Changed(bool value);
    void middleSwitch10Changed(bool value);
    void middleSwitch11Changed(bool value);
    void middleSwitch12Changed(bool value);
    void middleSwitch13Changed(bool value);
    void middleSwitch14Changed(bool value);
    void middleSwitch15Changed(bool value);
    void middleSwitch16Changed(bool value);
    void middleAnalogInput01Changed(float value);
    void middleAnalogInput02Changed(float value);
    void middleHzInputChanged(int value);
    void middleSpeedInputChanged(int value);
    //后模块信息
    void backOutputCurrent01Changed(float value);
    void backOutputCurrent02Changed(float value);
    void backOutputCurrent03Changed(float value);
    void backOutputCurrent04Changed(float value);
    void backOutputCurrent05Changed(float value);
    void backOutputCurrent06Changed(float value);
    void backOutputCurrent07Changed(float value);
    void backOutputCurrent08Changed(float value);
    void backOutputCurrent09Changed(float value);
    void backOutputCurrent10Changed(float value);
    void backOutputCurrent11Changed(float value);
    void backOutputCurrent12Changed(float value);
    void backOutputCurrent13Changed(float value);
    void backOutputCurrent14Changed(float value);
    void backOutputCurrent15Changed(float value);
    void backOutputFault01Changed(int value);
    void backOutputFault02Changed(int value);
    void backOutputFault03Changed(int value);
    void backOutputFault04Changed(int value);
    void backOutputFault05Changed(int value);
    void backOutputFault06Changed(int value);
    void backOutputFault07Changed(int value);
    void backOutputFault08Changed(int value);
    void backOutputFault09Changed(int value);
    void backOutputFault10Changed(int value);
    void backOutputFault11Changed(int value);
    void backOutputFault12Changed(int value);
    void backOutputFault13Changed(int value);
    void backOutputFault14Changed(int value);
    void backOutputFault15Changed(int value);
    void backSwitch01Changed(bool value);
    void backSwitch02Changed(bool value);
    void backSwitch03Changed(bool value);
    void backSwitch04Changed(bool value);
    void backSwitch05Changed(bool value);
    void backSwitch06Changed(bool value);
    void backSwitch07Changed(bool value);
    void backSwitch08Changed(bool value);
    void backSwitch09Changed(bool value);
    void backSwitch10Changed(bool value);
    void backSwitch11Changed(bool value);
    void backSwitch12Changed(bool value);
    void backSwitch13Changed(bool value);
    void backSwitch14Changed(bool value);
    void backSwitch15Changed(bool value);
    void backSwitch16Changed(bool value);
    void backAnalogInput01Changed(float value);
    void backAnalogInput02Changed(float value);
    void backHzInputChanged(int value);
    void backSpeedInputChanged(int value);
    //报警模块信息
    void warningIdChanged(int value);
    //发动机信息
    void engineFuelConsumptionChanged(float value);
    void engineLoadChanged(int value);
    void engineTargetThrottleChanged(float value);
    void engineActualThrottleChanged(float value);
    void engineInletTemperatureChanged(int value);
    //辅助模块信息
    void oilPumpDcacWoutputCurrentChanged(float value);
    void oilPumpDcacVoutputCurrentChanged(float value);
    void oilPumpDcacUoutputCurrentChanged(float value);
    void radiatorTemperatureChanged(int value);
    //TCU模块信息
    void actualClutchPositionChanged(int value);
    void tcuFaultCodeChanged(uint value);
    void axisRpmChanged(int value);
    void fmiChanged(int value);
    void cmChanged(int value);
    void ocChanged(uint value);
    //电池管理信息
    void batMaxChargeCurrentChanged(float value);
    void batMaxDischargeCurrentChanged(float value);
    void batAverageVoltageChanged(float value);
    void batStatus1Changed(uint value);
    void batStatus2Changed(uint value);
    void batStatus3Changed(uint value);
    void irmOhmPositiveChanged(float value);
    void irmOhmNegativeChanged(float value);
    void batMaxVoltageChanged(float value);
    void batMinVoltageChanged(float value);
    void batteryHighestTempChanged(float value);
    void bmsVersionChanged(float value);
    void bmsModuleAmountChanged(float value);
    void bmsLifeChanged(float value);
    void batteryPackHighestTempChanged(float value);
    void batteryPackMinTempChanged(float value);
    void batteryManagePackEnergyChanged(float value);
    void bmsControlStatusChanged(float value);
    void batAmountChanged(float value);
    void rechargeStatusChanged(float value);
    void tempStyletAmountChanged(float value);
    void outletPositiveTempChanged(float value);
    void outletNegativeTempChanged(float value);
    void powerBatteryTypeChanged(float value);
    void powerBatteryRechargeChanged(float value);
    //电池组电压信息
    //void addrNumberVoltageChanged(int value);
    //void addrNumberVoltageValueChanged(float value);
    //void boxNumberVoltageChanged(int value);
    //void voltageInfoChanged(QVariantMap value);
    void batVoltageChanged(QVariantMap value);
    //电池组温度信息
    //void addrNumberTempChanged(int value);
    //void addrNumberTempValueChanged(float value);
    //void boxNumberTempChanged(int value);
    //void tempInfoChanged(QVariantMap value);
    void batTempChanged(QVariantMap value);
    //空调模块信息
    void acFaultCodeChanged(uint value);
    void acFanStatusChanged(uint value);
    void acWorkStatusChanged(uint value);
    void acLifeChanged(uint value);
    void acOutTempChanged(int value);
    void acInTempChanged(int value);
    void acSetTempChanged(int value);
    void acRefrigereReqChanged(uint value);
    //DCDC状态信息
    void dcLowVoltageChanged(float value);
    void dcLowCurrentChanged(float value);
    void dcTempChanged(int value);
    void dcStatus2Changed(int value);
    void dcUndervoltageChanged(bool value);
    void dcOvervoltageChanged(bool value);
    void dcOverheatingChanged(bool value);
    void dcShortCircuitChanged(bool value);
    void dcWorkStatusChanged(bool value);
    //符号片信息
    void lampKeyOnChanged(bool value);
    void lampAirFilterChanged(bool value);
    void lampAsrChanged(bool value);
    void lampHighVoltageMaintenanceChanged(bool value);
    void lampDefrosterChanged(bool value);
    void lampDryereChanged(bool value);
    void lampAbsChanged(bool value);
    void lampAcChanged(bool value);
    void powerSupplyChanged(bool value);
    void powerPlugInModeChanged(bool value);
    void powerByvridModeChanged(bool value);
    void climbingModeChanged(bool value);
    void diagnosticModeChanged(bool value);
    void lampTurnLeftChanged(bool value);
    void lampTurnRightChanged(bool value);
    void lampDoubleFlashChanged(bool value);
    void lampFrontFogChanged(bool value);
    void lampRearFogChanged(bool value);
    void lampHighBeamChanged(bool value);
    void lampHeadLightChanged(bool value);
    void lampReverseGearChanged(bool value);
    void lampPositionLightChanged(bool value);
    void lampGate1Changed(bool value);
    void lampGate2Changed(bool value);
    void lampRearDoorOpenChanged(bool value);
    void lampBrakeChanged(bool value);
    void lampParkingBrakeChanged(bool value);
    void lampLeftLowAirPressureChanged(bool value);
    void lampRightLowAirPressureChanged(bool value);
    void lampLeftShoeWearChanged(bool value);
    void lampRightShoeWearChanged(bool value);
    void lampChargeConfirmChanged(bool value);
    void lampBatteryMainContactChanged(bool value);
    void lampWaterTempHighChanged(bool value);
    void lampWaterLevelLowChanged(bool value);
    void lampLowServiceWlChanged(bool value);
    void lampHeavyStopWlChanged(bool value);
    void lampSeriousStopWlChanged(bool value);
    void lampOilLevelLowChanged(bool value);
    void lampOilPressureLowChanged(bool value);
    void lampEngineFaultChanged(bool value);
    void lampMotorOutOfServiceChanged(bool value);
    void lampMoterFireIgonChanged(bool value);
    void lampAfterTreatChanged(bool value);
    void lampWarningLedChanged(bool value);
    void airPress1LampChanged(bool value);
    void airPress2LampChanged(bool value);
    void airPress3LampChanged(bool value);
    void airPress4LampChanged(bool value);
    void airPress5LampChanged(bool value);
    void powerDoorsOpenChanged(bool value);
    void powerBatteryCutOffChanged(bool value);
    void seatbeltNotFastenedChanged(bool value);
    void forwardGearChanged(bool value);
    void neutralGearChanged(bool value);
    void reverseGearChanged(bool value);
    void electronicInSlopeChanged(bool value);
    void ascdChanged(bool value);
    void readyChanged(bool value);
    void powerAccumulatorsChargeStatusChanged(bool value);
    void cableConnectChanged(bool value);
    void controlMotorOverheatingChanged(bool value);
    void powerAccumulatorsFaultChanged(bool value);
    void driverSystemFaultChanged(bool value);
    void severityInsulationFaultChanged(bool value);
    void slightInsulationFaultChanged(bool value);
    void motorPowerLimitationChanged(bool value);
    void bmsAlarmChanged(bool value);
    void socLowAramChanged(bool value);
    void safetySystemAlarmChanged(bool value);
    void leftDoorsOpenAlarmChanged(bool value);
    void rightDoorsOpenAlarmChanged(bool value);
    void barrierFreeMarchReachChanged(bool value);
    void gateChargeOpenChanged(bool value);
    void driverSeatAlarmChanged(bool value);
    void ecasSystemFaultLedChanged(bool value);
    void ecasAlarmLedChanged(bool value);
    void ecasKneelingStatusLedChanged(bool value);
    void ecasSpecialHeightLedChanged(bool value);
    void dropOffDoorbellChanged(bool value);
    void waitChanged(bool value);
    void frontDoorExigencyAlarmChanged(bool value);
    void middleDoorExigencyAlarmChanged(bool value);
    void stopChanged(bool value);
    void lampLeftBackWearChanged(bool value);
    void lampRightBackWearChanged(bool value);
    void lampMirrorHeatingChanged(bool value);
    void lampDefroster1Changed(bool value);
    void lampDefroster2Changed(bool value);
    void lampLowSpeedCloseChanged(bool value);
    void lampMainSwitchChanged(bool value);
    void lampTirePreFaultChanged(bool value);
    void lampBatHigtTempChanged(bool value);
    void lampSystemFaultChanged(bool value);
    void lampBatLegendChanged(bool value);
    void lampRtonChanged(bool value);
    //胎压模块信息
    void frontLeftTirePressChanged(float value);
    void fronRightTirePressChanged(float value);
    void backLeftTirePress1Changed(float value);
    void backRightTirePress1Changed(float value);
    void backLeftTirePress2Changed(float value);
    void backRightTirePress2Changed(float value);
    void frontLeftTireTempChanged(int value);
    void frontRightTireTempChanged(int value);
    void backLeftTireTemp1Changed(int value);
    void backRightTireTemp1Changed(int value);
    void backLeftTireTemp2Changed(int value);
    void backRightTireTemp2Changed(int value);
    //整车控制系统诊断信息
    void driveFaultAlarmChanged(bool value) ; //驱动系统故障报警
    void controlOvervoltageAlarmChanged(bool value) ; //驱动控制器过压报警
    void controlUndervoltageAlarmChanged(bool value) ; //驱动控制器欠压报警
    void controlEncodingFaultChanged(bool value) ; //驱动控制器编码故障
    void controlHighTempAlarmChanged(bool value) ; //驱动控制器高温报警
    void controlHighTempAbortAlarmChanged(bool value) ; //驱动控制器高温截止报警
    void controlMainContactorFaultChanged(bool value) ; //驱动控制器主接触器故障
    void controlOvercurrentAlarmChanged(bool value) ; //驱动控制器过流报警
    void motorHighTempAlarmChanged(bool value) ; //驱动电机高温报警
    void motorHigtTempAbortAlarmChanged(bool value) ; //驱动电机高温截止报警
    void motorRotaryFaultChanged(bool value) ; //驱动电机旋变故障报警
    void controlMotorPowerLimitationChanged(bool value) ; //驱动电机功率受限报警
    void motorRotaryLimitationChanged(bool value) ; //驱动电机转矩受限报警
    void motorWaterTempOvertopChanged(bool value) ; //驱动电机水温过高报警
    void acceleratorPedalFaultChanged(bool value) ; //加速踏板信号值异常报警
    void brakePedalFauleChanged(bool value) ; //刹车踏板信号值异常报警
    void seatbeltAlarmChanged(bool value) ; //安全带报警
    void seatSwitchAlarmChanged(bool value) ; //座椅开关报警
    void controlRightDoorsOpenAlarmChanged(bool value) ; //右侧舱门开启报警
    void controlLeftDoorsOpenAlarmChanged(bool value) ; //左侧舱门开启报警
    void chauffeurDoorsNotCloseChanged(bool value) ; //司机门未关报警
    void highTensionSwitchOpenChanged(bool value) ; //高压开关门开启报警
    void chargeDoorOpenChanged(bool value) ; //充电门开启报警
    void safetyDoorOpenChanged(bool value) ; //安全门开启报警
    void lowVoltageSwitchOpenChanged(bool value) ; //低压开关门开启报警
    void absSystemFaultChanged(bool value) ; //ABS系统故障
    void airCompressorControlHighTempChanged(bool value) ; //空压机控制器高温报警
    void airCompressorMotorHighTempChanged(bool value) ; //空压机电机高温报警
    void boosterPumpControlHighTempChanged(bool value) ; //助力泵控制器高温报警
    void boosterPumpMotorHighTempChanged(bool value) ; //助力泵电机高温报警
    void vcuVersionChanged(float value) ; //VCU程序版本号，0.0
    void vcuLifeChanged(int value) ; //VCU系统Life值
    //动力电池诊断系统信息
    void batVoltageMaxAlarmChanged(bool value) ; //单体电压过高报警
    void batVoltageMaxAbortAlarmChanged(bool value) ; //单体电压过高截止报警
    void batVoltageMinAlarmChanged(bool value) ; //单体电压过低报警
    void batVoltageMinAbortAlarmChanged(bool value) ; //单体电压过低截止报警
    void chargeCurrentMaxAlarmChanged(bool value) ; //峰值充电电流过大
    void dischargeCurrentMaxAlarmChanged(bool value) ; //峰值放电电流过大
    void dischargeCurrentMaxAbortAlarmChanged(bool value) ; //峰值放电电流过大截止报警
    void dischargeCurrentTempMinAlarmChanged(bool value) ; //电池放电温度过低报警
    void dischargeCurrentTempMinAbortAlarmChanged(bool value) ; //电池放电温度过低截止报警
    void chargeCurrentTempMaxAlarmChanged(bool value) ; //电池充电温度过高报警
    void chargeCurrentTempMaxAbortAlarmChanged(bool value) ; //电池充电温度过高截止报警
    void batTempMaxAlarmChanged(bool value) ; //电池温度过高报警
    void batTempMaxAbortAlarmChanged(bool value) ; //电池温度过高截止报警
    void dropoutVoltageMaxAlarmChanged(bool value) ; //单体电压压差过大报警
    void dropoutVoltageMaxAbortAlarmChanged(bool value) ; //单体电压压差过大截止报警
    void chargeVoltageMaxAlarmChanged(bool value) ; //电池充电电压过高
    void batTempDifferentAlarmChanged(bool value) ; //动力电池温度差异报警
    void batChargeTempMinAbortAlarmChanged(bool value) ; //电池充电温度过低截止报警
    void batChargeTempMinAlarmChanged(bool value) ; //动力电池充电温度过低报警
    void socMinAlarmChanged(bool value) ; //动力电池SOC过低报警
    void socMaxAlarmChanged(bool value) ; //动力电池SOC过高报警
    void batModuleCommunicationFailChanged(bool value) ; //动力电池模块通讯失效
    void bmsSystemFaultChanged(bool value) ; //BMS系统故障
    void batteryFaultChanged(bool value) ; //动力蓄电池故障
    void energyRecoveryCurrentMaxAlarmChanged(bool value) ; //制动能量回收电流过大报警
    void energyRecoveryVoltageMaxAlarmChanged(bool value) ; //制动能量回收单体电压过高报警
    void energyRecoveryVoltageMaxAbortChanged(bool value) ; //制动能量回收单体电压过高截止报警
    void energyRecoveryCancelChanged(bool value) ; //取消制动能量回收功能
    void socJumpAlarmChanged(bool value) ; //SOC跳变报警
    void mismatchingAlarmChanged(bool value) ; //可充电储能系统不匹配报警
    void vehicleMountedTypeMaxChanged(bool value) ; //车载储能装置类型过压报警
    void vehicleMountedTypeMinChanged(bool value) ; //车载储能装置类型欠压报警
    void vehicleMountedTypeOverchargeChanged(bool value) ; //车载储能装置类型过充
protected:
     virtual void registerCallback();

private:
    //通用信息
    void handleProtoKey(const carfox::MessagePtr& msg);
    void handleGeneralInfoFrame(const carfox::MessagePtr& msg);
    void handleControlInfoFrame(const carfox::MessagePtr& msg);
    void handleCustomInfoFrame(const carfox::MessagePtr& msg);
    void handleMixedInfoFrame(const carfox::MessagePtr& msg);
    //系统设置信息
    void handleProtoDatetime(const carfox::MessagePtr &msg);
    void handleMilesClear(const carfox::MessagePtr &msg);
    void handleProtoUpgradeNotify(const carfox::MessagePtr &msg);
    void handleProtoCloseBuzzer(const carfox::MessagePtr &msg);
    void handleProtoDateTimeVerify(const carfox::MessagePtr &msg);
    void handleProtoMilesClearVerify(const carfox::MessagePtr &msg);
    void handleProtoCloseBuzzerVerify(const carfox::MessagePtr &msg);
    void handleProtoYxMenuIdRequest(const carfox::MessagePtr &msg);
    //控制系统信息
    void handleProtoControlSystemMenuInfo(const carfox::MessagePtr &msg);
    //仪表信息
    void handleProtoInstrumentFrameInfo(const carfox::MessagePtr &msg);
    //前模块信息
    void handleProtoFrontElectricFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoFrontFaultFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoFrontControlFrameInfo(const carfox::MessagePtr &msg);
    //中模块信息
    void handleProtoMiddleElectricFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoMiddleFaultFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoMiddleControlFrameInfo(const carfox::MessagePtr &msg);
    //后模块信息
    void handleProtoBackElectricFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoBackFaultFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoBackControlFrameInfo(const carfox::MessagePtr &msg);
    //警告信息
    void handleProtoWarningFrameInfo(const carfox::MessagePtr &msg);
    //发动机系统信息
    void handleProtoMoterSystemMenuInfo(const carfox::MessagePtr &msg);
    //辅助系统信息
    void handleProtoAuxiliarySystemMenuInfo(const carfox::MessagePtr &msg);
    //TCU系统信息
    void handleProtoTcuSystemMenuInfo(const carfox::MessagePtr &msg);
    //电池管理系统信息
    void handleProtoBatteryManageSystemMenuInfo(const carfox::MessagePtr &msg);
    //电池组电压信息
    //void handleProtoBatteryGroupVoltageMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoBatterySingleVoltageMenuInfo(const carfox::MessagePtr &msg);
    //电池组温度信息
    //void handleProtoBatteryGroupTemperatureMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoBatterySingleTemperatureMenuInfo(const carfox::MessagePtr &msg);
    //空调系统信息
    void handleProtoAirCtrlSystemMenuInfo(const carfox::MessagePtr &msg);
    //DC/DC状态信息系统
    void handleProtoDcStatusMessageMenuInfo(const carfox::MessagePtr &msg);
    //符号信息
    void handleProtoPicLampFrameInfo(const carfox::MessagePtr &msg);
    //胎压监测系统
    void handleProtoTirePressInfoFrameInfo(const carfox::MessagePtr &msg);
    //胎压监测系统
    void handleProtoControlSystemDiagnoseMenuInfo(const carfox::MessagePtr &msg);
    //动力电池诊断系统信息
    void handleProtoBatteryDiagnoseSystemMenuInfo(const carfox::MessagePtr &msg);
private:
    CarMsgWorkerStateData mStateData;
    std::shared_ptr<KeyManager> mKeyManager;
    std::shared_ptr<ThemeConfig> mThemeConfig;
    QVariantMap mBatVoltageData;
    QVariantMap mBatTempData;
};

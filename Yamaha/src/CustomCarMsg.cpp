#include "CustomCarMsg.hpp"
#include "CustomCarMsgWorker.hpp"
#include "KeyManager.hpp"

CustomCarMsg::CustomCarMsg(CustomCarMsgWorker *worker)
    : carfox::CarMsg(worker)
{

    if (!worker) {
        return;
    }
    connectMsgToWorker(worker);
    connectWorkerToMsg(worker);
}

void CustomCarMsg::connectWorkerToMsg(CustomCarMsgWorker *worker)
{
    // 上行帧 Worker to Msg
    connect(worker, &CustomCarMsgWorker::keyPressed, this, &CustomCarMsg::keyPressed);
    connect(worker, &CustomCarMsgWorker::keyReleased, this, &CustomCarMsg::keyReleased);
    connect(worker, &CustomCarMsgWorker::keyDoublePressed, this, &CustomCarMsg::keyDoublePressed);
    connect(worker, &CustomCarMsgWorker::keyLongPressed, this, &CustomCarMsg::keyLongPressed);
    connect(worker, &CustomCarMsgWorker::keyShortPressed, this, &CustomCarMsg::keyShortPressed);
    connect(worker, &CustomCarMsgWorker::themeModeChanged, this, &CustomCarMsg::updateThemeMode);
    connect(worker, &CustomCarMsgWorker::dateTimeChanged, this, &CustomCarMsg::updateDateTime);
    connect(worker, &CustomCarMsgWorker::carModeChanged, this, &CustomCarMsg::updateCarMode);
    connect(worker, &CustomCarMsgWorker::carSpeedChanged, this, &CustomCarMsg::updateCarSpeed);
    connect(worker, &CustomCarMsgWorker::rpmChanged, this, &CustomCarMsg::updateRpm);
    connect(worker, &CustomCarMsgWorker::totalVoltageChanged, this, &CustomCarMsg::updateTotalVoltage);
    connect(worker, &CustomCarMsgWorker::totalCurrentChanged, this, &CustomCarMsg::updateTotalCurrent);
    connect(worker, &CustomCarMsgWorker::gearChanged, this, &CustomCarMsg::updateGear);
    connect(worker, &CustomCarMsgWorker::odoChanged, this, &CustomCarMsg::updateOdo);
    connect(worker, &CustomCarMsgWorker::tripChanged, this, &CustomCarMsg::updateTrip);
    connect(worker, &CustomCarMsgWorker::socChanged, this, &CustomCarMsg::updateSoc);
    connect(worker, &CustomCarMsgWorker::apVol1Changed, this, &CustomCarMsg::updateApVol1);
    connect(worker, &CustomCarMsgWorker::apVol2Changed, this, &CustomCarMsg::updateApVol2);
    connect(worker, &CustomCarMsgWorker::moterControlTempChanged, this, &CustomCarMsg::updateMoterControlTemp);
    connect(worker, &CustomCarMsgWorker::moterTempChanged, this, &CustomCarMsg::updateMoterTemp);
    connect(worker, &CustomCarMsgWorker::batteryChanged, this, &CustomCarMsg::updateBattery);
    connect(worker, &CustomCarMsgWorker::spnChanged, this, &CustomCarMsg::updateSpn);
    connect(worker, &CustomCarMsgWorker::engineWaterTempChanged, this, &CustomCarMsg::updateEngineWaterTemp);
    connect(worker, &CustomCarMsgWorker::ureaLevelChanged, this, &CustomCarMsg::updateUreaLevel);
    connect(worker, &CustomCarMsgWorker::faultLevelChanged, this, &CustomCarMsg::updateFaultLevel);
    connect(worker, &CustomCarMsgWorker::faultCodeChanged, this, &CustomCarMsg::updateFaultCode);
    connect(worker, &CustomCarMsgWorker::oilLevelChanged, this, &CustomCarMsg::updateOilLevel);
    connect(worker, &CustomCarMsgWorker::engineOilPressureChanged, this, &CustomCarMsg::updateEngineOilPressure);
    connect(worker, &CustomCarMsgWorker::aloneBatteryLowVoltageChanged, this, &CustomCarMsg::updateAloneBatteryLowVoltage);
    connect(worker, &CustomCarMsgWorker::aloneBatteryHighVoltageChanged, this, &CustomCarMsg::updateAloneBatteryHighVoltage);
    connect(worker, &CustomCarMsgWorker::batteryHighTemperatureChanged, this, &CustomCarMsg::updateBatteryHighTemperature);
    connect(worker, &CustomCarMsgWorker::batteryLowTemperatureChanged, this, &CustomCarMsg::updateBatteryLowTemperature);
    connect(worker, &CustomCarMsgWorker::batteryPackEnergyChanged, this, &CustomCarMsg::updateBatteryPackEnergy);
    connect(worker, &CustomCarMsgWorker::velocityRatioChanged, this, &CustomCarMsg::updateVelocityRatio);
    connect(worker, &CustomCarMsgWorker::buzzerStatusChanged, this, &CustomCarMsg::updateVuzzerStatus);
    //设置模块信息
    connect(worker, &CustomCarMsgWorker::tripMilesClearChanged, this, &CustomCarMsg::updateTripMilesClear);
    connect(worker, &CustomCarMsgWorker::checkMilesClearChanged, this, &CustomCarMsg::updateCheckMilesClear);
    connect(worker, &CustomCarMsgWorker::upgradeMsgIdChanged, this, &CustomCarMsg::updateUpgradeMsgId);
    connect(worker, &CustomCarMsgWorker::upgradeMsgCtxChanged, this, &CustomCarMsg::updateUpgradeMsgCtx);
    connect(worker, &CustomCarMsgWorker::closeBuzzerClearChanged, this, &CustomCarMsg::updateCloseBuzzerClear);
    connect(worker, &CustomCarMsgWorker::checkCloseBuzzerClearChanged, this, &CustomCarMsg::updateCheckCloseBuzzerClear);
    connect(worker, &CustomCarMsgWorker::checkDateTimeChanged, this, &CustomCarMsg::updateCheckDateTimeSetting);
    //控制模块信息
    connect(worker, &CustomCarMsgWorker::motorInVoltageChanged, this, &CustomCarMsg::updateMotorInVoltage);
    connect(worker, &CustomCarMsgWorker::motorInCurrentChanged, this, &CustomCarMsg::updateMotorInCurrent);
    connect(worker, &CustomCarMsgWorker::motorTempChanged, this, &CustomCarMsg::updateMotorTemp);
    connect(worker, &CustomCarMsgWorker::motorControllerTempChanged, this, &CustomCarMsg::updateMotorControllerTemp);
    connect(worker, &CustomCarMsgWorker::carVcuModeChanged, this, &CustomCarMsg::updateCarVcuMode);
    connect(worker, &CustomCarMsgWorker::versionChanged, this, &CustomCarMsg::updateVersion);
    connect(worker, &CustomCarMsgWorker::carLifeChanged, this, &CustomCarMsg::updateCarLife);
    connect(worker, &CustomCarMsgWorker::accelPedalPercentChanged, this, &CustomCarMsg::updateAccelPedalPercent);
    connect(worker, &CustomCarMsgWorker::brakePedalPercentChanged, this, &CustomCarMsg::updateBrakePedalPercent);
    connect(worker, &CustomCarMsgWorker::din1Changed, this, &CustomCarMsg::updateDin1);
    connect(worker, &CustomCarMsgWorker::din2Changed, this, &CustomCarMsg::updateDin2);
    connect(worker, &CustomCarMsgWorker::din3Changed, this, &CustomCarMsg::updateDin3);
    connect(worker, &CustomCarMsgWorker::dout1Changed, this, &CustomCarMsg::updateDout1);
    connect(worker, &CustomCarMsgWorker::dout2Changed, this, &CustomCarMsg::updateDout2);
    connect(worker, &CustomCarMsgWorker::dout3Changed, this, &CustomCarMsg::updateDout3);
    connect(worker, &CustomCarMsgWorker::driveSystemStatusChanged, this, &CustomCarMsg::updateDriveSystemStatus);
    connect(worker, &CustomCarMsgWorker::driveMotorStatusChanged, this, &CustomCarMsg::updateDriveMotorStatus);
    connect(worker, &CustomCarMsgWorker::mechanicalBrakeStatusChanged, this, &CustomCarMsg::updateMechanicalBrakeStatus);
    connect(worker, &CustomCarMsgWorker::keyAccChanged, this, &CustomCarMsg::updateKeyAcc);
    connect(worker, &CustomCarMsgWorker::keyOnChanged, this, &CustomCarMsg::updateKeyOn);
    connect(worker, &CustomCarMsgWorker::highVoltageInterlockChanged, this, &CustomCarMsg::updateHighVoltageInterlock);
    connect(worker, &CustomCarMsgWorker::highVoltagePowerUpChanged, this, &CustomCarMsg::updateHighVoltagePowerUp);
    connect(worker, &CustomCarMsgWorker::airCompressorWorkChanged, this, &CustomCarMsg::updateAirCompressorWork);
    connect(worker, &CustomCarMsgWorker::boosterPumpWorkChanged, this, &CustomCarMsg::updateBoosterPumpWork);
    connect(worker, &CustomCarMsgWorker::airCompressorMotorSpeedChanged, this, &CustomCarMsg::updateAirCompressorMotorSpeed);
    connect(worker, &CustomCarMsgWorker::steeringAssistMotorSpeedChanged, this, &CustomCarMsg::updateSteeringAssistMotorSpeed);
    connect(worker, &CustomCarMsgWorker::steeringAssistMotorTempChanged, this, &CustomCarMsg::updateSteeringAssistMotorTemp);
    connect(worker, &CustomCarMsgWorker::airCompressorMotorTempChanged, this, &CustomCarMsg::updateAirCompressorMotorTemp);
    connect(worker, &CustomCarMsgWorker::airCompressorControlTempChanged, this, &CustomCarMsg::updateAirCompressorControlTemp);
    connect(worker, &CustomCarMsgWorker::steeringControlDeviceTempChanged, this, &CustomCarMsg::updateSteeringControlDeviceTemp);
    connect(worker, &CustomCarMsgWorker::airPress3Changed, this, &CustomCarMsg::updateAirPress3);
    connect(worker, &CustomCarMsgWorker::airPress4Changed, this, &CustomCarMsg::updateAirPress4);
    connect(worker, &CustomCarMsgWorker::airPress5Changed, this, &CustomCarMsg::updateAirPress5);
    connect(worker, &CustomCarMsgWorker::highestAlarmGradeChanged, this, &CustomCarMsg::updateHighestAlarmGrade);
    connect(worker, &CustomCarMsgWorker::faultAlarmSituationChanged, this, &CustomCarMsg::updateFaultAlarmSituation);
    connect(worker, &CustomCarMsgWorker::driveGearsModeChanged, this, &CustomCarMsg::updateDriveGearsMode);
    connect(worker, &CustomCarMsgWorker::bduSwitchChanged, this, &CustomCarMsg::updateBduSwitch);
    //仪表模块信息
    connect(worker, &CustomCarMsgWorker::inputCtrl01Changed, this, &CustomCarMsg::updateInputCtrl01);
    connect(worker, &CustomCarMsgWorker::inputCtrl02Changed, this, &CustomCarMsg::updateInputCtrl02);
    connect(worker, &CustomCarMsgWorker::inputCtrl03Changed, this, &CustomCarMsg::updateInputCtrl03);
    connect(worker, &CustomCarMsgWorker::inputCtrl04Changed, this, &CustomCarMsg::updateInputCtrl04);
    connect(worker, &CustomCarMsgWorker::inputCtrl05Changed, this, &CustomCarMsg::updateInputCtrl05);
    connect(worker, &CustomCarMsgWorker::inputCtrl06Changed, this, &CustomCarMsg::updateInputCtrl06);
    connect(worker, &CustomCarMsgWorker::inputCtrl07Changed, this, &CustomCarMsg::updateInputCtrl07);
    connect(worker, &CustomCarMsgWorker::inputCtrl08Changed, this, &CustomCarMsg::updateInputCtrl08);
    connect(worker, &CustomCarMsgWorker::inputCtrl09Changed, this, &CustomCarMsg::updateInputCtrl09);
    connect(worker, &CustomCarMsgWorker::inputCtrl10Changed, this, &CustomCarMsg::updateInputCtrl10);
    connect(worker, &CustomCarMsgWorker::inputCtrl11Changed, this, &CustomCarMsg::updateInputCtrl11);
    connect(worker, &CustomCarMsgWorker::inputCtrl12Changed, this, &CustomCarMsg::updateInputCtrl12);
    connect(worker, &CustomCarMsgWorker::inputCtrl13Changed, this, &CustomCarMsg::updateInputCtrl13);
    connect(worker, &CustomCarMsgWorker::inputCtrl14Changed, this, &CustomCarMsg::updateInputCtrl14);
    connect(worker, &CustomCarMsgWorker::inputCtrl15Changed, this, &CustomCarMsg::updateInputCtrl15);
    connect(worker, &CustomCarMsgWorker::inputCtrl16Changed, this, &CustomCarMsg::updateInputCtrl16);
    connect(worker, &CustomCarMsgWorker::inputCtrl17Changed, this, &CustomCarMsg::updateInputCtrl17);
    connect(worker, &CustomCarMsgWorker::inputCtrl18Changed, this, &CustomCarMsg::updateInputCtrl18);
    connect(worker, &CustomCarMsgWorker::inputCtrl19Changed, this, &CustomCarMsg::updateInputCtrl19);
    connect(worker, &CustomCarMsgWorker::inputCtrl20Changed, this, &CustomCarMsg::updateInputCtrl20);
    connect(worker, &CustomCarMsgWorker::inputCtrl21Changed, this, &CustomCarMsg::updateInputCtrl21);
    connect(worker, &CustomCarMsgWorker::inputCtrl22Changed, this, &CustomCarMsg::updateInputCtrl22);
    connect(worker, &CustomCarMsgWorker::inputCtrl23Changed, this, &CustomCarMsg::updateInputCtrl23);
    connect(worker, &CustomCarMsgWorker::inputCtrl24Changed, this, &CustomCarMsg::updateInputCtrl24);
    connect(worker, &CustomCarMsgWorker::inputCtrl25Changed, this, &CustomCarMsg::updateInputCtrl25);
    connect(worker, &CustomCarMsgWorker::inputCtrl26Changed, this, &CustomCarMsg::updateInputCtrl26);
    connect(worker, &CustomCarMsgWorker::inputCtrl27Changed, this, &CustomCarMsg::updateInputCtrl27);
    connect(worker, &CustomCarMsgWorker::inputCtrl28Changed, this, &CustomCarMsg::updateInputCtrl28);
    connect(worker, &CustomCarMsgWorker::inputCtrl29Changed, this, &CustomCarMsg::updateInputCtrl29);
    connect(worker, &CustomCarMsgWorker::inputCtrl30Changed, this, &CustomCarMsg::updateInputCtrl30);
    connect(worker, &CustomCarMsgWorker::inputCtrl31Changed, this, &CustomCarMsg::updateInputCtrl31);
    connect(worker, &CustomCarMsgWorker::inputCtrl32Changed, this, &CustomCarMsg::updateInputCtrl32);
    connect(worker, &CustomCarMsgWorker::inputCtrl33Changed, this, &CustomCarMsg::updateInputCtrl33);
    connect(worker, &CustomCarMsgWorker::inputCtrl34Changed, this, &CustomCarMsg::updateInputCtrl34);
    connect(worker, &CustomCarMsgWorker::inputCtrl35Changed, this, &CustomCarMsg::updateInputCtrl35);
    //前模块信息
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent01Changed, this, &CustomCarMsg::updateFrontOutputCurrent01);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent02Changed, this, &CustomCarMsg::updateFrontOutputCurrent02);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent03Changed, this, &CustomCarMsg::updateFrontOutputCurrent03);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent04Changed, this, &CustomCarMsg::updateFrontOutputCurrent04);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent05Changed, this, &CustomCarMsg::updateFrontOutputCurrent05);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent06Changed, this, &CustomCarMsg::updateFrontOutputCurrent06);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent07Changed, this, &CustomCarMsg::updateFrontOutputCurrent07);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent08Changed, this, &CustomCarMsg::updateFrontOutputCurrent08);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent09Changed, this, &CustomCarMsg::updateFrontOutputCurrent09);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent10Changed, this, &CustomCarMsg::updateFrontOutputCurrent10);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent11Changed, this, &CustomCarMsg::updateFrontOutputCurrent11);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent12Changed, this, &CustomCarMsg::updateFrontOutputCurrent12);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent13Changed, this, &CustomCarMsg::updateFrontOutputCurrent13);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent14Changed, this, &CustomCarMsg::updateFrontOutputCurrent14);
    connect(worker, &CustomCarMsgWorker::frontOutputCurrent15Changed, this, &CustomCarMsg::updateFrontOutputCurrent15);
    connect(worker, &CustomCarMsgWorker::frontOutputFault01Changed, this, &CustomCarMsg::updateFrontOutputFault01);
    connect(worker, &CustomCarMsgWorker::frontOutputFault02Changed, this, &CustomCarMsg::updateFrontOutputFault02);
    connect(worker, &CustomCarMsgWorker::frontOutputFault03Changed, this, &CustomCarMsg::updateFrontOutputFault03);
    connect(worker, &CustomCarMsgWorker::frontOutputFault04Changed, this, &CustomCarMsg::updateFrontOutputFault04);
    connect(worker, &CustomCarMsgWorker::frontOutputFault05Changed, this, &CustomCarMsg::updateFrontOutputFault05);
    connect(worker, &CustomCarMsgWorker::frontOutputFault06Changed, this, &CustomCarMsg::updateFrontOutputFault06);
    connect(worker, &CustomCarMsgWorker::frontOutputFault07Changed, this, &CustomCarMsg::updateFrontOutputFault07);
    connect(worker, &CustomCarMsgWorker::frontOutputFault08Changed, this, &CustomCarMsg::updateFrontOutputFault08);
    connect(worker, &CustomCarMsgWorker::frontOutputFault09Changed, this, &CustomCarMsg::updateFrontOutputFault09);
    connect(worker, &CustomCarMsgWorker::frontOutputFault10Changed, this, &CustomCarMsg::updateFrontOutputFault10);
    connect(worker, &CustomCarMsgWorker::frontOutputFault11Changed, this, &CustomCarMsg::updateFrontOutputFault11);
    connect(worker, &CustomCarMsgWorker::frontOutputFault12Changed, this, &CustomCarMsg::updateFrontOutputFault12);
    connect(worker, &CustomCarMsgWorker::frontOutputFault13Changed, this, &CustomCarMsg::updateFrontOutputFault13);
    connect(worker, &CustomCarMsgWorker::frontOutputFault14Changed, this, &CustomCarMsg::updateFrontOutputFault14);
    connect(worker, &CustomCarMsgWorker::frontOutputFault15Changed, this, &CustomCarMsg::updateFrontOutputFault15);
    connect(worker, &CustomCarMsgWorker::frontSwitch01Changed, this, &CustomCarMsg::updateFrontSwitch01);
    connect(worker, &CustomCarMsgWorker::frontSwitch02Changed, this, &CustomCarMsg::updateFrontSwitch02);
    connect(worker, &CustomCarMsgWorker::frontSwitch03Changed, this, &CustomCarMsg::updateFrontSwitch03);
    connect(worker, &CustomCarMsgWorker::frontSwitch04Changed, this, &CustomCarMsg::updateFrontSwitch04);
    connect(worker, &CustomCarMsgWorker::frontSwitch05Changed, this, &CustomCarMsg::updateFrontSwitch05);
    connect(worker, &CustomCarMsgWorker::frontSwitch06Changed, this, &CustomCarMsg::updateFrontSwitch06);
    connect(worker, &CustomCarMsgWorker::frontSwitch07Changed, this, &CustomCarMsg::updateFrontSwitch07);
    connect(worker, &CustomCarMsgWorker::frontSwitch08Changed, this, &CustomCarMsg::updateFrontSwitch08);
    connect(worker, &CustomCarMsgWorker::frontSwitch09Changed, this, &CustomCarMsg::updateFrontSwitch09);
    connect(worker, &CustomCarMsgWorker::frontSwitch10Changed, this, &CustomCarMsg::updateFrontSwitch10);
    connect(worker, &CustomCarMsgWorker::frontSwitch11Changed, this, &CustomCarMsg::updateFrontSwitch11);
    connect(worker, &CustomCarMsgWorker::frontSwitch12Changed, this, &CustomCarMsg::updateFrontSwitch12);
    connect(worker, &CustomCarMsgWorker::frontSwitch13Changed, this, &CustomCarMsg::updateFrontSwitch13);
    connect(worker, &CustomCarMsgWorker::frontSwitch14Changed, this, &CustomCarMsg::updateFrontSwitch14);
    connect(worker, &CustomCarMsgWorker::frontSwitch15Changed, this, &CustomCarMsg::updateFrontSwitch15);
    connect(worker, &CustomCarMsgWorker::frontSwitch16Changed, this, &CustomCarMsg::updateFrontSwitch16);
    connect(worker, &CustomCarMsgWorker::frontAnalogInput01Changed, this, &CustomCarMsg::updateFrontAnalogInput01);
    connect(worker, &CustomCarMsgWorker::frontAnalogInput02Changed, this, &CustomCarMsg::updateFrontAnalogInput02);
    connect(worker, &CustomCarMsgWorker::frontHzInputChanged, this, &CustomCarMsg::updateFrontHzInput);
    connect(worker, &CustomCarMsgWorker::frontSpeedInputChanged, this, &CustomCarMsg::updateFrontSpeedInput);
    //中模块信息
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent01Changed, this, &CustomCarMsg::updateMiddleOutputCurrent01);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent02Changed, this, &CustomCarMsg::updateMiddleOutputCurrent02);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent03Changed, this, &CustomCarMsg::updateMiddleOutputCurrent03);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent04Changed, this, &CustomCarMsg::updateMiddleOutputCurrent04);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent05Changed, this, &CustomCarMsg::updateMiddleOutputCurrent05);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent06Changed, this, &CustomCarMsg::updateMiddleOutputCurrent06);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent07Changed, this, &CustomCarMsg::updateMiddleOutputCurrent07);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent08Changed, this, &CustomCarMsg::updateMiddleOutputCurrent08);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent09Changed, this, &CustomCarMsg::updateMiddleOutputCurrent09);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent10Changed, this, &CustomCarMsg::updateMiddleOutputCurrent10);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent11Changed, this, &CustomCarMsg::updateMiddleOutputCurrent11);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent12Changed, this, &CustomCarMsg::updateMiddleOutputCurrent12);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent13Changed, this, &CustomCarMsg::updateMiddleOutputCurrent13);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent14Changed, this, &CustomCarMsg::updateMiddleOutputCurrent14);
    connect(worker, &CustomCarMsgWorker::middleOutputCurrent15Changed, this, &CustomCarMsg::updateMiddleOutputCurrent15);
    connect(worker, &CustomCarMsgWorker::middleOutputFault01Changed, this, &CustomCarMsg::updateMiddleOutputFault01);
    connect(worker, &CustomCarMsgWorker::middleOutputFault02Changed, this, &CustomCarMsg::updateMiddleOutputFault02);
    connect(worker, &CustomCarMsgWorker::middleOutputFault03Changed, this, &CustomCarMsg::updateMiddleOutputFault03);
    connect(worker, &CustomCarMsgWorker::middleOutputFault04Changed, this, &CustomCarMsg::updateMiddleOutputFault04);
    connect(worker, &CustomCarMsgWorker::middleOutputFault05Changed, this, &CustomCarMsg::updateMiddleOutputFault05);
    connect(worker, &CustomCarMsgWorker::middleOutputFault06Changed, this, &CustomCarMsg::updateMiddleOutputFault06);
    connect(worker, &CustomCarMsgWorker::middleOutputFault07Changed, this, &CustomCarMsg::updateMiddleOutputFault07);
    connect(worker, &CustomCarMsgWorker::middleOutputFault08Changed, this, &CustomCarMsg::updateMiddleOutputFault08);
    connect(worker, &CustomCarMsgWorker::middleOutputFault09Changed, this, &CustomCarMsg::updateMiddleOutputFault09);
    connect(worker, &CustomCarMsgWorker::middleOutputFault10Changed, this, &CustomCarMsg::updateMiddleOutputFault10);
    connect(worker, &CustomCarMsgWorker::middleOutputFault11Changed, this, &CustomCarMsg::updateMiddleOutputFault11);
    connect(worker, &CustomCarMsgWorker::middleOutputFault12Changed, this, &CustomCarMsg::updateMiddleOutputFault12);
    connect(worker, &CustomCarMsgWorker::middleOutputFault13Changed, this, &CustomCarMsg::updateMiddleOutputFault13);
    connect(worker, &CustomCarMsgWorker::middleOutputFault14Changed, this, &CustomCarMsg::updateMiddleOutputFault14);
    connect(worker, &CustomCarMsgWorker::middleOutputFault15Changed, this, &CustomCarMsg::updateMiddleOutputFault15);
    connect(worker, &CustomCarMsgWorker::middleSwitch01Changed, this, &CustomCarMsg::updateMiddleSwitch01);
    connect(worker, &CustomCarMsgWorker::middleSwitch02Changed, this, &CustomCarMsg::updateMiddleSwitch02);
    connect(worker, &CustomCarMsgWorker::middleSwitch03Changed, this, &CustomCarMsg::updateMiddleSwitch03);
    connect(worker, &CustomCarMsgWorker::middleSwitch04Changed, this, &CustomCarMsg::updateMiddleSwitch04);
    connect(worker, &CustomCarMsgWorker::middleSwitch05Changed, this, &CustomCarMsg::updateMiddleSwitch05);
    connect(worker, &CustomCarMsgWorker::middleSwitch06Changed, this, &CustomCarMsg::updateMiddleSwitch06);
    connect(worker, &CustomCarMsgWorker::middleSwitch07Changed, this, &CustomCarMsg::updateMiddleSwitch07);
    connect(worker, &CustomCarMsgWorker::middleSwitch08Changed, this, &CustomCarMsg::updateMiddleSwitch08);
    connect(worker, &CustomCarMsgWorker::middleSwitch09Changed, this, &CustomCarMsg::updateMiddleSwitch09);
    connect(worker, &CustomCarMsgWorker::middleSwitch10Changed, this, &CustomCarMsg::updateMiddleSwitch10);
    connect(worker, &CustomCarMsgWorker::middleSwitch11Changed, this, &CustomCarMsg::updateMiddleSwitch11);
    connect(worker, &CustomCarMsgWorker::middleSwitch12Changed, this, &CustomCarMsg::updateMiddleSwitch12);
    connect(worker, &CustomCarMsgWorker::middleSwitch13Changed, this, &CustomCarMsg::updateMiddleSwitch13);
    connect(worker, &CustomCarMsgWorker::middleSwitch14Changed, this, &CustomCarMsg::updateMiddleSwitch14);
    connect(worker, &CustomCarMsgWorker::middleSwitch15Changed, this, &CustomCarMsg::updateMiddleSwitch15);
    connect(worker, &CustomCarMsgWorker::middleSwitch16Changed, this, &CustomCarMsg::updateMiddleSwitch16);
    connect(worker, &CustomCarMsgWorker::middleAnalogInput01Changed, this, &CustomCarMsg::updateMiddleAnalogInput01);
    connect(worker, &CustomCarMsgWorker::middleAnalogInput02Changed, this, &CustomCarMsg::updateMiddleAnalogInput02);
    connect(worker, &CustomCarMsgWorker::middleHzInputChanged, this, &CustomCarMsg::updateMiddleHzInput);
    connect(worker, &CustomCarMsgWorker::middleSpeedInputChanged, this, &CustomCarMsg::updateMiddleSpeedInput);
    //后模块信息
    connect(worker, &CustomCarMsgWorker::backOutputCurrent01Changed, this, &CustomCarMsg::updateBackOutputCurrent01);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent02Changed, this, &CustomCarMsg::updateBackOutputCurrent02);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent03Changed, this, &CustomCarMsg::updateBackOutputCurrent03);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent04Changed, this, &CustomCarMsg::updateBackOutputCurrent04);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent05Changed, this, &CustomCarMsg::updateBackOutputCurrent05);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent06Changed, this, &CustomCarMsg::updateBackOutputCurrent06);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent07Changed, this, &CustomCarMsg::updateBackOutputCurrent07);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent08Changed, this, &CustomCarMsg::updateBackOutputCurrent08);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent09Changed, this, &CustomCarMsg::updateBackOutputCurrent09);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent10Changed, this, &CustomCarMsg::updateBackOutputCurrent10);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent11Changed, this, &CustomCarMsg::updateBackOutputCurrent11);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent12Changed, this, &CustomCarMsg::updateBackOutputCurrent12);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent13Changed, this, &CustomCarMsg::updateBackOutputCurrent13);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent14Changed, this, &CustomCarMsg::updateBackOutputCurrent14);
    connect(worker, &CustomCarMsgWorker::backOutputCurrent15Changed, this, &CustomCarMsg::updateBackOutputCurrent15);
    connect(worker, &CustomCarMsgWorker::backOutputFault01Changed, this, &CustomCarMsg::updateMiddleOutputFault01);
    connect(worker, &CustomCarMsgWorker::backOutputFault02Changed, this, &CustomCarMsg::updateBackOutputFault02);
    connect(worker, &CustomCarMsgWorker::backOutputFault03Changed, this, &CustomCarMsg::updateBackOutputFault03);
    connect(worker, &CustomCarMsgWorker::backOutputFault04Changed, this, &CustomCarMsg::updateBackOutputFault04);
    connect(worker, &CustomCarMsgWorker::backOutputFault05Changed, this, &CustomCarMsg::updateBackOutputFault05);
    connect(worker, &CustomCarMsgWorker::backOutputFault06Changed, this, &CustomCarMsg::updateBackOutputFault06);
    connect(worker, &CustomCarMsgWorker::backOutputFault07Changed, this, &CustomCarMsg::updateBackOutputFault07);
    connect(worker, &CustomCarMsgWorker::backOutputFault08Changed, this, &CustomCarMsg::updateBackOutputFault08);
    connect(worker, &CustomCarMsgWorker::backOutputFault09Changed, this, &CustomCarMsg::updateBackOutputFault09);
    connect(worker, &CustomCarMsgWorker::backOutputFault10Changed, this, &CustomCarMsg::updateBackOutputFault10);
    connect(worker, &CustomCarMsgWorker::backOutputFault11Changed, this, &CustomCarMsg::updateBackOutputFault11);
    connect(worker, &CustomCarMsgWorker::backOutputFault12Changed, this, &CustomCarMsg::updateBackOutputFault12);
    connect(worker, &CustomCarMsgWorker::backOutputFault13Changed, this, &CustomCarMsg::updateBackOutputFault13);
    connect(worker, &CustomCarMsgWorker::backOutputFault14Changed, this, &CustomCarMsg::updateBackOutputFault14);
    connect(worker, &CustomCarMsgWorker::backOutputFault15Changed, this, &CustomCarMsg::updateBackOutputFault15);
    connect(worker, &CustomCarMsgWorker::backSwitch01Changed, this, &CustomCarMsg::updateBackSwitch01);
    connect(worker, &CustomCarMsgWorker::backSwitch02Changed, this, &CustomCarMsg::updateBackSwitch02);
    connect(worker, &CustomCarMsgWorker::backSwitch03Changed, this, &CustomCarMsg::updateBackSwitch03);
    connect(worker, &CustomCarMsgWorker::backSwitch04Changed, this, &CustomCarMsg::updateBackSwitch04);
    connect(worker, &CustomCarMsgWorker::backSwitch05Changed, this, &CustomCarMsg::updateBackSwitch05);
    connect(worker, &CustomCarMsgWorker::backSwitch06Changed, this, &CustomCarMsg::updateBackSwitch06);
    connect(worker, &CustomCarMsgWorker::backSwitch07Changed, this, &CustomCarMsg::updateBackSwitch07);
    connect(worker, &CustomCarMsgWorker::backSwitch08Changed, this, &CustomCarMsg::updateBackSwitch08);
    connect(worker, &CustomCarMsgWorker::backSwitch09Changed, this, &CustomCarMsg::updateBackSwitch09);
    connect(worker, &CustomCarMsgWorker::backSwitch10Changed, this, &CustomCarMsg::updateBackSwitch10);
    connect(worker, &CustomCarMsgWorker::backSwitch11Changed, this, &CustomCarMsg::updateBackSwitch11);
    connect(worker, &CustomCarMsgWorker::backSwitch12Changed, this, &CustomCarMsg::updateBackSwitch12);
    connect(worker, &CustomCarMsgWorker::backSwitch13Changed, this, &CustomCarMsg::updateBackSwitch13);
    connect(worker, &CustomCarMsgWorker::backSwitch14Changed, this, &CustomCarMsg::updateBackSwitch14);
    connect(worker, &CustomCarMsgWorker::backSwitch15Changed, this, &CustomCarMsg::updateBackSwitch15);
    connect(worker, &CustomCarMsgWorker::backSwitch16Changed, this, &CustomCarMsg::updateBackSwitch16);
    connect(worker, &CustomCarMsgWorker::backAnalogInput01Changed, this, &CustomCarMsg::updateBackAnalogInput01);
    connect(worker, &CustomCarMsgWorker::backAnalogInput02Changed, this, &CustomCarMsg::updateBackAnalogInput02);
    connect(worker, &CustomCarMsgWorker::backHzInputChanged, this, &CustomCarMsg::updateBackHzInput);
    connect(worker, &CustomCarMsgWorker::backSpeedInputChanged, this, &CustomCarMsg::updateBackSpeedInput);
    //报警模块信息
    connect(worker, &CustomCarMsgWorker::warningIdChanged, this, &CustomCarMsg::updateWarningId);
    //发动机信息
    connect(worker, &CustomCarMsgWorker::engineFuelConsumptionChanged, this, &CustomCarMsg::updateEngineFuelConsumption);
    connect(worker, &CustomCarMsgWorker::engineLoadChanged, this, &CustomCarMsg::updateEngineLoad);
    connect(worker, &CustomCarMsgWorker::engineTargetThrottleChanged, this, &CustomCarMsg::updateEngineTargetThrottle);
    connect(worker, &CustomCarMsgWorker::engineActualThrottleChanged, this, &CustomCarMsg::updateEngineActualThrottle);
    connect(worker, &CustomCarMsgWorker::engineInletTemperatureChanged, this, &CustomCarMsg::updateEngineInletTemperature);
    //辅助模块信息
    connect(worker, &CustomCarMsgWorker::oilPumpDcacWoutputCurrentChanged, this, &CustomCarMsg::updateOilPumpDcacWoutputCurrent);
    connect(worker, &CustomCarMsgWorker::oilPumpDcacVoutputCurrentChanged, this, &CustomCarMsg::updateOilPumpDcacVoutputCurrent);
    connect(worker, &CustomCarMsgWorker::oilPumpDcacUoutputCurrentChanged, this, &CustomCarMsg::updateOilPumpDcacUoutputCurrent);
    connect(worker, &CustomCarMsgWorker::radiatorTemperatureChanged, this, &CustomCarMsg::updateRadiatorTemperature);
    //TCU模块信息
    connect(worker, &CustomCarMsgWorker::actualClutchPositionChanged  , this, &CustomCarMsg::updateActualClutchPosition);
    connect(worker, &CustomCarMsgWorker::tcuFaultCodeChanged, this, &CustomCarMsg::updateTcuFaultCode);
    connect(worker, &CustomCarMsgWorker::axisRpmChanged, this, &CustomCarMsg::updateAxisRpm);
    connect(worker, &CustomCarMsgWorker::fmiChanged, this, &CustomCarMsg::updateFmi);
    connect(worker, &CustomCarMsgWorker::cmChanged, this, &CustomCarMsg::updateCm);
    connect(worker, &CustomCarMsgWorker::ocChanged, this, &CustomCarMsg::updateOc);
    //电池管理信息
    connect(worker, &CustomCarMsgWorker::batMaxChargeCurrentChanged, this, &CustomCarMsg::updateBatMaxChargeCurrent);
    connect(worker, &CustomCarMsgWorker::batMaxDischargeCurrentChanged, this, &CustomCarMsg::updateBatMaxDischargeCurrent);
    connect(worker, &CustomCarMsgWorker::batAverageVoltageChanged, this, &CustomCarMsg::updateBatAverageVoltage);
    connect(worker, &CustomCarMsgWorker::batStatus1Changed, this, &CustomCarMsg::updateBatStatus1);
    connect(worker, &CustomCarMsgWorker::batStatus2Changed, this, &CustomCarMsg::updateBatStatus2);
    connect(worker, &CustomCarMsgWorker::batStatus3Changed, this, &CustomCarMsg::updateBatStatus3);
    connect(worker, &CustomCarMsgWorker::irmOhmPositiveChanged, this, &CustomCarMsg::updateIrmOhmPositive);
    connect(worker, &CustomCarMsgWorker::irmOhmNegativeChanged, this, &CustomCarMsg::updateIrmOhmNegative);
    connect(worker, &CustomCarMsgWorker::batMaxVoltageChanged, this, &CustomCarMsg::updateBatMaxVoltage);
    connect(worker, &CustomCarMsgWorker::batMinVoltageChanged, this, &CustomCarMsg::updateBatMinVoltage);
    connect(worker, &CustomCarMsgWorker::batteryHighestTempChanged, this, &CustomCarMsg::updateBatteryHighestTemp);
    connect(worker, &CustomCarMsgWorker::bmsVersionChanged, this, &CustomCarMsg::updateBmsVersion);
    connect(worker, &CustomCarMsgWorker::bmsModuleAmountChanged, this, &CustomCarMsg::updateBmsModuleAmount);
    connect(worker, &CustomCarMsgWorker::bmsLifeChanged, this, &CustomCarMsg::updateBmsLife);
    connect(worker, &CustomCarMsgWorker::batteryPackHighestTempChanged, this, &CustomCarMsg::updateBatteryPackHighestTemp);
    connect(worker, &CustomCarMsgWorker::batteryPackMinTempChanged, this, &CustomCarMsg::updateBatteryPackMinTemp);
    connect(worker, &CustomCarMsgWorker::batteryPackEnergyChanged, this, &CustomCarMsg::updateBatteryPackEnergy);
    connect(worker, &CustomCarMsgWorker::bmsControlStatusChanged, this, &CustomCarMsg::updateBmsControlStatus);
    connect(worker, &CustomCarMsgWorker::batAmountChanged, this, &CustomCarMsg::updateBatAmount);
    connect(worker, &CustomCarMsgWorker::rechargeStatusChanged, this, &CustomCarMsg::updateRechargeStatus);
    connect(worker, &CustomCarMsgWorker::tempStyletAmountChanged, this, &CustomCarMsg::updateTempStyletAmount);
    connect(worker, &CustomCarMsgWorker::outletPositiveTempChanged, this, &CustomCarMsg::updateOutletPositiveTemp);
    connect(worker, &CustomCarMsgWorker::outletNegativeTempChanged, this, &CustomCarMsg::updateOutletNegativeTemp);
    connect(worker, &CustomCarMsgWorker::powerBatteryTypeChanged, this, &CustomCarMsg::updatePowerBatteryType);
    connect(worker, &CustomCarMsgWorker::powerBatteryRechargeChanged, this, &CustomCarMsg::updatePowerBatteryRecharge);
    //电池组电压信息
    connect(worker, &CustomCarMsgWorker::addrNumberVoltageChanged, this, &CustomCarMsg::updateAddrNumberVoltage);
    connect(worker, &CustomCarMsgWorker::addrNumberVoltageValueChanged, this, &CustomCarMsg::updateAddrNumberVoltageValue);
    connect(worker, &CustomCarMsgWorker::boxNumberVoltageChanged, this, &CustomCarMsg::updateBoxNumberVoltage);
    //connect(worker, &CustomCarMsgWorker::voltageInfoChanged, this, &CustomCarMsg::updateVoltageInfo);
    //void batVoltageChanged(QVariantMap value);
    //电池组温度信息
    connect(worker, &CustomCarMsgWorker::addrNumberTempChanged, this, &CustomCarMsg::updateAddrNumberTemp);
    connect(worker, &CustomCarMsgWorker::addrNumberTempValueChanged, this, &CustomCarMsg::updateAddrNumberTempValue);
    connect(worker, &CustomCarMsgWorker::boxNumberTempChanged, this, &CustomCarMsg::updateBoxNumberTemp);
    //connect(worker, &CustomCarMsgWorker::tempInfoChanged, this, &CustomCarMsg::updateTempInfo);
    //void batTempChanged(QVariantMap value);
    //空调模块信息
    connect(worker, &CustomCarMsgWorker::acFaultCodeChanged, this, &CustomCarMsg::updateAcFaultCode);
    connect(worker, &CustomCarMsgWorker::acFanStatusChanged, this, &CustomCarMsg::updateAcFanStatus);
    connect(worker, &CustomCarMsgWorker::acWorkStatusChanged, this, &CustomCarMsg::updateAcWorkStatus);
    connect(worker, &CustomCarMsgWorker::acLifeChanged, this, &CustomCarMsg::updateAcLife);
    connect(worker, &CustomCarMsgWorker::acOutTempChanged, this, &CustomCarMsg::updateAcOutTemp);
    connect(worker, &CustomCarMsgWorker::acInTempChanged, this, &CustomCarMsg::updateAcInTemp);
    connect(worker, &CustomCarMsgWorker::acSetTempChanged, this, &CustomCarMsg::updateAcSetTemp);
    connect(worker, &CustomCarMsgWorker::acRefrigereReqChanged, this, &CustomCarMsg::updateAcRefrigereReq);
    //DCDC状态信息
    connect(worker, &CustomCarMsgWorker::dcLowVoltageChanged, this, &CustomCarMsg::updateDcLowVoltage);
    connect(worker, &CustomCarMsgWorker::dcLowCurrentChanged, this, &CustomCarMsg::updateDcLowCurrent);
    connect(worker, &CustomCarMsgWorker::dcTempChanged, this, &CustomCarMsg::updateDcTemp);
    connect(worker, &CustomCarMsgWorker::dcStatus2Changed, this, &CustomCarMsg::updateDcStatus2);
    connect(worker, &CustomCarMsgWorker::dcUndervoltageChanged, this, &CustomCarMsg::updateDcUndervoltage);
    connect(worker, &CustomCarMsgWorker::dcOvervoltageChanged, this, &CustomCarMsg::updateDcOvervoltage);
    connect(worker, &CustomCarMsgWorker::dcOverheatingChanged, this, &CustomCarMsg::updateDcOverheating);
    connect(worker, &CustomCarMsgWorker::dcShortCircuitChanged, this, &CustomCarMsg::updateDcShortCircuit);
    connect(worker, &CustomCarMsgWorker::dcWorkStatusChanged, this, &CustomCarMsg::updateDcWorkStatus);
    //符号片信息
    connect(worker, &CustomCarMsgWorker::lampKeyOnChanged, this, &CustomCarMsg::updateLampKeyOn);
    connect(worker, &CustomCarMsgWorker::lampAirFilterChanged, this, &CustomCarMsg::updateLampAirFilter);
    connect(worker, &CustomCarMsgWorker::lampAsrChanged, this, &CustomCarMsg::updateLampAsr);
    connect(worker, &CustomCarMsgWorker::lampHighVoltageMaintenanceChanged, this, &CustomCarMsg::updateLampHighVoltageMaintenance);
    connect(worker, &CustomCarMsgWorker::lampDefrosterChanged, this, &CustomCarMsg::updateLampDefroster);
    connect(worker, &CustomCarMsgWorker::lampDryereChanged, this, &CustomCarMsg::updateLampDryere);
    connect(worker, &CustomCarMsgWorker::lampAbsChanged, this, &CustomCarMsg::updateLampAbs);
    connect(worker, &CustomCarMsgWorker::lampAcChanged, this, &CustomCarMsg::updateLampAc);
    connect(worker, &CustomCarMsgWorker::powerSupplyChanged, this, &CustomCarMsg::updatePowerSupply);
    connect(worker, &CustomCarMsgWorker::powerPlugInModeChanged, this, &CustomCarMsg::updatePowerPlugInMode);
    connect(worker, &CustomCarMsgWorker::powerByvridModeChanged, this, &CustomCarMsg::updatePowerByvridMode);
    connect(worker, &CustomCarMsgWorker::climbingModeChanged, this, &CustomCarMsg::updateClimbingMode);
    connect(worker, &CustomCarMsgWorker::diagnosticModeChanged, this, &CustomCarMsg::updateDiagnosticMode);
    connect(worker, &CustomCarMsgWorker::lampTurnLeftChanged, this, &CustomCarMsg::updateLampTurnLeft);
    connect(worker, &CustomCarMsgWorker::lampTurnRightChanged, this, &CustomCarMsg::updateLampTurnRight);
    connect(worker, &CustomCarMsgWorker::lampDoubleFlashChanged, this, &CustomCarMsg::updateLampDoubleFlash);
    connect(worker, &CustomCarMsgWorker::lampFrontFogChanged, this, &CustomCarMsg::updateLampFrontFog);
    connect(worker, &CustomCarMsgWorker::lampRearFogChanged, this, &CustomCarMsg::updateLampRearFog);
    connect(worker, &CustomCarMsgWorker::lampHighBeamChanged, this, &CustomCarMsg::updateLampHighBeam);
    connect(worker, &CustomCarMsgWorker::lampHeadLightChanged, this, &CustomCarMsg::updateLampHeadLight);
    connect(worker, &CustomCarMsgWorker::lampReverseGearChanged, this, &CustomCarMsg::updateLampReverseGear);
    connect(worker, &CustomCarMsgWorker::lampPositionLightChanged, this, &CustomCarMsg::updateLampPositionLight);
    connect(worker, &CustomCarMsgWorker::lampGate1Changed, this, &CustomCarMsg::updateLampGate1);
    connect(worker, &CustomCarMsgWorker::lampGate2Changed, this, &CustomCarMsg::updateLampGate2);
    connect(worker, &CustomCarMsgWorker::lampRearDoorOpenChanged, this, &CustomCarMsg::updateLampRearDoorOpen);
    connect(worker, &CustomCarMsgWorker::lampBrakeChanged, this, &CustomCarMsg::updateLampBrake);
    connect(worker, &CustomCarMsgWorker::lampParkingBrakeChanged, this, &CustomCarMsg::updateLampParkingBrake);
    connect(worker, &CustomCarMsgWorker::lampLeftLowAirPressureChanged, this, &CustomCarMsg::updateLampLeftLowAirPressure);
    connect(worker, &CustomCarMsgWorker::lampRightLowAirPressureChanged, this, &CustomCarMsg::updateLampRightLowAirPressure);
    connect(worker, &CustomCarMsgWorker::lampLeftShoeWearChanged, this, &CustomCarMsg::updateLampLeftShoeWear);
    connect(worker, &CustomCarMsgWorker::lampRightShoeWearChanged, this, &CustomCarMsg::updateLampRightShoeWear);
    connect(worker, &CustomCarMsgWorker::lampChargeConfirmChanged, this, &CustomCarMsg::updateLampChargeConfirm);
    connect(worker, &CustomCarMsgWorker::lampBatteryMainContactChanged, this, &CustomCarMsg::updateLampBatteryMainContact);
    connect(worker, &CustomCarMsgWorker::lampWaterTempHighChanged, this, &CustomCarMsg::updateLampWaterTempHigh);
    connect(worker, &CustomCarMsgWorker::lampWaterLevelLowChanged, this, &CustomCarMsg::updateLampWaterLevelLow);
    connect(worker, &CustomCarMsgWorker::lampLowServiceWlChanged, this, &CustomCarMsg::updateLampLowServiceWl);
    connect(worker, &CustomCarMsgWorker::lampHeavyStopWlChanged, this, &CustomCarMsg::updateLampHeavyStopWl);
    connect(worker, &CustomCarMsgWorker::lampSeriousStopWlChanged, this, &CustomCarMsg::updateLampSeriousStopWl);
    connect(worker, &CustomCarMsgWorker::lampOilLevelLowChanged, this, &CustomCarMsg::updateLampOilLevelLow);
    connect(worker, &CustomCarMsgWorker::lampOilPressureLowChanged, this, &CustomCarMsg::updateLampOilPressureLow);
    connect(worker, &CustomCarMsgWorker::lampEngineFaultChanged, this, &CustomCarMsg::updateLampEngineFault);
    connect(worker, &CustomCarMsgWorker::lampMotorOutOfServiceChanged, this, &CustomCarMsg::updateLampMotorOutOfService);
    connect(worker, &CustomCarMsgWorker::lampMoterFireIgonChanged, this, &CustomCarMsg::updateLampMoterFireIgon);
    connect(worker, &CustomCarMsgWorker::lampAfterTreatChanged, this, &CustomCarMsg::updateLampAfterTreat);
    connect(worker, &CustomCarMsgWorker::lampWarningLedChanged, this, &CustomCarMsg::updateLampWarningLed);
    connect(worker, &CustomCarMsgWorker::airPress1LampChanged, this, &CustomCarMsg::updateAirPress1Lamp);
    connect(worker, &CustomCarMsgWorker::airPress2LampChanged, this, &CustomCarMsg::updateAirPress2Lamp);
    connect(worker, &CustomCarMsgWorker::airPress3LampChanged, this, &CustomCarMsg::updateAirPress3Lamp);
    connect(worker, &CustomCarMsgWorker::airPress4LampChanged, this, &CustomCarMsg::updateAirPress4Lamp);
    connect(worker, &CustomCarMsgWorker::airPress5LampChanged, this, &CustomCarMsg::updateAirPress5Lamp);
    connect(worker, &CustomCarMsgWorker::powerDoorsOpenChanged, this, &CustomCarMsg::updatePowerDoorsOpen);
    connect(worker, &CustomCarMsgWorker::powerBatteryCutOffChanged, this, &CustomCarMsg::updatePowerBatteryCutOff);
    connect(worker, &CustomCarMsgWorker::seatbeltNotFastenedChanged, this, &CustomCarMsg::updateSeatbeltNotFastened);
    connect(worker, &CustomCarMsgWorker::forwardGearChanged, this, &CustomCarMsg::updateForwardGear);
    connect(worker, &CustomCarMsgWorker::neutralGearChanged, this, &CustomCarMsg::updateNeutralGear);
    connect(worker, &CustomCarMsgWorker::reverseGearChanged, this, &CustomCarMsg::updateReverseGear);
    connect(worker, &CustomCarMsgWorker::electronicInSlopeChanged, this, &CustomCarMsg::updateElectronicInSlope);
    connect(worker, &CustomCarMsgWorker::ascdChanged, this, &CustomCarMsg::updateAscd);
    connect(worker, &CustomCarMsgWorker::readyChanged, this, &CustomCarMsg::updateReady);
    connect(worker, &CustomCarMsgWorker::powerAccumulatorsChargeStatusChanged, this, &CustomCarMsg::updatePowerAccumulatorsChargeStatus);
    connect(worker, &CustomCarMsgWorker::cableConnectChanged, this, &CustomCarMsg::updateCableConnect);
    connect(worker, &CustomCarMsgWorker::controlMotorOverheatingChanged, this, &CustomCarMsg::updateControlMotorOverheating);
    connect(worker, &CustomCarMsgWorker::powerAccumulatorsFaultChanged, this, &CustomCarMsg::updatePowerAccumulatorsFault);
    connect(worker, &CustomCarMsgWorker::driverSystemFaultChanged, this, &CustomCarMsg::updateDriverSystemFault);
    connect(worker, &CustomCarMsgWorker::severityInsulationFaultChanged, this, &CustomCarMsg::updateSeverityInsulationFault);
    connect(worker, &CustomCarMsgWorker::slightInsulationFaultChanged, this, &CustomCarMsg::updateSlightInsulationFault);
    connect(worker, &CustomCarMsgWorker::motorPowerLimitationChanged, this, &CustomCarMsg::updateMotorPowerLimitation);
    connect(worker, &CustomCarMsgWorker::bmsAlarmChanged, this, &CustomCarMsg::updateBmsAlarm);
    connect(worker, &CustomCarMsgWorker::socLowAramChanged, this, &CustomCarMsg::updateSocLowAram);
    connect(worker, &CustomCarMsgWorker::safetySystemAlarmChanged, this, &CustomCarMsg::updateSafetySystemAlarm);
    connect(worker, &CustomCarMsgWorker::leftDoorsOpenAlarmChanged, this, &CustomCarMsg::updateLeftDoorsOpenAlarm);
    connect(worker, &CustomCarMsgWorker::rightDoorsOpenAlarmChanged, this, &CustomCarMsg::updateRightDoorsOpenAlarm);
    connect(worker, &CustomCarMsgWorker::barrierFreeMarchReachChanged, this, &CustomCarMsg::updateBarrierFreeMarchReach);
    connect(worker, &CustomCarMsgWorker::gateChargeOpenChanged, this, &CustomCarMsg::updateGateChargeOpen);
    connect(worker, &CustomCarMsgWorker::driverSeatAlarmChanged, this, &CustomCarMsg::updateDriverSeatAlarm);
    connect(worker, &CustomCarMsgWorker::ecasSystemFaultLedChanged, this, &CustomCarMsg::updateEcasSystemFaultLed);
    connect(worker, &CustomCarMsgWorker::ecasAlarmLedChanged, this, &CustomCarMsg::updateEcasAlarmLed);
    connect(worker, &CustomCarMsgWorker::ecasKneelingStatusLedChanged, this, &CustomCarMsg::updateEcasKneelingStatusLed);
    connect(worker, &CustomCarMsgWorker::ecasSpecialHeightLedChanged, this, &CustomCarMsg::updateEcasSpecialHeightLed);
    connect(worker, &CustomCarMsgWorker::dropOffDoorbellChanged, this, &CustomCarMsg::updateDropOffDoorbell);
    connect(worker, &CustomCarMsgWorker::waitChanged, this, &CustomCarMsg::updateWait);
    connect(worker, &CustomCarMsgWorker::frontDoorExigencyAlarmChanged, this, &CustomCarMsg::updateFrontDoorExigencyAlarm);
    connect(worker, &CustomCarMsgWorker::middleDoorExigencyAlarmChanged, this, &CustomCarMsg::updateMiddleDoorExigencyAlarm);
    connect(worker, &CustomCarMsgWorker::stopChanged, this, &CustomCarMsg::updateStop);
    //胎压模块信息
    connect(worker, &CustomCarMsgWorker::frontLeftTirePressChanged, this, &CustomCarMsg::updateFrontLeftTirePress);
    connect(worker, &CustomCarMsgWorker::fronRightTirePressChanged, this, &CustomCarMsg::updateFronRightTirePress);
    connect(worker, &CustomCarMsgWorker::backLeftTirePress1Changed, this, &CustomCarMsg::updateBackLeftTirePress1);
    connect(worker, &CustomCarMsgWorker::backRightTirePress1Changed, this, &CustomCarMsg::updateBackRightTirePress1);
    connect(worker, &CustomCarMsgWorker::backLeftTirePress2Changed, this, &CustomCarMsg::updateBackLeftTirePress2);
    connect(worker, &CustomCarMsgWorker::backRightTirePress2Changed, this, &CustomCarMsg::updateBackRightTirePress2);
    connect(worker, &CustomCarMsgWorker::frontLeftTireTempChanged, this, &CustomCarMsg::updateFrontLeftTireTemp);
    connect(worker, &CustomCarMsgWorker::frontRightTireTempChanged, this, &CustomCarMsg::updateFrontRightTireTemp);
    connect(worker, &CustomCarMsgWorker::backLeftTireTemp1Changed, this, &CustomCarMsg::updateBackLeftTireTemp1);
    connect(worker, &CustomCarMsgWorker::backRightTireTemp1Changed, this, &CustomCarMsg::updateBackRightTireTemp1);
    connect(worker, &CustomCarMsgWorker::backLeftTireTemp2Changed, this, &CustomCarMsg::updateBackLeftTireTemp2);
    connect(worker, &CustomCarMsgWorker::backRightTireTemp2Changed, this, &CustomCarMsg::updateBackRightTireTemp2);
    //整车控制系统诊断信息
    connect(worker, &CustomCarMsgWorker::driveFaultAlarmChanged, this, &CustomCarMsg::updateDriveFaultAlarm);
    connect(worker, &CustomCarMsgWorker::controlOvervoltageAlarmChanged, this, &CustomCarMsg::updateControlOvervoltageAlarm);
    connect(worker, &CustomCarMsgWorker::controlUndervoltageAlarmChanged, this, &CustomCarMsg::updateControlUndervoltageAlarm);
    connect(worker, &CustomCarMsgWorker::controlEncodingFaultChanged, this, &CustomCarMsg::updateControlEncodingFault);
    connect(worker, &CustomCarMsgWorker::controlHighTempAlarmChanged, this, &CustomCarMsg::updateControlHighTempAlarm);
    connect(worker, &CustomCarMsgWorker::controlHighTempAbortAlarmChanged, this, &CustomCarMsg::updateControlHighTempAbortAlarm);
    connect(worker, &CustomCarMsgWorker::controlMainContactorFaultChanged, this, &CustomCarMsg::updateControlMainContactorFault);
    connect(worker, &CustomCarMsgWorker::controlOvercurrentAlarmChanged, this, &CustomCarMsg::updateControlOvercurrentAlarm);
    connect(worker, &CustomCarMsgWorker::motorHighTempAlarmChanged, this, &CustomCarMsg::updateMotorHighTempAlarm);
    connect(worker, &CustomCarMsgWorker::motorHigtTempAbortAlarmChanged, this, &CustomCarMsg::updateMotorHigtTempAbortAlarm);
    connect(worker, &CustomCarMsgWorker::motorRotaryFaultChanged, this, &CustomCarMsg::updateMotorRotaryFault);
    connect(worker, &CustomCarMsgWorker::controlMotorPowerLimitationChanged, this, &CustomCarMsg::updateControlMotorPowerLimitation);
    connect(worker, &CustomCarMsgWorker::motorRotaryLimitationChanged, this, &CustomCarMsg::updateMotorRotaryLimitation);
    connect(worker, &CustomCarMsgWorker::motorWaterTempOvertopChanged, this, &CustomCarMsg::updateMotorWaterTempOvertop);
    connect(worker, &CustomCarMsgWorker::acceleratorPedalFaultChanged, this, &CustomCarMsg::updateAcceleratorPedalFault);
    connect(worker, &CustomCarMsgWorker::brakePedalFauleChanged, this, &CustomCarMsg::updateBrakePedalFaule);
    connect(worker, &CustomCarMsgWorker::seatbeltAlarmChanged, this, &CustomCarMsg::updateSeatbeltAlarm);
    connect(worker, &CustomCarMsgWorker::seatSwitchAlarmChanged, this, &CustomCarMsg::updateSeatSwitchAlarm);
    connect(worker, &CustomCarMsgWorker::controlRightDoorsOpenAlarmChanged, this, &CustomCarMsg::updateControlRightDoorsOpenAlarm);
    connect(worker, &CustomCarMsgWorker::controlLeftDoorsOpenAlarmChanged, this, &CustomCarMsg::updateControlLeftDoorsOpenAlarm);
    connect(worker, &CustomCarMsgWorker::chauffeurDoorsNotCloseChanged, this, &CustomCarMsg::updateChauffeurDoorsNotClose);
    connect(worker, &CustomCarMsgWorker::highTensionSwitchOpenChanged, this, &CustomCarMsg::updateHighTensionSwitchOpen);
    connect(worker, &CustomCarMsgWorker::chargeDoorOpenChanged, this, &CustomCarMsg::updateChargeDoorOpen);
    connect(worker, &CustomCarMsgWorker::safetyDoorOpenChanged, this, &CustomCarMsg::updateSafetyDoorOpen);
    connect(worker, &CustomCarMsgWorker::lowVoltageSwitchOpenChanged, this, &CustomCarMsg::updateLowVoltageSwitchOpen);
    connect(worker, &CustomCarMsgWorker::absSystemFaultChanged, this, &CustomCarMsg::updateAbsSystemFault);
    connect(worker, &CustomCarMsgWorker::airCompressorControlHighTempChanged, this, &CustomCarMsg::updateAirCompressorControlHighTemp);
    connect(worker, &CustomCarMsgWorker::airCompressorMotorHighTempChanged, this, &CustomCarMsg::updateAirCompressorMotorHighTemp);
    connect(worker, &CustomCarMsgWorker::boosterPumpControlHighTempChanged, this, &CustomCarMsg::updateBoosterPumpControlHighTemp);
    connect(worker, &CustomCarMsgWorker::boosterPumpMotorHighTempChanged, this, &CustomCarMsg::updateBoosterPumpMotorHighTemp);
    connect(worker, &CustomCarMsgWorker::vcuVersionChanged, this, &CustomCarMsg::updateVcuVersion);
    connect(worker, &CustomCarMsgWorker::vcuLifeChanged, this, &CustomCarMsg::updateVcuLife);
    //动力电池诊断系统信息
    connect(worker, &CustomCarMsgWorker::batVoltageMaxAlarmChanged, this, &CustomCarMsg::updateBatVoltageMaxAlarm);
    connect(worker, &CustomCarMsgWorker::batVoltageMaxAbortAlarmChanged, this, &CustomCarMsg::updateBatVoltageMaxAbortAlarm);
    connect(worker, &CustomCarMsgWorker::batVoltageMinAlarmChanged, this, &CustomCarMsg::updateBatVoltageMinAlarm);
    connect(worker, &CustomCarMsgWorker::batVoltageMinAbortAlarmChanged, this, &CustomCarMsg::updateBatVoltageMinAbortAlarm);
    connect(worker, &CustomCarMsgWorker::chargeCurrentMaxAlarmChanged, this, &CustomCarMsg::updateChargeCurrentMaxAlarm);
    connect(worker, &CustomCarMsgWorker::dischargeCurrentMaxAlarmChanged, this, &CustomCarMsg::updateDischargeCurrentMaxAlarm);
    connect(worker, &CustomCarMsgWorker::dischargeCurrentMaxAbortAlarmChanged, this, &CustomCarMsg::updateDischargeCurrentMaxAbortAlarm);
    connect(worker, &CustomCarMsgWorker::dischargeCurrentTempMinAlarmChanged, this, &CustomCarMsg::updateDischargeCurrentTempMinAlarm);
    connect(worker, &CustomCarMsgWorker::dischargeCurrentTempMinAbortAlarmChanged, this, &CustomCarMsg::updateDischargeCurrentTempMinAbortAlarm);
    connect(worker, &CustomCarMsgWorker::chargeCurrentTempMaxAlarmChanged, this, &CustomCarMsg::updateChargeCurrentTempMaxAlarm);
    connect(worker, &CustomCarMsgWorker::chargeCurrentTempMaxAbortAlarmChanged, this, &CustomCarMsg::updateChargeCurrentTempMaxAbortAlarm);
    connect(worker, &CustomCarMsgWorker::batTempMaxAlarmChanged, this, &CustomCarMsg::updateBatTempMaxAlarm);
    connect(worker, &CustomCarMsgWorker::batTempMaxAbortAlarmChanged, this, &CustomCarMsg::updateBatTempMaxAbortAlarm);
    connect(worker, &CustomCarMsgWorker::dropoutVoltageMaxAlarmChanged, this, &CustomCarMsg::updateDropoutVoltageMaxAlarm);
    connect(worker, &CustomCarMsgWorker::dropoutVoltageMaxAbortAlarmChanged, this, &CustomCarMsg::updateDropoutVoltageMaxAbortAlarm);
    connect(worker, &CustomCarMsgWorker::chargeVoltageMaxAlarmChanged, this, &CustomCarMsg::updateChargeVoltageMaxAlarm);
    connect(worker, &CustomCarMsgWorker::batTempDifferentAlarmChanged, this, &CustomCarMsg::updateBatTempDifferentAlarm);
    connect(worker, &CustomCarMsgWorker::batChargeTempMinAbortAlarmChanged, this, &CustomCarMsg::updateBatChargeTempMinAbortAlarm);
    connect(worker, &CustomCarMsgWorker::batChargeTempMinAlarmChanged, this, &CustomCarMsg::updateBatChargeTempMinAlarm);
    connect(worker, &CustomCarMsgWorker::socMinAlarmChanged, this, &CustomCarMsg::updateSocMinAlarm);
    connect(worker, &CustomCarMsgWorker::socMaxAlarmChanged, this, &CustomCarMsg::updateSocMaxAlarm);
    connect(worker, &CustomCarMsgWorker::batModuleCommunicationFailChanged, this, &CustomCarMsg::updateBatModuleCommunicationFail);
    connect(worker, &CustomCarMsgWorker::bmsSystemFaultChanged, this, &CustomCarMsg::updateBmsSystemFault);
    connect(worker, &CustomCarMsgWorker::batteryFaultChanged, this, &CustomCarMsg::updateBatteryFault);
    connect(worker, &CustomCarMsgWorker::energyRecoveryCurrentMaxAlarmChanged, this, &CustomCarMsg::updateEnergyRecoveryCurrentMaxAlarm);
    connect(worker, &CustomCarMsgWorker::energyRecoveryVoltageMaxAlarmChanged, this, &CustomCarMsg::updateEnergyRecoveryVoltageMaxAlarm);
    connect(worker, &CustomCarMsgWorker::energyRecoveryVoltageMaxAbortChanged, this, &CustomCarMsg::updateEnergyRecoveryVoltageMaxAbort);
    connect(worker, &CustomCarMsgWorker::energyRecoveryCancelChanged, this, &CustomCarMsg::updateEnergyRecoveryCancel);
    connect(worker, &CustomCarMsgWorker::socJumpAlarmChanged, this, &CustomCarMsg::updateSocJumpAlarm);
    connect(worker, &CustomCarMsgWorker::mismatchingAlarmChanged, this, &CustomCarMsg::updateMismatchingAlarm);
    connect(worker, &CustomCarMsgWorker::vehicleMountedTypeMaxChanged, this, &CustomCarMsg::updateVehicleMountedTypeMax);
    connect(worker, &CustomCarMsgWorker::vehicleMountedTypeMinChanged, this, &CustomCarMsg::updateVehicleMountedTypeMin);
    connect(worker, &CustomCarMsgWorker::vehicleMountedTypeOverchargeChanged, this, &CustomCarMsg::updateVehicleMountedTypeOvercharge);
}

void CustomCarMsg::connectMsgToWorker(CustomCarMsgWorker *worker)
{
    connect(this, &CustomCarMsg::sendEnableKeys, worker, &CustomCarMsgWorker::enableKeys);
    connect(this, &CustomCarMsg::sendThemeSetChanged, worker, &CustomCarMsgWorker::themeSet);
    connect(this, &CustomCarMsg::sendDateTime, worker, &CustomCarMsgWorker::datetimeInfoRequest);
    connect(this, &CustomCarMsg::sendMenuInfo, worker, &CustomCarMsgWorker::menuInfoRequest);
    connect(this, &CustomCarMsg::sendUpgradeStart, worker, &CustomCarMsgWorker::upgradeStartRequest);
    connect(this, &CustomCarMsg::sendTripMilesClear, worker, &CustomCarMsgWorker::tripMilesClearRequest);
}
//基本模块信息
void CustomCarMsg::updateThemeMode(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(themeMode, data);
}
void CustomCarMsg::updateDateTime(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(dateTime, data);
}
void CustomCarMsg::updateCarMode(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(carMode, data);
}
void CustomCarMsg::updateCarSpeed(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(carSpeed, value);
}
void CustomCarMsg::updateRpm(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(rpm, value);
}
void CustomCarMsg::updateTotalVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(totalVoltage, value);
}
void CustomCarMsg::updateTotalCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(totalCurrent, value);
}
void CustomCarMsg::updateGear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(gear, value);
}
void CustomCarMsg::updateOdo(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(odo, value);
}
void CustomCarMsg::updateTrip(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(trip, value);
}
void CustomCarMsg::updateSoc(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(soc, value);
}
void CustomCarMsg::updateApVol1(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(apVol1, value);
}
void CustomCarMsg::updateApVol2(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(apVol2, value);
}
void CustomCarMsg::updateMoterControlTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(moterControlTemp, value);
}
void CustomCarMsg::updateMoterTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(moterTemp, value);
}
void CustomCarMsg::updateBattery(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(battery, value);
}
void CustomCarMsg::updateSpn(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(spn, value);
}
void CustomCarMsg::updateEngineWaterTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineWaterTemp, value);
}
void CustomCarMsg::updateUreaLevel(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ureaLevel, value);
}
void CustomCarMsg::updateFaultLevel(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(faultLevel, value);
}
void CustomCarMsg::updateFaultCode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(faultCode, value);
}
void CustomCarMsg::updateOilLevel(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oilLevel, value);
}
void CustomCarMsg::updateEngineOilPressure(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineOilPressure, value);
}
void CustomCarMsg::updateAloneBatteryLowVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(aloneBatteryLowVoltage, value);
}
void CustomCarMsg::updateAloneBatteryHighVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(aloneBatteryHighVoltage, value);
}
void CustomCarMsg::updateBatteryHighTemperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryHighTemperature, value);
}
void CustomCarMsg::updateBatteryLowTemperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryLowTemperature, value);
}
void CustomCarMsg::updateBatteryPackEnergy(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryPackEnergy, value);
}
void CustomCarMsg::updateVelocityRatio(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(velocityRatio, value);
}
void CustomCarMsg::updateVuzzerStatus(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(buzzerStatus, value);
}
//设置模块信息
void CustomCarMsg::updateTripMilesClear(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(tripMilesClear, data);
}
void CustomCarMsg::updateCheckMilesClear(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(checkMilesClear, data);
}
void CustomCarMsg::updateUpgradeMsgId(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(upgradeMsgId, data);
}
void CustomCarMsg::updateUpgradeMsgCtx(QString data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(upgradeMsgCtx, data);
}
void CustomCarMsg::updateCloseBuzzerClear(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(closeBuzzerClear, data);
}
void CustomCarMsg::updateCheckCloseBuzzerClear(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(checkCloseBuzzerClear, data);
}
void CustomCarMsg::updateCheckDateTimeSetting(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(checkDateTimeSetting, data);
}
//控制系统信息
void CustomCarMsg::updateMotorInVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorInVoltage, value);
}
void CustomCarMsg::updateMotorInCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorInCurrent, value);
}
void CustomCarMsg::updateMotorTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorTemp, value);
}
void CustomCarMsg::updateMotorControllerTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorControllerTemp, value);
}
void CustomCarMsg::updateCarVcuMode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(carVcuMode, value);
}
void CustomCarMsg::updateVersion(double value) {
    MEMBER_PROPERTY_VALUE_CHANGED(version, value);
}
void CustomCarMsg::updateCarLife(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(carLife, value);
}
void CustomCarMsg::updateAccelPedalPercent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(accelPedalPercent, value);
}
void CustomCarMsg::updateBrakePedalPercent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(brakePedalPercent, value);
}
void CustomCarMsg::updateDin1(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(din1, value);
}
void CustomCarMsg::updateDin2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(din2, value);
}
void CustomCarMsg::updateDin3(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(din3, value);
}
void CustomCarMsg::updateDout1(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dout1, value);
}
void CustomCarMsg::updateDout2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dout2, value);
}
void CustomCarMsg::updateDout3(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dout3, value);
}
void CustomCarMsg::updateDriveSystemStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(driveSystemStatus, value);
}
void CustomCarMsg::updateDriveMotorStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(driveMotorStatus, value);
}
void CustomCarMsg::updateMechanicalBrakeStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(mechanicalBrakeStatus, value);
}
void CustomCarMsg::updateKeyAcc(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(keyAcc, value);
}
void CustomCarMsg::updateKeyOn(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(keyOn, value);
}
void CustomCarMsg::updateHighVoltageInterlock(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(highVoltageInterLock, value);
}
void CustomCarMsg::updateHighVoltagePowerUp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(highVoltagePowerUp, value);
}
void CustomCarMsg::updateAirCompressorWork(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airCompressorWork, value);
}
void CustomCarMsg::updateBoosterPumpWork(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(boosterPumpWork, value);
}
void CustomCarMsg::updateAirCompressorMotorSpeed(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airCompressorMotorSpeed, value);
}
void CustomCarMsg::updateSteeringAssistMotorSpeed(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(steeringAssistMotorSpeed, value);
}
void CustomCarMsg::updateSteeringAssistMotorTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(steeringAssistMotorTemp, value);
}
void CustomCarMsg::updateAirCompressorMotorTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airCompressorMotorTemp, value);
}
void CustomCarMsg::updateAirCompressorControlTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airCompressorControlTemp, value);
}
void CustomCarMsg::updateSteeringControlDeviceTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(steeringControlDeviceTemp, value);
}
void CustomCarMsg::updateAirPress3(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress3, value);
}
void CustomCarMsg::updateAirPress4(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress4, value);
}
void CustomCarMsg::updateAirPress5(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress5, value);
}
void CustomCarMsg::updateHighestAlarmGrade(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(highestAlarmGrade, value);
}
void CustomCarMsg::updateFaultAlarmSituation(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(faultAlarmSituation, value);
}
void CustomCarMsg::updateDriveGearsMode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(driveGearsMode, value);
}
void CustomCarMsg::updateBduSwitch(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bduSwitch, value);
}
//仪表信息
void CustomCarMsg::updateInputCtrl01(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl01, value);
}
void CustomCarMsg::updateInputCtrl02(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl02, value);
}
void CustomCarMsg::updateInputCtrl03(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl03, value);
}
void CustomCarMsg::updateInputCtrl04(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl04, value);
}
void CustomCarMsg::updateInputCtrl05(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl05, value);
}
void CustomCarMsg::updateInputCtrl06(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl06, value);
}
void CustomCarMsg::updateInputCtrl07(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl07, value);
}
void CustomCarMsg::updateInputCtrl08(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl08, value);
}
void CustomCarMsg::updateInputCtrl09(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl09, value);
}
void CustomCarMsg::updateInputCtrl10(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl10, value);
}
void CustomCarMsg::updateInputCtrl11(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl11, value);
}
void CustomCarMsg::updateInputCtrl12(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl12, value);
}
void CustomCarMsg::updateInputCtrl13(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl13, value);
}
void CustomCarMsg::updateInputCtrl14(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl14, value);
}
void CustomCarMsg::updateInputCtrl15(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl15, value);
}
void CustomCarMsg::updateInputCtrl16(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl16, value);
}
void CustomCarMsg::updateInputCtrl17(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl17, value);
}
void CustomCarMsg::updateInputCtrl18(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl18, value);
}
void CustomCarMsg::updateInputCtrl19(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl19, value);
}
void CustomCarMsg::updateInputCtrl20(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl20, value);
}
void CustomCarMsg::updateInputCtrl21(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl21, value);
}
void CustomCarMsg::updateInputCtrl22(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl22, value);
}
void CustomCarMsg::updateInputCtrl23(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl23, value);
}
void CustomCarMsg::updateInputCtrl24(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl24, value);
}
void CustomCarMsg::updateInputCtrl25(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl25, value);
}
void CustomCarMsg::updateInputCtrl26(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl26, value);
}
void CustomCarMsg::updateInputCtrl27(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl27, value);
}
void CustomCarMsg::updateInputCtrl28(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl28, value);
}
void CustomCarMsg::updateInputCtrl29(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl29, value);
}
void CustomCarMsg::updateInputCtrl30(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl30, value);
}
void CustomCarMsg::updateInputCtrl31(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl31, value);
}
void CustomCarMsg::updateInputCtrl32(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl32, value);
}
void CustomCarMsg::updateInputCtrl33(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl33, value);
}
void CustomCarMsg::updateInputCtrl34(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl34, value);
}
void CustomCarMsg::updateInputCtrl35(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl35, value);
}
//前模块信息
void CustomCarMsg::updateFrontOutputCurrent01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent01, value);
}
void CustomCarMsg::updateFrontOutputCurrent02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent02, value);
}
void CustomCarMsg::updateFrontOutputCurrent03(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent03, value);
}
void CustomCarMsg::updateFrontOutputCurrent04(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent04, value);
}
void CustomCarMsg::updateFrontOutputCurrent05(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent05, value);
}
void CustomCarMsg::updateFrontOutputCurrent06(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent06, value);
}
void CustomCarMsg::updateFrontOutputCurrent07(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent07, value);
}
void CustomCarMsg::updateFrontOutputCurrent08(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent08, value);
}
void CustomCarMsg::updateFrontOutputCurrent09(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent09, value);
}
void CustomCarMsg::updateFrontOutputCurrent10(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent10, value);
}
void CustomCarMsg::updateFrontOutputCurrent11(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent11, value);
}
void CustomCarMsg::updateFrontOutputCurrent12(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent12, value);
}
void CustomCarMsg::updateFrontOutputCurrent13(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent13, value);
}
void CustomCarMsg::updateFrontOutputCurrent14(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent14, value);
}
void CustomCarMsg::updateFrontOutputCurrent15(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputCurrent15, value);
}
void CustomCarMsg::updateFrontOutputFault01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault01, value);
}
void CustomCarMsg::updateFrontOutputFault02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault02, value);
}
void CustomCarMsg::updateFrontOutputFault03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault03, value);
}
void CustomCarMsg::updateFrontOutputFault04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault04, value);
}
void CustomCarMsg::updateFrontOutputFault05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault05, value);
}
void CustomCarMsg::updateFrontOutputFault06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault06, value);
}
void CustomCarMsg::updateFrontOutputFault07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault07, value);
}
void CustomCarMsg::updateFrontOutputFault08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault08, value);
}
void CustomCarMsg::updateFrontOutputFault09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault09, value);
}
void CustomCarMsg::updateFrontOutputFault10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault10, value);
}
void CustomCarMsg::updateFrontOutputFault11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault11, value);
}
void CustomCarMsg::updateFrontOutputFault12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault12, value);
}
void CustomCarMsg::updateFrontOutputFault13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault13, value);
}
void CustomCarMsg::updateFrontOutputFault14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault14, value);
}
void CustomCarMsg::updateFrontOutputFault15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontOutputFault15, value);
}
void CustomCarMsg::updateFrontSwitch01(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch01, value);
}
void CustomCarMsg::updateFrontSwitch02(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch02, value);
}
void CustomCarMsg::updateFrontSwitch03(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch03, value);
}
void CustomCarMsg::updateFrontSwitch04(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch04, value);
}
void CustomCarMsg::updateFrontSwitch05(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch05, value);
}
void CustomCarMsg::updateFrontSwitch06(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch06, value);
}
void CustomCarMsg::updateFrontSwitch07(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch07, value);
}
void CustomCarMsg::updateFrontSwitch08(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch08, value);
}
void CustomCarMsg::updateFrontSwitch09(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch09, value);
}
void CustomCarMsg::updateFrontSwitch10(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch10, value);
}
void CustomCarMsg::updateFrontSwitch11(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch11, value);
}
void CustomCarMsg::updateFrontSwitch12(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch12, value);
}
void CustomCarMsg::updateFrontSwitch13(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch13, value);
}
void CustomCarMsg::updateFrontSwitch14(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch14, value);
}
void CustomCarMsg::updateFrontSwitch15(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch15, value);
}
void CustomCarMsg::updateFrontSwitch16(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch16, value);
}
void CustomCarMsg::updateFrontAnalogInput01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontAnalogInput01, value);
}
void CustomCarMsg::updateFrontAnalogInput02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontAnalogInput02, value);
}
void CustomCarMsg::updateFrontHzInput(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontHzInput, value);
}
void CustomCarMsg::updateFrontSpeedInput(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSpeedInput, value);
}
//中模块信息
void CustomCarMsg::updateMiddleOutputCurrent01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent01, value);
}
void CustomCarMsg::updateMiddleOutputCurrent02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent02, value);
}
void CustomCarMsg::updateMiddleOutputCurrent03(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent03, value);
}
void CustomCarMsg::updateMiddleOutputCurrent04(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent04, value);
}
void CustomCarMsg::updateMiddleOutputCurrent05(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent05, value);
}
void CustomCarMsg::updateMiddleOutputCurrent06(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent06, value);
}
void CustomCarMsg::updateMiddleOutputCurrent07(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent07, value);
}
void CustomCarMsg::updateMiddleOutputCurrent08(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent08, value);
}
void CustomCarMsg::updateMiddleOutputCurrent09(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent09, value);
}
void CustomCarMsg::updateMiddleOutputCurrent10(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent10, value);
}
void CustomCarMsg::updateMiddleOutputCurrent11(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent11, value);
}
void CustomCarMsg::updateMiddleOutputCurrent12(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent12, value);
}
void CustomCarMsg::updateMiddleOutputCurrent13(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent13, value);
}
void CustomCarMsg::updateMiddleOutputCurrent14(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent14, value);
}
void CustomCarMsg::updateMiddleOutputCurrent15(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputCurrent15, value);
}
void CustomCarMsg::updateMiddleOutputFault01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault01, value);
}
void CustomCarMsg::updateMiddleOutputFault02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault02, value);
}
void CustomCarMsg::updateMiddleOutputFault03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault03, value);
}
void CustomCarMsg::updateMiddleOutputFault04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault04, value);
}
void CustomCarMsg::updateMiddleOutputFault05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault05, value);
}
void CustomCarMsg::updateMiddleOutputFault06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault06, value);
}
void CustomCarMsg::updateMiddleOutputFault07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault07, value);
}
void CustomCarMsg::updateMiddleOutputFault08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault08, value);
}
void CustomCarMsg::updateMiddleOutputFault09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault09, value);
}
void CustomCarMsg::updateMiddleOutputFault10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault10, value);
}
void CustomCarMsg::updateMiddleOutputFault11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault11, value);
}
void CustomCarMsg::updateMiddleOutputFault12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault12, value);
}
void CustomCarMsg::updateMiddleOutputFault13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault13, value);
}
void CustomCarMsg::updateMiddleOutputFault14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault14, value);
}
void CustomCarMsg::updateMiddleOutputFault15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleOutputFault15, value);
}
void CustomCarMsg::updateMiddleSwitch01(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch01, value);
}
void CustomCarMsg::updateMiddleSwitch02(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch02, value);
}
void CustomCarMsg::updateMiddleSwitch03(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch03, value);
}
void CustomCarMsg::updateMiddleSwitch04(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch04, value);
}
void CustomCarMsg::updateMiddleSwitch05(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch05, value);
}
void CustomCarMsg::updateMiddleSwitch06(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch06, value);
}
void CustomCarMsg::updateMiddleSwitch07(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch07, value);
}
void CustomCarMsg::updateMiddleSwitch08(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch08, value);
}
void CustomCarMsg::updateMiddleSwitch09(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch09, value);
}
void CustomCarMsg::updateMiddleSwitch10(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch10, value);
}
void CustomCarMsg::updateMiddleSwitch11(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch11, value);
}
void CustomCarMsg::updateMiddleSwitch12(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch12, value);
}
void CustomCarMsg::updateMiddleSwitch13(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch13, value);
}
void CustomCarMsg::updateMiddleSwitch14(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch14, value);
}
void CustomCarMsg::updateMiddleSwitch15(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch15, value);
}
void CustomCarMsg::updateMiddleSwitch16(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch16, value);
}
void CustomCarMsg::updateMiddleAnalogInput01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleAnalogInput01, value);
}
void CustomCarMsg::updateMiddleAnalogInput02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleAnalogInput02, value);
}
void CustomCarMsg::updateMiddleHzInput(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleHzInput, value);
}
void CustomCarMsg::updateMiddleSpeedInput(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSpeedInput, value);
}
//后模块信息
void CustomCarMsg::updateBackOutputCurrent01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent01, value);
}
void CustomCarMsg::updateBackOutputCurrent02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent02, value);
}
void CustomCarMsg::updateBackOutputCurrent03(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent03, value);
}
void CustomCarMsg::updateBackOutputCurrent04(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent04, value);
}
void CustomCarMsg::updateBackOutputCurrent05(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent05, value);
}
void CustomCarMsg::updateBackOutputCurrent06(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent06, value);
}
void CustomCarMsg::updateBackOutputCurrent07(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent07, value);
}
void CustomCarMsg::updateBackOutputCurrent08(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent08, value);
}
void CustomCarMsg::updateBackOutputCurrent09(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent09, value);
}
void CustomCarMsg::updateBackOutputCurrent10(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent10, value);
}
void CustomCarMsg::updateBackOutputCurrent11(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent11, value);
}
void CustomCarMsg::updateBackOutputCurrent12(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent12, value);
}
void CustomCarMsg::updateBackOutputCurrent13(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent13, value);
}
void CustomCarMsg::updateBackOutputCurrent14(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent14, value);
}
void CustomCarMsg::updateBackOutputCurrent15(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputCurrent15, value);
}
void CustomCarMsg::updateBackOutputFault01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault01, value);
}
void CustomCarMsg::updateBackOutputFault02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault02, value);
}
void CustomCarMsg::updateBackOutputFault03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault03, value);
}
void CustomCarMsg::updateBackOutputFault04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault04, value);
}
void CustomCarMsg::updateBackOutputFault05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault05, value);
}
void CustomCarMsg::updateBackOutputFault06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault06, value);
}
void CustomCarMsg::updateBackOutputFault07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault07, value);
}
void CustomCarMsg::updateBackOutputFault08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault08, value);
}
void CustomCarMsg::updateBackOutputFault09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault09, value);
}
void CustomCarMsg::updateBackOutputFault10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault10, value);
}
void CustomCarMsg::updateBackOutputFault11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault11, value);
}
void CustomCarMsg::updateBackOutputFault12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault12, value);
}
void CustomCarMsg::updateBackOutputFault13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault13, value);
}
void CustomCarMsg::updateBackOutputFault14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault14, value);
}
void CustomCarMsg::updateBackOutputFault15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backOutputFault15, value);
}
void CustomCarMsg::updateBackSwitch01(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch01, value);
}
void CustomCarMsg::updateBackSwitch02(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch02, value);
}
void CustomCarMsg::updateBackSwitch03(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch03, value);
}
void CustomCarMsg::updateBackSwitch04(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch04, value);
}
void CustomCarMsg::updateBackSwitch05(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch05, value);
}
void CustomCarMsg::updateBackSwitch06(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch06, value);
}
void CustomCarMsg::updateBackSwitch07(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch07, value);
}
void CustomCarMsg::updateBackSwitch08(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch08, value);
}
void CustomCarMsg::updateBackSwitch09(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch09, value);
}
void CustomCarMsg::updateBackSwitch10(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch10, value);
}
void CustomCarMsg::updateBackSwitch11(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch11, value);
}
void CustomCarMsg::updateBackSwitch12(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch12, value);
}
void CustomCarMsg::updateBackSwitch13(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch13, value);
}
void CustomCarMsg::updateBackSwitch14(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch14, value);
}
void CustomCarMsg::updateBackSwitch15(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch15, value);
}
void CustomCarMsg::updateBackSwitch16(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch16, value);
}
void CustomCarMsg::updateBackAnalogInput01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backAnalogInput01, value);
}
void CustomCarMsg::updateBackAnalogInput02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backAnalogInput02, value);
}
void CustomCarMsg::updateBackHzInput(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backHzInput, value);
}
void CustomCarMsg::updateBackSpeedInput(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSpeedInput, value);
}
//警告提示
void CustomCarMsg::updateWarningId(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warningId, value);
}
//发动机系统信息
void CustomCarMsg::updateEngineFuelConsumption(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineFuelConsumption, value);
}
void CustomCarMsg::updateEngineLoad(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineLoad, value);
}
void CustomCarMsg::updateEngineTargetThrottle(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineTargetThrottle, value);
}
void CustomCarMsg::updateEngineActualThrottle(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineActualThrottle, value);
}
void CustomCarMsg::updateEngineInletTemperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engineInletTemperature, value);
}
//辅助系统信息
void CustomCarMsg::updateOilPumpDcacWoutputCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oilPumpDcacWoutputCurrent, value);
}
void CustomCarMsg::updateOilPumpDcacVoutputCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oilPumpDcacVoutputCurrent, value);
}
void CustomCarMsg::updateOilPumpDcacUoutputCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oilPumpDcacUoutputCurrent, value);
}
void CustomCarMsg::updateRadiatorTemperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(radiatorTemperature, value);
}
//TCU系统信息
void CustomCarMsg::updateActualClutchPosition(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(actualClutchPosition, value);
}
void CustomCarMsg::updateTcuFaultCode(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(tcuFaultCode, value);
}
void CustomCarMsg::updateAxisRpm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(axisRpm, value);
}
void CustomCarMsg::updateFmi(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fmi, value);
}
void CustomCarMsg::updateCm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(cm, value);
}
void CustomCarMsg::updateOc(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oc, value);
}
//电池管理系统
void CustomCarMsg::updateBatMaxChargeCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batMaxChargeCurrent, value);
}
void CustomCarMsg::updateBatMaxDischargeCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batMaxDischargeCurrent, value);
}
void CustomCarMsg::updateBatAverageVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batAverageVoltage, value);
}
void CustomCarMsg::updateBatStatus1(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batStatus1, value);
}
void CustomCarMsg::updateBatStatus2(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batStatus2, value);
}
void CustomCarMsg::updateBatStatus3(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batStatus3, value);
}
void CustomCarMsg::updateIrmOhmPositive(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(irmOhmPositive, value);
}
void CustomCarMsg::updateIrmOhmNegative(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(irmOhmNegative, value);
}
void CustomCarMsg::updateBatMaxVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batMaxVoltage, value);
}
void CustomCarMsg::updateBatMinVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batMinVoltage, value);
}
void CustomCarMsg::updateBatteryHighestTemp(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryHighestTemp, value);
}
void CustomCarMsg::updateBmsVersion(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bmsVersion, value);
}
void CustomCarMsg::updateBmsModuleAmount(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bmsModuleAmount, value);
}
void CustomCarMsg::updateBmsLife(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bmsLife, value);
}
void CustomCarMsg::updateBatteryPackHighestTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryPackHighestTemp, value);
}
void CustomCarMsg::updateBatteryPackMinTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryPackMinTemp, value);
}
void CustomCarMsg::updateBatteryManagePackEnergy(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryManagePackEnergy, value);
}
void CustomCarMsg::updateBmsControlStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bmsControlStatus, value);
}
void CustomCarMsg::updateBatAmount(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batAmount, value);
}
void CustomCarMsg::updateRechargeStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(rechargeStatus, value);
}
void CustomCarMsg::updateTempStyletAmount(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(tempStyletAmount, value);
}
void CustomCarMsg::updateOutletPositiveTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(outletPositiveTemp, value);
}
void CustomCarMsg::updateOutletNegativeTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(outletNegativeTemp, value);
}
void CustomCarMsg::updatePowerBatteryType(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerBatteryType, value);
}
void CustomCarMsg::updatePowerBatteryRecharge(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerBatteryRecharge, value);
}
//电池组电压信息
void CustomCarMsg::updateAddrNumberVoltage(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(addrNumberVoltage, value);
}
void CustomCarMsg::updateAddrNumberVoltageValue(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(addrNumberVoltageValue, value);
}
void CustomCarMsg::updateBoxNumberVoltage(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(boxNumberVoltage, value);
}
/*
void CustomCarMsg::updateVoltageInfo(QVariantMap value) {
    MEMBER_PROPERTY_VALUE_CHANGED(voltageInfo, value);
}
*/
//电池组温度信息
void CustomCarMsg::updateAddrNumberTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(addrNumberTemp, value);
}
void CustomCarMsg::updateAddrNumberTempValue(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(addrNumberTempValue, value);
}
void CustomCarMsg::updateBoxNumberTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(boxNumberTemp, value);
}
/*
void CustomCarMsg::updateTempInfo(QVariantMap value) {
    MEMBER_PROPERTY_VALUE_CHANGED(tempInfo, value);
}
*/
//空调系统信息
void CustomCarMsg::updateAcFaultCode(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acFaultCode, value);
}
void CustomCarMsg::updateAcFanStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acFanStatus, value);
}
void CustomCarMsg::updateAcWorkStatus(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acWorkStatus, value);
}
void CustomCarMsg::updateAcLife(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acLife, value);
}
void CustomCarMsg::updateAcOutTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acOutTemp, value);
}
void CustomCarMsg::updateAcInTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acInTemp, value);
}
void CustomCarMsg::updateAcSetTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acSetTemp, value);
}
void CustomCarMsg::updateAcRefrigereReq(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acRefrigereReq, value);
}
//DCDC状态信息
void CustomCarMsg::updateDcLowVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcLowVoltage, value);
}
void CustomCarMsg::updateDcLowCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcLowCurrent, value);
}
void CustomCarMsg::updateDcTemp(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcTemp, value);
}
void CustomCarMsg::updateDcStatus2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcStatus2, value);
}
void CustomCarMsg::updateDcUndervoltage(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcUndervoltage, value);
}
void CustomCarMsg::updateDcOvervoltage(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcOvervoltage, value);
}
void CustomCarMsg::updateDcOverheating(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcOverheating, value);
}
void CustomCarMsg::updateDcShortCircuit(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcShortCircuit, value);
}
void CustomCarMsg::updateDcWorkStatus(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dcWorkStatus, value);
}
//符号片显示
void CustomCarMsg::updateLampKeyOn(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampKeyOn, value);
}
void CustomCarMsg::updateLampAirFilter(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAirFilter, value);
}
void CustomCarMsg::updateLampAsr(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAsr, value);
}
void CustomCarMsg::updateLampHighVoltageMaintenance(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHighVoltageMaintenance, value);
}
void CustomCarMsg::updateLampDefroster(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampDefroster, value);
}
void CustomCarMsg::updateLampDryere(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampDryere, value);
}
void CustomCarMsg::updateLampAbs(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAbs, value);
}
void CustomCarMsg::updateLampAc(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAc, value);
}
void CustomCarMsg::updatePowerSupply(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerSupply, value);
}
void CustomCarMsg::updatePowerPlugInMode(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerPlugInMode, value);
}
void CustomCarMsg::updatePowerByvridMode(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerByvridMode, value);
}
void CustomCarMsg::updateClimbingMode(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(climbingMode, value);
}
void CustomCarMsg::updateDiagnosticMode(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(diagnosticMode, value);
}
void CustomCarMsg::updateLampTurnLeft(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampTurnLeft, value);
}
void CustomCarMsg::updateLampTurnRight(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampTurnRight, value);
}
void CustomCarMsg::updateLampDoubleFlash(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampDoubleFlash, value);
}
void CustomCarMsg::updateLampFrontFog(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampFrontFog, value);
}
void CustomCarMsg::updateLampRearFog(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRearFog, value);
}
void CustomCarMsg::updateLampHighBeam(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHighBeam, value);
}
void CustomCarMsg::updateLampHeadLight(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHeadLight, value);
}
void CustomCarMsg::updateLampReverseGear(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampReverseGear, value);
}
void CustomCarMsg::updateLampPositionLight(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampPositionLight, value);
}
void CustomCarMsg::updateLampGate1(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampGate1, value);
}
void CustomCarMsg::updateLampGate2(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampGate2, value);
}
void CustomCarMsg::updateLampRearDoorOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRearDoorOpen, value);
}
void CustomCarMsg::updateLampBrake(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampBrake, value);
}
void CustomCarMsg::updateLampParkingBrake(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampParkingBrake, value);
}
void CustomCarMsg::updateLampLeftLowAirPressure(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampLeftLowAirPressure, value);
}
void CustomCarMsg::updateLampRightLowAirPressure(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRightLowAirPressure, value);
}
void CustomCarMsg::updateLampLeftShoeWear(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampLeftShoeWear, value);
}
void CustomCarMsg::updateLampRightShoeWear(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRightShoeWear, value);
}
void CustomCarMsg::updateLampChargeConfirm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampChargeConfirm, value);
}
void CustomCarMsg::updateLampBatteryMainContact(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampBatteryMainContact, value);
}
void CustomCarMsg::updateLampWaterTempHigh(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampWaterTempHigh, value);
}
void CustomCarMsg::updateLampWaterLevelLow(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampWaterLevelLow, value);
}
void CustomCarMsg::updateLampLowServiceWl(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampLowServiceWl, value);
}
void CustomCarMsg::updateLampHeavyStopWl(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHeavyStopWl, value);
}
void CustomCarMsg::updateLampSeriousStopWl(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampSeriousStopWl, value);
}
void CustomCarMsg::updateLampOilLevelLow(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampOilLevelLow, value);
}
void CustomCarMsg::updateLampOilPressureLow(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampOilPressureLow, value);
}
void CustomCarMsg::updateLampEngineFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampEngineFault, value);
}
void CustomCarMsg::updateLampMotorOutOfService(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampMotorOutOfService, value);
}
void CustomCarMsg::updateLampMoterFireIgon(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampMoterFireIgon, value);
}
void CustomCarMsg::updateLampAfterTreat(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAfterTreat, value);
}
void CustomCarMsg::updateLampWarningLed(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampWarningLed, value);
}
void CustomCarMsg::updateAirPress1Lamp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress1Lamp, value);
}
void CustomCarMsg::updateAirPress2Lamp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress2Lamp, value);
}
void CustomCarMsg::updateAirPress3Lamp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress3Lamp, value);
}
void CustomCarMsg::updateAirPress4Lamp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress4Lamp, value);
}
void CustomCarMsg::updateAirPress5Lamp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airPress5Lamp, value);
}
void CustomCarMsg::updatePowerDoorsOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerDoorsOpen, value);
}
void CustomCarMsg::updatePowerBatteryCutOff(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerBatteryCutOff, value);
}
void CustomCarMsg::updateSeatbeltNotFastened(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(seatbeltNotFastened, value);
}
void CustomCarMsg::updateForwardGear(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(forwardGear, value);
}
void CustomCarMsg::updateNeutralGear(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(neutralGear, value);
}
void CustomCarMsg::updateReverseGear(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(reverseGear, value);
}
void CustomCarMsg::updateElectronicInSlope(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(electronicInSlope, value);
}
void CustomCarMsg::updateAscd(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ascd, value);
}
void CustomCarMsg::updateReady(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ready, value);
}
void CustomCarMsg::updatePowerAccumulatorsChargeStatus(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerAccumulatorsChargeStatus, value);
}
void CustomCarMsg::updateCableConnect(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(cableConnect, value);
}
void CustomCarMsg::updateControlMotorOverheating(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlMotorOverheating, value);
}
void CustomCarMsg::updatePowerAccumulatorsFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerAccumulatorsFault, value);
}
void CustomCarMsg::updateDriverSystemFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(driverSystemFault, value);
}
void CustomCarMsg::updateSeverityInsulationFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(severityInsulationFault, value);
}
void CustomCarMsg::updateSlightInsulationFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(slightInsulationFault, value);
}
void CustomCarMsg::updateMotorPowerLimitation(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorPowerLimitation, value);
}
void CustomCarMsg::updateBmsAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bmsAlarm, value);
}
void CustomCarMsg::updateSocLowAram(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(socLowAram, value);
}
void CustomCarMsg::updateSafetySystemAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(safetySystemAlarm, value);
}
void CustomCarMsg::updateLeftDoorsOpenAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(leftDoorsOpenAlarm, value);
}
void CustomCarMsg::updateRightDoorsOpenAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(rightDoorsOpenAlarm, value);
}
void CustomCarMsg::updateBarrierFreeMarchReach(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(barrierFreeMarchReach, value);
}
void CustomCarMsg::updateGateChargeOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(gateChargeOpen, value);
}
void CustomCarMsg::updateDriverSeatAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(driverSeatAlarm, value);
}
void CustomCarMsg::updateEcasSystemFaultLed(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ecasSystemFaultLed, value);
}
void CustomCarMsg::updateEcasAlarmLed(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ecasAlarmLed, value);
}
void CustomCarMsg::updateEcasKneelingStatusLed(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ecasKneelingStatusLed, value);
}
void CustomCarMsg::updateEcasSpecialHeightLed(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ecasSpecialHeightLed, value);
}
void CustomCarMsg::updateDropOffDoorbell(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dropOffDoorbell, value);
}
void CustomCarMsg::updateWait(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(wait, value);
}
void CustomCarMsg::updateFrontDoorExigencyAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontDoorExigencyAlarm, value);
}
void CustomCarMsg::updateMiddleDoorExigencyAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleDoorExigencyAlarm, value);
}
void CustomCarMsg::updateStop(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(stop, value);
}
//胎压模块信息
void CustomCarMsg::updateFrontLeftTirePress(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontLeftTirePress, value);
}
void CustomCarMsg::updateFronRightTirePress(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fronRightTirePress, value);
}
void CustomCarMsg::updateBackLeftTirePress1(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backLeftTirePress1, value);
}
void CustomCarMsg::updateBackRightTirePress1(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backRightTirePress1, value);
}
void CustomCarMsg::updateBackLeftTirePress2(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backLeftTirePress2, value);
}
void CustomCarMsg::updateBackRightTirePress2(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backRightTirePress2, value);
}
void CustomCarMsg::updateFrontLeftTireTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontLeftTireTemp, value);
}
void CustomCarMsg::updateFrontRightTireTemp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontRightTireTemp, value);
}
void CustomCarMsg::updateBackLeftTireTemp1(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backLeftTireTemp1, value);
}
void CustomCarMsg::updateBackRightTireTemp1(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backRightTireTemp1, value);
}
void CustomCarMsg::updateBackLeftTireTemp2(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backLeftTireTemp2, value);
}
void CustomCarMsg::updateBackRightTireTemp2(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backRightTireTemp2, value);
}
//控制系统诊断信息
void CustomCarMsg::updateDriveFaultAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(driveFaultAlarm, value);
}
void CustomCarMsg::updateControlOvervoltageAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlOvervoltageAlarm, value);
}
void CustomCarMsg::updateControlUndervoltageAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlUndervoltageAlarm, value);
}
void CustomCarMsg::updateControlEncodingFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlEncodingFault, value);
}
void CustomCarMsg::updateControlHighTempAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlHighTempAlarm, value);
}
void CustomCarMsg::updateControlHighTempAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlHighTempAbortAlarm, value);
}
void CustomCarMsg::updateControlMainContactorFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlMainContactorFault, value);
}
void CustomCarMsg::updateControlOvercurrentAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlOvercurrentAlarm, value);
}
void CustomCarMsg::updateMotorHighTempAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorHighTempAlarm, value);
}
void CustomCarMsg::updateMotorHigtTempAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorHigtTempAbortAlarm, value);
}
void CustomCarMsg::updateMotorRotaryFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorRotaryFault, value);
}
void CustomCarMsg::updateControlMotorPowerLimitation(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlMotorPowerLimitation, value);
}
void CustomCarMsg::updateMotorRotaryLimitation(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorRotaryLimitation, value);
}
void CustomCarMsg::updateMotorWaterTempOvertop(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motorWaterTempOvertop, value);
}
void CustomCarMsg::updateAcceleratorPedalFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(acceleratorPedalFault, value);
}
void CustomCarMsg::updateBrakePedalFaule(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(brakePedalFaule, value);
}
void CustomCarMsg::updateSeatbeltAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(seatbeltAlarm, value);
}
void CustomCarMsg::updateSeatSwitchAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(seatSwitchAlarm, value);
}
void CustomCarMsg::updateControlRightDoorsOpenAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlRightDoorsOpenAlarm, value);
}
void CustomCarMsg::updateControlLeftDoorsOpenAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(controlLeftDoorsOpenAlarm, value);
}
void CustomCarMsg::updateChauffeurDoorsNotClose(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(chauffeurDoorsNotClose, value);
}
void CustomCarMsg::updateHighTensionSwitchOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(highTensionSwitchOpen, value);
}
void CustomCarMsg::updateChargeDoorOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(chargeDoorOpen, value);
}
void CustomCarMsg::updateSafetyDoorOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(safetyDoorOpen, value);
}
void CustomCarMsg::updateLowVoltageSwitchOpen(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lowVoltageSwitchOpen, value);
}
void CustomCarMsg::updateAbsSystemFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(absSystemFault, value);
}
void CustomCarMsg::updateAirCompressorControlHighTemp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airCompressorControlHighTemp, value);
}
void CustomCarMsg::updateAirCompressorMotorHighTemp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(airCompressorMotorHighTemp, value);
}
void CustomCarMsg::updateBoosterPumpControlHighTemp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(boosterPumpControlHighTemp, value);
}
void CustomCarMsg::updateBoosterPumpMotorHighTemp(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(boosterPumpMotorHighTemp, value);
}
void CustomCarMsg::updateVcuVersion(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(vcuVersion, value);
}
void CustomCarMsg::updateVcuLife(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(vcuLife, value);
}
//动力电池诊断系统信息
void CustomCarMsg::updateBatVoltageMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batVoltageMaxAlarm, value);
}
void CustomCarMsg::updateBatVoltageMaxAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batVoltageMaxAbortAlarm, value);
}
void CustomCarMsg::updateBatVoltageMinAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batVoltageMinAlarm, value);
}
void CustomCarMsg::updateBatVoltageMinAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batVoltageMinAbortAlarm, value);
}
void CustomCarMsg::updateChargeCurrentMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(chargeCurrentMaxAlarm, value);
}
void CustomCarMsg::updateDischargeCurrentMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dischargeCurrentMaxAlarm, value);
}
void CustomCarMsg::updateDischargeCurrentMaxAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dischargeCurrentMaxAbortAlarm, value);
}
void CustomCarMsg::updateDischargeCurrentTempMinAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dischargeCurrentTempMinAlarm, value);
}
void CustomCarMsg::updateDischargeCurrentTempMinAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dischargeCurrentTempMinAbortAlarm, value);
}
void CustomCarMsg::updateChargeCurrentTempMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(chargeCurrentTempMaxAlarm, value);
}
void CustomCarMsg::updateChargeCurrentTempMaxAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(chargeCurrentTempMaxAbortAlarm, value);
}
void CustomCarMsg::updateBatTempMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batTempMaxAlarm, value);
}
void CustomCarMsg::updateBatTempMaxAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batTempMaxAbortAlarm, value);
}
void CustomCarMsg::updateDropoutVoltageMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dropoutVoltageMaxAlarm, value);
}
void CustomCarMsg::updateDropoutVoltageMaxAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dropoutVoltageMaxAbortAlarm, value);
}
void CustomCarMsg::updateChargeVoltageMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(chargeVoltageMaxAlarm, value);
}
void CustomCarMsg::updateBatTempDifferentAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batTempDifferentAlarm, value);
}
void CustomCarMsg::updateBatChargeTempMinAbortAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batChargeTempMinAbortAlarm, value);
}
void CustomCarMsg::updateBatChargeTempMinAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batChargeTempMinAlarm, value);
}
void CustomCarMsg::updateSocMinAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(socMinAlarm, value);
}
void CustomCarMsg::updateSocMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(socMaxAlarm, value);
}
void CustomCarMsg::updateBatModuleCommunicationFail(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batModuleCommunicationFail, value);
}
void CustomCarMsg::updateBmsSystemFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bmsSystemFault, value);
}
void CustomCarMsg::updateBatteryFault(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batteryFault, value);
}
void CustomCarMsg::updateEnergyRecoveryCurrentMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(energyRecoveryCurrentMaxAlarm, value);
}
void CustomCarMsg::updateEnergyRecoveryVoltageMaxAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(energyRecoveryVoltageMaxAlarm, value);
}
void CustomCarMsg::updateEnergyRecoveryVoltageMaxAbort(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(energyRecoveryVoltageMaxAbort, value);
}
void CustomCarMsg::updateEnergyRecoveryCancel(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(energyRecoveryCancel, value);
}
void CustomCarMsg::updateSocJumpAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(socJumpAlarm, value);
}
void CustomCarMsg::updateMismatchingAlarm(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(mismatchingAlarm, value);
}
void CustomCarMsg::updateVehicleMountedTypeMax(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(vehicleMountedTypeMax, value);
}
void CustomCarMsg::updateVehicleMountedTypeMin(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(vehicleMountedTypeMin, value);
}
void CustomCarMsg::updateVehicleMountedTypeOvercharge(bool value) {
    MEMBER_PROPERTY_VALUE_CHANGED(vehicleMountedTypeOvercharge, value);
}

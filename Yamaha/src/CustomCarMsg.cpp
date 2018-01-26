
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
    connect(worker, &CustomCarMsgWorker::keyPressed, this, &CustomCarMsg::keyPressed);
    connect(worker, &CustomCarMsgWorker::keyReleased, this, &CustomCarMsg::keyReleased);
    connect(worker, &CustomCarMsgWorker::keyDoublePressed, this, &CustomCarMsg::keyDoublePressed);
    connect(worker, &CustomCarMsgWorker::doubleKeysPressed, this, &CustomCarMsg::doubleKeysPressed);
    connect(worker, &CustomCarMsgWorker::keyLongPressed, this, &CustomCarMsg::keyLongPressed);
    connect(worker, &CustomCarMsgWorker::keyShortPressed, this, &CustomCarMsg::keyShortPressed);

    connect(worker, &CustomCarMsgWorker::themeModeChanged, this, &CustomCarMsg::updateThemeMode);
    connect(worker, &CustomCarMsgWorker::dateTimeChanged, this, &CustomCarMsg::updateDateTime);
    connect(worker, &CustomCarMsgWorker::upgradeMsgIdChanged, this, &CustomCarMsg::updateUpgradeMsgId);
    connect(worker, &CustomCarMsgWorker::upgradeMsgCtxChanged, this, &CustomCarMsg::updateUpgradeMsgCtx);
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

    connect(worker, &CustomCarMsgWorker::engineFuelConsumptionChanged, this, &CustomCarMsg::updateEngineFuelConsumption);
    connect(worker, &CustomCarMsgWorker::engineLoadChanged, this, &CustomCarMsg::updateEngineLoad);
    connect(worker, &CustomCarMsgWorker::engineTargetThrottleChanged, this, &CustomCarMsg::updateEngineTargetThrottle);
    connect(worker, &CustomCarMsgWorker::engineActualThrottleChanged, this, &CustomCarMsg::updateEngineActualThrottle);
    connect(worker, &CustomCarMsgWorker::engineInletTemperatureChanged, this, &CustomCarMsg::updateEngineInletTemperature);

    connect(worker, &CustomCarMsgWorker::oilPumpDcacWoutputCurrentChanged, this, &CustomCarMsg::updateOilPumpDcacWoutputCurrent);
    connect(worker, &CustomCarMsgWorker::oilPumpDcacVoutputCurrentChanged, this, &CustomCarMsg::updateOilPumpDcacVoutputCurrent);
    connect(worker, &CustomCarMsgWorker::oilPumpDcacUoutputCurrentChanged, this, &CustomCarMsg::updateOilPumpDcacUoutputCurrent);
    connect(worker, &CustomCarMsgWorker::radiatorTemperatureChanged, this, &CustomCarMsg::updateRadiatorTemperature);

    connect(worker, &CustomCarMsgWorker::actualClutchPositionChanged, this, &CustomCarMsg::updateActualClutchPosition);
    connect(worker, &CustomCarMsgWorker::tcuFaultCodeChanged, this, &CustomCarMsg::updateTcuFaultCode);
    connect(worker, &CustomCarMsgWorker::axisRpmChanged, this, &CustomCarMsg::updateAxisRpm);
    connect(worker, &CustomCarMsgWorker::fmiChanged, this, &CustomCarMsg::updateFmi);
    connect(worker, &CustomCarMsgWorker::cmChanged, this, &CustomCarMsg::updateCm);
    connect(worker, &CustomCarMsgWorker::ocChanged, this, &CustomCarMsg::updateOc);

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

    connect(worker, &CustomCarMsgWorker::acFaultCodeChanged, this, &CustomCarMsg::updateAcFaultCode);
    connect(worker, &CustomCarMsgWorker::acFanStatusChanged, this, &CustomCarMsg::updateAcFanStatus);
    connect(worker, &CustomCarMsgWorker::acWorkStatusChanged, this, &CustomCarMsg::updateAcWorkStatus);
    connect(worker, &CustomCarMsgWorker::acLifeChanged, this, &CustomCarMsg::updateAcLife);
    connect(worker, &CustomCarMsgWorker::acOutTempChanged, this, &CustomCarMsg::updateAcOutTemp);
    connect(worker, &CustomCarMsgWorker::acInTempChanged, this, &CustomCarMsg::updateAcInTemp);
    connect(worker, &CustomCarMsgWorker::acSetTempChanged, this, &CustomCarMsg::updateAcSetTemp);
    connect(worker, &CustomCarMsgWorker::acRefrigereReqChanged, this, &CustomCarMsg::updateAcRefrigereReq);

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

    connect(worker, &CustomCarMsgWorker::lampKeyOnChanged, this, &CustomCarMsg::updateLampKeyOn);
    connect(worker, &CustomCarMsgWorker::lampAirFilterChanged, this, &CustomCarMsg::updateLampAirFilter);
    connect(worker, &CustomCarMsgWorker::lampAsrChanged, this, &CustomCarMsg::updateLampAsr);
    connect(worker, &CustomCarMsgWorker::lampHighVoltageMaintenanceChanged, this, &CustomCarMsg::updateLampHighVoltageMaintenance);
    connect(worker, &CustomCarMsgWorker::lampDefrosterChanged, this, &CustomCarMsg::updateLampDefroster);
    connect(worker, &CustomCarMsgWorker::lampDryereChanged, this, &CustomCarMsg::updateLampDryere);
    connect(worker, &CustomCarMsgWorker::lampAbsChanged, this, &CustomCarMsg::updateLampAbs);
    connect(worker, &CustomCarMsgWorker::lampAcChanged, this, &CustomCarMsg::updateLampAc);
    connect(worker, &CustomCarMsgWorker::powerSupplyChanged, this, &CustomCarMsg::updatePowerSupply);
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

    connect(worker, &CustomCarMsgWorker::frontSwitch17Changed, this, &CustomCarMsg::updateFrontSwitch17);
    connect(worker, &CustomCarMsgWorker::frontSwitch18Changed, this, &CustomCarMsg::updateFrontSwitch18);
    connect(worker, &CustomCarMsgWorker::frontSwitch19Changed, this, &CustomCarMsg::updateFrontSwitch19);
    connect(worker, &CustomCarMsgWorker::frontSwitch20Changed, this, &CustomCarMsg::updateFrontSwitch20);
    connect(worker, &CustomCarMsgWorker::frontSwitch21Changed, this, &CustomCarMsg::updateFrontSwitch21);
    connect(worker, &CustomCarMsgWorker::frontSwitch22Changed, this, &CustomCarMsg::updateFrontSwitch22);
    connect(worker, &CustomCarMsgWorker::frontSwitch23Changed, this, &CustomCarMsg::updateFrontSwitch23);
    connect(worker, &CustomCarMsgWorker::frontSwitch24Changed, this, &CustomCarMsg::updateFrontSwitch24);
    connect(worker, &CustomCarMsgWorker::frontSwitch25Changed, this, &CustomCarMsg::updateFrontSwitch25);
    connect(worker, &CustomCarMsgWorker::frontSwitch26Changed, this, &CustomCarMsg::updateFrontSwitch26);
    connect(worker, &CustomCarMsgWorker::frontSwitch27Changed, this, &CustomCarMsg::updateFrontSwitch27);
    connect(worker, &CustomCarMsgWorker::frontSwitch28Changed, this, &CustomCarMsg::updateFrontSwitch28);
    connect(worker, &CustomCarMsgWorker::frontSwitch29Changed, this, &CustomCarMsg::updateFrontSwitch29);
    connect(worker, &CustomCarMsgWorker::frontSwitch30Changed, this, &CustomCarMsg::updateFrontSwitch30);
    connect(worker, &CustomCarMsgWorker::frontSwitch31Changed, this, &CustomCarMsg::updateFrontSwitch31);
    connect(worker, &CustomCarMsgWorker::frontSwitch32Changed, this, &CustomCarMsg::updateFrontSwitch32);

    connect(worker, &CustomCarMsgWorker::frontSwitch33Changed, this, &CustomCarMsg::updateFrontSwitch33);
    connect(worker, &CustomCarMsgWorker::frontSwitch34Changed, this, &CustomCarMsg::updateFrontSwitch34);
    connect(worker, &CustomCarMsgWorker::frontSwitch35Changed, this, &CustomCarMsg::updateFrontSwitch35);
    connect(worker, &CustomCarMsgWorker::frontSwitch36Changed, this, &CustomCarMsg::updateFrontSwitch36);
    connect(worker, &CustomCarMsgWorker::frontSwitch37Changed, this, &CustomCarMsg::updateFrontSwitch37);
    connect(worker, &CustomCarMsgWorker::frontSwitch38Changed, this, &CustomCarMsg::updateFrontSwitch38);
    connect(worker, &CustomCarMsgWorker::frontSwitch39Changed, this, &CustomCarMsg::updateFrontSwitch39);
    connect(worker, &CustomCarMsgWorker::frontSwitch40Changed, this, &CustomCarMsg::updateFrontSwitch40);
    connect(worker, &CustomCarMsgWorker::frontSwitch41Changed, this, &CustomCarMsg::updateFrontSwitch41);
    connect(worker, &CustomCarMsgWorker::frontSwitch42Changed, this, &CustomCarMsg::updateFrontSwitch42);

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

    connect(worker, &CustomCarMsgWorker::middleSwitch17Changed, this, &CustomCarMsg::updateMiddleSwitch17);
    connect(worker, &CustomCarMsgWorker::middleSwitch18Changed, this, &CustomCarMsg::updateMiddleSwitch18);
    connect(worker, &CustomCarMsgWorker::middleSwitch19Changed, this, &CustomCarMsg::updateMiddleSwitch19);
    connect(worker, &CustomCarMsgWorker::middleSwitch20Changed, this, &CustomCarMsg::updateMiddleSwitch20);
    connect(worker, &CustomCarMsgWorker::middleSwitch21Changed, this, &CustomCarMsg::updateMiddleSwitch21);
    connect(worker, &CustomCarMsgWorker::middleSwitch22Changed, this, &CustomCarMsg::updateMiddleSwitch22);
    connect(worker, &CustomCarMsgWorker::middleSwitch23Changed, this, &CustomCarMsg::updateMiddleSwitch23);
    connect(worker, &CustomCarMsgWorker::middleSwitch24Changed, this, &CustomCarMsg::updateMiddleSwitch24);
    connect(worker, &CustomCarMsgWorker::middleSwitch25Changed, this, &CustomCarMsg::updateMiddleSwitch25);
    connect(worker, &CustomCarMsgWorker::middleSwitch26Changed, this, &CustomCarMsg::updateMiddleSwitch26);
    connect(worker, &CustomCarMsgWorker::middleSwitch27Changed, this, &CustomCarMsg::updateMiddleSwitch27);
    connect(worker, &CustomCarMsgWorker::middleSwitch28Changed, this, &CustomCarMsg::updateMiddleSwitch28);
    connect(worker, &CustomCarMsgWorker::middleSwitch29Changed, this, &CustomCarMsg::updateMiddleSwitch29);
    connect(worker, &CustomCarMsgWorker::middleSwitch30Changed, this, &CustomCarMsg::updateMiddleSwitch30);
    connect(worker, &CustomCarMsgWorker::middleSwitch31Changed, this, &CustomCarMsg::updateMiddleSwitch31);
    connect(worker, &CustomCarMsgWorker::middleSwitch32Changed, this, &CustomCarMsg::updateMiddleSwitch32);

    connect(worker, &CustomCarMsgWorker::middleSwitch33Changed, this, &CustomCarMsg::updateMiddleSwitch33);
    connect(worker, &CustomCarMsgWorker::middleSwitch34Changed, this, &CustomCarMsg::updateMiddleSwitch34);
    connect(worker, &CustomCarMsgWorker::middleSwitch35Changed, this, &CustomCarMsg::updateMiddleSwitch35);
    connect(worker, &CustomCarMsgWorker::middleSwitch36Changed, this, &CustomCarMsg::updateMiddleSwitch36);
    connect(worker, &CustomCarMsgWorker::middleSwitch37Changed, this, &CustomCarMsg::updateMiddleSwitch37);
    connect(worker, &CustomCarMsgWorker::middleSwitch38Changed, this, &CustomCarMsg::updateMiddleSwitch38);
    connect(worker, &CustomCarMsgWorker::middleSwitch39Changed, this, &CustomCarMsg::updateMiddleSwitch39);
    connect(worker, &CustomCarMsgWorker::middleSwitch40Changed, this, &CustomCarMsg::updateMiddleSwitch40);
    connect(worker, &CustomCarMsgWorker::middleSwitch41Changed, this, &CustomCarMsg::updateMiddleSwitch41);
    connect(worker, &CustomCarMsgWorker::middleSwitch42Changed, this, &CustomCarMsg::updateMiddleSwitch42);

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

    connect(worker, &CustomCarMsgWorker::backSwitch17Changed, this, &CustomCarMsg::updateBackSwitch17);
    connect(worker, &CustomCarMsgWorker::backSwitch18Changed, this, &CustomCarMsg::updateBackSwitch18);
    connect(worker, &CustomCarMsgWorker::backSwitch19Changed, this, &CustomCarMsg::updateBackSwitch19);
    connect(worker, &CustomCarMsgWorker::backSwitch20Changed, this, &CustomCarMsg::updateBackSwitch20);
    connect(worker, &CustomCarMsgWorker::backSwitch21Changed, this, &CustomCarMsg::updateBackSwitch21);
    connect(worker, &CustomCarMsgWorker::backSwitch22Changed, this, &CustomCarMsg::updateBackSwitch22);
    connect(worker, &CustomCarMsgWorker::backSwitch23Changed, this, &CustomCarMsg::updateBackSwitch23);
    connect(worker, &CustomCarMsgWorker::backSwitch24Changed, this, &CustomCarMsg::updateBackSwitch24);
    connect(worker, &CustomCarMsgWorker::backSwitch25Changed, this, &CustomCarMsg::updateBackSwitch25);
    connect(worker, &CustomCarMsgWorker::backSwitch26Changed, this, &CustomCarMsg::updateBackSwitch26);
    connect(worker, &CustomCarMsgWorker::backSwitch27Changed, this, &CustomCarMsg::updateBackSwitch27);
    connect(worker, &CustomCarMsgWorker::backSwitch28Changed, this, &CustomCarMsg::updateBackSwitch28);
    connect(worker, &CustomCarMsgWorker::backSwitch29Changed, this, &CustomCarMsg::updateBackSwitch29);
    connect(worker, &CustomCarMsgWorker::backSwitch30Changed, this, &CustomCarMsg::updateBackSwitch30);
    connect(worker, &CustomCarMsgWorker::backSwitch31Changed, this, &CustomCarMsg::updateBackSwitch31);
    connect(worker, &CustomCarMsgWorker::backSwitch32Changed, this, &CustomCarMsg::updateBackSwitch32);

    connect(worker, &CustomCarMsgWorker::backSwitch33Changed, this, &CustomCarMsg::updateBackSwitch33);
    connect(worker, &CustomCarMsgWorker::backSwitch34Changed, this, &CustomCarMsg::updateBackSwitch34);
    connect(worker, &CustomCarMsgWorker::backSwitch35Changed, this, &CustomCarMsg::updateBackSwitch35);
    connect(worker, &CustomCarMsgWorker::backSwitch36Changed, this, &CustomCarMsg::updateBackSwitch36);
    connect(worker, &CustomCarMsgWorker::backSwitch37Changed, this, &CustomCarMsg::updateBackSwitch37);
    connect(worker, &CustomCarMsgWorker::backSwitch38Changed, this, &CustomCarMsg::updateBackSwitch38);
    connect(worker, &CustomCarMsgWorker::backSwitch39Changed, this, &CustomCarMsg::updateBackSwitch39);
    connect(worker, &CustomCarMsgWorker::backSwitch40Changed, this, &CustomCarMsg::updateBackSwitch40);
    connect(worker, &CustomCarMsgWorker::backSwitch41Changed, this, &CustomCarMsg::updateBackSwitch41);
    connect(worker, &CustomCarMsgWorker::backSwitch42Changed, this, &CustomCarMsg::updateBackSwitch42);

    connect(worker, &CustomCarMsgWorker::warning01Changed, this, &CustomCarMsg::updateWarning01);
    connect(worker, &CustomCarMsgWorker::warning02Changed, this, &CustomCarMsg::updateWarning02);
    connect(worker, &CustomCarMsgWorker::warning03Changed, this, &CustomCarMsg::updateWarning03);
    connect(worker, &CustomCarMsgWorker::warning04Changed, this, &CustomCarMsg::updateWarning04);
    connect(worker, &CustomCarMsgWorker::warning05Changed, this, &CustomCarMsg::updateWarning05);
    connect(worker, &CustomCarMsgWorker::warning06Changed, this, &CustomCarMsg::updateWarning06);
    connect(worker, &CustomCarMsgWorker::warning07Changed, this, &CustomCarMsg::updateWarning07);
    connect(worker, &CustomCarMsgWorker::warning08Changed, this, &CustomCarMsg::updateWarning08);
    connect(worker, &CustomCarMsgWorker::warning09Changed, this, &CustomCarMsg::updateWarning09);
    connect(worker, &CustomCarMsgWorker::warning10Changed, this, &CustomCarMsg::updateWarning10);
    connect(worker, &CustomCarMsgWorker::warning11Changed, this, &CustomCarMsg::updateWarning11);
    connect(worker, &CustomCarMsgWorker::warning12Changed, this, &CustomCarMsg::updateWarning12);
    connect(worker, &CustomCarMsgWorker::warning13Changed, this, &CustomCarMsg::updateWarning13);
    connect(worker, &CustomCarMsgWorker::warning14Changed, this, &CustomCarMsg::updateWarning14);
    connect(worker, &CustomCarMsgWorker::warning15Changed, this, &CustomCarMsg::updateWarning15);
    connect(worker, &CustomCarMsgWorker::warning16Changed, this, &CustomCarMsg::updateWarning16);
    connect(worker, &CustomCarMsgWorker::warning17Changed, this, &CustomCarMsg::updateWarning17);
    connect(worker, &CustomCarMsgWorker::warning18Changed, this, &CustomCarMsg::updateWarning18);
    connect(worker, &CustomCarMsgWorker::warning19Changed, this, &CustomCarMsg::updateWarning19);
    connect(worker, &CustomCarMsgWorker::warning20Changed, this, &CustomCarMsg::updateWarning20);
    connect(worker, &CustomCarMsgWorker::warning21Changed, this, &CustomCarMsg::updateWarning21);
    connect(worker, &CustomCarMsgWorker::warning22Changed, this, &CustomCarMsg::updateWarning22);
    connect(worker, &CustomCarMsgWorker::warning23Changed, this, &CustomCarMsg::updateWarning23);
    connect(worker, &CustomCarMsgWorker::warning24Changed, this, &CustomCarMsg::updateWarning24);
    connect(worker, &CustomCarMsgWorker::warning25Changed, this, &CustomCarMsg::updateWarning25);
    connect(worker, &CustomCarMsgWorker::warning26Changed, this, &CustomCarMsg::updateWarning26);
    connect(worker, &CustomCarMsgWorker::warning27Changed, this, &CustomCarMsg::updateWarning27);
    connect(worker, &CustomCarMsgWorker::warning28Changed, this, &CustomCarMsg::updateWarning28);
    connect(worker, &CustomCarMsgWorker::warning29Changed, this, &CustomCarMsg::updateWarning29);
    connect(worker, &CustomCarMsgWorker::warning30Changed, this, &CustomCarMsg::updateWarning30);
    connect(worker, &CustomCarMsgWorker::warning31Changed, this, &CustomCarMsg::updateWarning31);
    connect(worker, &CustomCarMsgWorker::warning32Changed, this, &CustomCarMsg::updateWarning32);
    connect(worker, &CustomCarMsgWorker::warning33Changed, this, &CustomCarMsg::updateWarning33);
    connect(worker, &CustomCarMsgWorker::warning34Changed, this, &CustomCarMsg::updateWarning34);
    connect(worker, &CustomCarMsgWorker::warning35Changed, this, &CustomCarMsg::updateWarning35);
    connect(worker, &CustomCarMsgWorker::warning36Changed, this, &CustomCarMsg::updateWarning36);
    connect(worker, &CustomCarMsgWorker::warning37Changed, this, &CustomCarMsg::updateWarning37);
    connect(worker, &CustomCarMsgWorker::warning38Changed, this, &CustomCarMsg::updateWarning38);
    connect(worker, &CustomCarMsgWorker::warning39Changed, this, &CustomCarMsg::updateWarning39);
    connect(worker, &CustomCarMsgWorker::warning40Changed, this, &CustomCarMsg::updateWarning40);
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

void CustomCarMsg::updateThemeMode(qint8 data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(themeMode, data);
}

void CustomCarMsg::updateDateTime(qint32 data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(dateTime, data);
}

void CustomCarMsg::updateUpgradeMsgId(qint8 data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(upgradeMsgId, data);
}

void CustomCarMsg::updateUpgradeMsgCtx(QString data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(upgradeMsgCtx, data);
}

void CustomCarMsg::updateCarMode(qint8 data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(carMode, data);
}

void CustomCarMsg::updateCarSpeed(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(carSpeed, value);
}

void CustomCarMsg::updateRpm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(rpm, value);
}

void CustomCarMsg::updateTotalVoltage(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(totalVoltage, value);
}

void CustomCarMsg::updateTotalCurrent(int value) {
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

void CustomCarMsg::updateSoc(uint value) {
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

void CustomCarMsg::updateBatMaxChargeCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batMaxChargeCurrent, value);
}

void CustomCarMsg::updateBatMaxDischargeCurrent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batMaxDischargeCurrent, value);
}

void CustomCarMsg::updateBatAverageVoltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batAverageVoltage, value);
}

void CustomCarMsg::updateBatStatus1(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batStatus1, value);
}

void CustomCarMsg::updateBatStatus2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(batStatus2, value);
}

void CustomCarMsg::updateBatStatus3(uint value) {
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

void CustomCarMsg::updateInputCtrl01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl01, value);
}

void CustomCarMsg::updateInputCtrl02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl02, value);
}

void CustomCarMsg::updateInputCtrl03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl03, value);
}

void CustomCarMsg::updateInputCtrl04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl04, value);
}

void CustomCarMsg::updateInputCtrl05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl05, value);
}

void CustomCarMsg::updateInputCtrl06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl06, value);
}

void CustomCarMsg::updateInputCtrl07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl07, value);
}

void CustomCarMsg::updateInputCtrl08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl08, value);
}

void CustomCarMsg::updateInputCtrl09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl09, value);
}

void CustomCarMsg::updateInputCtrl10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl10, value);
}

void CustomCarMsg::updateInputCtrl11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl11, value);
}

void CustomCarMsg::updateInputCtrl12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl12, value);
}

void CustomCarMsg::updateInputCtrl13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl13, value);
}

void CustomCarMsg::updateInputCtrl14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl14, value);
}

void CustomCarMsg::updateInputCtrl15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl15, value);
}

void CustomCarMsg::updateInputCtrl16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl16, value);
}

void CustomCarMsg::updateInputCtrl17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl17, value);
}

void CustomCarMsg::updateInputCtrl18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl18, value);
}

void CustomCarMsg::updateInputCtrl19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl19, value);
}

void CustomCarMsg::updateInputCtrl20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl20, value);
}

void CustomCarMsg::updateInputCtrl21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl21, value);
}

void CustomCarMsg::updateInputCtrl22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl22, value);
}

void CustomCarMsg::updateInputCtrl23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl23, value);
}

void CustomCarMsg::updateInputCtrl24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl24, value);
}

void CustomCarMsg::updateInputCtrl25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl25, value);
}

void CustomCarMsg::updateInputCtrl26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl26, value);
}

void CustomCarMsg::updateInputCtrl27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl27, value);
}

void CustomCarMsg::updateInputCtrl28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl28, value);
}

void CustomCarMsg::updateInputCtrl29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl29, value);
}

void CustomCarMsg::updateInputCtrl30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl30, value);
}

void CustomCarMsg::updateInputCtrl31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl31, value);
}

void CustomCarMsg::updateInputCtrl32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl32, value);
}

void CustomCarMsg::updateInputCtrl33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl33, value);
}

void CustomCarMsg::updateInputCtrl34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl34, value);
}

void CustomCarMsg::updateInputCtrl35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(inputCtrl35, value);
}

void CustomCarMsg::updateLampKeyOn(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampKeyOn, value);
}

void CustomCarMsg::updateLampAirFilter(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAirFilter, value);
}

void CustomCarMsg::updateLampAsr(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAsr, value);
}

void CustomCarMsg::updateLampHighVoltageMaintenance(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHighVoltageMaintenance, value);
}

void CustomCarMsg::updateLampDefroster(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampDefroster, value);
}

void CustomCarMsg::updateLampDryere(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampDryere, value);
}

void CustomCarMsg::updateLampAbs(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAbs, value);
}

void CustomCarMsg::updateLampAc(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampAc, value);
}

void CustomCarMsg::updatePowerSupply(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(powerSupply, value);
}

void CustomCarMsg::updateClimbingMode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(climbingMode, value);
}

void CustomCarMsg::updateDiagnosticMode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(diagnosticMode, value);
}

void CustomCarMsg::updateLampTurnLeft(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampTurnLeft, value);
}

void CustomCarMsg::updateLampTurnRight(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampTurnRight, value);
}

void CustomCarMsg::updateLampDoubleFlash(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampDoubleFlash, value);
}

void CustomCarMsg::updateLampFrontFog(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampFrontFog, value);
}

void CustomCarMsg::updateLampRearFog(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRearFog, value);
}

void CustomCarMsg::updateLampHighBeam(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHighBeam, value);
}

void CustomCarMsg::updateLampHeadLight(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHeadLight, value);
}

void CustomCarMsg::updateLampReverseGear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampReverseGear, value);
}

void CustomCarMsg::updateLampPositionLight(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampPositionLight, value);
}


void CustomCarMsg::updateLampGate1(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampGate1, value);
}

void CustomCarMsg::updateLampGate2(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampGate2, value);
}

void CustomCarMsg::updateLampRearDoorOpen(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRearDoorOpen, value);
}


void CustomCarMsg::updateLampBrake(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampBrake, value);
}

void CustomCarMsg::updateLampParkingBrake(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampParkingBrake, value);
}


void CustomCarMsg::updateLampLeftLowAirPressure(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampLeftLowAirPressure, value);
}

void CustomCarMsg::updateLampRightLowAirPressure(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRightLowAirPressure, value);
}


void CustomCarMsg::updateLampLeftShoeWear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampLeftShoeWear, value);
}

void CustomCarMsg::updateLampRightShoeWear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampRightShoeWear, value);
}


void CustomCarMsg::updateLampChargeConfirm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampChargeConfirm, value);
}

void CustomCarMsg::updateLampBatteryMainContact(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampBatteryMainContact, value);
}


void CustomCarMsg::updateLampWaterTempHigh(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampWaterTempHigh, value);
}

void CustomCarMsg::updateLampWaterLevelLow(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampWaterLevelLow, value);
}


void CustomCarMsg::updateLampLowServiceWl(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampLowServiceWl, value);
}

void CustomCarMsg::updateLampHeavyStopWl(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampHeavyStopWl, value);
}

void CustomCarMsg::updateLampSeriousStopWl(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampSeriousStopWl, value);
}


void CustomCarMsg::updateLampOilLevelLow(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampOilLevelLow, value);
}

void CustomCarMsg::updateLampOilPressureLow(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampOilPressureLow, value);
}

void CustomCarMsg::updateLampEngineFault(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampEngineFault, value);
}

void CustomCarMsg::updateLampMotorOutOfService(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampMotorOutOfService, value);
}

void CustomCarMsg::updateLampMoterFireIgon(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lampMoterFireIgon, value);
}

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


void CustomCarMsg::updateFrontSwitch01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch01, value);
}

void CustomCarMsg::updateFrontSwitch02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch02, value);
}

void CustomCarMsg::updateFrontSwitch03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch03, value);
}

void CustomCarMsg::updateFrontSwitch04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch04, value);
}

void CustomCarMsg::updateFrontSwitch05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch05, value);
}

void CustomCarMsg::updateFrontSwitch06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch06, value);
}

void CustomCarMsg::updateFrontSwitch07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch07, value);
}

void CustomCarMsg::updateFrontSwitch08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch08, value);
}

void CustomCarMsg::updateFrontSwitch09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch09, value);
}

void CustomCarMsg::updateFrontSwitch10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch10, value);
}

void CustomCarMsg::updateFrontSwitch11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch11, value);
}

void CustomCarMsg::updateFrontSwitch12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch12, value);
}

void CustomCarMsg::updateFrontSwitch13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch13, value);
}

void CustomCarMsg::updateFrontSwitch14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch14, value);
}

void CustomCarMsg::updateFrontSwitch15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch15, value);
}

void CustomCarMsg::updateFrontSwitch16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch16, value);
}


void CustomCarMsg::updateFrontSwitch17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch17, value);
}

void CustomCarMsg::updateFrontSwitch18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch18, value);
}

void CustomCarMsg::updateFrontSwitch19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch19, value);
}

void CustomCarMsg::updateFrontSwitch20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch20, value);
}

void CustomCarMsg::updateFrontSwitch21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch21, value);
}

void CustomCarMsg::updateFrontSwitch22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch22, value);
}

void CustomCarMsg::updateFrontSwitch23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch23, value);
}

void CustomCarMsg::updateFrontSwitch24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch24, value);
}

void CustomCarMsg::updateFrontSwitch25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch25, value);
}

void CustomCarMsg::updateFrontSwitch26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch26, value);
}

void CustomCarMsg::updateFrontSwitch27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch27, value);
}

void CustomCarMsg::updateFrontSwitch28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch28, value);
}

void CustomCarMsg::updateFrontSwitch29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch29, value);
}

void CustomCarMsg::updateFrontSwitch30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch30, value);
}

void CustomCarMsg::updateFrontSwitch31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch31, value);
}

void CustomCarMsg::updateFrontSwitch32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch32, value);
}

void CustomCarMsg::updateFrontSwitch33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch33, value);
}

void CustomCarMsg::updateFrontSwitch34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch34, value);
}

void CustomCarMsg::updateFrontSwitch35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch35, value);
}

void CustomCarMsg::updateFrontSwitch36(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch36, value);
}

void CustomCarMsg::updateFrontSwitch37(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch37, value);
}

void CustomCarMsg::updateFrontSwitch38(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch38, value);
}

void CustomCarMsg::updateFrontSwitch39(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch39, value);
}

void CustomCarMsg::updateFrontSwitch40(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch40, value);
}

void CustomCarMsg::updateFrontSwitch41(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch41, value);
}

void CustomCarMsg::updateFrontSwitch42(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(frontSwitch42, value);
}

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


void CustomCarMsg::updateMiddleSwitch01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch01, value);
}

void CustomCarMsg::updateMiddleSwitch02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch02, value);
}

void CustomCarMsg::updateMiddleSwitch03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch03, value);
}

void CustomCarMsg::updateMiddleSwitch04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch04, value);
}

void CustomCarMsg::updateMiddleSwitch05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch05, value);
}

void CustomCarMsg::updateMiddleSwitch06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch06, value);
}

void CustomCarMsg::updateMiddleSwitch07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch07, value);
}

void CustomCarMsg::updateMiddleSwitch08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch08, value);
}

void CustomCarMsg::updateMiddleSwitch09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch09, value);
}

void CustomCarMsg::updateMiddleSwitch10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch10, value);
}

void CustomCarMsg::updateMiddleSwitch11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch11, value);
}

void CustomCarMsg::updateMiddleSwitch12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch12, value);
}

void CustomCarMsg::updateMiddleSwitch13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch13, value);
}

void CustomCarMsg::updateMiddleSwitch14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch14, value);
}

void CustomCarMsg::updateMiddleSwitch15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch15, value);
}

void CustomCarMsg::updateMiddleSwitch16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch16, value);
}

void CustomCarMsg::updateMiddleSwitch17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch17, value);
}

void CustomCarMsg::updateMiddleSwitch18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch18, value);
}

void CustomCarMsg::updateMiddleSwitch19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch19, value);
}

void CustomCarMsg::updateMiddleSwitch20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch20, value);
}

void CustomCarMsg::updateMiddleSwitch21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch21, value);
}

void CustomCarMsg::updateMiddleSwitch22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch22, value);
}

void CustomCarMsg::updateMiddleSwitch23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch23, value);
}

void CustomCarMsg::updateMiddleSwitch24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch24, value);
}

void CustomCarMsg::updateMiddleSwitch25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch25, value);
}

void CustomCarMsg::updateMiddleSwitch26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch26, value);
}

void CustomCarMsg::updateMiddleSwitch27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch27, value);
}

void CustomCarMsg::updateMiddleSwitch28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch28, value);
}

void CustomCarMsg::updateMiddleSwitch29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch29, value);
}

void CustomCarMsg::updateMiddleSwitch30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch30, value);
}

void CustomCarMsg::updateMiddleSwitch31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch31, value);
}

void CustomCarMsg::updateMiddleSwitch32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch32, value);
}

void CustomCarMsg::updateMiddleSwitch33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch33, value);
}

void CustomCarMsg::updateMiddleSwitch34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch34, value);
}

void CustomCarMsg::updateMiddleSwitch35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch35, value);
}

void CustomCarMsg::updateMiddleSwitch36(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch36, value);
}

void CustomCarMsg::updateMiddleSwitch37(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch37, value);
}

void CustomCarMsg::updateMiddleSwitch38(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch38, value);
}

void CustomCarMsg::updateMiddleSwitch39(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch39, value);
}

void CustomCarMsg::updateMiddleSwitch40(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch40, value);
}

void CustomCarMsg::updateMiddleSwitch41(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch41, value);
}

void CustomCarMsg::updateMiddleSwitch42(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middleSwitch42, value);
}

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


void CustomCarMsg::updateBackSwitch01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch01, value);
}

void CustomCarMsg::updateBackSwitch02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch02, value);
}

void CustomCarMsg::updateBackSwitch03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch03, value);
}

void CustomCarMsg::updateBackSwitch04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch04, value);
}

void CustomCarMsg::updateBackSwitch05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch05, value);
}

void CustomCarMsg::updateBackSwitch06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch06, value);
}

void CustomCarMsg::updateBackSwitch07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch07, value);
}

void CustomCarMsg::updateBackSwitch08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch08, value);
}

void CustomCarMsg::updateBackSwitch09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch09, value);
}

void CustomCarMsg::updateBackSwitch10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch10, value);
}

void CustomCarMsg::updateBackSwitch11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch11, value);
}

void CustomCarMsg::updateBackSwitch12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch12, value);
}

void CustomCarMsg::updateBackSwitch13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch13, value);
}

void CustomCarMsg::updateBackSwitch14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch14, value);
}

void CustomCarMsg::updateBackSwitch15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch15, value);
}

void CustomCarMsg::updateBackSwitch16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch16, value);
}


void CustomCarMsg::updateBackSwitch17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch17, value);
}

void CustomCarMsg::updateBackSwitch18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch18, value);
}

void CustomCarMsg::updateBackSwitch19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch19, value);
}

void CustomCarMsg::updateBackSwitch20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch20, value);
}

void CustomCarMsg::updateBackSwitch21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch21, value);
}

void CustomCarMsg::updateBackSwitch22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch22, value);
}

void CustomCarMsg::updateBackSwitch23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch23, value);
}

void CustomCarMsg::updateBackSwitch24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch24, value);
}

void CustomCarMsg::updateBackSwitch25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch25, value);
}

void CustomCarMsg::updateBackSwitch26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch26, value);
}

void CustomCarMsg::updateBackSwitch27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch27, value);
}

void CustomCarMsg::updateBackSwitch28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch28, value);
}

void CustomCarMsg::updateBackSwitch29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch29, value);
}

void CustomCarMsg::updateBackSwitch30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch30, value);
}

void CustomCarMsg::updateBackSwitch31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch31, value);
}

void CustomCarMsg::updateBackSwitch32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch32, value);
}


void CustomCarMsg::updateBackSwitch33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch33, value);
}

void CustomCarMsg::updateBackSwitch34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch34, value);
}

void CustomCarMsg::updateBackSwitch35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch35, value);
}

void CustomCarMsg::updateBackSwitch36(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch36, value);
}

void CustomCarMsg::updateBackSwitch37(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch37, value);
}

void CustomCarMsg::updateBackSwitch38(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch38, value);
}

void CustomCarMsg::updateBackSwitch39(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch39, value);
}

void CustomCarMsg::updateBackSwitch40(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch40, value);
}

void CustomCarMsg::updateBackSwitch41(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch41, value);
}

void CustomCarMsg::updateBackSwitch42(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(backSwitch42, value);
}

void CustomCarMsg::updateWarning01(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning01, value);
}

void CustomCarMsg::updateWarning02(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning02, value);
}

void CustomCarMsg::updateWarning03(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning03, value);
}

void CustomCarMsg::updateWarning04(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning04, value);
}

void CustomCarMsg::updateWarning05(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning05, value);
}

void CustomCarMsg::updateWarning06(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning06, value);
}

void CustomCarMsg::updateWarning07(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning07, value);
}

void CustomCarMsg::updateWarning08(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning08, value);
}

void CustomCarMsg::updateWarning09(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning09, value);
}

void CustomCarMsg::updateWarning10(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning10, value);
}

void CustomCarMsg::updateWarning11(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning11, value);
}

void CustomCarMsg::updateWarning12(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning12, value);
}

void CustomCarMsg::updateWarning13(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning13, value);
}

void CustomCarMsg::updateWarning14(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning14, value);
}

void CustomCarMsg::updateWarning15(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning15, value);
}

void CustomCarMsg::updateWarning16(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning16, value);
}

void CustomCarMsg::updateWarning17(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning17, value);
}

void CustomCarMsg::updateWarning18(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning18, value);
}

void CustomCarMsg::updateWarning19(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning19, value);
}

void CustomCarMsg::updateWarning20(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning20, value);
}

void CustomCarMsg::updateWarning21(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning21, value);
}

void CustomCarMsg::updateWarning22(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning22, value);
}

void CustomCarMsg::updateWarning23(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning23, value);
}

void CustomCarMsg::updateWarning24(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning24, value);
}

void CustomCarMsg::updateWarning25(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning25, value);
}

void CustomCarMsg::updateWarning26(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning26, value);
}

void CustomCarMsg::updateWarning27(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning27, value);
}

void CustomCarMsg::updateWarning28(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning28, value);
}

void CustomCarMsg::updateWarning29(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning29, value);
}

void CustomCarMsg::updateWarning30(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning30, value);
}

void CustomCarMsg::updateWarning31(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning31, value);
}

void CustomCarMsg::updateWarning32(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning32, value);
}

void CustomCarMsg::updateWarning33(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning33, value);
}

void CustomCarMsg::updateWarning34(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning34, value);
}

void CustomCarMsg::updateWarning35(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning35, value);
}

void CustomCarMsg::updateWarning36(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning36, value);
}

void CustomCarMsg::updateWarning37(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning37, value);
}

void CustomCarMsg::updateWarning38(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning38, value);
}

void CustomCarMsg::updateWarning39(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning39, value);
}

void CustomCarMsg::updateWarning40(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning40, value);
}

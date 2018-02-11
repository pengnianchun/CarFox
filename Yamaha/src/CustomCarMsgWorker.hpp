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
    void themeModeChanged(qint8 themeNo);
    void dateTimeChanged(qint32 dateTime);
    void upgradeMsgIdChanged(qint8 upgradeMsgId);
    void upgradeMsgCtxChanged(QString upgradeMsgCtx);
    void carModeChanged(qint8 modeNo);

    void carSpeedChanged(int value);
    void rpmChanged(int value);
    void totalVoltageChanged(int value);
    void totalCurrentChanged(int value);
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

    void engineFuelConsumptionChanged(float value);
    void engineLoadChanged(float value);
    void engineTargetThrottleChanged(float value);
    void engineActualThrottleChanged(float value);
    void engineInletTemperatureChanged(int value);

    void oilPumpDcacWoutputCurrentChanged(float value);
    void oilPumpDcacVoutputCurrentChanged(float value);
    void oilPumpDcacUoutputCurrentChanged(float value);
    void radiatorTemperatureChanged(int value);

    void actualClutchPositionChanged(int value);
    void tcuFaultCodeChanged(uint value);
    void axisRpmChanged(int value);
    void fmiChanged(int value);
    void cmChanged(int value);
    void ocChanged(uint value);

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

    void batVoltageChanged(QVariantMap value);
    void batTempChanged(QVariantMap value);

    void acFaultCodeChanged(uint value);
    void acFanStatusChanged(uint value);
    void acWorkStatusChanged(uint value);
    void acLifeChanged(uint value);
    void acOutTempChanged(int value);
    void acInTempChanged(int value);
    void acSetTempChanged(int value);
    void acRefrigereReqChanged(uint value);

    void inputCtrl01Changed(int value);
    void inputCtrl02Changed(int value);
    void inputCtrl03Changed(int value);
    void inputCtrl04Changed(int value);
    void inputCtrl05Changed(int value);
    void inputCtrl06Changed(int value);
    void inputCtrl07Changed(int value);
    void inputCtrl08Changed(int value);
    void inputCtrl09Changed(int value);
    void inputCtrl10Changed(int value);
    void inputCtrl11Changed(int value);
    void inputCtrl12Changed(int value);
    void inputCtrl13Changed(int value);
    void inputCtrl14Changed(int value);
    void inputCtrl15Changed(int value);
    void inputCtrl16Changed(int value);
    void inputCtrl17Changed(int value);
    void inputCtrl18Changed(int value);
    void inputCtrl19Changed(int value);
    void inputCtrl20Changed(int value);
    void inputCtrl21Changed(int value);
    void inputCtrl22Changed(int value);
    void inputCtrl23Changed(int value);
    void inputCtrl24Changed(int value);
    void inputCtrl25Changed(int value);
    void inputCtrl26Changed(int value);
    void inputCtrl27Changed(int value);
    void inputCtrl28Changed(int value);
    void inputCtrl29Changed(int value);
    void inputCtrl30Changed(int value);
    void inputCtrl31Changed(int value);
    void inputCtrl32Changed(int value);
    void inputCtrl33Changed(int value);
    void inputCtrl34Changed(int value);
    void inputCtrl35Changed(int value);

    void lampKeyOnChanged(int value);
    void lampAirFilterChanged(int value);
    void lampAsrChanged(int value);
    void lampHighVoltageMaintenanceChanged(int value);
    void lampDefrosterChanged(int value);
    void lampDryereChanged(int value);
    void lampAbsChanged(int value);
    void lampAcChanged(int value);
    void powerSupplyChanged(QString value);
    void climbingModeChanged(int value);
    void diagnosticModeChanged(int value);

    void lampTurnLeftChanged(int value);
    void lampTurnRightChanged(int value);

    void lampDoubleFlashChanged(int value);
    void lampFrontFogChanged(int value);
    void lampRearFogChanged(int value);
    void lampHighBeamChanged(int value);
    void lampHeadLightChanged(int value);
    void lampReverseGearChanged(int value);
    void lampPositionLightChanged(int value);

    void lampGate1Changed(int value);
    void lampGate2Changed(int value);
    void lampRearDoorOpenChanged(int value);

    void lampBrakeChanged(int value);
    void lampParkingBrakeChanged(int value);

    void lampLeftLowAirPressureChanged(int value);
    void lampRightLowAirPressureChanged(int value);

    void lampLeftShoeWearChanged(int value);
    void lampRightShoeWearChanged(int value);

    void lampChargeConfirmChanged(int value);
    void lampBatteryMainContactChanged(int value);

    void lampWaterTempHighChanged(int value);
    void lampWaterLevelLowChanged(int value);

    void lampLowServiceWlChanged(int value);
    void lampHeavyStopWlChanged(int value);
    void lampSeriousStopWlChanged(int value);

    void lampOilLevelLowChanged(int value);
    void lampOilPressureLowChanged(int value);
    void lampEngineFaultChanged(int value);

    void lampMotorOutOfServiceChanged(int value);
    void lampMoterFireIgonChanged(int value);

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

    void frontSwitch01Changed(int value);
    void frontSwitch02Changed(int value);
    void frontSwitch03Changed(int value);
    void frontSwitch04Changed(int value);
    void frontSwitch05Changed(int value);
    void frontSwitch06Changed(int value);
    void frontSwitch07Changed(int value);
    void frontSwitch08Changed(int value);
    void frontSwitch09Changed(int value);
    void frontSwitch10Changed(int value);
    void frontSwitch11Changed(int value);
    void frontSwitch12Changed(int value);
    void frontSwitch13Changed(int value);
    void frontSwitch14Changed(int value);
    void frontSwitch15Changed(int value);
    void frontSwitch16Changed(int value);

    void frontSwitch17Changed(int value);
    void frontSwitch18Changed(int value);
    void frontSwitch19Changed(int value);
    void frontSwitch20Changed(int value);
    void frontSwitch21Changed(int value);
    void frontSwitch22Changed(int value);
    void frontSwitch23Changed(int value);
    void frontSwitch24Changed(int value);
    void frontSwitch25Changed(int value);
    void frontSwitch26Changed(int value);
    void frontSwitch27Changed(int value);
    void frontSwitch28Changed(int value);
    void frontSwitch29Changed(int value);
    void frontSwitch30Changed(int value);
    void frontSwitch31Changed(int value);
    void frontSwitch32Changed(int value);

    void frontSwitch33Changed(int value);
    void frontSwitch34Changed(int value);
    void frontSwitch35Changed(int value);
    void frontSwitch36Changed(int value);
    void frontSwitch37Changed(int value);
    void frontSwitch38Changed(int value);
    void frontSwitch39Changed(int value);
    void frontSwitch40Changed(int value);
    void frontSwitch41Changed(int value);
    void frontSwitch42Changed(int value);

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

    void middleSwitch01Changed(int value);
    void middleSwitch02Changed(int value);
    void middleSwitch03Changed(int value);
    void middleSwitch04Changed(int value);
    void middleSwitch05Changed(int value);
    void middleSwitch06Changed(int value);
    void middleSwitch07Changed(int value);
    void middleSwitch08Changed(int value);
    void middleSwitch09Changed(int value);
    void middleSwitch10Changed(int value);
    void middleSwitch11Changed(int value);
    void middleSwitch12Changed(int value);
    void middleSwitch13Changed(int value);
    void middleSwitch14Changed(int value);
    void middleSwitch15Changed(int value);
    void middleSwitch16Changed(int value);

    void middleSwitch17Changed(int value);
    void middleSwitch18Changed(int value);
    void middleSwitch19Changed(int value);
    void middleSwitch20Changed(int value);
    void middleSwitch21Changed(int value);
    void middleSwitch22Changed(int value);
    void middleSwitch23Changed(int value);
    void middleSwitch24Changed(int value);
    void middleSwitch25Changed(int value);
    void middleSwitch26Changed(int value);
    void middleSwitch27Changed(int value);
    void middleSwitch28Changed(int value);
    void middleSwitch29Changed(int value);
    void middleSwitch30Changed(int value);
    void middleSwitch31Changed(int value);
    void middleSwitch32Changed(int value);

    void middleSwitch33Changed(int value);
    void middleSwitch34Changed(int value);
    void middleSwitch35Changed(int value);
    void middleSwitch36Changed(int value);
    void middleSwitch37Changed(int value);
    void middleSwitch38Changed(int value);
    void middleSwitch39Changed(int value);
    void middleSwitch40Changed(int value);
    void middleSwitch41Changed(int value);
    void middleSwitch42Changed(int value);

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

    void backSwitch01Changed(int value);
    void backSwitch02Changed(int value);
    void backSwitch03Changed(int value);
    void backSwitch04Changed(int value);
    void backSwitch05Changed(int value);
    void backSwitch06Changed(int value);
    void backSwitch07Changed(int value);
    void backSwitch08Changed(int value);
    void backSwitch09Changed(int value);
    void backSwitch10Changed(int value);
    void backSwitch11Changed(int value);
    void backSwitch12Changed(int value);
    void backSwitch13Changed(int value);
    void backSwitch14Changed(int value);
    void backSwitch15Changed(int value);
    void backSwitch16Changed(int value);

    void backSwitch17Changed(int value);
    void backSwitch18Changed(int value);
    void backSwitch19Changed(int value);
    void backSwitch20Changed(int value);
    void backSwitch21Changed(int value);
    void backSwitch22Changed(int value);
    void backSwitch23Changed(int value);
    void backSwitch24Changed(int value);
    void backSwitch25Changed(int value);
    void backSwitch26Changed(int value);
    void backSwitch27Changed(int value);
    void backSwitch28Changed(int value);
    void backSwitch29Changed(int value);
    void backSwitch30Changed(int value);
    void backSwitch31Changed(int value);
    void backSwitch32Changed(int value);

    void backSwitch33Changed(int value);
    void backSwitch34Changed(int value);
    void backSwitch35Changed(int value);
    void backSwitch36Changed(int value);
    void backSwitch37Changed(int value);
    void backSwitch38Changed(int value);
    void backSwitch39Changed(int value);
    void backSwitch40Changed(int value);
    void backSwitch41Changed(int value);
    void backSwitch42Changed(int value);

    void warning01Changed(QString value);
    void warning02Changed(QString value);
    void warning03Changed(QString value);
    void warning04Changed(QString value);
    void warning05Changed(QString value);
    void warning06Changed(QString value);
    void warning07Changed(QString value);
    void warning08Changed(QString value);
    void warning09Changed(QString value);
    void warning10Changed(QString value);
    void warning11Changed(QString value);
    void warning12Changed(QString value);
    void warning13Changed(QString value);
    void warning14Changed(QString value);
    void warning15Changed(QString value);
    void warning16Changed(QString value);
    void warning17Changed(QString value);
    void warning18Changed(QString value);
    void warning19Changed(QString value);
    void warning20Changed(QString value);
    void warning21Changed(QString value);
    void warning22Changed(QString value);
    void warning23Changed(QString value);
    void warning24Changed(QString value);
    void warning25Changed(QString value);
    void warning26Changed(QString value);
    void warning27Changed(QString value);
    void warning28Changed(QString value);
    void warning29Changed(QString value);
    void warning30Changed(QString value);
    void warning31Changed(QString value);
    void warning32Changed(QString value);
    void warning33Changed(QString value);
    void warning34Changed(QString value);
    void warning35Changed(QString value);
    void warning36Changed(QString value);
    void warning37Changed(QString value);
    void warning38Changed(QString value);
    void warning39Changed(QString value);
    void warning40Changed(QString value);

protected:
     virtual void registerCallback();

private:

    void handleProtoKey(const carfox::MessagePtr& msg);
    void handleProtoAutoFlash(const carfox::MessagePtr& msg);
    void handleGeneralInfoFrame(const carfox::MessagePtr& msg);

    void handleProtoDatetime(const carfox::MessagePtr &msg);
    void handleProtoUpgradeNotify(const carfox::MessagePtr &msg);
    void handleProtoInstrumentFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoFontMoudleFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoMiddleMoudleFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoBackMoudleFrameInfo(const carfox::MessagePtr &msg);
    void handleProtoWarningFrameInfo(const carfox::MessagePtr &msg);

    void handleProtoControlSystemMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoMoterSystemMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoAuxiliarySystemMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoTcuSystemMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoBatteryManageSystemMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoBatteryGroupVoltageMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoBatteryGroupTemperatureMenuInfo(const carfox::MessagePtr &msg);
    void handleProtoAirCtrlSystemMenuInfo(const carfox::MessagePtr &msg);

    void handleProtoSymbolLampMiscLampInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampCorneringInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampLightInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampGateInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampBrakeInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampAirPressureInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampShoeWearInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampChargingInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampWaterInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampStopInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampMoterInfo(const carfox::MessagePtr &msg);
    void handleProtoSymbolLampDynamotorInfo(const carfox::MessagePtr &msg);

private:
    CarMsgWorkerStateData mStateData;
    std::shared_ptr<KeyManager> mKeyManager;
    std::shared_ptr<ThemeConfig> mThemeConfig;
    QVariantMap mBatVoltageData;
    QVariantMap mBatTempData;
};

#pragma once

#include <CarMsgWorker.hpp>
#include "KeyManager.hpp"
#include "ThemeConfig.hpp"
#include "CustomCarMsgWorkerData.hpp"

#include "airctrl_system_frame.pb.h"
#include "auxiliary_system_frame.pb.h"
#include "battery_group_temperature_frame.pb.h"
#include "battery_group_voltage_frame.pb.h"
#include "battery_manage_system_frame.pb.h"
#include "control_system_frame.pb.h"
#include "settings.pb.h"
#include "general_info_frame.pb.h"
#include "instrument_frame.pb.h"
#include "key.pb.h"
#include "menu_num.pb.h"
#include "module_back_frame.pb.h"
#include "module_front_frame.pb.h"
#include "module_middle_frame.pb.h"
#include "moter_system_frame.pb.h"
#include "tcu_system_frame.pb.h"
#include "warning_frame.pb.h"


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

signals:
    // 上行帧 Worker to Msg
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);
    void themeModeChanged(qint8 themeNo);
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
    void moter_control_tempChanged(int value);
    void moter_tempChanged(int value);
    void batteryChanged(int value);
    void spnChanged(int value);
    void engine_water_tempChanged(int value);
    void urea_levelChanged(int value);
    void fault_levelChanged(uint value);
    void fault_codeChanged(int value);
    void oil_levelChanged(uint value);
    void engine_oil_pressureChanged(float value);

    void motor_in_voltageChanged(float value);
    void motor_in_currentChanged(float value);
    void motor_tempChanged(int value);
    void motor_controller_tempChanged(int value);
    void car_modeChanged(int value);
    void versionChanged(double value);
    void car_lifeChanged(int value);
    void accel_pedal_percentChanged(float value);
    void brake_pedal_percentChanged(float value);
    void din1Changed(uint value);
    void din2Changed(uint value);
    void din3Changed(uint value);
    void dout1Changed(uint value);
    void dout2Changed(uint value);
    void dout3Changed(uint value);

    void engine_fuel_consumptionChanged(float value);
    void engine_loadChanged(float value);
    void engine_target_throttleChanged(float value);
    void engine_actual_throttleChanged(float value);
    void engine_inlet_temperatureChanged(int value);

    void oil_pump_dcac_w_output_currentChanged(float value);
    void oil_pump_dcac_v_output_currentChanged(float value);
    void oil_pump_dcac_u_output_currentChanged(float value);
    void radiator_temperatureChanged(int value);

    void actual_clutch_positionChanged(int value);
    void tcu_fault_codeChanged(uint value);
    void axis_rpmChanged(int value);
    void fmiChanged(int value);
    void cmChanged(int value);
    void ocChanged(uint value);

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
};

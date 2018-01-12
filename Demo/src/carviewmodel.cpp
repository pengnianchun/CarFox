#include "carviewmodel.h"

CarViewModel::CarViewModel(QObject *parent): QThread(parent)
{
    initialize();
    this->start();
}

void CarViewModel::run() {
    carMenuControl = new CarMenuControl();
    msgHandle = new CarMessageHandle();

    //菜单信息
    connect(carMenuControl, &CarMenuControl::tripClearChanged, this, &CarViewModel::tripClearUpdate);
    connect(carMenuControl, &CarMenuControl::batNumSetChanged, this, &CarViewModel::batNumSetUpdate);
    connect(carMenuControl, &CarMenuControl::menu_increase, this, &CarViewModel::menu_increase);
    connect(carMenuControl, &CarMenuControl::menu_decrease, this, &CarViewModel::menu_decrease);
    connect(carMenuControl, &CarMenuControl::menu_time_tips, this, &CarViewModel::menu_time_tips);
    connect(carMenuControl, &CarMenuControl::menu_set_theme, this, &CarViewModel::menu_set_theme);
    connect(carMenuControl, &CarMenuControl::menu_L0Changed, this, &CarViewModel::menu_L0Update);
    connect(carMenuControl, &CarMenuControl::menu_L1Changed, this, &CarViewModel::menu_L1Update);
    connect(carMenuControl, &CarMenuControl::menu_L2Changed, this, &CarViewModel::menu_L2Update);
    connect(carMenuControl, &CarMenuControl::menu_L3Changed, this, &CarViewModel::menu_L3Update);
    connect(carMenuControl, &CarMenuControl::menu_L4Changed, this, &CarViewModel::menu_L4Update);
    connect(carMenuControl, &CarMenuControl::menu_L5Changed, this, &CarViewModel::menu_L5Update);
    connect(carMenuControl, &CarMenuControl::menu_L6Changed, this, &CarViewModel::menu_L6Update);
    connect(carMenuControl, &CarMenuControl::menu_L7Changed, this, &CarViewModel::menu_L7Update);
    connect(carMenuControl, &CarMenuControl::menu_L8Changed, this, &CarViewModel::menu_L8Update);
    connect(carMenuControl, &CarMenuControl::menu_TimePosChanged, this, &CarViewModel::menu_TimePosUpdate);
    connect(carMenuControl, &CarMenuControl::menu_DirectionChanged, this, &CarViewModel::menu_DirectionUpdate);
    connect(carMenuControl, &CarMenuControl::menu_SettingsSelectChanged, this, &CarViewModel::menu_SettingsSelectUpdate);
    connect(carMenuControl, &CarMenuControl::menu_ThemeSelectChanged, this, &CarViewModel::menu_ThemeSelectUpdate);

    connect(carMenuControl, &CarMenuControl::upgradeTipsChanged, this, &CarViewModel::upgradeTipsUpdate);
    connect(carMenuControl, &CarMenuControl::progressValueChanged, this, &CarViewModel::progressValueUpdate);
    connect(carMenuControl, &CarMenuControl::notifyMenuInfoRequest, msgHandle, &CarMessageHandle::menuInfoRequest);
    connect(carMenuControl, &CarMenuControl::notifyClearTripRequest, msgHandle, &CarMessageHandle::tripMilesClear);
    connect(carMenuControl, &CarMenuControl::notifyUpgradeStart, msgHandle, &CarMessageHandle::notifyUpgradeStart);
    connect(msgHandle, &CarMessageHandle::notifyUpgradeStatus, carMenuControl, &CarMenuControl::onNotifyUpgradeStatus);
    connect(msgHandle, &CarMessageHandle::dateTimeChanged, this, &CarViewModel::dateTimeUpdate);
    connect(msgHandle, &CarMessageHandle::autoFlashChanged, this, &CarViewModel::autoFlashUpdate);
    connect(this, SIGNAL(notifyEnableKey(bool)), msgHandle, SLOT(onNotifyEnableKey(bool)));
    connect(this, &CarViewModel::setFb1Alpha, msgHandle, &CarMessageHandle::onSetFb1Alpha);
    connect(this, &CarViewModel::dateTimeSet, msgHandle, &CarMessageHandle::datetimeInfoRequest);
    connect(this, &CarViewModel::themeChanged, carMenuControl, &CarMenuControl::onNotifyResetStatus);
    connect(this, &CarViewModel::resetStateChanged, this, &CarViewModel::onNotifyResetStatus);

    /* 主界面信息*/
    connect(msgHandle, &CarMessageHandle::speedChanged, this, &CarViewModel::speedUpdate);
    connect(msgHandle, &CarMessageHandle::rpmChanged, this, &CarViewModel::rpmUpdate);
    connect(msgHandle, &CarMessageHandle::totalVoltageChanged, this, &CarViewModel::totalVoltageUpdate);
    connect(msgHandle, &CarMessageHandle::totalCurrentChanged, this, &CarViewModel::totalCurrentUpdate);
    connect(msgHandle, &CarMessageHandle::gearChanged, this, &CarViewModel::gearUpdate);
    connect(msgHandle, &CarMessageHandle::odoChanged, this, &CarViewModel::odoUpdate);
    connect(msgHandle, &CarMessageHandle::tripChanged, this, &CarViewModel::tripUpdate);
    connect(msgHandle, &CarMessageHandle::socChanged, this, &CarViewModel::socUpdate);
    connect(msgHandle, &CarMessageHandle::apVol1Changed, this, &CarViewModel::apVol1Update);
    connect(msgHandle, &CarMessageHandle::apVol2Changed, this, &CarViewModel::apVol2Update);
    connect(msgHandle, &CarMessageHandle::moter_control_tempChanged, this, &CarViewModel::moter_control_tempUpdate);
    connect(msgHandle, &CarMessageHandle::moter_tempChanged, this, &CarViewModel::moter_tempUpdate);
    connect(msgHandle, &CarMessageHandle::fault_levelChanged, this, &CarViewModel::fault_levelUpdate);
    connect(msgHandle, &CarMessageHandle::fault_codeChanged, this, &CarViewModel::fault_codeUpdate);
    connect(msgHandle, &CarMessageHandle::SPNChanged, this, &CarViewModel::SPNUpdate);
    connect(msgHandle, &CarMessageHandle::urea_levelChanged, this, &CarViewModel::urea_levelUpdate);
    connect(msgHandle, &CarMessageHandle::batteryChanged, this, &CarViewModel::batteryUpdate);
    connect(msgHandle, &CarMessageHandle::oil_levelChanged, this, &CarViewModel::oil_levelUpdate);

    /* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::motor_in_voltageChanged, this, &CarViewModel::motor_in_voltageUpdate);
    connect(msgHandle, &CarMessageHandle::motor_in_currentChanged, this, &CarViewModel::motor_in_currentUpdate);
    connect(msgHandle, &CarMessageHandle::motor_tempChanged, this, &CarViewModel::motor_tempUpdate);
    connect(msgHandle, &CarMessageHandle::motor_controller_tempChanged, this, &CarViewModel::motor_controller_tempUpdate);
    connect(msgHandle, &CarMessageHandle::car_modeChanged, this, &CarViewModel::car_modeUpdate);
    connect(msgHandle, &CarMessageHandle::versionChanged, this, &CarViewModel::versionUpdate);
    connect(msgHandle, &CarMessageHandle::car_LifeChanged, this, &CarViewModel::car_LifeUpdate);
    connect(msgHandle, &CarMessageHandle::accel_pedal_percentChanged, this, &CarViewModel::accel_pedal_percentUpdate);
    connect(msgHandle, &CarMessageHandle::brake_pedal_percentChanged, this, &CarViewModel::brake_pedal_percentUpdate);
    connect(msgHandle, &CarMessageHandle::din1Changed, this, &CarViewModel::din1Update);
    connect(msgHandle, &CarMessageHandle::din2Changed, this, &CarViewModel::din2Update);
    connect(msgHandle, &CarMessageHandle::din3Changed, this, &CarViewModel::din3Update);
    connect(msgHandle, &CarMessageHandle::dout1Changed, this, &CarViewModel::dout1Update);
    connect(msgHandle, &CarMessageHandle::dout2Changed, this, &CarViewModel::dout2Update);
    connect(msgHandle, &CarMessageHandle::dout3Changed, this, &CarViewModel::dout3Update);

    /* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::engine_fuel_consumptionChanged, this, &CarViewModel::engine_fuel_consumptionUpdate);
    connect(msgHandle, &CarMessageHandle::engine_water_tempChanged, this, &CarViewModel::engine_water_tempUpdate);
    connect(msgHandle, &CarMessageHandle::engine_loadChanged, this, &CarViewModel::engine_loadUpdate);
    connect(msgHandle, &CarMessageHandle::engine_target_throttleChanged, this, &CarViewModel::engine_target_throttleUpdate);
    connect(msgHandle, &CarMessageHandle::engine_actual_throttleChanged, this, &CarViewModel::engine_actual_throttleUpdate);
    connect(msgHandle, &CarMessageHandle::engine_oil_pressureChanged, this, &CarViewModel::engine_oil_pressureUpdate);
    connect(msgHandle, &CarMessageHandle::engine_inlet_tempChanged, this, &CarViewModel::engine_inlet_tempUpdate);

    /* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::oilpump_dcac_w_output_currentChanged, this, &CarViewModel::oilpump_dcac_w_output_currentUpdate);
    connect(msgHandle, &CarMessageHandle::oilpump_dcac_v_output_currentChanged, this, &CarViewModel::oilpump_dcac_v_output_currentUpdate);
    connect(msgHandle, &CarMessageHandle::oilpump_dcac_u_output_currentChanged, this, &CarViewModel::oilpump_dcac_u_output_currentUpdate);
    connect(msgHandle, &CarMessageHandle::radiator_tempChanged, this, &CarViewModel::radiator_tempUpdate);

    /* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::actual_clutch_positionChanged, this, &CarViewModel::actual_clutch_positionUpdate);
    connect(msgHandle, &CarMessageHandle::TCU_fault_codeChanged, this, &CarViewModel::TCU_fault_codeUpdate);
    connect(msgHandle, &CarMessageHandle::axis_rpmChanged, this, &CarViewModel::axis_rpmUpdate);
    connect(msgHandle, &CarMessageHandle::FMIChanged, this, &CarViewModel::FMIUpdate);
    connect(msgHandle, &CarMessageHandle::CMChanged, this, &CarViewModel::CMUpdate);
    connect(msgHandle, &CarMessageHandle::OCChanged, this, &CarViewModel::OCUpdate);

    /* 电池管理系统信息,对应BMS_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::bat_max_charge_currentChanged, this, &CarViewModel::bat_max_charge_currentUpdate);
    connect(msgHandle, &CarMessageHandle::bat_max_discharge_currentChanged, this, &CarViewModel::bat_max_discharge_currentUpdate);
    connect(msgHandle, &CarMessageHandle::bat_average_voltageChanged, this, &CarViewModel::bat_average_voltageUpdate);
    connect(msgHandle, &CarMessageHandle::bat_status1Changed, this, &CarViewModel::bat_status1Update);
    connect(msgHandle, &CarMessageHandle::bat_status2Changed, this, &CarViewModel::bat_status2Update);
    connect(msgHandle, &CarMessageHandle::bat_status3Changed, this, &CarViewModel::bat_status3Update);
    connect(msgHandle, &CarMessageHandle::irm_ohm_positiveChanged, this, &CarViewModel::irm_ohm_positiveUpdate);
    connect(msgHandle, &CarMessageHandle::irm_ohm_negativeChanged, this, &CarViewModel::irm_ohm_negativeUpdate);
    connect(msgHandle, &CarMessageHandle::bat_max_voltageChanged, this, &CarViewModel::bat_max_voltageUpdate);
    connect(msgHandle, &CarMessageHandle::bat_min_voltageChanged, this, &CarViewModel::bat_min_voltageUpdate);
    connect(msgHandle, &CarMessageHandle::batteryTHChanged, this, &CarViewModel::batteryTHUpdate);

    /* 电池信息,对应BATTERY_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::bat_voltageChanged, this, &CarViewModel::bat_voltageUpdate);
    connect(msgHandle, &CarMessageHandle::bat_tempChanged, this, &CarViewModel::bat_tempUpdate);

    /* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
    connect(msgHandle, &CarMessageHandle::ac_fault_codeChanged, this, &CarViewModel::ac_fault_codeUpdate);
    connect(msgHandle, &CarMessageHandle::ac_fan_statusChanged, this, &CarViewModel::ac_fan_statusUpdate);
    connect(msgHandle, &CarMessageHandle::ac_work_statusChanged, this, &CarViewModel::ac_work_statusUpdate);
    connect(msgHandle, &CarMessageHandle::ac_LifeChanged, this, &CarViewModel::ac_LifeUpdate);
    connect(msgHandle, &CarMessageHandle::ac_out_tempChanged, this, &CarViewModel::ac_out_tempUpdate);
    connect(msgHandle, &CarMessageHandle::ac_in_tempChanged, this, &CarViewModel::ac_in_tempUpdate);
    connect(msgHandle, &CarMessageHandle::ac_set_tempChanged, this, &CarViewModel::ac_set_tempUpdate);
    connect(msgHandle, &CarMessageHandle::ac_refrigere_reqChanged, this, &CarViewModel::ac_refrigere_reqUpdate);

    //告警
    connect(msgHandle, &CarMessageHandle::warning_01Changed, this, &CarViewModel::warning_01Update);
    connect(msgHandle, &CarMessageHandle::warning_02Changed, this, &CarViewModel::warning_02Update);
    connect(msgHandle, &CarMessageHandle::warning_03Changed, this, &CarViewModel::warning_03Update);
    connect(msgHandle, &CarMessageHandle::warning_04Changed, this, &CarViewModel::warning_04Update);
    connect(msgHandle, &CarMessageHandle::warning_05Changed, this, &CarViewModel::warning_05Update);
    connect(msgHandle, &CarMessageHandle::warning_06Changed, this, &CarViewModel::warning_06Update);
    connect(msgHandle, &CarMessageHandle::warning_07Changed, this, &CarViewModel::warning_07Update);
    connect(msgHandle, &CarMessageHandle::warning_08Changed, this, &CarViewModel::warning_08Update);
    connect(msgHandle, &CarMessageHandle::warning_09Changed, this, &CarViewModel::warning_09Update);
    connect(msgHandle, &CarMessageHandle::warning_10Changed, this, &CarViewModel::warning_10Update);
    connect(msgHandle, &CarMessageHandle::warning_11Changed, this, &CarViewModel::warning_11Update);
    connect(msgHandle, &CarMessageHandle::warning_12Changed, this, &CarViewModel::warning_12Update);
    connect(msgHandle, &CarMessageHandle::warning_13Changed, this, &CarViewModel::warning_13Update);
    connect(msgHandle, &CarMessageHandle::warning_14Changed, this, &CarViewModel::warning_14Update);
    connect(msgHandle, &CarMessageHandle::warning_15Changed, this, &CarViewModel::warning_15Update);
    connect(msgHandle, &CarMessageHandle::warning_16Changed, this, &CarViewModel::warning_16Update);
    connect(msgHandle, &CarMessageHandle::warning_17Changed, this, &CarViewModel::warning_17Update);
    connect(msgHandle, &CarMessageHandle::warning_18Changed, this, &CarViewModel::warning_18Update);
    connect(msgHandle, &CarMessageHandle::warning_19Changed, this, &CarViewModel::warning_19Update);
    connect(msgHandle, &CarMessageHandle::warning_20Changed, this, &CarViewModel::warning_20Update);
    connect(msgHandle, &CarMessageHandle::warning_21Changed, this, &CarViewModel::warning_21Update);
    connect(msgHandle, &CarMessageHandle::warning_22Changed, this, &CarViewModel::warning_22Update);
    connect(msgHandle, &CarMessageHandle::warning_23Changed, this, &CarViewModel::warning_23Update);
    connect(msgHandle, &CarMessageHandle::warning_24Changed, this, &CarViewModel::warning_24Update);
    connect(msgHandle, &CarMessageHandle::warning_25Changed, this, &CarViewModel::warning_25Update);
    connect(msgHandle, &CarMessageHandle::warning_26Changed, this, &CarViewModel::warning_26Update);
    connect(msgHandle, &CarMessageHandle::warning_27Changed, this, &CarViewModel::warning_27Update);
    connect(msgHandle, &CarMessageHandle::warning_28Changed, this, &CarViewModel::warning_28Update);
    connect(msgHandle, &CarMessageHandle::warning_29Changed, this, &CarViewModel::warning_29Update);
    connect(msgHandle, &CarMessageHandle::warning_30Changed, this, &CarViewModel::warning_30Update);
    connect(msgHandle, &CarMessageHandle::warning_31Changed, this, &CarViewModel::warning_31Update);
    connect(msgHandle, &CarMessageHandle::warning_32Changed, this, &CarViewModel::warning_32Update);
    connect(msgHandle, &CarMessageHandle::warning_33Changed, this, &CarViewModel::warning_33Update);
    connect(msgHandle, &CarMessageHandle::warning_34Changed, this, &CarViewModel::warning_34Update);
    connect(msgHandle, &CarMessageHandle::warning_35Changed, this, &CarViewModel::warning_35Update);
    connect(msgHandle, &CarMessageHandle::warning_36Changed, this, &CarViewModel::warning_36Update);
    connect(msgHandle, &CarMessageHandle::warning_37Changed, this, &CarViewModel::warning_37Update);
    connect(msgHandle, &CarMessageHandle::warning_38Changed, this, &CarViewModel::warning_38Update);
    connect(msgHandle, &CarMessageHandle::warning_39Changed, this, &CarViewModel::warning_39Update);
    connect(msgHandle, &CarMessageHandle::warning_40Changed, this, &CarViewModel::warning_40Update);

    connect(msgHandle, &CarMessageHandle::lamp_key_onChanged, this, &CarViewModel::lamp_key_onUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_turn_leftChanged, this, &CarViewModel::lamp_turn_leftUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_turn_rightChanged, this, &CarViewModel::lamp_turn_rightUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_double_flashChanged, this, &CarViewModel::lamp_double_flashUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_front_fogChanged, this, &CarViewModel::lamp_front_fogUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_rear_fogChanged, this, &CarViewModel::lamp_rear_fogUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_high_beamChanged, this, &CarViewModel::lamp_high_beamUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_head_lightChanged, this, &CarViewModel::lamp_head_lightUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_reverse_gearChanged, this, &CarViewModel::lamp_reverse_gearUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_gate1Changed, this, &CarViewModel::lamp_gate1Update);
    connect(msgHandle, &CarMessageHandle::lamp_gate2Changed, this, &CarViewModel::lamp_gate2Update);
    connect(msgHandle, &CarMessageHandle::lamp_brakeChanged, this, &CarViewModel::lamp_brakeUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_parking_brakeChanged, this, &CarViewModel::lamp_parking_brakeUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_left_low_air_pressureChanged, this, &CarViewModel::lamp_left_low_air_pressureUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_right_low_air_pressureChanged, this, &CarViewModel::lamp_right_low_air_pressureUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_left_shoe_wearChanged, this, &CarViewModel::lamp_left_shoe_wearUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_right_shoe_wearChanged, this, &CarViewModel::lamp_right_shoe_wearUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_defrosterChanged, this, &CarViewModel::lamp_defrosterUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_dryereChanged, this, &CarViewModel::lamp_dryereUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_charge_pluginChanged, this, &CarViewModel::lamp_charge_pluginUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_chargingChanged, this, &CarViewModel::lamp_chargingUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_water_temp_highChanged, this, &CarViewModel::lamp_water_temp_highUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_water_level_lowChanged, this, &CarViewModel::lamp_water_level_lowUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_oil_level_lowChanged, this, &CarViewModel::lamp_oil_level_lowUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_engine_faultChanged, this, &CarViewModel::lamp_engine_faultUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_motor_out_of_serviceChanged, this, &CarViewModel::lamp_motor_out_of_serviceUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_moter_fire_igonChanged, this, &CarViewModel::lamp_moter_fire_igonUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_air_filterChanged, this, &CarViewModel::lamp_air_filterUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_asrChanged, this, &CarViewModel::lamp_asrUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_absChanged, this, &CarViewModel::lamp_absUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_acChanged, this, &CarViewModel::lamp_acUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_high_voltage_maintenanceChanged, this, &CarViewModel::lamp_high_voltage_maintenanceUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_rear_door_openChanged, this, &CarViewModel::lamp_rear_door_openUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_low_service_wlChanged, this, &CarViewModel::lamp_low_service_wlUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_heavy_stop_wlChanged, this, &CarViewModel::lamp_heavy_stop_wlUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_serious_stop_wlChanged, this, &CarViewModel::lamp_serious_stop_wlUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_battery_main_contactChanged, this, &CarViewModel::lamp_battery_main_contactUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_position_lightChanged, this, &CarViewModel::lamp_position_lightUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_oil_pressure_lowChanged, this, &CarViewModel::lamp_oil_pressure_lowUpdate);
    connect(msgHandle, &CarMessageHandle::lamp_charge_confirmChanged, this, &CarViewModel::lamp_charge_confirmUpdate);
    connect(msgHandle, &CarMessageHandle::power_supplyChanged, this, &CarViewModel::power_supplyUpdate);
    connect(msgHandle, &CarMessageHandle::climbing_modeChanged, this, &CarViewModel::climbing_modeUpdate);
    connect(msgHandle, &CarMessageHandle::diagnostic_modeChanged, this, &CarViewModel::diagnostic_modeUpdate);

    //仪表
    connect(msgHandle, &CarMessageHandle::input_ctrl_01Changed, this, &CarViewModel::input_ctrl_01Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_02Changed, this, &CarViewModel::input_ctrl_02Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_03Changed, this, &CarViewModel::input_ctrl_03Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_04Changed, this, &CarViewModel::input_ctrl_04Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_05Changed, this, &CarViewModel::input_ctrl_05Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_06Changed, this, &CarViewModel::input_ctrl_06Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_07Changed, this, &CarViewModel::input_ctrl_07Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_08Changed, this, &CarViewModel::input_ctrl_08Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_09Changed, this, &CarViewModel::input_ctrl_09Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_10Changed, this, &CarViewModel::input_ctrl_10Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_11Changed, this, &CarViewModel::input_ctrl_11Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_12Changed, this, &CarViewModel::input_ctrl_12Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_13Changed, this, &CarViewModel::input_ctrl_13Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_14Changed, this, &CarViewModel::input_ctrl_14Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_15Changed, this, &CarViewModel::input_ctrl_15Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_16Changed, this, &CarViewModel::input_ctrl_16Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_17Changed, this, &CarViewModel::input_ctrl_17Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_18Changed, this, &CarViewModel::input_ctrl_18Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_19Changed, this, &CarViewModel::input_ctrl_19Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_20Changed, this, &CarViewModel::input_ctrl_20Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_21Changed, this, &CarViewModel::input_ctrl_21Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_22Changed, this, &CarViewModel::input_ctrl_22Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_23Changed, this, &CarViewModel::input_ctrl_23Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_24Changed, this, &CarViewModel::input_ctrl_24Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_25Changed, this, &CarViewModel::input_ctrl_25Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_26Changed, this, &CarViewModel::input_ctrl_26Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_27Changed, this, &CarViewModel::input_ctrl_27Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_28Changed, this, &CarViewModel::input_ctrl_28Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_29Changed, this, &CarViewModel::input_ctrl_29Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_30Changed, this, &CarViewModel::input_ctrl_30Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_31Changed, this, &CarViewModel::input_ctrl_31Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_32Changed, this, &CarViewModel::input_ctrl_32Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_33Changed, this, &CarViewModel::input_ctrl_33Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_34Changed, this, &CarViewModel::input_ctrl_34Update);
    connect(msgHandle, &CarMessageHandle::input_ctrl_35Changed, this, &CarViewModel::input_ctrl_35Update);

    /* 前模块,对应FRONT_MODULE_TYPE */
    connect(msgHandle, &CarMessageHandle::front_current01Changed, this, &CarViewModel::front_current01Update);
    connect(msgHandle, &CarMessageHandle::front_current02Changed, this, &CarViewModel::front_current02Update);
    connect(msgHandle, &CarMessageHandle::front_current03Changed, this, &CarViewModel::front_current03Update);
    connect(msgHandle, &CarMessageHandle::front_current04Changed, this, &CarViewModel::front_current04Update);
    connect(msgHandle, &CarMessageHandle::front_current05Changed, this, &CarViewModel::front_current05Update);
    connect(msgHandle, &CarMessageHandle::front_current06Changed, this, &CarViewModel::front_current06Update);
    connect(msgHandle, &CarMessageHandle::front_current07Changed, this, &CarViewModel::front_current07Update);
    connect(msgHandle, &CarMessageHandle::front_current08Changed, this, &CarViewModel::front_current08Update);
    connect(msgHandle, &CarMessageHandle::front_current09Changed, this, &CarViewModel::front_current09Update);
    connect(msgHandle, &CarMessageHandle::front_current10Changed, this, &CarViewModel::front_current10Update);
    connect(msgHandle, &CarMessageHandle::front_current11Changed, this, &CarViewModel::front_current11Update);
    connect(msgHandle, &CarMessageHandle::front_current12Changed, this, &CarViewModel::front_current12Update);
    connect(msgHandle, &CarMessageHandle::front_current13Changed, this, &CarViewModel::front_current13Update);
    connect(msgHandle, &CarMessageHandle::front_current14Changed, this, &CarViewModel::front_current14Update);
    connect(msgHandle, &CarMessageHandle::front_current15Changed, this, &CarViewModel::front_current15Update);
    connect(msgHandle, &CarMessageHandle::front_switch01Changed, this, &CarViewModel::front_switch01Update);
    connect(msgHandle, &CarMessageHandle::front_switch02Changed, this, &CarViewModel::front_switch02Update);
    connect(msgHandle, &CarMessageHandle::front_switch03Changed, this, &CarViewModel::front_switch03Update);
    connect(msgHandle, &CarMessageHandle::front_switch04Changed, this, &CarViewModel::front_switch04Update);
    connect(msgHandle, &CarMessageHandle::front_switch05Changed, this, &CarViewModel::front_switch05Update);
    connect(msgHandle, &CarMessageHandle::front_switch06Changed, this, &CarViewModel::front_switch06Update);
    connect(msgHandle, &CarMessageHandle::front_switch07Changed, this, &CarViewModel::front_switch07Update);
    connect(msgHandle, &CarMessageHandle::front_switch08Changed, this, &CarViewModel::front_switch08Update);
    connect(msgHandle, &CarMessageHandle::front_switch09Changed, this, &CarViewModel::front_switch09Update);
    connect(msgHandle, &CarMessageHandle::front_switch10Changed, this, &CarViewModel::front_switch10Update);
    connect(msgHandle, &CarMessageHandle::front_switch11Changed, this, &CarViewModel::front_switch11Update);
    connect(msgHandle, &CarMessageHandle::front_switch12Changed, this, &CarViewModel::front_switch12Update);
    connect(msgHandle, &CarMessageHandle::front_switch13Changed, this, &CarViewModel::front_switch13Update);
    connect(msgHandle, &CarMessageHandle::front_switch14Changed, this, &CarViewModel::front_switch14Update);
    connect(msgHandle, &CarMessageHandle::front_switch15Changed, this, &CarViewModel::front_switch15Update);
    connect(msgHandle, &CarMessageHandle::front_switch16Changed, this, &CarViewModel::front_switch16Update);
    connect(msgHandle, &CarMessageHandle::front_switch17Changed, this, &CarViewModel::front_switch17Update);
    connect(msgHandle, &CarMessageHandle::front_switch18Changed, this, &CarViewModel::front_switch18Update);
    connect(msgHandle, &CarMessageHandle::front_switch19Changed, this, &CarViewModel::front_switch19Update);
    connect(msgHandle, &CarMessageHandle::front_switch20Changed, this, &CarViewModel::front_switch20Update);
    connect(msgHandle, &CarMessageHandle::front_switch21Changed, this, &CarViewModel::front_switch21Update);
    connect(msgHandle, &CarMessageHandle::front_switch22Changed, this, &CarViewModel::front_switch22Update);
    connect(msgHandle, &CarMessageHandle::front_switch23Changed, this, &CarViewModel::front_switch23Update);
    connect(msgHandle, &CarMessageHandle::front_switch24Changed, this, &CarViewModel::front_switch24Update);
    connect(msgHandle, &CarMessageHandle::front_switch25Changed, this, &CarViewModel::front_switch25Update);
    connect(msgHandle, &CarMessageHandle::front_switch26Changed, this, &CarViewModel::front_switch26Update);
    connect(msgHandle, &CarMessageHandle::front_switch27Changed, this, &CarViewModel::front_switch27Update);
    connect(msgHandle, &CarMessageHandle::front_switch28Changed, this, &CarViewModel::front_switch28Update);
    connect(msgHandle, &CarMessageHandle::front_switch29Changed, this, &CarViewModel::front_switch29Update);
    connect(msgHandle, &CarMessageHandle::front_switch30Changed, this, &CarViewModel::front_switch30Update);
    connect(msgHandle, &CarMessageHandle::front_switch31Changed, this, &CarViewModel::front_switch31Update);
    connect(msgHandle, &CarMessageHandle::front_switch32Changed, this, &CarViewModel::front_switch32Update);
    connect(msgHandle, &CarMessageHandle::front_switch33Changed, this, &CarViewModel::front_switch33Update);
    connect(msgHandle, &CarMessageHandle::front_switch34Changed, this, &CarViewModel::front_switch34Update);
    connect(msgHandle, &CarMessageHandle::front_switch35Changed, this, &CarViewModel::front_switch35Update);
    connect(msgHandle, &CarMessageHandle::front_switch36Changed, this, &CarViewModel::front_switch36Update);
    connect(msgHandle, &CarMessageHandle::front_switch37Changed, this, &CarViewModel::front_switch37Update);
    connect(msgHandle, &CarMessageHandle::front_switch38Changed, this, &CarViewModel::front_switch38Update);
    connect(msgHandle, &CarMessageHandle::front_switch39Changed, this, &CarViewModel::front_switch39Update);
    connect(msgHandle, &CarMessageHandle::front_switch40Changed, this, &CarViewModel::front_switch40Update);
    connect(msgHandle, &CarMessageHandle::front_switch41Changed, this, &CarViewModel::front_switch41Update);
    connect(msgHandle, &CarMessageHandle::front_switch42Changed, this, &CarViewModel::front_switch42Update);

    /* 中模块,对应MIDDLE_MODULE_TYPE */
    connect(msgHandle, &CarMessageHandle::middle_current01Changed, this, &CarViewModel::middle_current01Update);
    connect(msgHandle, &CarMessageHandle::middle_current02Changed, this, &CarViewModel::middle_current02Update);
    connect(msgHandle, &CarMessageHandle::middle_current03Changed, this, &CarViewModel::middle_current03Update);
    connect(msgHandle, &CarMessageHandle::middle_current04Changed, this, &CarViewModel::middle_current04Update);
    connect(msgHandle, &CarMessageHandle::middle_current05Changed, this, &CarViewModel::middle_current05Update);
    connect(msgHandle, &CarMessageHandle::middle_current06Changed, this, &CarViewModel::middle_current06Update);
    connect(msgHandle, &CarMessageHandle::middle_current07Changed, this, &CarViewModel::middle_current07Update);
    connect(msgHandle, &CarMessageHandle::middle_current08Changed, this, &CarViewModel::middle_current08Update);
    connect(msgHandle, &CarMessageHandle::middle_current09Changed, this, &CarViewModel::middle_current09Update);
    connect(msgHandle, &CarMessageHandle::middle_current10Changed, this, &CarViewModel::middle_current10Update);
    connect(msgHandle, &CarMessageHandle::middle_current11Changed, this, &CarViewModel::middle_current11Update);
    connect(msgHandle, &CarMessageHandle::middle_current12Changed, this, &CarViewModel::middle_current12Update);
    connect(msgHandle, &CarMessageHandle::middle_current13Changed, this, &CarViewModel::middle_current13Update);
    connect(msgHandle, &CarMessageHandle::middle_current14Changed, this, &CarViewModel::middle_current14Update);
    connect(msgHandle, &CarMessageHandle::middle_current15Changed, this, &CarViewModel::middle_current15Update);
    connect(msgHandle, &CarMessageHandle::middle_switch01Changed, this, &CarViewModel::middle_switch01Update);
    connect(msgHandle, &CarMessageHandle::middle_switch02Changed, this, &CarViewModel::middle_switch02Update);
    connect(msgHandle, &CarMessageHandle::middle_switch03Changed, this, &CarViewModel::middle_switch03Update);
    connect(msgHandle, &CarMessageHandle::middle_switch04Changed, this, &CarViewModel::middle_switch04Update);
    connect(msgHandle, &CarMessageHandle::middle_switch05Changed, this, &CarViewModel::middle_switch05Update);
    connect(msgHandle, &CarMessageHandle::middle_switch06Changed, this, &CarViewModel::middle_switch06Update);
    connect(msgHandle, &CarMessageHandle::middle_switch07Changed, this, &CarViewModel::middle_switch07Update);
    connect(msgHandle, &CarMessageHandle::middle_switch08Changed, this, &CarViewModel::middle_switch08Update);
    connect(msgHandle, &CarMessageHandle::middle_switch09Changed, this, &CarViewModel::middle_switch09Update);
    connect(msgHandle, &CarMessageHandle::middle_switch10Changed, this, &CarViewModel::middle_switch10Update);
    connect(msgHandle, &CarMessageHandle::middle_switch11Changed, this, &CarViewModel::middle_switch11Update);
    connect(msgHandle, &CarMessageHandle::middle_switch12Changed, this, &CarViewModel::middle_switch12Update);
    connect(msgHandle, &CarMessageHandle::middle_switch13Changed, this, &CarViewModel::middle_switch13Update);
    connect(msgHandle, &CarMessageHandle::middle_switch14Changed, this, &CarViewModel::middle_switch14Update);
    connect(msgHandle, &CarMessageHandle::middle_switch15Changed, this, &CarViewModel::middle_switch15Update);
    connect(msgHandle, &CarMessageHandle::middle_switch16Changed, this, &CarViewModel::middle_switch16Update);
    connect(msgHandle, &CarMessageHandle::middle_switch17Changed, this, &CarViewModel::middle_switch17Update);
    connect(msgHandle, &CarMessageHandle::middle_switch18Changed, this, &CarViewModel::middle_switch18Update);
    connect(msgHandle, &CarMessageHandle::middle_switch19Changed, this, &CarViewModel::middle_switch19Update);
    connect(msgHandle, &CarMessageHandle::middle_switch20Changed, this, &CarViewModel::middle_switch20Update);
    connect(msgHandle, &CarMessageHandle::middle_switch21Changed, this, &CarViewModel::middle_switch21Update);
    connect(msgHandle, &CarMessageHandle::middle_switch22Changed, this, &CarViewModel::middle_switch22Update);
    connect(msgHandle, &CarMessageHandle::middle_switch23Changed, this, &CarViewModel::middle_switch23Update);
    connect(msgHandle, &CarMessageHandle::middle_switch24Changed, this, &CarViewModel::middle_switch24Update);
    connect(msgHandle, &CarMessageHandle::middle_switch25Changed, this, &CarViewModel::middle_switch25Update);
    connect(msgHandle, &CarMessageHandle::middle_switch26Changed, this, &CarViewModel::middle_switch26Update);
    connect(msgHandle, &CarMessageHandle::middle_switch27Changed, this, &CarViewModel::middle_switch27Update);
    connect(msgHandle, &CarMessageHandle::middle_switch28Changed, this, &CarViewModel::middle_switch28Update);
    connect(msgHandle, &CarMessageHandle::middle_switch29Changed, this, &CarViewModel::middle_switch29Update);
    connect(msgHandle, &CarMessageHandle::middle_switch30Changed, this, &CarViewModel::middle_switch30Update);
    connect(msgHandle, &CarMessageHandle::middle_switch31Changed, this, &CarViewModel::middle_switch31Update);
    connect(msgHandle, &CarMessageHandle::middle_switch32Changed, this, &CarViewModel::middle_switch32Update);
    connect(msgHandle, &CarMessageHandle::middle_switch33Changed, this, &CarViewModel::middle_switch33Update);
    connect(msgHandle, &CarMessageHandle::middle_switch34Changed, this, &CarViewModel::middle_switch34Update);
    connect(msgHandle, &CarMessageHandle::middle_switch35Changed, this, &CarViewModel::middle_switch35Update);
    connect(msgHandle, &CarMessageHandle::middle_switch36Changed, this, &CarViewModel::middle_switch36Update);
    connect(msgHandle, &CarMessageHandle::middle_switch37Changed, this, &CarViewModel::middle_switch37Update);
    connect(msgHandle, &CarMessageHandle::middle_switch38Changed, this, &CarViewModel::middle_switch38Update);
    connect(msgHandle, &CarMessageHandle::middle_switch39Changed, this, &CarViewModel::middle_switch39Update);
    connect(msgHandle, &CarMessageHandle::middle_switch40Changed, this, &CarViewModel::middle_switch40Update);
    connect(msgHandle, &CarMessageHandle::middle_switch41Changed, this, &CarViewModel::middle_switch41Update);
    connect(msgHandle, &CarMessageHandle::middle_switch42Changed, this, &CarViewModel::middle_switch42Update);

    /* 后模块,对应BACK_MODULE_TYPE */
    connect(msgHandle, &CarMessageHandle::back_current01Changed, this, &CarViewModel::back_current01Update);
    connect(msgHandle, &CarMessageHandle::back_current02Changed, this, &CarViewModel::back_current02Update);
    connect(msgHandle, &CarMessageHandle::back_current03Changed, this, &CarViewModel::back_current03Update);
    connect(msgHandle, &CarMessageHandle::back_current04Changed, this, &CarViewModel::back_current04Update);
    connect(msgHandle, &CarMessageHandle::back_current05Changed, this, &CarViewModel::back_current05Update);
    connect(msgHandle, &CarMessageHandle::back_current06Changed, this, &CarViewModel::back_current06Update);
    connect(msgHandle, &CarMessageHandle::back_current07Changed, this, &CarViewModel::back_current07Update);
    connect(msgHandle, &CarMessageHandle::back_current08Changed, this, &CarViewModel::back_current08Update);
    connect(msgHandle, &CarMessageHandle::back_current09Changed, this, &CarViewModel::back_current09Update);
    connect(msgHandle, &CarMessageHandle::back_current10Changed, this, &CarViewModel::back_current10Update);
    connect(msgHandle, &CarMessageHandle::back_current11Changed, this, &CarViewModel::back_current11Update);
    connect(msgHandle, &CarMessageHandle::back_current12Changed, this, &CarViewModel::back_current12Update);
    connect(msgHandle, &CarMessageHandle::back_current13Changed, this, &CarViewModel::back_current13Update);
    connect(msgHandle, &CarMessageHandle::back_current14Changed, this, &CarViewModel::back_current14Update);
    connect(msgHandle, &CarMessageHandle::back_current15Changed, this, &CarViewModel::back_current15Update);
    connect(msgHandle, &CarMessageHandle::back_switch01Changed, this, &CarViewModel::back_switch01Update);
    connect(msgHandle, &CarMessageHandle::back_switch02Changed, this, &CarViewModel::back_switch02Update);
    connect(msgHandle, &CarMessageHandle::back_switch03Changed, this, &CarViewModel::back_switch03Update);
    connect(msgHandle, &CarMessageHandle::back_switch04Changed, this, &CarViewModel::back_switch04Update);
    connect(msgHandle, &CarMessageHandle::back_switch05Changed, this, &CarViewModel::back_switch05Update);
    connect(msgHandle, &CarMessageHandle::back_switch06Changed, this, &CarViewModel::back_switch06Update);
    connect(msgHandle, &CarMessageHandle::back_switch07Changed, this, &CarViewModel::back_switch07Update);
    connect(msgHandle, &CarMessageHandle::back_switch08Changed, this, &CarViewModel::back_switch08Update);
    connect(msgHandle, &CarMessageHandle::back_switch09Changed, this, &CarViewModel::back_switch09Update);
    connect(msgHandle, &CarMessageHandle::back_switch10Changed, this, &CarViewModel::back_switch10Update);
    connect(msgHandle, &CarMessageHandle::back_switch11Changed, this, &CarViewModel::back_switch11Update);
    connect(msgHandle, &CarMessageHandle::back_switch12Changed, this, &CarViewModel::back_switch12Update);
    connect(msgHandle, &CarMessageHandle::back_switch13Changed, this, &CarViewModel::back_switch13Update);
    connect(msgHandle, &CarMessageHandle::back_switch14Changed, this, &CarViewModel::back_switch14Update);
    connect(msgHandle, &CarMessageHandle::back_switch15Changed, this, &CarViewModel::back_switch15Update);
    connect(msgHandle, &CarMessageHandle::back_switch16Changed, this, &CarViewModel::back_switch16Update);
    connect(msgHandle, &CarMessageHandle::back_switch17Changed, this, &CarViewModel::back_switch17Update);
    connect(msgHandle, &CarMessageHandle::back_switch18Changed, this, &CarViewModel::back_switch18Update);
    connect(msgHandle, &CarMessageHandle::back_switch19Changed, this, &CarViewModel::back_switch19Update);
    connect(msgHandle, &CarMessageHandle::back_switch20Changed, this, &CarViewModel::back_switch20Update);
    connect(msgHandle, &CarMessageHandle::back_switch21Changed, this, &CarViewModel::back_switch21Update);
    connect(msgHandle, &CarMessageHandle::back_switch22Changed, this, &CarViewModel::back_switch22Update);
    connect(msgHandle, &CarMessageHandle::back_switch23Changed, this, &CarViewModel::back_switch23Update);
    connect(msgHandle, &CarMessageHandle::back_switch24Changed, this, &CarViewModel::back_switch24Update);
    connect(msgHandle, &CarMessageHandle::back_switch25Changed, this, &CarViewModel::back_switch25Update);
    connect(msgHandle, &CarMessageHandle::back_switch26Changed, this, &CarViewModel::back_switch26Update);
    connect(msgHandle, &CarMessageHandle::back_switch27Changed, this, &CarViewModel::back_switch27Update);
    connect(msgHandle, &CarMessageHandle::back_switch28Changed, this, &CarViewModel::back_switch28Update);
    connect(msgHandle, &CarMessageHandle::back_switch29Changed, this, &CarViewModel::back_switch29Update);
    connect(msgHandle, &CarMessageHandle::back_switch30Changed, this, &CarViewModel::back_switch30Update);
    connect(msgHandle, &CarMessageHandle::back_switch31Changed, this, &CarViewModel::back_switch31Update);
    connect(msgHandle, &CarMessageHandle::back_switch32Changed, this, &CarViewModel::back_switch32Update);
    connect(msgHandle, &CarMessageHandle::back_switch33Changed, this, &CarViewModel::back_switch33Update);
    connect(msgHandle, &CarMessageHandle::back_switch34Changed, this, &CarViewModel::back_switch34Update);
    connect(msgHandle, &CarMessageHandle::back_switch35Changed, this, &CarViewModel::back_switch35Update);
    connect(msgHandle, &CarMessageHandle::back_switch36Changed, this, &CarViewModel::back_switch36Update);
    connect(msgHandle, &CarMessageHandle::back_switch37Changed, this, &CarViewModel::back_switch37Update);
    connect(msgHandle, &CarMessageHandle::back_switch38Changed, this, &CarViewModel::back_switch38Update);
    connect(msgHandle, &CarMessageHandle::back_switch39Changed, this, &CarViewModel::back_switch39Update);
    connect(msgHandle, &CarMessageHandle::back_switch40Changed, this, &CarViewModel::back_switch40Update);
    connect(msgHandle, &CarMessageHandle::back_switch41Changed, this, &CarViewModel::back_switch41Update);
    connect(msgHandle, &CarMessageHandle::back_switch42Changed, this, &CarViewModel::back_switch42Update);
	
	this->exec();
}

CarViewModel::~CarViewModel() {

    if(NULL != carMenuControl) {
        delete carMenuControl;
        carMenuControl = NULL;
    }

    if(NULL != msgHandle) {
        delete msgHandle;
        msgHandle = NULL;
    }
}

void CarViewModel:: initialize()
{
    m_batNumSet = 0;
    m_dateTime = 0;

    if(bResetStatus == true) {
        m_menu_L0 = 0;
        m_menu_L1 = 0;
        m_menu_L2 = 0;
        m_menu_L3 = 0;
        m_menu_L4 = 0;
        m_menu_L5 = 0;
        m_menu_L6 = 0;
        m_menu_L7 = 0;
        m_menu_L8 = 0;
        m_menu_TimePos = 0;
        m_menu_Direction = 0;
        m_menu_SettingsSelect = 0;
        m_menu_ThemeSelect = 0;
        m_upgradeTips = "";
        m_progressValue = 0;
        m_autoFlash = 0;
    }

    /* 主界面信息帧,对应CAR_INFO_TYPE */
    m_speed = 0;
    m_rpm = 0;
    m_totalVoltage = 0;
    m_totalCurrent = 0;
    m_gear = 0;
    m_odo = 0;
    m_trip = 0;
    m_soc = 0;
    m_apVol1 = 0;
    m_apVol2 = 0;
    m_moter_control_temp = 0;
    m_moter_temp = 0;

    m_main_power = 0;
    m_power_supply = "";
    m_climbing_mode = 0;
    m_diagnostic_mode = 0;
    m_charge_confirm = 0;

    m_fault_level = 0;
    m_fault_code = 0;
    m_SPN = 0;
    m_urea_level = 0.0;
    m_dateTime = 0;
    m_battery = 0;
    m_oil_level = 0.0;

    /* 报警信息帧,对应WARNING_TYPE */
    m_low_water_level_warn = 0;
    m_low_ap1_warn = 0;
    m_low_ap2_warn = 0;
    m_water_temp_sensor_warn = 0;
    m_oil_quantity_sensor_warn = 0;
    m_oil_pressure_sensor_warn = 0;
    m_bat_voltage_sensor_warn = 0;
    m_ap1_sensor_warn = 0;
    m_ap2_sensor_warn = 0;
    m_j1939_comm_fault_warn = 0;
    m_low_oil_pressure_warn = 0;
    m_left_brake_shoe_warn = 0;
    m_right_brake_shoe_warn = 0;
    m_air_filter_warn = 0;
    m_water_temp_miss = 0;
    m_oil_pressure_data_miss = 0;
    m_bus_comm_fault = 0;
    m_low_oil_warn = 0;

    m_after_treat_warn = 0;
    m_water_temp_high_warn = 0;
    m_status_Flag1_bit1 = 0;
    m_status_Flag1_bit2 = 0;
    m_status_Flag1_bit3 = 0;
    m_status_Flag1_bit4 = 0;
    m_status_Flag1_bit5 = 0;
    m_status_Flag1_bit6 = 0;
    m_status_Flag1_bit7 = 0;
    m_status_Flag1_bit8 = 0;
    m_status_Flag2_bit1 = 0;
    m_status_Flag2_bit2 = 0;
    m_status_Flag2_bit3 = 0;
    m_status_Flag2_bit4 = 0;
    m_status_Flag2_bit5 = 0;
    m_status_Flag2_bit6 = 0;
    m_status_Flag2_bit7 = 0;
    m_status_Flag2_bit8 = 0;
    m_status_Flag3_bit1 = 0;
    m_status_Flag3_bit2 = 0;
    m_status_Flag3_bit3 = 0;
    m_status_Flag3_bit4 = 0;
    m_status_Flag3_bit5 = 0;

    /* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
    m_motor_in_voltage = 0;
    m_motor_in_current = 0;
    m_motor_temp = 0;
    m_motor_controller_temp = 0;
    m_car_mode = 0;
    m_version = 0.0;
    m_car_Life = 0;
    m_accel_pedal_percent = 0.0;
    m_brake_pedal_percent = 0.0;
    m_din1 = 0;
    m_din2 = 0;
    m_din3 = 0;
    m_dout1 = 0;
    m_dout2 = 0;
    m_dout3 = 0;

    /* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
    m_engine_fuel_consumption = 0;
    m_engine_water_temp = 0;
    m_engine_load = 0;
    m_engine_target_throttle = 0;
    m_engine_actual_throttle = 0;
    m_engine_oil_pressure = 0;
    m_engine_inlet_temp = 0;

    /* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
    m_oilpump_dcac_w_output_current = 0;
    m_oilpump_dcac_v_output_current = 0;
    m_oilpump_dcac_u_output_current = 0;
    m_radiator_temp = 0;

    /* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
    m_actual_clutch_position = 0;
    m_TCU_fault_code = 0;
    m_axis_rpm = 0;
    m_FMI = 0;
    m_CM = 0;
    m_OC = 0;

    /* 电池管理系统信息,对应BMS_INFO_TYPE */
    m_bat_max_charge_current = 0;
    m_bat_max_discharge_current = 0;
    m_bat_average_voltage = 0.0;
    m_bat_status1 = 0;
    m_bat_status2 = 0;
    m_bat_status3 = 0;
    m_irm_ohm_positive = 0;
    m_irm_ohm_negative = 0;
    m_bat_max_voltage = 0;
    m_bat_min_voltage = 0;
    m_batteryTH = 0;

    /* 电池信息,对应BATTERY_INFO_TYPE */
    m_bat_voltage1 = 0.0;
    m_bat_voltage2 = 0.0;
    m_bat_voltage3 = 0.0;
    m_bat_voltage4 = 0.0;
    m_bat_voltage5 = 0.0;
    m_bat_voltage6 = 0.0;
    m_bat_voltage7 = 0.0;
    m_bat_voltage8 = 0.0;
    m_bat_voltage9 = 0.0;
    m_bat_voltage10 = 0.0;
    m_bat_temp1 = 0;
    m_bat_temp2 = 0;
    m_bat_temp3 = 0;
    m_bat_temp4 = 0;
    m_bat_temp5 = 0;
    m_bat_temp6 = 0;
    m_bat_temp7 = 0;
    m_bat_temp8 = 0;
    m_bat_temp9 = 0;
    m_bat_temp10 = 0;

    /* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
    m_ac_fault_code = 0;
    m_ac_fan_status = 0;
    m_ac_work_status = 0;
    m_ac_Life = 0;
    m_ac_out_temp = 0;
    m_ac_in_temp = 0;
    m_ac_set_temp = 0;
    m_ac_refrigere_req = 0;

    m_warning_01 = "";
    m_warning_02 = "";
    m_warning_03 = "";
    m_warning_04 = "";
    m_warning_05 = "";
    m_warning_06 = "";
    m_warning_07 = "";
    m_warning_08 = "";
    m_warning_09 = "";
    m_warning_10 = "";
    m_warning_11 = "";
    m_warning_12 = "";
    m_warning_13 = "";
    m_warning_14 = "";
    m_warning_15 = "";
    m_warning_16 = "";
    m_warning_17 = "";
    m_warning_18 = "";
    m_warning_19 = "";
    m_warning_20 = "";
    m_warning_21 = "";
    m_warning_22 = "";
    m_warning_23 = "";
    m_warning_24 = "";
    m_warning_25 = "";
    m_warning_26 = "";
    m_warning_27 = "";
    m_warning_28 = "";
    m_warning_29 = "";
    m_warning_30 = "";
    m_warning_31 = "";
    m_warning_32 = "";
    m_warning_33 = "";
    m_warning_34 = "";
    m_warning_35 = "";
    m_warning_36 = "";
    m_warning_37 = "";
    m_warning_38 = "";
    m_warning_39 = "";
    m_warning_40 = "";

    m_lamp_key_on = 0;
    m_lamp_turn_left = 0;
    m_lamp_turn_right = 0;
    m_lamp_double_flash = 0;
    m_lamp_front_fog = 0;
    m_lamp_rear_fog = 0;
    m_lamp_high_beam = 0;
    m_lamp_head_light = 0;
    m_lamp_reverse_gear = 0;
    m_lamp_gate1 = 0;
    m_lamp_gate2 = 0;
    m_lamp_brake = 0;
    m_lamp_parking_brake = 0;
    m_lamp_left_low_air_pressure = 0;
    m_lamp_right_low_air_pressure = 0;
    m_lamp_left_shoe_wear = 0;
    m_lamp_right_shoe_wear = 0;
    m_lamp_defroster = 0;
    m_lamp_dryere = 0;
    m_lamp_charge_plugin = 0;
    m_lamp_charging = 0;
    m_lamp_water_temp_high = 0;
    m_lamp_water_level_low = 0;
    m_lamp_oil_level_low = 0;
    m_lamp_engine_fault = 0;
    m_lamp_motor_out_of_service = 0;
    m_lamp_moter_fire_igon = 0;
    m_lamp_air_filter = 0;
    m_lamp_asr = 0;
    m_lamp_abs = 0;
    m_lamp_ac = 0;
    m_lamp_high_voltage_maintenance = 0;
    m_lamp_rear_door_open = 0;
    m_lamp_low_service_wl = 0;
    m_lamp_heavy_stop_wl = 0;
    m_lamp_serious_stop_wl = 0;
    m_lamp_battery_main_contact = 0;
    m_lamp_position_light = 0;
    m_lamp_oil_pressure_low = 0;
    m_lamp_charge_confirm = 0;

    /* 前模块,对应FRONT_MODULE_TYPE */
    m_front_current01 = 0.0;
    m_front_current02 = 0.0;
    m_front_current03 = 0.0;
    m_front_current04 = 0.0;
    m_front_current05 = 0.0;
    m_front_current06 = 0.0;
    m_front_current07 = 0.0;
    m_front_current08 = 0.0;
    m_front_current09 = 0.0;
    m_front_current10 = 0.0;
    m_front_current11 = 0.0;
    m_front_current12 = 0.0;
    m_front_current13 = 0.0;
    m_front_current14 = 0.0;
    m_front_current15 = 0.0;
    m_front_switch01 = 0;
    m_front_switch02 = 0;
    m_front_switch03 = 0;
    m_front_switch04 = 0;
    m_front_switch05 = 0;
    m_front_switch06 = 0;
    m_front_switch07 = 0;
    m_front_switch08 = 0;
    m_front_switch09 = 0;
    m_front_switch10 = 0;
    m_front_switch11 = 0;
    m_front_switch12 = 0;
    m_front_switch13 = 0;
    m_front_switch14 = 0;
    m_front_switch15 = 0;
    m_front_switch16 = 0;
    m_front_switch17 = 0;
    m_front_switch18 = 0;
    m_front_switch19 = 0;
    m_front_switch20 = 0;
    m_front_switch21 = 0;
    m_front_switch22 = 0;
    m_front_switch23 = 0;
    m_front_switch24 = 0;
    m_front_switch25 = 0;
    m_front_switch26 = 0;
    m_front_switch27 = 0;
    m_front_switch28 = 0;
    m_front_switch29 = 0;
    m_front_switch30 = 0;
    m_front_switch31 = 0;
    m_front_switch32 = 0;
    m_front_switch33 = 0;
    m_front_switch34 = 0;
    m_front_switch35 = 0;
    m_front_switch36 = 0;
    m_front_switch37 = 0;
    m_front_switch38 = 0;
    m_front_switch39 = 0;
    m_front_switch40 = 0;
    m_front_switch41 = 0;
    m_front_switch42 = 0;

    /* 中模块,对应MIDDLE_MODULE_TYPE */
    m_middle_current01 = 0.0;
    m_middle_current02 = 0.0;
    m_middle_current03 = 0.0;
    m_middle_current04 = 0.0;
    m_middle_current05 = 0.0;
    m_middle_current06 = 0.0;
    m_middle_current07 = 0.0;
    m_middle_current08 = 0.0;
    m_middle_current09 = 0.0;
    m_middle_current10 = 0.0;
    m_middle_current11 = 0.0;
    m_middle_current12 = 0.0;
    m_middle_current13 = 0.0;
    m_middle_current14 = 0.0;
    m_middle_current15 = 0.0;
    m_middle_switch01 = 0;
    m_middle_switch02 = 0;
    m_middle_switch03 = 0;
    m_middle_switch04 = 0;
    m_middle_switch05 = 0;
    m_middle_switch06 = 0;
    m_middle_switch07 = 0;
    m_middle_switch08 = 0;
    m_middle_switch09 = 0;
    m_middle_switch10 = 0;
    m_middle_switch11 = 0;
    m_middle_switch12 = 0;
    m_middle_switch13 = 0;
    m_middle_switch14 = 0;
    m_middle_switch15 = 0;
    m_middle_switch16 = 0;
    m_middle_switch17 = 0;
    m_middle_switch18 = 0;
    m_middle_switch19 = 0;
    m_middle_switch20 = 0;
    m_middle_switch21 = 0;
    m_middle_switch22 = 0;
    m_middle_switch23 = 0;
    m_middle_switch24 = 0;
    m_middle_switch25 = 0;
    m_middle_switch26 = 0;
    m_middle_switch27 = 0;
    m_middle_switch28 = 0;
    m_middle_switch29 = 0;
    m_middle_switch30 = 0;
    m_middle_switch31 = 0;
    m_middle_switch32 = 0;
    m_middle_switch33 = 0;
    m_middle_switch34 = 0;
    m_middle_switch35 = 0;
    m_middle_switch36 = 0;
    m_middle_switch37 = 0;
    m_middle_switch38 = 0;
    m_middle_switch39 = 0;
    m_middle_switch40 = 0;
    m_middle_switch41 = 0;
    m_middle_switch42 = 0;

    /* 后模块,对应BACK_MODULE_TYPE */
    m_back_current01 = 0.0;
    m_back_current02 = 0.0;
    m_back_current03 = 0.0;
    m_back_current04 = 0.0;
    m_back_current05 = 0.0;
    m_back_current06 = 0.0;
    m_back_current07 = 0.0;
    m_back_current08 = 0.0;
    m_back_current09 = 0.0;
    m_back_current10 = 0.0;
    m_back_current11 = 0.0;
    m_back_current12 = 0.0;
    m_back_current13 = 0.0;
    m_back_current14 = 0.0;
    m_back_current15 = 0.0;
    m_back_switch01 = 0;
    m_back_switch02 = 0;
    m_back_switch03 = 0;
    m_back_switch04 = 0;
    m_back_switch05 = 0;
    m_back_switch06 = 0;
    m_back_switch07 = 0;
    m_back_switch08 = 0;
    m_back_switch09 = 0;
    m_back_switch10 = 0;
    m_back_switch11 = 0;
    m_back_switch12 = 0;
    m_back_switch13 = 0;
    m_back_switch14 = 0;
    m_back_switch15 = 0;
    m_back_switch16 = 0;
    m_back_switch17 = 0;
    m_back_switch18 = 0;
    m_back_switch19 = 0;
    m_back_switch20 = 0;
    m_back_switch21 = 0;
    m_back_switch22 = 0;
    m_back_switch23 = 0;
    m_back_switch24 = 0;
    m_back_switch25 = 0;
    m_back_switch26 = 0;
    m_back_switch27 = 0;
    m_back_switch28 = 0;
    m_back_switch29 = 0;
    m_back_switch30 = 0;
    m_back_switch31 = 0;
    m_back_switch32 = 0;
    m_back_switch33 = 0;
    m_back_switch34 = 0;
    m_back_switch35 = 0;
    m_back_switch36 = 0;
    m_back_switch37 = 0;
    m_back_switch38 = 0;
    m_back_switch39 = 0;
    m_back_switch40 = 0;
    m_back_switch41 = 0;
    m_back_switch42 = 0;

    QString app_version = getIniKey("/etc/app.ini", "product/version");

#define STR1(R)  #R
#define STR2(R)  STR1(R)
    QString git_version = STR2(GIT_VERSION);
    app_version.append("-");
    m_versionStr = app_version.append(git_version);
    qDebug()<< "verStr: " << m_versionStr;
}

QString CarViewModel::getIniKey(QString path, QString keypath)
{
    QSettings *configIniRead;
    QString cmd;

    configIniRead = new QSettings(path, QSettings::IniFormat);
    cmd = configIniRead->value(keypath).toString();

    delete configIniRead;

    return cmd;
}

void CarViewModel::onNotifyResetStatus() {
    bResetStatus = true;
    initialize();
    bResetStatus = false;
}

void CarViewModel::setVoltageByIndex(int index, float value)
{
    switch(index){
        case 1:  ValueChangeSet(bat_voltage1,  value); break;
        case 2:  ValueChangeSet(bat_voltage2,  value); break;
        case 3:  ValueChangeSet(bat_voltage3,  value); break;
        case 4:  ValueChangeSet(bat_voltage4,  value); break;
        case 5:  ValueChangeSet(bat_voltage5,  value); break;
        case 6:  ValueChangeSet(bat_voltage6,  value); break;
        case 7:  ValueChangeSet(bat_voltage7,  value); break;
        case 8:  ValueChangeSet(bat_voltage8,  value); break;
        case 9:  ValueChangeSet(bat_voltage9,  value); break;
        case 10: ValueChangeSet(bat_voltage10, value); break;
    }
}

void CarViewModel::setTemperatureByIndex(int index, int value)
{
    switch(index){
        case 1:  ValueChangeSet(bat_temp1,  value); break;
        case 2:  ValueChangeSet(bat_temp2,  value); break;
        case 3:  ValueChangeSet(bat_temp3,  value); break;
        case 4:  ValueChangeSet(bat_temp4,  value); break;
        case 5:  ValueChangeSet(bat_temp5,  value); break;
        case 6:  ValueChangeSet(bat_temp6,  value); break;
        case 7:  ValueChangeSet(bat_temp7,  value); break;
        case 8:  ValueChangeSet(bat_temp8,  value); break;
        case 9:  ValueChangeSet(bat_temp9,  value); break;
        case 10: ValueChangeSet(bat_temp10, value); break;
    }
}

void CarViewModel::tripClearUpdate(bool value)
{
    if (value) { m_trip = 0; }
}

void CarViewModel::batNumSetUpdate(int value)
{
    ValueChangeSet(batNumSet, value);
}

void CarViewModel::menu_L0Update(uint value)
{
    ValueChangeSet(menu_L0, value);
}

void CarViewModel::menu_L1Update(int value)
{
    ValueChangeSet(menu_L1, value);
}

void CarViewModel::menu_L2Update(int value)
{
    ValueChangeSet(menu_L2, value);
}

void CarViewModel::menu_L3Update(int value)
{
    ValueChangeSet(menu_L3, value);
}

void CarViewModel::menu_L4Update(int value)
{
    ValueChangeSet(menu_L4, value);
}

void CarViewModel::menu_L5Update(int value)
{
    ValueChangeSet(menu_L5, value);
}

void CarViewModel::menu_L6Update(int value)
{
    ValueChangeSet(menu_L6, value);
}

void CarViewModel::menu_L7Update(int value)
{
    ValueChangeSet(menu_L7, value);
}

void CarViewModel::menu_L8Update(int value)
{
    ValueChangeSet(menu_L8, value);
}

void CarViewModel::menu_TimePosUpdate(int value)
{
    ValueChangeSet(menu_TimePos, value);
}

void CarViewModel::menu_DirectionUpdate(int value)
{
    ValueChangeSet(menu_Direction, value);
}

void CarViewModel::menu_SettingsSelectUpdate(int value)
{
    ValueChangeSet(menu_SettingsSelect, value);
}

void CarViewModel::menu_ThemeSelectUpdate(int value)
{
    ValueChangeSet(menu_ThemeSelect, value);
}

void CarViewModel::upgradeTipsUpdate(QString value)
{
    ValueChangeSet(upgradeTips, value);
}

void CarViewModel::progressValueUpdate(int value)
{
    ValueChangeSet(progressValue, value);
}

void CarViewModel::autoFlashUpdate(int value)
{
    ValueChangeSet(autoFlash, value);
}

void CarViewModel::speedUpdate(uint value)
{
    ValueChangeSet(speed, value);
}

void CarViewModel::rpmUpdate(int value)
{
    ValueChangeSet(rpm, value);
}

void CarViewModel::totalVoltageUpdate(int value)
{
    ValueChangeSet(totalVoltage, value);
}

void CarViewModel::totalCurrentUpdate(int value)
{
    ValueChangeSet(totalCurrent, value);
}

void CarViewModel::gearUpdate(int value)
{
    ValueChangeSet(gear, value);
}

void CarViewModel::odoUpdate(int value)
{
    ValueChangeSet(odo, value);
}

void CarViewModel::tripUpdate(float value)
{
    ValueChangeSet(trip, value);
}

void CarViewModel::socUpdate(uint value)
{
    ValueChangeSet(soc, value);
}

void CarViewModel::apVol1Update(float value)
{
    ValueChangeSet(apVol1, value);
}

void CarViewModel::apVol2Update(float value)
{
    ValueChangeSet(apVol2, value);
}

void CarViewModel::moter_control_tempUpdate(int value)
{
    ValueChangeSet(moter_control_temp, value);
}

void CarViewModel::moter_tempUpdate(int value)
{
    ValueChangeSet(moter_temp, value);
}

void CarViewModel::main_powerUpdate(uint value)
{
    ValueChangeSet(main_power, value);
}

void CarViewModel::power_supplyUpdate(QString value)
{
    ValueChangeSet(power_supply, value);
}

void CarViewModel::climbing_modeUpdate(uint value)
{
    ValueChangeSet(climbing_mode, value);
}

void CarViewModel::diagnostic_modeUpdate(uint value)
{
    ValueChangeSet(diagnostic_mode, value);
}

void CarViewModel::charge_confirmUpdate(uint value)
{
    ValueChangeSet(charge_confirm, value);
}

void CarViewModel::fault_levelUpdate(int value)
{
    ValueChangeSet(fault_level, value);
}

void CarViewModel::fault_codeUpdate(int value)
{
    ValueChangeSet(fault_code, value);
}

void CarViewModel::SPNUpdate(int value)
{
    ValueChangeSet(SPN, value);
}

void CarViewModel::urea_levelUpdate(float value)
{
    ValueChangeSet(urea_level, value);
}

void CarViewModel::dateTimeUpdate(int value)
{
    ValueChangeSet(dateTime, value);
}

void CarViewModel::batteryUpdate(int value)
{
    ValueChangeSet(battery, value);
}

void CarViewModel::oil_levelUpdate(int value)
{
    ValueChangeSet(oil_level, value);
}

/* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
void CarViewModel::motor_in_voltageUpdate(int value)
{
    ValueChangeSet(motor_in_voltage, value);
}

void CarViewModel::motor_in_currentUpdate(int value)
{
    ValueChangeSet(motor_in_current, value);
}

void CarViewModel::motor_tempUpdate(int value)
{
    ValueChangeSet(motor_temp, value);
}

void CarViewModel::motor_controller_tempUpdate(int value)
{
    ValueChangeSet(motor_controller_temp, value);
}

void CarViewModel::car_modeUpdate(int value)
{
    ValueChangeSet(car_mode, value);
}

void CarViewModel::versionUpdate(float value)
{
    ValueChangeSet(version, value);
}

void CarViewModel::car_LifeUpdate(int value)
{
    ValueChangeSet(car_Life, value);
}

void CarViewModel::accel_pedal_percentUpdate(float value)
{
    ValueChangeSet(accel_pedal_percent, value);
}

void CarViewModel::brake_pedal_percentUpdate(float value)
{
    ValueChangeSet(brake_pedal_percent, value);
}

void CarViewModel::din1Update(int value)
{
    ValueChangeSet(din1, value);
}

void CarViewModel::din2Update(int value)
{
    ValueChangeSet(din2, value);
}

void CarViewModel::din3Update(int value)
{
    ValueChangeSet(din3, value);
}

void CarViewModel::dout1Update(int value)
{
    ValueChangeSet(dout1, value);
}

void CarViewModel::dout2Update(int value)
{
    ValueChangeSet(dout2, value);
}

void CarViewModel::dout3Update(int value)
{
    ValueChangeSet(dout3, value);
}


/* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
void CarViewModel::engine_fuel_consumptionUpdate(float value)
{
    ValueChangeSet(engine_fuel_consumption, value);
}

void CarViewModel::engine_water_tempUpdate(int value)
{
    ValueChangeSet(engine_water_temp, value);

    //水温高于98度时，触发水温过高报警
    ValueChangeSet(water_temp_high_warn, value > 98 ? 1 : 0);
}

void CarViewModel::engine_loadUpdate(int value)
{
    ValueChangeSet(engine_load, value);
}

void CarViewModel::engine_target_throttleUpdate(float value)
{
    ValueChangeSet(engine_target_throttle, value);
}

void CarViewModel::engine_actual_throttleUpdate(float value)
{
    ValueChangeSet(engine_actual_throttle, value);
}

void CarViewModel::engine_oil_pressureUpdate(int value)
{
    ValueChangeSet(engine_oil_pressure, value);
}

void CarViewModel::engine_inlet_tempUpdate(int value)
{
    ValueChangeSet(engine_inlet_temp, value);
}


/* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
void CarViewModel::oilpump_dcac_w_output_currentUpdate(int value)
{
    ValueChangeSet(oilpump_dcac_w_output_current, value);
}

void CarViewModel::oilpump_dcac_v_output_currentUpdate(int value)
{
    ValueChangeSet(oilpump_dcac_v_output_current, value);
}

void CarViewModel::oilpump_dcac_u_output_currentUpdate(int value)
{
    ValueChangeSet(oilpump_dcac_u_output_current, value);
}

void CarViewModel::radiator_tempUpdate(int value)
{
    ValueChangeSet(radiator_temp, value);
}


/* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
void CarViewModel::actual_clutch_positionUpdate(int value)
{
    ValueChangeSet(actual_clutch_position, value);
}

void CarViewModel::TCU_fault_codeUpdate(int value)
{
    ValueChangeSet(TCU_fault_code, value);
}

void CarViewModel::axis_rpmUpdate(int value)
{
    ValueChangeSet(axis_rpm, value);
}

void CarViewModel::FMIUpdate(int value)
{
    ValueChangeSet(FMI, value);
}

void CarViewModel::CMUpdate(int value)
{
    ValueChangeSet(CM, value);
}

void CarViewModel::OCUpdate(int value)
{
    ValueChangeSet(OC, value);
}


/* 电池管理系统信息,对应BMS_INFO_TYPE */
void CarViewModel::bat_max_charge_currentUpdate(float value)
{
    ValueChangeSet(bat_max_charge_current, value);
}

void CarViewModel::bat_max_discharge_currentUpdate(float value)
{
    ValueChangeSet(bat_max_discharge_current, value);
}

void CarViewModel::bat_average_voltageUpdate(float value)
{
    ValueChangeSet(bat_average_voltage, value);
}

void CarViewModel::bat_status1Update(int value)
{
    ValueChangeSet(bat_status1, value);
}

void CarViewModel::bat_status2Update(int value)
{
    ValueChangeSet(bat_status2, value);
}

void CarViewModel::bat_status3Update(int value)
{
    ValueChangeSet(bat_status3, value);
}

void CarViewModel::irm_ohm_positiveUpdate(int value)
{
    ValueChangeSet(irm_ohm_positive, value);
}

void CarViewModel::irm_ohm_negativeUpdate(int value)
{
    ValueChangeSet(irm_ohm_negative, value);
}

void CarViewModel::bat_max_voltageUpdate(float value)
{
    ValueChangeSet(bat_max_voltage, value);
}

void CarViewModel::bat_min_voltageUpdate(float value)
{
    ValueChangeSet(bat_min_voltage, value);
}

void CarViewModel::batteryTHUpdate(float value)
{
    ValueChangeSet(batteryTH, value);
}


/* 电池信息,对应BATTERY_INFO_TYPE */
void CarViewModel::bat_voltageUpdate(int index, float value)
{
    setVoltageByIndex(index, value);
}

void CarViewModel::bat_tempUpdate(int index, int value)
{
    setTemperatureByIndex(index, value);
}

/* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
void CarViewModel::ac_fault_codeUpdate(int value)
{
    ValueChangeSet(ac_fault_code, value);
}

void CarViewModel::ac_fan_statusUpdate(int value)
{
    ValueChangeSet(ac_fan_status, value);
}

void CarViewModel::ac_work_statusUpdate(int value)
{
    ValueChangeSet(ac_work_status, value);
}

void CarViewModel::ac_LifeUpdate(int value)
{
    ValueChangeSet(ac_Life, value);
}

void CarViewModel::ac_out_tempUpdate(int value)
{
    ValueChangeSet(ac_out_temp, value);
}

void CarViewModel::ac_in_tempUpdate(int value)
{
    ValueChangeSet(ac_in_temp, value);
}

void CarViewModel::ac_set_tempUpdate(int value)
{
    ValueChangeSet(ac_set_temp, value);
}

void CarViewModel::ac_refrigere_reqUpdate(int value)
{
    ValueChangeSet(ac_refrigere_req, value);
}


//告警
void CarViewModel::warning_01Update(QString value) {
    WarningValueChangeSet(warning_01, value);
}

void CarViewModel::warning_02Update(QString value) {
    WarningValueChangeSet(warning_02, value);
}

void CarViewModel::warning_03Update(QString value) {
    WarningValueChangeSet(warning_03, value);
}

void CarViewModel::warning_04Update(QString value) {
    WarningValueChangeSet(warning_04, value);
}

void CarViewModel::warning_05Update(QString value) {
    WarningValueChangeSet(warning_05, value);
}

void CarViewModel::warning_06Update(QString value) {
    WarningValueChangeSet(warning_06, value);
}

void CarViewModel::warning_07Update(QString value) {
    WarningValueChangeSet(warning_07, value);
}

void CarViewModel::warning_08Update(QString value) {
    WarningValueChangeSet(warning_08, value);
}

void CarViewModel::warning_09Update(QString value) {
    WarningValueChangeSet(warning_09, value);
}

void CarViewModel::warning_10Update(QString value) {
    WarningValueChangeSet(warning_10, value);
}

void CarViewModel::warning_11Update(QString value) {
    WarningValueChangeSet(warning_11, value);
}

void CarViewModel::warning_12Update(QString value) {
    WarningValueChangeSet(warning_12, value);
}

void CarViewModel::warning_13Update(QString value) {
    WarningValueChangeSet(warning_13, value);
}

void CarViewModel::warning_14Update(QString value) {
    WarningValueChangeSet(warning_14, value);
}

void CarViewModel::warning_15Update(QString value) {
    WarningValueChangeSet(warning_15, value);
}

void CarViewModel::warning_16Update(QString value) {
    WarningValueChangeSet(warning_16, value);
}

void CarViewModel::warning_17Update(QString value) {
    WarningValueChangeSet(warning_17, value);
}

void CarViewModel::warning_18Update(QString value) {
    WarningValueChangeSet(warning_18, value);
}

void CarViewModel::warning_19Update(QString value) {
    WarningValueChangeSet(warning_19, value);
}

void CarViewModel::warning_20Update(QString value) {
    WarningValueChangeSet(warning_20, value);
}

void CarViewModel::warning_21Update(QString value) {
    WarningValueChangeSet(warning_21, value);
}

void CarViewModel::warning_22Update(QString value) {
    WarningValueChangeSet(warning_22, value);
}

void CarViewModel::warning_23Update(QString value) {
    WarningValueChangeSet(warning_23, value);
}

void CarViewModel::warning_24Update(QString value) {
    WarningValueChangeSet(warning_24, value);
}

void CarViewModel::warning_25Update(QString value) {
    WarningValueChangeSet(warning_25, value);
}

void CarViewModel::warning_26Update(QString value) {
    WarningValueChangeSet(warning_26, value);
}

void CarViewModel::warning_27Update(QString value) {
    WarningValueChangeSet(warning_27, value);
}

void CarViewModel::warning_28Update(QString value) {
    WarningValueChangeSet(warning_28, value);
}

void CarViewModel::warning_29Update(QString value) {
    WarningValueChangeSet(warning_29, value);
}

void CarViewModel::warning_30Update(QString value) {
    WarningValueChangeSet(warning_30, value);
}

void CarViewModel::warning_31Update(QString value) {
    WarningValueChangeSet(warning_31, value);
}

void CarViewModel::warning_32Update(QString value) {
    WarningValueChangeSet(warning_32, value);
}

void CarViewModel::warning_33Update(QString value) {
    WarningValueChangeSet(warning_33, value);
}

void CarViewModel::warning_34Update(QString value) {
    WarningValueChangeSet(warning_34, value);
}

void CarViewModel::warning_35Update(QString value) {
    WarningValueChangeSet(warning_35, value);
}

void CarViewModel::warning_36Update(QString value) {
    WarningValueChangeSet(warning_36, value);
}

void CarViewModel::warning_37Update(QString value) {
    WarningValueChangeSet(warning_37, value);
}

void CarViewModel::warning_38Update(QString value) {
    WarningValueChangeSet(warning_38, value);
}

void CarViewModel::warning_39Update(QString value) {
    WarningValueChangeSet(warning_39, value);
}

void CarViewModel::warning_40Update(QString value) {
    WarningValueChangeSet(warning_40, value);
}


//符号片
void CarViewModel::lamp_key_onUpdate(uint value) {
    ValueChangeSet(lamp_key_on, value);
}

void CarViewModel::lamp_turn_leftUpdate(uint value) {
    ValueChangeSet(lamp_turn_left, value);
}

void CarViewModel::lamp_turn_rightUpdate(uint value) {
    ValueChangeSet(lamp_turn_right, value);
}

void CarViewModel::lamp_double_flashUpdate(uint value) {
    ValueChangeSet(lamp_double_flash, value);
}

void CarViewModel::lamp_front_fogUpdate(uint value) {
    ValueChangeSet(lamp_front_fog, value);
}

void CarViewModel::lamp_rear_fogUpdate(uint value) {
    ValueChangeSet(lamp_rear_fog, value);
}

void CarViewModel::lamp_high_beamUpdate(uint value) {
    ValueChangeSet(lamp_high_beam, value);
}

void CarViewModel::lamp_head_lightUpdate(uint value) {
    ValueChangeSet(lamp_head_light, value);
}

void CarViewModel::lamp_reverse_gearUpdate(uint value) {
    ValueChangeSet(lamp_reverse_gear, value);
}

void CarViewModel::lamp_gate1Update(uint value) {
    ValueChangeSet(lamp_gate1, value);
}

void CarViewModel::lamp_gate2Update(uint value) {
    ValueChangeSet(lamp_gate2, value);
}

void CarViewModel::lamp_brakeUpdate(uint value) {
    ValueChangeSet(lamp_brake, value);
}

void CarViewModel::lamp_parking_brakeUpdate(uint value) {
    ValueChangeSet(lamp_parking_brake, value);
}

void CarViewModel::lamp_left_low_air_pressureUpdate(uint value) {
    ValueChangeSet(lamp_left_low_air_pressure, value);
}

void CarViewModel::lamp_right_low_air_pressureUpdate(uint value) {
    ValueChangeSet(lamp_right_low_air_pressure, value);
}

void CarViewModel::lamp_left_shoe_wearUpdate(uint value) {
    ValueChangeSet(lamp_left_shoe_wear, value);
}

void CarViewModel::lamp_right_shoe_wearUpdate(uint value) {
    ValueChangeSet(lamp_right_shoe_wear, value);
}

void CarViewModel::lamp_defrosterUpdate(uint value) {
    ValueChangeSet(lamp_defroster, value);
}

void CarViewModel::lamp_dryereUpdate(uint value) {
    ValueChangeSet(lamp_dryere, value);
}

void CarViewModel::lamp_charge_pluginUpdate(uint value) {
    ValueChangeSet(lamp_charge_plugin, value);
}

void CarViewModel::lamp_chargingUpdate(uint value) {
    ValueChangeSet(lamp_charging, value);
}

void CarViewModel::lamp_water_temp_highUpdate(uint value) {
    ValueChangeSet(lamp_water_temp_high, value);
}

void CarViewModel::lamp_water_level_lowUpdate(uint value) {
    ValueChangeSet(lamp_water_level_low, value);
}

void CarViewModel::lamp_oil_level_lowUpdate(uint value) {
    ValueChangeSet(lamp_oil_level_low, value);
}

void CarViewModel::lamp_engine_faultUpdate(uint value) {
    ValueChangeSet(lamp_engine_fault, value);
}

void CarViewModel::lamp_motor_out_of_serviceUpdate(uint value) {
    ValueChangeSet(lamp_motor_out_of_service, value);
}

void CarViewModel::lamp_moter_fire_igonUpdate(uint value) {
    ValueChangeSet(lamp_moter_fire_igon, value);
}

void CarViewModel::lamp_air_filterUpdate(uint value) {
    ValueChangeSet(lamp_air_filter, value);
}

void CarViewModel::lamp_asrUpdate(uint value) {
    ValueChangeSet(lamp_asr, value);
}

void CarViewModel::lamp_absUpdate(uint value) {
    ValueChangeSet(lamp_abs, value);
}

void CarViewModel::lamp_acUpdate(uint value) {
    ValueChangeSet(lamp_ac, value);
}

void CarViewModel::lamp_high_voltage_maintenanceUpdate(uint value) {
    ValueChangeSet(lamp_high_voltage_maintenance, value);
}

void CarViewModel::lamp_rear_door_openUpdate(uint value) {
    ValueChangeSet(lamp_rear_door_open, value);
}

void CarViewModel::lamp_low_service_wlUpdate(uint value) {
    ValueChangeSet(lamp_low_service_wl, value);
}

void CarViewModel::lamp_heavy_stop_wlUpdate(uint value) {
    ValueChangeSet(lamp_heavy_stop_wl, value);
}

void CarViewModel::lamp_serious_stop_wlUpdate(uint value) {
    ValueChangeSet(lamp_serious_stop_wl, value);
}

void CarViewModel::lamp_battery_main_contactUpdate(uint value) {
    ValueChangeSet(lamp_battery_main_contact, value);
}

void CarViewModel::lamp_position_lightUpdate(uint value) {
    ValueChangeSet(lamp_position_light, value);
}

void CarViewModel::lamp_oil_pressure_lowUpdate(uint value) {
    ValueChangeSet(lamp_oil_pressure_low, value);
}

void CarViewModel::lamp_charge_confirmUpdate(uint value) {
    ValueChangeSet(lamp_charge_confirm, value);
}

//仪表
void CarViewModel::input_ctrl_01Update(uint value) {
    ValueChangeSet(input_ctrl_01, value);
}

void CarViewModel::input_ctrl_02Update(uint value) {
    ValueChangeSet(input_ctrl_02, value);
}

void CarViewModel::input_ctrl_03Update(uint value) {
    ValueChangeSet(input_ctrl_03, value);
}

void CarViewModel::input_ctrl_04Update(uint value) {
    ValueChangeSet(input_ctrl_04, value);
}

void CarViewModel::input_ctrl_05Update(uint value) {
    ValueChangeSet(input_ctrl_05, value);
}

void CarViewModel::input_ctrl_06Update(uint value) {
    ValueChangeSet(input_ctrl_06, value);
}

void CarViewModel::input_ctrl_07Update(uint value) {
    ValueChangeSet(input_ctrl_07, value);
}

void CarViewModel::input_ctrl_08Update(uint value) {
    ValueChangeSet(input_ctrl_08, value);
}

void CarViewModel::input_ctrl_09Update(uint value) {
    ValueChangeSet(input_ctrl_09, value);
}

void CarViewModel::input_ctrl_10Update(uint value) {
    ValueChangeSet(input_ctrl_10, value);
}

void CarViewModel::input_ctrl_11Update(uint value) {
    ValueChangeSet(input_ctrl_11, value);
}

void CarViewModel::input_ctrl_12Update(uint value) {
    ValueChangeSet(input_ctrl_12, value);
}

void CarViewModel::input_ctrl_13Update(uint value) {
    ValueChangeSet(input_ctrl_13, value);
}

void CarViewModel::input_ctrl_14Update(uint value) {
    ValueChangeSet(input_ctrl_14, value);
}

void CarViewModel::input_ctrl_15Update(uint value) {
    ValueChangeSet(input_ctrl_15, value);
}

void CarViewModel::input_ctrl_16Update(uint value) {
    ValueChangeSet(input_ctrl_16, value);
}

void CarViewModel::input_ctrl_17Update(uint value) {
    ValueChangeSet(input_ctrl_17, value);
}

void CarViewModel::input_ctrl_18Update(uint value) {
    ValueChangeSet(input_ctrl_18, value);
}

void CarViewModel::input_ctrl_19Update(uint value) {
    ValueChangeSet(input_ctrl_19, value);
}

void CarViewModel::input_ctrl_20Update(uint value) {
    ValueChangeSet(input_ctrl_20, value);
}

void CarViewModel::input_ctrl_21Update(uint value) {
    ValueChangeSet(input_ctrl_21, value);
}

void CarViewModel::input_ctrl_22Update(uint value) {
    ValueChangeSet(input_ctrl_22, value);
}

void CarViewModel::input_ctrl_23Update(uint value) {
    ValueChangeSet(input_ctrl_23, value);
}

void CarViewModel::input_ctrl_24Update(uint value) {
    ValueChangeSet(input_ctrl_24, value);
}

void CarViewModel::input_ctrl_25Update(uint value) {
    ValueChangeSet(input_ctrl_25, value);
}

void CarViewModel::input_ctrl_26Update(uint value) {
    ValueChangeSet(input_ctrl_26, value);
}

void CarViewModel::input_ctrl_27Update(uint value) {
    ValueChangeSet(input_ctrl_27, value);
}

void CarViewModel::input_ctrl_28Update(uint value) {
    ValueChangeSet(input_ctrl_28, value);
}

void CarViewModel::input_ctrl_29Update(uint value) {
    ValueChangeSet(input_ctrl_29, value);
}

void CarViewModel::input_ctrl_30Update(uint value) {
    ValueChangeSet(input_ctrl_30, value);
}

void CarViewModel::input_ctrl_31Update(uint value) {
    ValueChangeSet(input_ctrl_31, value);
}

void CarViewModel::input_ctrl_32Update(uint value) {
    ValueChangeSet(input_ctrl_32, value);
}

void CarViewModel::input_ctrl_33Update(uint value) {
    ValueChangeSet(input_ctrl_33, value);
}

void CarViewModel::input_ctrl_34Update(uint value) {
    ValueChangeSet(input_ctrl_34, value);
}

void CarViewModel::input_ctrl_35Update(uint value) {
    ValueChangeSet(input_ctrl_35, value);
}

/* 前模块,对应FRONT_MODULE_TYPE */
void CarViewModel::front_current01Update(float value) {
    ValueChangeSet(front_current01, value);
}

void CarViewModel::front_current02Update(float value) {
    ValueChangeSet(front_current02, value);
}

void CarViewModel::front_current03Update(float value) {
    ValueChangeSet(front_current03, value);
}

void CarViewModel::front_current04Update(float value) {
    ValueChangeSet(front_current04, value);
}

void CarViewModel::front_current05Update(float value) {
    ValueChangeSet(front_current05, value);
}

void CarViewModel::front_current06Update(float value) {
    ValueChangeSet(front_current06, value);
}

void CarViewModel::front_current07Update(float value) {
    ValueChangeSet(front_current07, value);
}

void CarViewModel::front_current08Update(float value) {
    ValueChangeSet(front_current08, value);
}

void CarViewModel::front_current09Update(float value) {
    ValueChangeSet(front_current09, value);
}

void CarViewModel::front_current10Update(float value) {
    ValueChangeSet(front_current10, value);
}

void CarViewModel::front_current11Update(float value) {
    ValueChangeSet(front_current11, value);
}

void CarViewModel::front_current12Update(float value) {
    ValueChangeSet(front_current12, value);
}

void CarViewModel::front_current13Update(float value) {
    ValueChangeSet(front_current13, value);
}

void CarViewModel::front_current14Update(float value) {
    ValueChangeSet(front_current14, value);
}

void CarViewModel::front_current15Update(float value) {
    ValueChangeSet(front_current15, value);
}

void CarViewModel::front_switch01Update(uint value) {
    ValueChangeSet(front_switch01, value);
}

void CarViewModel::front_switch02Update(uint value) {
    ValueChangeSet(front_switch02, value);
}

void CarViewModel::front_switch03Update(uint value) {
    ValueChangeSet(front_switch03, value);
}

void CarViewModel::front_switch04Update(uint value) {
    ValueChangeSet(front_switch04, value);
}

void CarViewModel::front_switch05Update(uint value) {
    ValueChangeSet(front_switch05, value);
}

void CarViewModel::front_switch06Update(uint value) {
    ValueChangeSet(front_switch06, value);
}

void CarViewModel::front_switch07Update(uint value) {
    ValueChangeSet(front_switch07, value);
}

void CarViewModel::front_switch08Update(uint value) {
    ValueChangeSet(front_switch08, value);
}

void CarViewModel::front_switch09Update(uint value) {
    ValueChangeSet(front_switch09, value);
}

void CarViewModel::front_switch10Update(uint value) {
    ValueChangeSet(front_switch10, value);
}

void CarViewModel::front_switch11Update(uint value) {
    ValueChangeSet(front_switch11, value);
}

void CarViewModel::front_switch12Update(uint value) {
    ValueChangeSet(front_switch12, value);
}

void CarViewModel::front_switch13Update(uint value) {
    ValueChangeSet(front_switch13, value);
}

void CarViewModel::front_switch14Update(uint value) {
    ValueChangeSet(front_switch14, value);
}

void CarViewModel::front_switch15Update(uint value) {
    ValueChangeSet(front_switch15, value);
}

void CarViewModel::front_switch16Update(uint value) {
    ValueChangeSet(front_switch16, value);
}

void CarViewModel::front_switch17Update(uint value) {
    ValueChangeSet(front_switch17, value);
}

void CarViewModel::front_switch18Update(uint value) {
    ValueChangeSet(front_switch18, value);
}

void CarViewModel::front_switch19Update(uint value) {
    ValueChangeSet(front_switch19, value);
}

void CarViewModel::front_switch20Update(uint value) {
    ValueChangeSet(front_switch20, value);
}

void CarViewModel::front_switch21Update(uint value) {
    ValueChangeSet(front_switch21, value);
}

void CarViewModel::front_switch22Update(uint value) {
    ValueChangeSet(front_switch22, value);
}

void CarViewModel::front_switch23Update(uint value) {
    ValueChangeSet(front_switch23, value);
}

void CarViewModel::front_switch24Update(uint value) {
    ValueChangeSet(front_switch24, value);
}

void CarViewModel::front_switch25Update(uint value) {
    ValueChangeSet(front_switch25, value);
}

void CarViewModel::front_switch26Update(uint value) {
    ValueChangeSet(front_switch26, value);
}

void CarViewModel::front_switch27Update(uint value) {
    ValueChangeSet(front_switch27, value);
}

void CarViewModel::front_switch28Update(uint value) {
    ValueChangeSet(front_switch28, value);
}

void CarViewModel::front_switch29Update(uint value) {
    ValueChangeSet(front_switch29, value);
}

void CarViewModel::front_switch30Update(uint value) {
    ValueChangeSet(front_switch30, value);
}

void CarViewModel::front_switch31Update(uint value) {
    ValueChangeSet(front_switch31, value);
}

void CarViewModel::front_switch32Update(uint value) {
    ValueChangeSet(front_switch32, value);
}

void CarViewModel::front_switch33Update(uint value) {
    ValueChangeSet(front_switch33, value);
}

void CarViewModel::front_switch34Update(uint value) {
    ValueChangeSet(front_switch34, value);
}

void CarViewModel::front_switch35Update(uint value) {
    ValueChangeSet(front_switch35, value);
}

void CarViewModel::front_switch36Update(uint value) {
    ValueChangeSet(front_switch36, value);
}

void CarViewModel::front_switch37Update(uint value) {
    ValueChangeSet(front_switch37, value);
}

void CarViewModel::front_switch38Update(uint value) {
    ValueChangeSet(front_switch38, value);
}

void CarViewModel::front_switch39Update(uint value) {
    ValueChangeSet(front_switch39, value);
}

void CarViewModel::front_switch40Update(uint value) {
    ValueChangeSet(front_switch40, value);
}

void CarViewModel::front_switch41Update(uint value) {
    ValueChangeSet(front_switch41, value);
}

void CarViewModel::front_switch42Update(uint value) {
    ValueChangeSet(front_switch42, value);
}

/* 中模块,对应MIDDLE_MODULE_TYPE */
void CarViewModel::middle_current01Update(float value) {
    ValueChangeSet(middle_current01, value);
}

void CarViewModel::middle_current02Update(float value) {
    ValueChangeSet(middle_current02, value);
}

void CarViewModel::middle_current03Update(float value) {
    ValueChangeSet(middle_current03, value);
}

void CarViewModel::middle_current04Update(float value) {
    ValueChangeSet(middle_current04, value);
}

void CarViewModel::middle_current05Update(float value) {
    ValueChangeSet(middle_current05, value);
}

void CarViewModel::middle_current06Update(float value) {
    ValueChangeSet(middle_current06, value);
}

void CarViewModel::middle_current07Update(float value) {
    ValueChangeSet(middle_current07, value);
}

void CarViewModel::middle_current08Update(float value) {
    ValueChangeSet(middle_current08, value);
}

void CarViewModel::middle_current09Update(float value) {
    ValueChangeSet(middle_current09, value);
}

void CarViewModel::middle_current10Update(float value) {
    ValueChangeSet(middle_current10, value);
}

void CarViewModel::middle_current11Update(float value) {
    ValueChangeSet(middle_current11, value);
}

void CarViewModel::middle_current12Update(float value) {
    ValueChangeSet(middle_current12, value);
}

void CarViewModel::middle_current13Update(float value) {
    ValueChangeSet(middle_current13, value);
}

void CarViewModel::middle_current14Update(float value) {
    ValueChangeSet(middle_current14, value);
}

void CarViewModel::middle_current15Update(float value) {
    ValueChangeSet(middle_current15, value);
}

void CarViewModel::middle_switch01Update(uint value) {
    ValueChangeSet(middle_switch01, value);
}

void CarViewModel::middle_switch02Update(uint value) {
    ValueChangeSet(middle_switch02, value);
}

void CarViewModel::middle_switch03Update(uint value) {
    ValueChangeSet(middle_switch03, value);
}

void CarViewModel::middle_switch04Update(uint value) {
    ValueChangeSet(middle_switch04, value);
}

void CarViewModel::middle_switch05Update(uint value) {
    ValueChangeSet(middle_switch05, value);
}

void CarViewModel::middle_switch06Update(uint value) {
    ValueChangeSet(middle_switch06, value);
}

void CarViewModel::middle_switch07Update(uint value) {
    ValueChangeSet(middle_switch07, value);
}

void CarViewModel::middle_switch08Update(uint value) {
    ValueChangeSet(middle_switch08, value);
}

void CarViewModel::middle_switch09Update(uint value) {
    ValueChangeSet(middle_switch09, value);
}

void CarViewModel::middle_switch10Update(uint value) {
    ValueChangeSet(middle_switch10, value);
}

void CarViewModel::middle_switch11Update(uint value) {
    ValueChangeSet(middle_switch11, value);
}

void CarViewModel::middle_switch12Update(uint value) {
    ValueChangeSet(middle_switch12, value);
}

void CarViewModel::middle_switch13Update(uint value) {
    ValueChangeSet(middle_switch13, value);
}

void CarViewModel::middle_switch14Update(uint value) {
    ValueChangeSet(middle_switch14, value);
}

void CarViewModel::middle_switch15Update(uint value) {
    ValueChangeSet(middle_switch15, value);
}

void CarViewModel::middle_switch16Update(uint value) {
    ValueChangeSet(middle_switch16, value);
}

void CarViewModel::middle_switch17Update(uint value) {
    ValueChangeSet(middle_switch17, value);
}

void CarViewModel::middle_switch18Update(uint value) {
    ValueChangeSet(middle_switch18, value);
}

void CarViewModel::middle_switch19Update(uint value) {
    ValueChangeSet(middle_switch19, value);
}

void CarViewModel::middle_switch20Update(uint value) {
    ValueChangeSet(middle_switch20, value);
}

void CarViewModel::middle_switch21Update(uint value) {
    ValueChangeSet(middle_switch21, value);
}

void CarViewModel::middle_switch22Update(uint value) {
    ValueChangeSet(middle_switch22, value);
}

void CarViewModel::middle_switch23Update(uint value) {
    ValueChangeSet(middle_switch23, value);
}

void CarViewModel::middle_switch24Update(uint value) {
    ValueChangeSet(middle_switch24, value);
}

void CarViewModel::middle_switch25Update(uint value) {
    ValueChangeSet(middle_switch25, value);
}

void CarViewModel::middle_switch26Update(uint value) {
    ValueChangeSet(middle_switch26, value);
}

void CarViewModel::middle_switch27Update(uint value) {
    ValueChangeSet(middle_switch27, value);
}

void CarViewModel::middle_switch28Update(uint value) {
    ValueChangeSet(middle_switch28, value);
}

void CarViewModel::middle_switch29Update(uint value) {
    ValueChangeSet(middle_switch29, value);
}

void CarViewModel::middle_switch30Update(uint value) {
    ValueChangeSet(middle_switch30, value);
}

void CarViewModel::middle_switch31Update(uint value) {
    ValueChangeSet(middle_switch31, value);
}

void CarViewModel::middle_switch32Update(uint value) {
    ValueChangeSet(middle_switch32, value);
}

void CarViewModel::middle_switch33Update(uint value) {
    ValueChangeSet(middle_switch33, value);
}

void CarViewModel::middle_switch34Update(uint value) {
    ValueChangeSet(middle_switch34, value);
}

void CarViewModel::middle_switch35Update(uint value) {
    ValueChangeSet(middle_switch35, value);
}

void CarViewModel::middle_switch36Update(uint value) {
    ValueChangeSet(middle_switch36, value);
}

void CarViewModel::middle_switch37Update(uint value) {
    ValueChangeSet(middle_switch37, value);
}

void CarViewModel::middle_switch38Update(uint value) {
    ValueChangeSet(middle_switch38, value);
}

void CarViewModel::middle_switch39Update(uint value) {
    ValueChangeSet(middle_switch39, value);
}

void CarViewModel::middle_switch40Update(uint value) {
    ValueChangeSet(middle_switch40, value);
}

void CarViewModel::middle_switch41Update(uint value) {
    ValueChangeSet(middle_switch41, value);
}

void CarViewModel::middle_switch42Update(uint value) {
    ValueChangeSet(middle_switch42, value);
}

/* 后模块,对应BCAK_MODULE_TYPE */
void CarViewModel::back_current01Update(float value) {
    ValueChangeSet(back_current01, value);
}

void CarViewModel::back_current02Update(float value) {
    ValueChangeSet(back_current02, value);
}

void CarViewModel::back_current03Update(float value) {
    ValueChangeSet(back_current03, value);
}

void CarViewModel::back_current04Update(float value) {
    ValueChangeSet(back_current04, value);
}

void CarViewModel::back_current05Update(float value) {
    ValueChangeSet(back_current05, value);
}

void CarViewModel::back_current06Update(float value) {
    ValueChangeSet(back_current06, value);
}

void CarViewModel::back_current07Update(float value) {
    ValueChangeSet(back_current07, value);
}

void CarViewModel::back_current08Update(float value) {
    ValueChangeSet(back_current08, value);
}

void CarViewModel::back_current09Update(float value) {
    ValueChangeSet(back_current09, value);
}

void CarViewModel::back_current10Update(float value) {
    ValueChangeSet(back_current10, value);
}

void CarViewModel::back_current11Update(float value) {
    ValueChangeSet(back_current11, value);
}

void CarViewModel::back_current12Update(float value) {
    ValueChangeSet(back_current12, value);
}

void CarViewModel::back_current13Update(float value) {
    ValueChangeSet(back_current13, value);
}

void CarViewModel::back_current14Update(float value) {
    ValueChangeSet(back_current14, value);
}

void CarViewModel::back_current15Update(float value) {
    ValueChangeSet(back_current15, value);
}

void CarViewModel::back_switch01Update(uint value) {
    ValueChangeSet(back_switch01, value);
}

void CarViewModel::back_switch02Update(uint value) {
    ValueChangeSet(back_switch02, value);
}

void CarViewModel::back_switch03Update(uint value) {
    ValueChangeSet(back_switch03, value);
}

void CarViewModel::back_switch04Update(uint value) {
    ValueChangeSet(back_switch04, value);
}

void CarViewModel::back_switch05Update(uint value) {
    ValueChangeSet(back_switch05, value);
}

void CarViewModel::back_switch06Update(uint value) {
    ValueChangeSet(back_switch06, value);
}

void CarViewModel::back_switch07Update(uint value) {
    ValueChangeSet(back_switch07, value);
}

void CarViewModel::back_switch08Update(uint value) {
    ValueChangeSet(back_switch08, value);
}

void CarViewModel::back_switch09Update(uint value) {
    ValueChangeSet(back_switch09, value);
}

void CarViewModel::back_switch10Update(uint value) {
    ValueChangeSet(back_switch10, value);
}

void CarViewModel::back_switch11Update(uint value) {
    ValueChangeSet(back_switch11, value);
}

void CarViewModel::back_switch12Update(uint value) {
    ValueChangeSet(back_switch12, value);
}

void CarViewModel::back_switch13Update(uint value) {
    ValueChangeSet(back_switch13, value);
}

void CarViewModel::back_switch14Update(uint value) {
    ValueChangeSet(back_switch14, value);
}

void CarViewModel::back_switch15Update(uint value) {
    ValueChangeSet(back_switch15, value);
}

void CarViewModel::back_switch16Update(uint value) {
    ValueChangeSet(back_switch16, value);
}

void CarViewModel::back_switch17Update(uint value) {
    ValueChangeSet(back_switch17, value);
}

void CarViewModel::back_switch18Update(uint value) {
    ValueChangeSet(back_switch18, value);
}

void CarViewModel::back_switch19Update(uint value) {
    ValueChangeSet(back_switch19, value);
}

void CarViewModel::back_switch20Update(uint value) {
    ValueChangeSet(back_switch20, value);
}

void CarViewModel::back_switch21Update(uint value) {
    ValueChangeSet(back_switch21, value);
}

void CarViewModel::back_switch22Update(uint value) {
    ValueChangeSet(back_switch22, value);
}

void CarViewModel::back_switch23Update(uint value) {
    ValueChangeSet(back_switch23, value);
}

void CarViewModel::back_switch24Update(uint value) {
    ValueChangeSet(back_switch24, value);
}

void CarViewModel::back_switch25Update(uint value) {
    ValueChangeSet(back_switch25, value);
}

void CarViewModel::back_switch26Update(uint value) {
    ValueChangeSet(back_switch26, value);
}

void CarViewModel::back_switch27Update(uint value) {
    ValueChangeSet(back_switch27, value);
}

void CarViewModel::back_switch28Update(uint value) {
    ValueChangeSet(back_switch28, value);
}

void CarViewModel::back_switch29Update(uint value) {
    ValueChangeSet(back_switch29, value);
}

void CarViewModel::back_switch30Update(uint value) {
    ValueChangeSet(back_switch30, value);
}

void CarViewModel::back_switch31Update(uint value) {
    ValueChangeSet(back_switch31, value);
}

void CarViewModel::back_switch32Update(uint value) {
    ValueChangeSet(back_switch32, value);
}

void CarViewModel::back_switch33Update(uint value) {
    ValueChangeSet(back_switch33, value);
}

void CarViewModel::back_switch34Update(uint value) {
    ValueChangeSet(back_switch34, value);
}

void CarViewModel::back_switch35Update(uint value) {
    ValueChangeSet(back_switch35, value);
}

void CarViewModel::back_switch36Update(uint value) {
    ValueChangeSet(back_switch36, value);
}

void CarViewModel::back_switch37Update(uint value) {
    ValueChangeSet(back_switch37, value);
}

void CarViewModel::back_switch38Update(uint value) {
    ValueChangeSet(back_switch38, value);
}

void CarViewModel::back_switch39Update(uint value) {
    ValueChangeSet(back_switch39, value);
}

void CarViewModel::back_switch40Update(uint value) {
    ValueChangeSet(back_switch40, value);
}

void CarViewModel::back_switch41Update(uint value) {
    ValueChangeSet(back_switch41, value);
}

void CarViewModel::back_switch42Update(uint value) {
    ValueChangeSet(back_switch42, value);
}


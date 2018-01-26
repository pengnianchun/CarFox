
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
    connect(worker, &CustomCarMsgWorker::moter_control_tempChanged, this, &CustomCarMsg::updateMoter_control_temp);
    connect(worker, &CustomCarMsgWorker::moter_tempChanged, this, &CustomCarMsg::updateMoter_temp);
    connect(worker, &CustomCarMsgWorker::batteryChanged, this, &CustomCarMsg::updateBattery);
    connect(worker, &CustomCarMsgWorker::spnChanged, this, &CustomCarMsg::updateSpn);
    connect(worker, &CustomCarMsgWorker::engine_water_tempChanged, this, &CustomCarMsg::updateEngine_water_temp);
    connect(worker, &CustomCarMsgWorker::urea_levelChanged, this, &CustomCarMsg::updateUrea_level);
    connect(worker, &CustomCarMsgWorker::fault_levelChanged, this, &CustomCarMsg::updateFault_level);
    connect(worker, &CustomCarMsgWorker::fault_codeChanged, this, &CustomCarMsg::updateFault_code);
    connect(worker, &CustomCarMsgWorker::oil_levelChanged, this, &CustomCarMsg::updateOil_level);
    connect(worker, &CustomCarMsgWorker::engine_oil_pressureChanged, this, &CustomCarMsg::updateEngine_oil_pressure);

    connect(worker, &CustomCarMsgWorker::motor_in_voltageChanged, this, &CustomCarMsg::updateMotor_in_voltage);
    connect(worker, &CustomCarMsgWorker::motor_in_currentChanged, this, &CustomCarMsg::updateMotor_in_current);
    connect(worker, &CustomCarMsgWorker::motor_tempChanged, this, &CustomCarMsg::updateMotor_temp);
    connect(worker, &CustomCarMsgWorker::motor_controller_tempChanged, this, &CustomCarMsg::updateMotor_controller_temp);
    connect(worker, &CustomCarMsgWorker::car_modeChanged, this, &CustomCarMsg::updateCar_mode);
    connect(worker, &CustomCarMsgWorker::versionChanged, this, &CustomCarMsg::updateVersion);
    connect(worker, &CustomCarMsgWorker::car_lifeChanged, this, &CustomCarMsg::updateCar_life);
    connect(worker, &CustomCarMsgWorker::accel_pedal_percentChanged, this, &CustomCarMsg::updateAccel_pedal_percent);
    connect(worker, &CustomCarMsgWorker::brake_pedal_percentChanged, this, &CustomCarMsg::updateBrake_pedal_percent);
    connect(worker, &CustomCarMsgWorker::din1Changed, this, &CustomCarMsg::updateDin1);
    connect(worker, &CustomCarMsgWorker::din2Changed, this, &CustomCarMsg::updateDin2);
    connect(worker, &CustomCarMsgWorker::din3Changed, this, &CustomCarMsg::updateDin3);
    connect(worker, &CustomCarMsgWorker::dout1Changed, this, &CustomCarMsg::updateDout1);
    connect(worker, &CustomCarMsgWorker::dout2Changed, this, &CustomCarMsg::updateDout2);
    connect(worker, &CustomCarMsgWorker::dout3Changed, this, &CustomCarMsg::updateDout3);

    connect(worker, &CustomCarMsgWorker::engine_fuel_consumptionChanged, this, &CustomCarMsg::updateEngine_fuel_consumption);
    connect(worker, &CustomCarMsgWorker::engine_loadChanged, this, &CustomCarMsg::updateEngine_load);
    connect(worker, &CustomCarMsgWorker::engine_target_throttleChanged, this, &CustomCarMsg::updateEngine_target_throttle);
    connect(worker, &CustomCarMsgWorker::engine_actual_throttleChanged, this, &CustomCarMsg::updateEngine_actual_throttle);
    connect(worker, &CustomCarMsgWorker::engine_inlet_temperatureChanged, this, &CustomCarMsg::updateEngine_inlet_temperature);

    connect(worker, &CustomCarMsgWorker::oil_pump_dcac_w_output_currentChanged, this, &CustomCarMsg::updateOil_pump_dcac_w_output_current);
    connect(worker, &CustomCarMsgWorker::oil_pump_dcac_v_output_currentChanged, this, &CustomCarMsg::updateOil_pump_dcac_v_output_current);
    connect(worker, &CustomCarMsgWorker::oil_pump_dcac_u_output_currentChanged, this, &CustomCarMsg::updateOil_pump_dcac_u_output_current);
    connect(worker, &CustomCarMsgWorker::radiator_temperatureChanged, this, &CustomCarMsg::updateRadiator_temperature);

    connect(worker, &CustomCarMsgWorker::actual_clutch_positionChanged, this, &CustomCarMsg::updateActual_clutch_position);
    connect(worker, &CustomCarMsgWorker::tcu_fault_codeChanged, this, &CustomCarMsg::updateTcu_fault_code);
    connect(worker, &CustomCarMsgWorker::axis_rpmChanged, this, &CustomCarMsg::updateAxis_rpm);
    connect(worker, &CustomCarMsgWorker::fmiChanged, this, &CustomCarMsg::updateFmi);
    connect(worker, &CustomCarMsgWorker::cmChanged, this, &CustomCarMsg::updateCm);
    connect(worker, &CustomCarMsgWorker::ocChanged, this, &CustomCarMsg::updateOc);

    connect(worker, &CustomCarMsgWorker::bat_max_charge_currentChanged, this, &CustomCarMsg::updateBat_max_charge_current);
    connect(worker, &CustomCarMsgWorker::bat_max_discharge_currentChanged, this, &CustomCarMsg::updateBat_max_discharge_current);
    connect(worker, &CustomCarMsgWorker::bat_average_voltageChanged, this, &CustomCarMsg::updateBat_average_voltage);
    connect(worker, &CustomCarMsgWorker::bat_status1Changed, this, &CustomCarMsg::updateBat_status1);
    connect(worker, &CustomCarMsgWorker::bat_status2Changed, this, &CustomCarMsg::updateBat_status2);
    connect(worker, &CustomCarMsgWorker::bat_status3Changed, this, &CustomCarMsg::updateBat_status3);
    connect(worker, &CustomCarMsgWorker::irm_ohm_positiveChanged, this, &CustomCarMsg::updateIrm_ohm_positive);
    connect(worker, &CustomCarMsgWorker::irm_ohm_negativeChanged, this, &CustomCarMsg::updateIrm_ohm_negative);
    connect(worker, &CustomCarMsgWorker::bat_max_voltageChanged, this, &CustomCarMsg::updateBat_max_voltage);
    connect(worker, &CustomCarMsgWorker::bat_min_voltageChanged, this, &CustomCarMsg::updateBat_min_voltage);
    connect(worker, &CustomCarMsgWorker::battery_highest_tempChanged, this, &CustomCarMsg::updateBattery_highest_temp);

    connect(worker, &CustomCarMsgWorker::ac_fault_codeChanged, this, &CustomCarMsg::updateAc_fault_code);
    connect(worker, &CustomCarMsgWorker::ac_fan_statusChanged, this, &CustomCarMsg::updateAc_fan_status);
    connect(worker, &CustomCarMsgWorker::ac_work_statusChanged, this, &CustomCarMsg::updateAc_work_status);
    connect(worker, &CustomCarMsgWorker::ac_lifeChanged, this, &CustomCarMsg::updateAc_life);
    connect(worker, &CustomCarMsgWorker::ac_out_tempChanged, this, &CustomCarMsg::updateAc_out_temp);
    connect(worker, &CustomCarMsgWorker::ac_in_tempChanged, this, &CustomCarMsg::updateAc_in_temp);
    connect(worker, &CustomCarMsgWorker::ac_set_tempChanged, this, &CustomCarMsg::updateAc_set_temp);
    connect(worker, &CustomCarMsgWorker::ac_refrigere_reqChanged, this, &CustomCarMsg::updateAc_refrigere_req);

    connect(worker, &CustomCarMsgWorker::input_ctrl_01Changed, this, &CustomCarMsg::updateInput_ctrl_01);
    connect(worker, &CustomCarMsgWorker::input_ctrl_02Changed, this, &CustomCarMsg::updateInput_ctrl_02);
    connect(worker, &CustomCarMsgWorker::input_ctrl_03Changed, this, &CustomCarMsg::updateInput_ctrl_03);
    connect(worker, &CustomCarMsgWorker::input_ctrl_04Changed, this, &CustomCarMsg::updateInput_ctrl_04);
    connect(worker, &CustomCarMsgWorker::input_ctrl_05Changed, this, &CustomCarMsg::updateInput_ctrl_05);
    connect(worker, &CustomCarMsgWorker::input_ctrl_06Changed, this, &CustomCarMsg::updateInput_ctrl_06);
    connect(worker, &CustomCarMsgWorker::input_ctrl_07Changed, this, &CustomCarMsg::updateInput_ctrl_07);
    connect(worker, &CustomCarMsgWorker::input_ctrl_08Changed, this, &CustomCarMsg::updateInput_ctrl_08);
    connect(worker, &CustomCarMsgWorker::input_ctrl_09Changed, this, &CustomCarMsg::updateInput_ctrl_09);
    connect(worker, &CustomCarMsgWorker::input_ctrl_10Changed, this, &CustomCarMsg::updateInput_ctrl_10);
    connect(worker, &CustomCarMsgWorker::input_ctrl_11Changed, this, &CustomCarMsg::updateInput_ctrl_11);
    connect(worker, &CustomCarMsgWorker::input_ctrl_12Changed, this, &CustomCarMsg::updateInput_ctrl_12);
    connect(worker, &CustomCarMsgWorker::input_ctrl_13Changed, this, &CustomCarMsg::updateInput_ctrl_13);
    connect(worker, &CustomCarMsgWorker::input_ctrl_14Changed, this, &CustomCarMsg::updateInput_ctrl_14);
    connect(worker, &CustomCarMsgWorker::input_ctrl_15Changed, this, &CustomCarMsg::updateInput_ctrl_15);
    connect(worker, &CustomCarMsgWorker::input_ctrl_16Changed, this, &CustomCarMsg::updateInput_ctrl_16);
    connect(worker, &CustomCarMsgWorker::input_ctrl_17Changed, this, &CustomCarMsg::updateInput_ctrl_17);
    connect(worker, &CustomCarMsgWorker::input_ctrl_18Changed, this, &CustomCarMsg::updateInput_ctrl_18);
    connect(worker, &CustomCarMsgWorker::input_ctrl_19Changed, this, &CustomCarMsg::updateInput_ctrl_19);
    connect(worker, &CustomCarMsgWorker::input_ctrl_20Changed, this, &CustomCarMsg::updateInput_ctrl_20);
    connect(worker, &CustomCarMsgWorker::input_ctrl_21Changed, this, &CustomCarMsg::updateInput_ctrl_21);
    connect(worker, &CustomCarMsgWorker::input_ctrl_22Changed, this, &CustomCarMsg::updateInput_ctrl_22);
    connect(worker, &CustomCarMsgWorker::input_ctrl_23Changed, this, &CustomCarMsg::updateInput_ctrl_23);
    connect(worker, &CustomCarMsgWorker::input_ctrl_24Changed, this, &CustomCarMsg::updateInput_ctrl_24);
    connect(worker, &CustomCarMsgWorker::input_ctrl_25Changed, this, &CustomCarMsg::updateInput_ctrl_25);
    connect(worker, &CustomCarMsgWorker::input_ctrl_26Changed, this, &CustomCarMsg::updateInput_ctrl_26);
    connect(worker, &CustomCarMsgWorker::input_ctrl_27Changed, this, &CustomCarMsg::updateInput_ctrl_27);
    connect(worker, &CustomCarMsgWorker::input_ctrl_28Changed, this, &CustomCarMsg::updateInput_ctrl_28);
    connect(worker, &CustomCarMsgWorker::input_ctrl_29Changed, this, &CustomCarMsg::updateInput_ctrl_29);
    connect(worker, &CustomCarMsgWorker::input_ctrl_30Changed, this, &CustomCarMsg::updateInput_ctrl_30);
    connect(worker, &CustomCarMsgWorker::input_ctrl_31Changed, this, &CustomCarMsg::updateInput_ctrl_31);
    connect(worker, &CustomCarMsgWorker::input_ctrl_32Changed, this, &CustomCarMsg::updateInput_ctrl_32);
    connect(worker, &CustomCarMsgWorker::input_ctrl_33Changed, this, &CustomCarMsg::updateInput_ctrl_33);
    connect(worker, &CustomCarMsgWorker::input_ctrl_34Changed, this, &CustomCarMsg::updateInput_ctrl_34);
    connect(worker, &CustomCarMsgWorker::input_ctrl_35Changed, this, &CustomCarMsg::updateInput_ctrl_35);

    connect(worker, &CustomCarMsgWorker::lamp_key_onChanged, this, &CustomCarMsg::updateLamp_key_on);
    connect(worker, &CustomCarMsgWorker::lamp_air_filterChanged, this, &CustomCarMsg::updateLamp_air_filter);
    connect(worker, &CustomCarMsgWorker::lamp_asrChanged, this, &CustomCarMsg::updateLamp_asr);
    connect(worker, &CustomCarMsgWorker::lamp_high_voltage_maintenanceChanged, this, &CustomCarMsg::updateLamp_high_voltage_maintenance);
    connect(worker, &CustomCarMsgWorker::lamp_defrosterChanged, this, &CustomCarMsg::updateLamp_defroster);
    connect(worker, &CustomCarMsgWorker::lamp_dryereChanged, this, &CustomCarMsg::updateLamp_dryere);
    connect(worker, &CustomCarMsgWorker::lamp_absChanged, this, &CustomCarMsg::updateLamp_abs);
    connect(worker, &CustomCarMsgWorker::lamp_acChanged, this, &CustomCarMsg::updateLamp_ac);
    connect(worker, &CustomCarMsgWorker::power_supplyChanged, this, &CustomCarMsg::updatePower_supply);
    connect(worker, &CustomCarMsgWorker::climbing_modeChanged, this, &CustomCarMsg::updateClimbing_mode);
    connect(worker, &CustomCarMsgWorker::diagnostic_modeChanged, this, &CustomCarMsg::updateDiagnostic_mode);

    connect(worker, &CustomCarMsgWorker::lamp_turn_leftChanged, this, &CustomCarMsg::updateLamp_turn_left);
    connect(worker, &CustomCarMsgWorker::lamp_turn_rightChanged, this, &CustomCarMsg::updateLamp_turn_right);

    connect(worker, &CustomCarMsgWorker::lamp_double_flashChanged, this, &CustomCarMsg::updateLamp_double_flash);
    connect(worker, &CustomCarMsgWorker::lamp_front_fogChanged, this, &CustomCarMsg::updateLamp_front_fog);
    connect(worker, &CustomCarMsgWorker::lamp_rear_fogChanged, this, &CustomCarMsg::updateLamp_rear_fog);
    connect(worker, &CustomCarMsgWorker::lamp_high_beamChanged, this, &CustomCarMsg::updateLamp_high_beam);
    connect(worker, &CustomCarMsgWorker::lamp_head_lightChanged, this, &CustomCarMsg::updateLamp_head_light);
    connect(worker, &CustomCarMsgWorker::lamp_reverse_gearChanged, this, &CustomCarMsg::updateLamp_reverse_gear);
    connect(worker, &CustomCarMsgWorker::lamp_position_lightChanged, this, &CustomCarMsg::updateLamp_position_light);

    connect(worker, &CustomCarMsgWorker::lamp_gate1Changed, this, &CustomCarMsg::updateLamp_gate1);
    connect(worker, &CustomCarMsgWorker::lamp_gate2Changed, this, &CustomCarMsg::updateLamp_gate2);
    connect(worker, &CustomCarMsgWorker::lamp_rear_door_openChanged, this, &CustomCarMsg::updateLamp_rear_door_open);

    connect(worker, &CustomCarMsgWorker::lamp_brakeChanged, this, &CustomCarMsg::updateLamp_brake);
    connect(worker, &CustomCarMsgWorker::lamp_parking_brakeChanged, this, &CustomCarMsg::updateLamp_parking_brake);

    connect(worker, &CustomCarMsgWorker::lamp_left_low_air_pressureChanged, this, &CustomCarMsg::updateLamp_left_low_air_pressure);
    connect(worker, &CustomCarMsgWorker::lamp_right_low_air_pressureChanged, this, &CustomCarMsg::updateLamp_right_low_air_pressure);

    connect(worker, &CustomCarMsgWorker::lamp_left_shoe_wearChanged, this, &CustomCarMsg::updateLamp_left_shoe_wear);
    connect(worker, &CustomCarMsgWorker::lamp_right_shoe_wearChanged, this, &CustomCarMsg::updateLamp_right_shoe_wear);

    connect(worker, &CustomCarMsgWorker::lamp_charge_confirmChanged, this, &CustomCarMsg::updateLamp_charge_confirm);
    connect(worker, &CustomCarMsgWorker::lamp_battery_main_contactChanged, this, &CustomCarMsg::updateLamp_battery_main_contact);

    connect(worker, &CustomCarMsgWorker::lamp_water_temp_highChanged, this, &CustomCarMsg::updateLamp_water_temp_high);
    connect(worker, &CustomCarMsgWorker::lamp_water_level_lowChanged, this, &CustomCarMsg::updateLamp_water_level_low);

    connect(worker, &CustomCarMsgWorker::lamp_low_service_wlChanged, this, &CustomCarMsg::updateLamp_low_service_wl);
    connect(worker, &CustomCarMsgWorker::lamp_heavy_stop_wlChanged, this, &CustomCarMsg::updateLamp_heavy_stop_wl);
    connect(worker, &CustomCarMsgWorker::lamp_serious_stop_wlChanged, this, &CustomCarMsg::updateLamp_serious_stop_wl);

    connect(worker, &CustomCarMsgWorker::lamp_oil_level_lowChanged, this, &CustomCarMsg::updateLamp_oil_level_low);
    connect(worker, &CustomCarMsgWorker::lamp_oil_pressure_lowChanged, this, &CustomCarMsg::updateLamp_oil_pressure_low);
    connect(worker, &CustomCarMsgWorker::lamp_engine_faultChanged, this, &CustomCarMsg::updateLamp_engine_fault);

    connect(worker, &CustomCarMsgWorker::lamp_motor_out_of_serviceChanged, this, &CustomCarMsg::updateLamp_motor_out_of_service);
    connect(worker, &CustomCarMsgWorker::lamp_moter_fire_igonChanged, this, &CustomCarMsg::updateLamp_moter_fire_igon);

    connect(worker, &CustomCarMsgWorker::front_output_current_01Changed, this, &CustomCarMsg::updateFront_output_current_01);
    connect(worker, &CustomCarMsgWorker::front_output_current_02Changed, this, &CustomCarMsg::updateFront_output_current_02);
    connect(worker, &CustomCarMsgWorker::front_output_current_03Changed, this, &CustomCarMsg::updateFront_output_current_03);
    connect(worker, &CustomCarMsgWorker::front_output_current_04Changed, this, &CustomCarMsg::updateFront_output_current_04);
    connect(worker, &CustomCarMsgWorker::front_output_current_05Changed, this, &CustomCarMsg::updateFront_output_current_05);

    connect(worker, &CustomCarMsgWorker::front_output_current_06Changed, this, &CustomCarMsg::updateFront_output_current_06);
    connect(worker, &CustomCarMsgWorker::front_output_current_07Changed, this, &CustomCarMsg::updateFront_output_current_07);
    connect(worker, &CustomCarMsgWorker::front_output_current_08Changed, this, &CustomCarMsg::updateFront_output_current_08);
    connect(worker, &CustomCarMsgWorker::front_output_current_09Changed, this, &CustomCarMsg::updateFront_output_current_09);
    connect(worker, &CustomCarMsgWorker::front_output_current_10Changed, this, &CustomCarMsg::updateFront_output_current_10);

    connect(worker, &CustomCarMsgWorker::front_output_current_11Changed, this, &CustomCarMsg::updateFront_output_current_11);
    connect(worker, &CustomCarMsgWorker::front_output_current_12Changed, this, &CustomCarMsg::updateFront_output_current_12);
    connect(worker, &CustomCarMsgWorker::front_output_current_13Changed, this, &CustomCarMsg::updateFront_output_current_13);
    connect(worker, &CustomCarMsgWorker::front_output_current_14Changed, this, &CustomCarMsg::updateFront_output_current_14);
    connect(worker, &CustomCarMsgWorker::front_output_current_15Changed, this, &CustomCarMsg::updateFront_output_current_15);

    connect(worker, &CustomCarMsgWorker::front_switch_01Changed, this, &CustomCarMsg::updateFront_switch_01);
    connect(worker, &CustomCarMsgWorker::front_switch_02Changed, this, &CustomCarMsg::updateFront_switch_02);
    connect(worker, &CustomCarMsgWorker::front_switch_03Changed, this, &CustomCarMsg::updateFront_switch_03);
    connect(worker, &CustomCarMsgWorker::front_switch_04Changed, this, &CustomCarMsg::updateFront_switch_04);
    connect(worker, &CustomCarMsgWorker::front_switch_05Changed, this, &CustomCarMsg::updateFront_switch_05);
    connect(worker, &CustomCarMsgWorker::front_switch_06Changed, this, &CustomCarMsg::updateFront_switch_06);
    connect(worker, &CustomCarMsgWorker::front_switch_07Changed, this, &CustomCarMsg::updateFront_switch_07);
    connect(worker, &CustomCarMsgWorker::front_switch_08Changed, this, &CustomCarMsg::updateFront_switch_08);
    connect(worker, &CustomCarMsgWorker::front_switch_09Changed, this, &CustomCarMsg::updateFront_switch_09);
    connect(worker, &CustomCarMsgWorker::front_switch_10Changed, this, &CustomCarMsg::updateFront_switch_10);
    connect(worker, &CustomCarMsgWorker::front_switch_11Changed, this, &CustomCarMsg::updateFront_switch_11);
    connect(worker, &CustomCarMsgWorker::front_switch_12Changed, this, &CustomCarMsg::updateFront_switch_12);
    connect(worker, &CustomCarMsgWorker::front_switch_13Changed, this, &CustomCarMsg::updateFront_switch_13);
    connect(worker, &CustomCarMsgWorker::front_switch_14Changed, this, &CustomCarMsg::updateFront_switch_14);
    connect(worker, &CustomCarMsgWorker::front_switch_15Changed, this, &CustomCarMsg::updateFront_switch_15);
    connect(worker, &CustomCarMsgWorker::front_switch_16Changed, this, &CustomCarMsg::updateFront_switch_16);

    connect(worker, &CustomCarMsgWorker::front_switch_17Changed, this, &CustomCarMsg::updateFront_switch_17);
    connect(worker, &CustomCarMsgWorker::front_switch_18Changed, this, &CustomCarMsg::updateFront_switch_18);
    connect(worker, &CustomCarMsgWorker::front_switch_19Changed, this, &CustomCarMsg::updateFront_switch_19);
    connect(worker, &CustomCarMsgWorker::front_switch_20Changed, this, &CustomCarMsg::updateFront_switch_20);
    connect(worker, &CustomCarMsgWorker::front_switch_21Changed, this, &CustomCarMsg::updateFront_switch_21);
    connect(worker, &CustomCarMsgWorker::front_switch_22Changed, this, &CustomCarMsg::updateFront_switch_22);
    connect(worker, &CustomCarMsgWorker::front_switch_23Changed, this, &CustomCarMsg::updateFront_switch_23);
    connect(worker, &CustomCarMsgWorker::front_switch_24Changed, this, &CustomCarMsg::updateFront_switch_24);
    connect(worker, &CustomCarMsgWorker::front_switch_25Changed, this, &CustomCarMsg::updateFront_switch_25);
    connect(worker, &CustomCarMsgWorker::front_switch_26Changed, this, &CustomCarMsg::updateFront_switch_26);
    connect(worker, &CustomCarMsgWorker::front_switch_27Changed, this, &CustomCarMsg::updateFront_switch_27);
    connect(worker, &CustomCarMsgWorker::front_switch_28Changed, this, &CustomCarMsg::updateFront_switch_28);
    connect(worker, &CustomCarMsgWorker::front_switch_29Changed, this, &CustomCarMsg::updateFront_switch_29);
    connect(worker, &CustomCarMsgWorker::front_switch_30Changed, this, &CustomCarMsg::updateFront_switch_30);
    connect(worker, &CustomCarMsgWorker::front_switch_31Changed, this, &CustomCarMsg::updateFront_switch_31);
    connect(worker, &CustomCarMsgWorker::front_switch_32Changed, this, &CustomCarMsg::updateFront_switch_32);

    connect(worker, &CustomCarMsgWorker::front_switch_33Changed, this, &CustomCarMsg::updateFront_switch_33);
    connect(worker, &CustomCarMsgWorker::front_switch_34Changed, this, &CustomCarMsg::updateFront_switch_34);
    connect(worker, &CustomCarMsgWorker::front_switch_35Changed, this, &CustomCarMsg::updateFront_switch_35);
    connect(worker, &CustomCarMsgWorker::front_switch_36Changed, this, &CustomCarMsg::updateFront_switch_36);
    connect(worker, &CustomCarMsgWorker::front_switch_37Changed, this, &CustomCarMsg::updateFront_switch_37);
    connect(worker, &CustomCarMsgWorker::front_switch_38Changed, this, &CustomCarMsg::updateFront_switch_38);
    connect(worker, &CustomCarMsgWorker::front_switch_39Changed, this, &CustomCarMsg::updateFront_switch_39);
    connect(worker, &CustomCarMsgWorker::front_switch_40Changed, this, &CustomCarMsg::updateFront_switch_40);
    connect(worker, &CustomCarMsgWorker::front_switch_41Changed, this, &CustomCarMsg::updateFront_switch_41);
    connect(worker, &CustomCarMsgWorker::front_switch_42Changed, this, &CustomCarMsg::updateFront_switch_42);

    connect(worker, &CustomCarMsgWorker::middle_output_current_01Changed, this, &CustomCarMsg::updateMiddle_output_current_01);
    connect(worker, &CustomCarMsgWorker::middle_output_current_02Changed, this, &CustomCarMsg::updateMiddle_output_current_02);
    connect(worker, &CustomCarMsgWorker::middle_output_current_03Changed, this, &CustomCarMsg::updateMiddle_output_current_03);
    connect(worker, &CustomCarMsgWorker::middle_output_current_04Changed, this, &CustomCarMsg::updateMiddle_output_current_04);
    connect(worker, &CustomCarMsgWorker::middle_output_current_05Changed, this, &CustomCarMsg::updateMiddle_output_current_05);

    connect(worker, &CustomCarMsgWorker::middle_output_current_06Changed, this, &CustomCarMsg::updateMiddle_output_current_06);
    connect(worker, &CustomCarMsgWorker::middle_output_current_07Changed, this, &CustomCarMsg::updateMiddle_output_current_07);
    connect(worker, &CustomCarMsgWorker::middle_output_current_08Changed, this, &CustomCarMsg::updateMiddle_output_current_08);
    connect(worker, &CustomCarMsgWorker::middle_output_current_09Changed, this, &CustomCarMsg::updateMiddle_output_current_09);
    connect(worker, &CustomCarMsgWorker::middle_output_current_10Changed, this, &CustomCarMsg::updateMiddle_output_current_10);

    connect(worker, &CustomCarMsgWorker::middle_output_current_11Changed, this, &CustomCarMsg::updateMiddle_output_current_11);
    connect(worker, &CustomCarMsgWorker::middle_output_current_12Changed, this, &CustomCarMsg::updateMiddle_output_current_12);
    connect(worker, &CustomCarMsgWorker::middle_output_current_13Changed, this, &CustomCarMsg::updateMiddle_output_current_13);
    connect(worker, &CustomCarMsgWorker::middle_output_current_14Changed, this, &CustomCarMsg::updateMiddle_output_current_14);
    connect(worker, &CustomCarMsgWorker::middle_output_current_15Changed, this, &CustomCarMsg::updateMiddle_output_current_15);

    connect(worker, &CustomCarMsgWorker::middle_switch_01Changed, this, &CustomCarMsg::updateMiddle_switch_01);
    connect(worker, &CustomCarMsgWorker::middle_switch_02Changed, this, &CustomCarMsg::updateMiddle_switch_02);
    connect(worker, &CustomCarMsgWorker::middle_switch_03Changed, this, &CustomCarMsg::updateMiddle_switch_03);
    connect(worker, &CustomCarMsgWorker::middle_switch_04Changed, this, &CustomCarMsg::updateMiddle_switch_04);
    connect(worker, &CustomCarMsgWorker::middle_switch_05Changed, this, &CustomCarMsg::updateMiddle_switch_05);
    connect(worker, &CustomCarMsgWorker::middle_switch_06Changed, this, &CustomCarMsg::updateMiddle_switch_06);
    connect(worker, &CustomCarMsgWorker::middle_switch_07Changed, this, &CustomCarMsg::updateMiddle_switch_07);
    connect(worker, &CustomCarMsgWorker::middle_switch_08Changed, this, &CustomCarMsg::updateMiddle_switch_08);
    connect(worker, &CustomCarMsgWorker::middle_switch_09Changed, this, &CustomCarMsg::updateMiddle_switch_09);
    connect(worker, &CustomCarMsgWorker::middle_switch_10Changed, this, &CustomCarMsg::updateMiddle_switch_10);
    connect(worker, &CustomCarMsgWorker::middle_switch_11Changed, this, &CustomCarMsg::updateMiddle_switch_11);
    connect(worker, &CustomCarMsgWorker::middle_switch_12Changed, this, &CustomCarMsg::updateMiddle_switch_12);
    connect(worker, &CustomCarMsgWorker::middle_switch_13Changed, this, &CustomCarMsg::updateMiddle_switch_13);
    connect(worker, &CustomCarMsgWorker::middle_switch_14Changed, this, &CustomCarMsg::updateMiddle_switch_14);
    connect(worker, &CustomCarMsgWorker::middle_switch_15Changed, this, &CustomCarMsg::updateMiddle_switch_15);
    connect(worker, &CustomCarMsgWorker::middle_switch_16Changed, this, &CustomCarMsg::updateMiddle_switch_16);

    connect(worker, &CustomCarMsgWorker::middle_switch_17Changed, this, &CustomCarMsg::updateMiddle_switch_17);
    connect(worker, &CustomCarMsgWorker::middle_switch_18Changed, this, &CustomCarMsg::updateMiddle_switch_18);
    connect(worker, &CustomCarMsgWorker::middle_switch_19Changed, this, &CustomCarMsg::updateMiddle_switch_19);
    connect(worker, &CustomCarMsgWorker::middle_switch_20Changed, this, &CustomCarMsg::updateMiddle_switch_20);
    connect(worker, &CustomCarMsgWorker::middle_switch_21Changed, this, &CustomCarMsg::updateMiddle_switch_21);
    connect(worker, &CustomCarMsgWorker::middle_switch_22Changed, this, &CustomCarMsg::updateMiddle_switch_22);
    connect(worker, &CustomCarMsgWorker::middle_switch_23Changed, this, &CustomCarMsg::updateMiddle_switch_23);
    connect(worker, &CustomCarMsgWorker::middle_switch_24Changed, this, &CustomCarMsg::updateMiddle_switch_24);
    connect(worker, &CustomCarMsgWorker::middle_switch_25Changed, this, &CustomCarMsg::updateMiddle_switch_25);
    connect(worker, &CustomCarMsgWorker::middle_switch_26Changed, this, &CustomCarMsg::updateMiddle_switch_26);
    connect(worker, &CustomCarMsgWorker::middle_switch_27Changed, this, &CustomCarMsg::updateMiddle_switch_27);
    connect(worker, &CustomCarMsgWorker::middle_switch_28Changed, this, &CustomCarMsg::updateMiddle_switch_28);
    connect(worker, &CustomCarMsgWorker::middle_switch_29Changed, this, &CustomCarMsg::updateMiddle_switch_29);
    connect(worker, &CustomCarMsgWorker::middle_switch_30Changed, this, &CustomCarMsg::updateMiddle_switch_30);
    connect(worker, &CustomCarMsgWorker::middle_switch_31Changed, this, &CustomCarMsg::updateMiddle_switch_31);
    connect(worker, &CustomCarMsgWorker::middle_switch_32Changed, this, &CustomCarMsg::updateMiddle_switch_32);

    connect(worker, &CustomCarMsgWorker::middle_switch_33Changed, this, &CustomCarMsg::updateMiddle_switch_33);
    connect(worker, &CustomCarMsgWorker::middle_switch_34Changed, this, &CustomCarMsg::updateMiddle_switch_34);
    connect(worker, &CustomCarMsgWorker::middle_switch_35Changed, this, &CustomCarMsg::updateMiddle_switch_35);
    connect(worker, &CustomCarMsgWorker::middle_switch_36Changed, this, &CustomCarMsg::updateMiddle_switch_36);
    connect(worker, &CustomCarMsgWorker::middle_switch_37Changed, this, &CustomCarMsg::updateMiddle_switch_37);
    connect(worker, &CustomCarMsgWorker::middle_switch_38Changed, this, &CustomCarMsg::updateMiddle_switch_38);
    connect(worker, &CustomCarMsgWorker::middle_switch_39Changed, this, &CustomCarMsg::updateMiddle_switch_39);
    connect(worker, &CustomCarMsgWorker::middle_switch_40Changed, this, &CustomCarMsg::updateMiddle_switch_40);
    connect(worker, &CustomCarMsgWorker::middle_switch_41Changed, this, &CustomCarMsg::updateMiddle_switch_41);
    connect(worker, &CustomCarMsgWorker::middle_switch_42Changed, this, &CustomCarMsg::updateMiddle_switch_42);

    connect(worker, &CustomCarMsgWorker::back_output_current_01Changed, this, &CustomCarMsg::updateBack_output_current_01);
    connect(worker, &CustomCarMsgWorker::back_output_current_02Changed, this, &CustomCarMsg::updateBack_output_current_02);
    connect(worker, &CustomCarMsgWorker::back_output_current_03Changed, this, &CustomCarMsg::updateBack_output_current_03);
    connect(worker, &CustomCarMsgWorker::back_output_current_04Changed, this, &CustomCarMsg::updateBack_output_current_04);
    connect(worker, &CustomCarMsgWorker::back_output_current_05Changed, this, &CustomCarMsg::updateBack_output_current_05);

    connect(worker, &CustomCarMsgWorker::back_output_current_06Changed, this, &CustomCarMsg::updateBack_output_current_06);
    connect(worker, &CustomCarMsgWorker::back_output_current_07Changed, this, &CustomCarMsg::updateBack_output_current_07);
    connect(worker, &CustomCarMsgWorker::back_output_current_08Changed, this, &CustomCarMsg::updateBack_output_current_08);
    connect(worker, &CustomCarMsgWorker::back_output_current_09Changed, this, &CustomCarMsg::updateBack_output_current_09);
    connect(worker, &CustomCarMsgWorker::back_output_current_10Changed, this, &CustomCarMsg::updateBack_output_current_10);

    connect(worker, &CustomCarMsgWorker::back_output_current_11Changed, this, &CustomCarMsg::updateBack_output_current_11);
    connect(worker, &CustomCarMsgWorker::back_output_current_12Changed, this, &CustomCarMsg::updateBack_output_current_12);
    connect(worker, &CustomCarMsgWorker::back_output_current_13Changed, this, &CustomCarMsg::updateBack_output_current_13);
    connect(worker, &CustomCarMsgWorker::back_output_current_14Changed, this, &CustomCarMsg::updateBack_output_current_14);
    connect(worker, &CustomCarMsgWorker::back_output_current_15Changed, this, &CustomCarMsg::updateBack_output_current_15);

    connect(worker, &CustomCarMsgWorker::back_switch_01Changed, this, &CustomCarMsg::updateBack_switch_01);
    connect(worker, &CustomCarMsgWorker::back_switch_02Changed, this, &CustomCarMsg::updateBack_switch_02);
    connect(worker, &CustomCarMsgWorker::back_switch_03Changed, this, &CustomCarMsg::updateBack_switch_03);
    connect(worker, &CustomCarMsgWorker::back_switch_04Changed, this, &CustomCarMsg::updateBack_switch_04);
    connect(worker, &CustomCarMsgWorker::back_switch_05Changed, this, &CustomCarMsg::updateBack_switch_05);
    connect(worker, &CustomCarMsgWorker::back_switch_06Changed, this, &CustomCarMsg::updateBack_switch_06);
    connect(worker, &CustomCarMsgWorker::back_switch_07Changed, this, &CustomCarMsg::updateBack_switch_07);
    connect(worker, &CustomCarMsgWorker::back_switch_08Changed, this, &CustomCarMsg::updateBack_switch_08);
    connect(worker, &CustomCarMsgWorker::back_switch_09Changed, this, &CustomCarMsg::updateBack_switch_09);
    connect(worker, &CustomCarMsgWorker::back_switch_10Changed, this, &CustomCarMsg::updateBack_switch_10);
    connect(worker, &CustomCarMsgWorker::back_switch_11Changed, this, &CustomCarMsg::updateBack_switch_11);
    connect(worker, &CustomCarMsgWorker::back_switch_12Changed, this, &CustomCarMsg::updateBack_switch_12);
    connect(worker, &CustomCarMsgWorker::back_switch_13Changed, this, &CustomCarMsg::updateBack_switch_13);
    connect(worker, &CustomCarMsgWorker::back_switch_14Changed, this, &CustomCarMsg::updateBack_switch_14);
    connect(worker, &CustomCarMsgWorker::back_switch_15Changed, this, &CustomCarMsg::updateBack_switch_15);
    connect(worker, &CustomCarMsgWorker::back_switch_16Changed, this, &CustomCarMsg::updateBack_switch_16);

    connect(worker, &CustomCarMsgWorker::back_switch_17Changed, this, &CustomCarMsg::updateBack_switch_17);
    connect(worker, &CustomCarMsgWorker::back_switch_18Changed, this, &CustomCarMsg::updateBack_switch_18);
    connect(worker, &CustomCarMsgWorker::back_switch_19Changed, this, &CustomCarMsg::updateBack_switch_19);
    connect(worker, &CustomCarMsgWorker::back_switch_20Changed, this, &CustomCarMsg::updateBack_switch_20);
    connect(worker, &CustomCarMsgWorker::back_switch_21Changed, this, &CustomCarMsg::updateBack_switch_21);
    connect(worker, &CustomCarMsgWorker::back_switch_22Changed, this, &CustomCarMsg::updateBack_switch_22);
    connect(worker, &CustomCarMsgWorker::back_switch_23Changed, this, &CustomCarMsg::updateBack_switch_23);
    connect(worker, &CustomCarMsgWorker::back_switch_24Changed, this, &CustomCarMsg::updateBack_switch_24);
    connect(worker, &CustomCarMsgWorker::back_switch_25Changed, this, &CustomCarMsg::updateBack_switch_25);
    connect(worker, &CustomCarMsgWorker::back_switch_26Changed, this, &CustomCarMsg::updateBack_switch_26);
    connect(worker, &CustomCarMsgWorker::back_switch_27Changed, this, &CustomCarMsg::updateBack_switch_27);
    connect(worker, &CustomCarMsgWorker::back_switch_28Changed, this, &CustomCarMsg::updateBack_switch_28);
    connect(worker, &CustomCarMsgWorker::back_switch_29Changed, this, &CustomCarMsg::updateBack_switch_29);
    connect(worker, &CustomCarMsgWorker::back_switch_30Changed, this, &CustomCarMsg::updateBack_switch_30);
    connect(worker, &CustomCarMsgWorker::back_switch_31Changed, this, &CustomCarMsg::updateBack_switch_31);
    connect(worker, &CustomCarMsgWorker::back_switch_32Changed, this, &CustomCarMsg::updateBack_switch_32);

    connect(worker, &CustomCarMsgWorker::back_switch_33Changed, this, &CustomCarMsg::updateBack_switch_33);
    connect(worker, &CustomCarMsgWorker::back_switch_34Changed, this, &CustomCarMsg::updateBack_switch_34);
    connect(worker, &CustomCarMsgWorker::back_switch_35Changed, this, &CustomCarMsg::updateBack_switch_35);
    connect(worker, &CustomCarMsgWorker::back_switch_36Changed, this, &CustomCarMsg::updateBack_switch_36);
    connect(worker, &CustomCarMsgWorker::back_switch_37Changed, this, &CustomCarMsg::updateBack_switch_37);
    connect(worker, &CustomCarMsgWorker::back_switch_38Changed, this, &CustomCarMsg::updateBack_switch_38);
    connect(worker, &CustomCarMsgWorker::back_switch_39Changed, this, &CustomCarMsg::updateBack_switch_39);
    connect(worker, &CustomCarMsgWorker::back_switch_40Changed, this, &CustomCarMsg::updateBack_switch_40);
    connect(worker, &CustomCarMsgWorker::back_switch_41Changed, this, &CustomCarMsg::updateBack_switch_41);
    connect(worker, &CustomCarMsgWorker::back_switch_42Changed, this, &CustomCarMsg::updateBack_switch_42);

    connect(worker, &CustomCarMsgWorker::warning_01Changed, this, &CustomCarMsg::updateWarning_01);
    connect(worker, &CustomCarMsgWorker::warning_02Changed, this, &CustomCarMsg::updateWarning_02);
    connect(worker, &CustomCarMsgWorker::warning_03Changed, this, &CustomCarMsg::updateWarning_03);
    connect(worker, &CustomCarMsgWorker::warning_04Changed, this, &CustomCarMsg::updateWarning_04);
    connect(worker, &CustomCarMsgWorker::warning_05Changed, this, &CustomCarMsg::updateWarning_05);
    connect(worker, &CustomCarMsgWorker::warning_06Changed, this, &CustomCarMsg::updateWarning_06);
    connect(worker, &CustomCarMsgWorker::warning_07Changed, this, &CustomCarMsg::updateWarning_07);
    connect(worker, &CustomCarMsgWorker::warning_08Changed, this, &CustomCarMsg::updateWarning_08);
    connect(worker, &CustomCarMsgWorker::warning_09Changed, this, &CustomCarMsg::updateWarning_09);
    connect(worker, &CustomCarMsgWorker::warning_10Changed, this, &CustomCarMsg::updateWarning_10);
    connect(worker, &CustomCarMsgWorker::warning_11Changed, this, &CustomCarMsg::updateWarning_11);
    connect(worker, &CustomCarMsgWorker::warning_12Changed, this, &CustomCarMsg::updateWarning_12);
    connect(worker, &CustomCarMsgWorker::warning_13Changed, this, &CustomCarMsg::updateWarning_13);
    connect(worker, &CustomCarMsgWorker::warning_14Changed, this, &CustomCarMsg::updateWarning_14);
    connect(worker, &CustomCarMsgWorker::warning_15Changed, this, &CustomCarMsg::updateWarning_15);
    connect(worker, &CustomCarMsgWorker::warning_16Changed, this, &CustomCarMsg::updateWarning_16);
    connect(worker, &CustomCarMsgWorker::warning_17Changed, this, &CustomCarMsg::updateWarning_17);
    connect(worker, &CustomCarMsgWorker::warning_18Changed, this, &CustomCarMsg::updateWarning_18);
    connect(worker, &CustomCarMsgWorker::warning_19Changed, this, &CustomCarMsg::updateWarning_19);
    connect(worker, &CustomCarMsgWorker::warning_20Changed, this, &CustomCarMsg::updateWarning_20);
    connect(worker, &CustomCarMsgWorker::warning_21Changed, this, &CustomCarMsg::updateWarning_21);
    connect(worker, &CustomCarMsgWorker::warning_22Changed, this, &CustomCarMsg::updateWarning_22);
    connect(worker, &CustomCarMsgWorker::warning_23Changed, this, &CustomCarMsg::updateWarning_23);
    connect(worker, &CustomCarMsgWorker::warning_24Changed, this, &CustomCarMsg::updateWarning_24);
    connect(worker, &CustomCarMsgWorker::warning_25Changed, this, &CustomCarMsg::updateWarning_25);
    connect(worker, &CustomCarMsgWorker::warning_26Changed, this, &CustomCarMsg::updateWarning_26);
    connect(worker, &CustomCarMsgWorker::warning_27Changed, this, &CustomCarMsg::updateWarning_27);
    connect(worker, &CustomCarMsgWorker::warning_28Changed, this, &CustomCarMsg::updateWarning_28);
    connect(worker, &CustomCarMsgWorker::warning_29Changed, this, &CustomCarMsg::updateWarning_29);
    connect(worker, &CustomCarMsgWorker::warning_30Changed, this, &CustomCarMsg::updateWarning_30);
    connect(worker, &CustomCarMsgWorker::warning_31Changed, this, &CustomCarMsg::updateWarning_31);
    connect(worker, &CustomCarMsgWorker::warning_32Changed, this, &CustomCarMsg::updateWarning_32);
    connect(worker, &CustomCarMsgWorker::warning_33Changed, this, &CustomCarMsg::updateWarning_33);
    connect(worker, &CustomCarMsgWorker::warning_34Changed, this, &CustomCarMsg::updateWarning_34);
    connect(worker, &CustomCarMsgWorker::warning_35Changed, this, &CustomCarMsg::updateWarning_35);
    connect(worker, &CustomCarMsgWorker::warning_36Changed, this, &CustomCarMsg::updateWarning_36);
    connect(worker, &CustomCarMsgWorker::warning_37Changed, this, &CustomCarMsg::updateWarning_37);
    connect(worker, &CustomCarMsgWorker::warning_38Changed, this, &CustomCarMsg::updateWarning_38);
    connect(worker, &CustomCarMsgWorker::warning_39Changed, this, &CustomCarMsg::updateWarning_39);
    connect(worker, &CustomCarMsgWorker::warning_40Changed, this, &CustomCarMsg::updateWarning_40);
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

void CustomCarMsg::updateMoter_control_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(moter_control_temp, value);
}

void CustomCarMsg::updateMoter_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(moter_temp, value);
}

void CustomCarMsg::updateBattery(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(battery, value);
}

void CustomCarMsg::updateSpn(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(spn, value);
}

void CustomCarMsg::updateEngine_water_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_water_temp, value);
}

void CustomCarMsg::updateUrea_level(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(urea_level, value);
}

void CustomCarMsg::updateFault_level(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fault_level, value);
}

void CustomCarMsg::updateFault_code(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fault_code, value);
}

void CustomCarMsg::updateOil_level(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_level, value);
}

void CustomCarMsg::updateEngine_oil_pressure(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_oil_pressure, value);
}

void CustomCarMsg::updateMotor_in_voltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_in_voltage, value);
}

void CustomCarMsg::updateMotor_in_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_in_current, value);
}

void CustomCarMsg::updateMotor_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_temp, value);
}

void CustomCarMsg::updateMotor_controller_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_controller_temp, value);
}

void CustomCarMsg::updateCar_mode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(car_mode, value);
}

void CustomCarMsg::updateVersion(double value) {
    MEMBER_PROPERTY_VALUE_CHANGED(version, value);
}

void CustomCarMsg::updateCar_life(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(car_life, value);
}

void CustomCarMsg::updateAccel_pedal_percent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(accel_pedal_percent, value);
}

void CustomCarMsg::updateBrake_pedal_percent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(brake_pedal_percent, value);
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

void CustomCarMsg::updateEngine_fuel_consumption(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_fuel_consumption, value);
}

void CustomCarMsg::updateEngine_load(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_load, value);
}

void CustomCarMsg::updateEngine_target_throttle(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_target_throttle, value);
}

void CustomCarMsg::updateEngine_actual_throttle(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_actual_throttle, value);
}

void CustomCarMsg::updateEngine_inlet_temperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_inlet_temperature, value);
}

void CustomCarMsg::updateOil_pump_dcac_w_output_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_pump_dcac_w_output_current, value);
}

void CustomCarMsg::updateOil_pump_dcac_v_output_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_pump_dcac_v_output_current, value);
}

void CustomCarMsg::updateOil_pump_dcac_u_output_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_pump_dcac_u_output_current, value);
}

void CustomCarMsg::updateRadiator_temperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(radiator_temperature, value);
}

void CustomCarMsg::updateActual_clutch_position(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(actual_clutch_position, value);
}

void CustomCarMsg::updateTcu_fault_code(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(tcu_fault_code, value);
}

void CustomCarMsg::updateAxis_rpm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(axis_rpm, value);
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

void CustomCarMsg::updateBat_max_charge_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_max_charge_current, value);
}

void CustomCarMsg::updateBat_max_discharge_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_max_discharge_current, value);
}

void CustomCarMsg::updateBat_average_voltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_average_voltage, value);
}

void CustomCarMsg::updateBat_status1(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_status1, value);
}

void CustomCarMsg::updateBat_status2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_status2, value);
}

void CustomCarMsg::updateBat_status3(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_status3, value);
}

void CustomCarMsg::updateIrm_ohm_positive(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(irm_ohm_positive, value);
}

void CustomCarMsg::updateIrm_ohm_negative(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(irm_ohm_negative, value);
}

void CustomCarMsg::updateBat_max_voltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_max_voltage, value);
}

void CustomCarMsg::updateBat_min_voltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(bat_min_voltage, value);
}

void CustomCarMsg::updateBattery_highest_temp(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(battery_highest_temp, value);
}

void CustomCarMsg::updateAc_fault_code(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_fault_code, value);
}

void CustomCarMsg::updateAc_fan_status(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_fan_status, value);
}

void CustomCarMsg::updateAc_work_status(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_work_status, value);
}

void CustomCarMsg::updateAc_life(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_life, value);
}

void CustomCarMsg::updateAc_out_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_out_temp, value);
}

void CustomCarMsg::updateAc_in_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_in_temp, value);
}

void CustomCarMsg::updateAc_set_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_set_temp, value);
}

void CustomCarMsg::updateAc_refrigere_req(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(ac_refrigere_req, value);
}

void CustomCarMsg::updateInput_ctrl_01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_01, value);
}

void CustomCarMsg::updateInput_ctrl_02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_02, value);
}

void CustomCarMsg::updateInput_ctrl_03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_03, value);
}

void CustomCarMsg::updateInput_ctrl_04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_04, value);
}

void CustomCarMsg::updateInput_ctrl_05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_05, value);
}

void CustomCarMsg::updateInput_ctrl_06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_06, value);
}

void CustomCarMsg::updateInput_ctrl_07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_07, value);
}

void CustomCarMsg::updateInput_ctrl_08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_08, value);
}

void CustomCarMsg::updateInput_ctrl_09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_09, value);
}

void CustomCarMsg::updateInput_ctrl_10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_10, value);
}

void CustomCarMsg::updateInput_ctrl_11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_11, value);
}

void CustomCarMsg::updateInput_ctrl_12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_12, value);
}

void CustomCarMsg::updateInput_ctrl_13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_13, value);
}

void CustomCarMsg::updateInput_ctrl_14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_14, value);
}

void CustomCarMsg::updateInput_ctrl_15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_15, value);
}

void CustomCarMsg::updateInput_ctrl_16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_16, value);
}

void CustomCarMsg::updateInput_ctrl_17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_17, value);
}

void CustomCarMsg::updateInput_ctrl_18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_18, value);
}

void CustomCarMsg::updateInput_ctrl_19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_19, value);
}

void CustomCarMsg::updateInput_ctrl_20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_20, value);
}

void CustomCarMsg::updateInput_ctrl_21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_21, value);
}

void CustomCarMsg::updateInput_ctrl_22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_22, value);
}

void CustomCarMsg::updateInput_ctrl_23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_23, value);
}

void CustomCarMsg::updateInput_ctrl_24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_24, value);
}

void CustomCarMsg::updateInput_ctrl_25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_25, value);
}

void CustomCarMsg::updateInput_ctrl_26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_26, value);
}

void CustomCarMsg::updateInput_ctrl_27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_27, value);
}

void CustomCarMsg::updateInput_ctrl_28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_28, value);
}

void CustomCarMsg::updateInput_ctrl_29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_29, value);
}

void CustomCarMsg::updateInput_ctrl_30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_30, value);
}

void CustomCarMsg::updateInput_ctrl_31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_31, value);
}

void CustomCarMsg::updateInput_ctrl_32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_32, value);
}

void CustomCarMsg::updateInput_ctrl_33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_33, value);
}

void CustomCarMsg::updateInput_ctrl_34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_34, value);
}

void CustomCarMsg::updateInput_ctrl_35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(input_ctrl_35, value);
}

void CustomCarMsg::updateLamp_key_on(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_key_on, value);
}

void CustomCarMsg::updateLamp_air_filter(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_air_filter, value);
}

void CustomCarMsg::updateLamp_asr(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_asr, value);
}

void CustomCarMsg::updateLamp_high_voltage_maintenance(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_high_voltage_maintenance, value);
}

void CustomCarMsg::updateLamp_defroster(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_defroster, value);
}

void CustomCarMsg::updateLamp_dryere(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_dryere, value);
}

void CustomCarMsg::updateLamp_abs(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_abs, value);
}

void CustomCarMsg::updateLamp_ac(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_ac, value);
}

void CustomCarMsg::updatePower_supply(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(power_supply, value);
}

void CustomCarMsg::updateClimbing_mode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(climbing_mode, value);
}

void CustomCarMsg::updateDiagnostic_mode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(diagnostic_mode, value);
}


void CustomCarMsg::updateLamp_turn_left(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_turn_left, value);
}

void CustomCarMsg::updateLamp_turn_right(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_turn_right, value);
}


void CustomCarMsg::updateLamp_double_flash(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_double_flash, value);
}

void CustomCarMsg::updateLamp_front_fog(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_front_fog, value);
}

void CustomCarMsg::updateLamp_rear_fog(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_rear_fog, value);
}

void CustomCarMsg::updateLamp_high_beam(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_high_beam, value);
}

void CustomCarMsg::updateLamp_head_light(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_head_light, value);
}

void CustomCarMsg::updateLamp_reverse_gear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_reverse_gear, value);
}

void CustomCarMsg::updateLamp_position_light(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_position_light, value);
}


void CustomCarMsg::updateLamp_gate1(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_gate1, value);
}

void CustomCarMsg::updateLamp_gate2(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_gate2, value);
}

void CustomCarMsg::updateLamp_rear_door_open(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_rear_door_open, value);
}


void CustomCarMsg::updateLamp_brake(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_brake, value);
}

void CustomCarMsg::updateLamp_parking_brake(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_parking_brake, value);
}


void CustomCarMsg::updateLamp_left_low_air_pressure(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_left_low_air_pressure, value);
}

void CustomCarMsg::updateLamp_right_low_air_pressure(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_right_low_air_pressure, value);
}


void CustomCarMsg::updateLamp_left_shoe_wear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_left_shoe_wear, value);
}

void CustomCarMsg::updateLamp_right_shoe_wear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_right_shoe_wear, value);
}


void CustomCarMsg::updateLamp_charge_confirm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_charge_confirm, value);
}

void CustomCarMsg::updateLamp_battery_main_contact(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_battery_main_contact, value);
}


void CustomCarMsg::updateLamp_water_temp_high(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_water_temp_high, value);
}

void CustomCarMsg::updateLamp_water_level_low(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_water_level_low, value);
}


void CustomCarMsg::updateLamp_low_service_wl(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_low_service_wl, value);
}

void CustomCarMsg::updateLamp_heavy_stop_wl(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_heavy_stop_wl, value);
}

void CustomCarMsg::updateLamp_serious_stop_wl(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_serious_stop_wl, value);
}


void CustomCarMsg::updateLamp_oil_level_low(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_oil_level_low, value);
}

void CustomCarMsg::updateLamp_oil_pressure_low(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_oil_pressure_low, value);
}

void CustomCarMsg::updateLamp_engine_fault(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_engine_fault, value);
}


void CustomCarMsg::updateLamp_motor_out_of_service(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_motor_out_of_service, value);
}

void CustomCarMsg::updateLamp_moter_fire_igon(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(lamp_moter_fire_igon, value);
}

void CustomCarMsg::updateFront_output_current_01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_01, value);
}

void CustomCarMsg::updateFront_output_current_02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_02, value);
}

void CustomCarMsg::updateFront_output_current_03(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_03, value);
}

void CustomCarMsg::updateFront_output_current_04(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_04, value);
}

void CustomCarMsg::updateFront_output_current_05(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_05, value);
}


void CustomCarMsg::updateFront_output_current_06(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_06, value);
}

void CustomCarMsg::updateFront_output_current_07(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_07, value);
}

void CustomCarMsg::updateFront_output_current_08(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_08, value);
}

void CustomCarMsg::updateFront_output_current_09(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_09, value);
}

void CustomCarMsg::updateFront_output_current_10(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_10, value);
}


void CustomCarMsg::updateFront_output_current_11(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_11, value);
}

void CustomCarMsg::updateFront_output_current_12(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_12, value);
}

void CustomCarMsg::updateFront_output_current_13(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_13, value);
}

void CustomCarMsg::updateFront_output_current_14(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_14, value);
}

void CustomCarMsg::updateFront_output_current_15(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_output_current_15, value);
}


void CustomCarMsg::updateFront_switch_01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_01, value);
}

void CustomCarMsg::updateFront_switch_02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_02, value);
}

void CustomCarMsg::updateFront_switch_03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_03, value);
}

void CustomCarMsg::updateFront_switch_04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_04, value);
}

void CustomCarMsg::updateFront_switch_05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_05, value);
}

void CustomCarMsg::updateFront_switch_06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_06, value);
}

void CustomCarMsg::updateFront_switch_07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_07, value);
}

void CustomCarMsg::updateFront_switch_08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_08, value);
}

void CustomCarMsg::updateFront_switch_09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_09, value);
}

void CustomCarMsg::updateFront_switch_10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_10, value);
}

void CustomCarMsg::updateFront_switch_11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_11, value);
}

void CustomCarMsg::updateFront_switch_12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_12, value);
}

void CustomCarMsg::updateFront_switch_13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_13, value);
}

void CustomCarMsg::updateFront_switch_14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_14, value);
}

void CustomCarMsg::updateFront_switch_15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_15, value);
}

void CustomCarMsg::updateFront_switch_16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_16, value);
}


void CustomCarMsg::updateFront_switch_17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_17, value);
}

void CustomCarMsg::updateFront_switch_18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_18, value);
}

void CustomCarMsg::updateFront_switch_19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_19, value);
}

void CustomCarMsg::updateFront_switch_20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_20, value);
}

void CustomCarMsg::updateFront_switch_21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_21, value);
}

void CustomCarMsg::updateFront_switch_22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_22, value);
}

void CustomCarMsg::updateFront_switch_23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_23, value);
}

void CustomCarMsg::updateFront_switch_24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_24, value);
}

void CustomCarMsg::updateFront_switch_25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_25, value);
}

void CustomCarMsg::updateFront_switch_26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_26, value);
}

void CustomCarMsg::updateFront_switch_27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_27, value);
}

void CustomCarMsg::updateFront_switch_28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_28, value);
}

void CustomCarMsg::updateFront_switch_29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_29, value);
}

void CustomCarMsg::updateFront_switch_30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_30, value);
}

void CustomCarMsg::updateFront_switch_31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_31, value);
}

void CustomCarMsg::updateFront_switch_32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_32, value);
}


void CustomCarMsg::updateFront_switch_33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_33, value);
}

void CustomCarMsg::updateFront_switch_34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_34, value);
}

void CustomCarMsg::updateFront_switch_35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_35, value);
}

void CustomCarMsg::updateFront_switch_36(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_36, value);
}

void CustomCarMsg::updateFront_switch_37(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_37, value);
}

void CustomCarMsg::updateFront_switch_38(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_38, value);
}

void CustomCarMsg::updateFront_switch_39(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_39, value);
}

void CustomCarMsg::updateFront_switch_40(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_40, value);
}

void CustomCarMsg::updateFront_switch_41(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_41, value);
}

void CustomCarMsg::updateFront_switch_42(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(front_switch_42, value);
}



void CustomCarMsg::updateMiddle_output_current_01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_01, value);
}

void CustomCarMsg::updateMiddle_output_current_02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_02, value);
}

void CustomCarMsg::updateMiddle_output_current_03(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_03, value);
}

void CustomCarMsg::updateMiddle_output_current_04(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_04, value);
}

void CustomCarMsg::updateMiddle_output_current_05(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_05, value);
}


void CustomCarMsg::updateMiddle_output_current_06(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_06, value);
}

void CustomCarMsg::updateMiddle_output_current_07(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_07, value);
}

void CustomCarMsg::updateMiddle_output_current_08(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_08, value);
}

void CustomCarMsg::updateMiddle_output_current_09(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_09, value);
}

void CustomCarMsg::updateMiddle_output_current_10(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_10, value);
}


void CustomCarMsg::updateMiddle_output_current_11(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_11, value);
}

void CustomCarMsg::updateMiddle_output_current_12(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_12, value);
}

void CustomCarMsg::updateMiddle_output_current_13(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_13, value);
}

void CustomCarMsg::updateMiddle_output_current_14(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_14, value);
}

void CustomCarMsg::updateMiddle_output_current_15(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_output_current_15, value);
}


void CustomCarMsg::updateMiddle_switch_01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_01, value);
}

void CustomCarMsg::updateMiddle_switch_02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_02, value);
}

void CustomCarMsg::updateMiddle_switch_03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_03, value);
}

void CustomCarMsg::updateMiddle_switch_04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_04, value);
}

void CustomCarMsg::updateMiddle_switch_05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_05, value);
}

void CustomCarMsg::updateMiddle_switch_06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_06, value);
}

void CustomCarMsg::updateMiddle_switch_07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_07, value);
}

void CustomCarMsg::updateMiddle_switch_08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_08, value);
}

void CustomCarMsg::updateMiddle_switch_09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_09, value);
}

void CustomCarMsg::updateMiddle_switch_10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_10, value);
}

void CustomCarMsg::updateMiddle_switch_11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_11, value);
}

void CustomCarMsg::updateMiddle_switch_12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_12, value);
}

void CustomCarMsg::updateMiddle_switch_13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_13, value);
}

void CustomCarMsg::updateMiddle_switch_14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_14, value);
}

void CustomCarMsg::updateMiddle_switch_15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_15, value);
}

void CustomCarMsg::updateMiddle_switch_16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_16, value);
}


void CustomCarMsg::updateMiddle_switch_17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_17, value);
}

void CustomCarMsg::updateMiddle_switch_18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_18, value);
}

void CustomCarMsg::updateMiddle_switch_19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_19, value);
}

void CustomCarMsg::updateMiddle_switch_20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_20, value);
}

void CustomCarMsg::updateMiddle_switch_21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_21, value);
}

void CustomCarMsg::updateMiddle_switch_22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_22, value);
}

void CustomCarMsg::updateMiddle_switch_23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_23, value);
}

void CustomCarMsg::updateMiddle_switch_24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_24, value);
}

void CustomCarMsg::updateMiddle_switch_25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_25, value);
}

void CustomCarMsg::updateMiddle_switch_26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_26, value);
}

void CustomCarMsg::updateMiddle_switch_27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_27, value);
}

void CustomCarMsg::updateMiddle_switch_28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_28, value);
}

void CustomCarMsg::updateMiddle_switch_29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_29, value);
}

void CustomCarMsg::updateMiddle_switch_30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_30, value);
}

void CustomCarMsg::updateMiddle_switch_31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_31, value);
}

void CustomCarMsg::updateMiddle_switch_32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_32, value);
}

void CustomCarMsg::updateMiddle_switch_33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_33, value);
}

void CustomCarMsg::updateMiddle_switch_34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_34, value);
}

void CustomCarMsg::updateMiddle_switch_35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_35, value);
}

void CustomCarMsg::updateMiddle_switch_36(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_36, value);
}

void CustomCarMsg::updateMiddle_switch_37(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_37, value);
}

void CustomCarMsg::updateMiddle_switch_38(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_38, value);
}

void CustomCarMsg::updateMiddle_switch_39(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_39, value);
}

void CustomCarMsg::updateMiddle_switch_40(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_40, value);
}

void CustomCarMsg::updateMiddle_switch_41(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_41, value);
}

void CustomCarMsg::updateMiddle_switch_42(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(middle_switch_42, value);
}

void CustomCarMsg::updateBack_output_current_01(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_01, value);
}

void CustomCarMsg::updateBack_output_current_02(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_02, value);
}

void CustomCarMsg::updateBack_output_current_03(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_03, value);
}

void CustomCarMsg::updateBack_output_current_04(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_04, value);
}

void CustomCarMsg::updateBack_output_current_05(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_05, value);
}


void CustomCarMsg::updateBack_output_current_06(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_06, value);
}

void CustomCarMsg::updateBack_output_current_07(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_07, value);
}

void CustomCarMsg::updateBack_output_current_08(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_08, value);
}

void CustomCarMsg::updateBack_output_current_09(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_09, value);
}

void CustomCarMsg::updateBack_output_current_10(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_10, value);
}


void CustomCarMsg::updateBack_output_current_11(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_11, value);
}

void CustomCarMsg::updateBack_output_current_12(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_12, value);
}

void CustomCarMsg::updateBack_output_current_13(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_13, value);
}

void CustomCarMsg::updateBack_output_current_14(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_14, value);
}

void CustomCarMsg::updateBack_output_current_15(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_output_current_15, value);
}


void CustomCarMsg::updateBack_switch_01(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_01, value);
}

void CustomCarMsg::updateBack_switch_02(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_02, value);
}

void CustomCarMsg::updateBack_switch_03(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_03, value);
}

void CustomCarMsg::updateBack_switch_04(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_04, value);
}

void CustomCarMsg::updateBack_switch_05(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_05, value);
}

void CustomCarMsg::updateBack_switch_06(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_06, value);
}

void CustomCarMsg::updateBack_switch_07(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_07, value);
}

void CustomCarMsg::updateBack_switch_08(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_08, value);
}

void CustomCarMsg::updateBack_switch_09(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_09, value);
}

void CustomCarMsg::updateBack_switch_10(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_10, value);
}

void CustomCarMsg::updateBack_switch_11(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_11, value);
}

void CustomCarMsg::updateBack_switch_12(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_12, value);
}

void CustomCarMsg::updateBack_switch_13(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_13, value);
}

void CustomCarMsg::updateBack_switch_14(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_14, value);
}

void CustomCarMsg::updateBack_switch_15(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_15, value);
}

void CustomCarMsg::updateBack_switch_16(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_16, value);
}


void CustomCarMsg::updateBack_switch_17(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_17, value);
}

void CustomCarMsg::updateBack_switch_18(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_18, value);
}

void CustomCarMsg::updateBack_switch_19(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_19, value);
}

void CustomCarMsg::updateBack_switch_20(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_20, value);
}

void CustomCarMsg::updateBack_switch_21(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_21, value);
}

void CustomCarMsg::updateBack_switch_22(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_22, value);
}

void CustomCarMsg::updateBack_switch_23(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_23, value);
}

void CustomCarMsg::updateBack_switch_24(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_24, value);
}

void CustomCarMsg::updateBack_switch_25(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_25, value);
}

void CustomCarMsg::updateBack_switch_26(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_26, value);
}

void CustomCarMsg::updateBack_switch_27(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_27, value);
}

void CustomCarMsg::updateBack_switch_28(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_28, value);
}

void CustomCarMsg::updateBack_switch_29(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_29, value);
}

void CustomCarMsg::updateBack_switch_30(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_30, value);
}

void CustomCarMsg::updateBack_switch_31(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_31, value);
}

void CustomCarMsg::updateBack_switch_32(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_32, value);
}


void CustomCarMsg::updateBack_switch_33(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_33, value);
}

void CustomCarMsg::updateBack_switch_34(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_34, value);
}

void CustomCarMsg::updateBack_switch_35(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_35, value);
}

void CustomCarMsg::updateBack_switch_36(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_36, value);
}

void CustomCarMsg::updateBack_switch_37(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_37, value);
}

void CustomCarMsg::updateBack_switch_38(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_38, value);
}

void CustomCarMsg::updateBack_switch_39(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_39, value);
}

void CustomCarMsg::updateBack_switch_40(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_40, value);
}

void CustomCarMsg::updateBack_switch_41(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_41, value);
}

void CustomCarMsg::updateBack_switch_42(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(back_switch_42, value);
}



void CustomCarMsg::updateWarning_01(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_01, value);
}

void CustomCarMsg::updateWarning_02(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_02, value);
}

void CustomCarMsg::updateWarning_03(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_03, value);
}

void CustomCarMsg::updateWarning_04(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_04, value);
}

void CustomCarMsg::updateWarning_05(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_05, value);
}

void CustomCarMsg::updateWarning_06(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_06, value);
}

void CustomCarMsg::updateWarning_07(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_07, value);
}

void CustomCarMsg::updateWarning_08(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_08, value);
}

void CustomCarMsg::updateWarning_09(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_09, value);
}

void CustomCarMsg::updateWarning_10(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_10, value);
}

void CustomCarMsg::updateWarning_11(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_11, value);
}

void CustomCarMsg::updateWarning_12(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_12, value);
}

void CustomCarMsg::updateWarning_13(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_13, value);
}

void CustomCarMsg::updateWarning_14(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_14, value);
}

void CustomCarMsg::updateWarning_15(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_15, value);
}

void CustomCarMsg::updateWarning_16(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_16, value);
}

void CustomCarMsg::updateWarning_17(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_17, value);
}

void CustomCarMsg::updateWarning_18(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_18, value);
}

void CustomCarMsg::updateWarning_19(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_19, value);
}

void CustomCarMsg::updateWarning_20(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_20, value);
}

void CustomCarMsg::updateWarning_21(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_21, value);
}

void CustomCarMsg::updateWarning_22(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_22, value);
}

void CustomCarMsg::updateWarning_23(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_23, value);
}

void CustomCarMsg::updateWarning_24(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_24, value);
}

void CustomCarMsg::updateWarning_25(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_25, value);
}

void CustomCarMsg::updateWarning_26(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_26, value);
}

void CustomCarMsg::updateWarning_27(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_27, value);
}

void CustomCarMsg::updateWarning_28(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_28, value);
}

void CustomCarMsg::updateWarning_29(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_29, value);
}

void CustomCarMsg::updateWarning_30(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_30, value);
}

void CustomCarMsg::updateWarning_31(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_31, value);
}

void CustomCarMsg::updateWarning_32(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_32, value);
}

void CustomCarMsg::updateWarning_33(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_33, value);
}

void CustomCarMsg::updateWarning_34(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_34, value);
}

void CustomCarMsg::updateWarning_35(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_35, value);
}

void CustomCarMsg::updateWarning_36(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_36, value);
}

void CustomCarMsg::updateWarning_37(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_37, value);
}

void CustomCarMsg::updateWarning_38(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_38, value);
}

void CustomCarMsg::updateWarning_39(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_39, value);
}

void CustomCarMsg::updateWarning_40(QString value) {
    MEMBER_PROPERTY_VALUE_CHANGED(warning_40, value);
}

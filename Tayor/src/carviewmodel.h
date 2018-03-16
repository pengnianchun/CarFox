#ifndef CARVIEWMODEL_H
#define CARVIEWMODEL_H

#include <QObject>
#include <QDebug>
#include "carmenucontrol.h"
#include "carmessagehandle.h"

class CarViewModel : public QThread
{
    Q_OBJECT
public:
    Q_PROPERTY(uint menu_L0 MEMBER m_menu_L0 NOTIFY menu_L0Changed)
    Q_PROPERTY(int menu_L1 MEMBER m_menu_L1 NOTIFY menu_L1Changed)
    Q_PROPERTY(int menu_L2 MEMBER m_menu_L2 NOTIFY menu_L2Changed)
    Q_PROPERTY(int menu_L3 MEMBER m_menu_L3 NOTIFY menu_L3Changed)
    Q_PROPERTY(int menu_L4 MEMBER m_menu_L4 NOTIFY menu_L4Changed)
    Q_PROPERTY(int menu_L5 MEMBER m_menu_L5 NOTIFY menu_L5Changed)
    Q_PROPERTY(int menu_L6 MEMBER m_menu_L6 NOTIFY menu_L6Changed)
    Q_PROPERTY(int menu_L7 MEMBER m_menu_L7 NOTIFY menu_L7Changed)
    Q_PROPERTY(int menu_L8 MEMBER m_menu_L8 NOTIFY menu_L8Changed)
    Q_PROPERTY(int menu_TimePos MEMBER m_menu_TimePos NOTIFY menu_TimePosChanged)
    Q_PROPERTY(int menu_Direction MEMBER m_menu_Direction NOTIFY menu_DirectionChanged)
    Q_PROPERTY(int menu_SettingsSelect MEMBER m_menu_SettingsSelect NOTIFY menu_SettingsSelectChanged)
    Q_PROPERTY(int menu_ThemeSelect MEMBER m_menu_ThemeSelect NOTIFY menu_ThemeSelectChanged)
    Q_PROPERTY(QString upgradeTips MEMBER m_upgradeTips NOTIFY upgradeTipsChanged)
    Q_PROPERTY(int progressValue MEMBER m_progressValue NOTIFY progressValueChanged)
    Q_PROPERTY(int autoFlash MEMBER m_autoFlash NOTIFY autoFlashChanged)

    /* 主界面信息帧,对应CAR_INFO_TYPE */
    Q_PROPERTY(int ok_key MEMBER m_ok_key NOTIFY ok_keyChanged)
    Q_PROPERTY(int left_key MEMBER m_left_key NOTIFY left_keyChanged)
    Q_PROPERTY(int cancel_key MEMBER m_cancel_key NOTIFY cancel_keyChanged)
    Q_PROPERTY(int right_key MEMBER m_right_key NOTIFY right_keyChanged)
    Q_PROPERTY(uint speed MEMBER m_speed NOTIFY speedChanged)
    Q_PROPERTY(int rpm MEMBER m_rpm NOTIFY rpmChanged)
    Q_PROPERTY(int totalVoltage MEMBER m_totalVoltage NOTIFY totalVoltageChanged)
    Q_PROPERTY(int totalCurrent MEMBER m_totalCurrent NOTIFY totalCurrentChanged)
    Q_PROPERTY(int gear MEMBER m_gear NOTIFY gearChanged)
    Q_PROPERTY(int odo MEMBER m_odo NOTIFY odoChanged)
    Q_PROPERTY(float trip MEMBER m_trip NOTIFY tripChanged)
    Q_PROPERTY(uint soc MEMBER m_soc NOTIFY socChanged)
    Q_PROPERTY(float apVol1 MEMBER m_apVol1 NOTIFY apVol1Changed)
    Q_PROPERTY(float apVol2 MEMBER m_apVol2 NOTIFY apVol2Changed)
    Q_PROPERTY(int moter_control_temp MEMBER m_moter_control_temp NOTIFY moter_control_tempChanged)
    Q_PROPERTY(int moter_temp MEMBER m_moter_temp NOTIFY moter_tempChanged)

    Q_PROPERTY(uint main_power MEMBER m_main_power NOTIFY main_powerChanged)
    Q_PROPERTY(QString power_supply MEMBER m_power_supply NOTIFY power_supplyChanged)
    Q_PROPERTY(uint climbing_mode MEMBER m_climbing_mode NOTIFY climbing_modeChanged)
    Q_PROPERTY(uint diagnostic_mode MEMBER m_diagnostic_mode NOTIFY diagnostic_modeChanged)
    Q_PROPERTY(uint charge_confirm MEMBER m_charge_confirm NOTIFY charge_confirmChanged)
    Q_PROPERTY(int fault_level MEMBER m_fault_level NOTIFY fault_levelChanged)
    Q_PROPERTY(int fault_code MEMBER m_fault_code NOTIFY fault_codeChanged)
    Q_PROPERTY(int SPN MEMBER m_SPN NOTIFY SPNChanged)
    Q_PROPERTY(float urea_level MEMBER m_urea_level NOTIFY urea_levelChanged)
    Q_PROPERTY(uint dateTime MEMBER m_dateTime WRITE dateTimeSet NOTIFY dateTimeChanged)
    Q_PROPERTY(int battery MEMBER m_battery NOTIFY batteryChanged)
    Q_PROPERTY(int oil_level MEMBER m_oil_level NOTIFY oil_levelChanged)

    /* 报警信息帧,对应WARNING_TYPE */
    Q_PROPERTY(uint low_water_level_warn MEMBER m_low_water_level_warn NOTIFY low_water_level_warnChanged)
    Q_PROPERTY(uint low_ap1_warn MEMBER m_low_ap1_warn NOTIFY low_ap1_warnChanged)
    Q_PROPERTY(uint low_ap2_warn MEMBER m_low_ap2_warn NOTIFY low_ap2_warnChanged)
    Q_PROPERTY(uint water_temp_sensor_warn MEMBER m_water_temp_sensor_warn NOTIFY water_temp_sensor_warnChanged)
    Q_PROPERTY(uint oil_quantity_sensor_warn MEMBER m_oil_quantity_sensor_warn NOTIFY oil_quantity_sensor_warnChanged)
    Q_PROPERTY(uint oil_pressure_sensor_warn MEMBER m_oil_pressure_sensor_warn NOTIFY oil_pressure_sensor_warnChanged)
    Q_PROPERTY(uint bat_voltage_sensor_warn MEMBER m_bat_voltage_sensor_warn NOTIFY bat_voltage_sensor_warnChanged)
    Q_PROPERTY(uint ap1_sensor_warn MEMBER m_ap1_sensor_warn NOTIFY ap1_sensor_warnChanged)
    Q_PROPERTY(uint ap2_sensor_warn MEMBER m_ap2_sensor_warn NOTIFY ap2_sensor_warnChanged)
    Q_PROPERTY(uint j1939_comm_fault_warn MEMBER m_j1939_comm_fault_warn NOTIFY j1939_comm_fault_warnChanged)
    Q_PROPERTY(uint low_oil_pressure_warn MEMBER m_low_oil_pressure_warn NOTIFY low_oil_pressure_warnChanged)
    Q_PROPERTY(uint left_brake_shoe_warn MEMBER m_left_brake_shoe_warn NOTIFY left_brake_shoe_warnChanged)
    Q_PROPERTY(uint right_brake_shoe_warn MEMBER m_right_brake_shoe_warn NOTIFY right_brake_shoe_warnChanged)
    Q_PROPERTY(uint air_filter_warn MEMBER m_air_filter_warn NOTIFY air_filter_warnChanged)
    Q_PROPERTY(uint after_treat_warn MEMBER m_after_treat_warn NOTIFY after_treat_warnChanged)
    Q_PROPERTY(uint water_temp_high_warn MEMBER m_water_temp_high_warn NOTIFY water_temp_high_warnChanged)

    Q_PROPERTY(uint water_temp_miss MEMBER m_water_temp_miss NOTIFY water_temp_missChanged)
    Q_PROPERTY(uint oil_pressure_data_miss MEMBER m_oil_pressure_data_miss NOTIFY oil_pressure_data_missChanged)
    Q_PROPERTY(uint bus_comm_fault MEMBER m_bus_comm_fault NOTIFY bus_comm_faultChanged)
    Q_PROPERTY(uint low_oil_warn MEMBER m_low_oil_warn NOTIFY low_oil_warnChanged)

    Q_PROPERTY(uint status_Flag1_bit1 MEMBER m_status_Flag1_bit1 NOTIFY status_Flag1_bit1Changed)
    Q_PROPERTY(uint status_Flag1_bit2 MEMBER m_status_Flag1_bit2 NOTIFY status_Flag1_bit2Changed)
    Q_PROPERTY(uint status_Flag1_bit3 MEMBER m_status_Flag1_bit3 NOTIFY status_Flag1_bit3Changed)
    Q_PROPERTY(uint status_Flag1_bit4 MEMBER m_status_Flag1_bit4 NOTIFY status_Flag1_bit4Changed)
    Q_PROPERTY(uint status_Flag1_bit5 MEMBER m_status_Flag1_bit5 NOTIFY status_Flag1_bit5Changed)
    Q_PROPERTY(uint status_Flag1_bit6 MEMBER m_status_Flag1_bit6 NOTIFY status_Flag1_bit6Changed)
    Q_PROPERTY(uint status_Flag1_bit7 MEMBER m_status_Flag1_bit7 NOTIFY status_Flag1_bit7Changed)
    Q_PROPERTY(uint status_Flag1_bit8 MEMBER m_status_Flag1_bit8 NOTIFY status_Flag1_bit8Changed)
    Q_PROPERTY(uint status_Flag2_bit1 MEMBER m_status_Flag2_bit1 NOTIFY status_Flag2_bit1Changed)
    Q_PROPERTY(uint status_Flag2_bit2 MEMBER m_status_Flag2_bit2 NOTIFY status_Flag2_bit2Changed)
    Q_PROPERTY(uint status_Flag2_bit3 MEMBER m_status_Flag2_bit3 NOTIFY status_Flag2_bit3Changed)
    Q_PROPERTY(uint status_Flag2_bit4 MEMBER m_status_Flag2_bit4 NOTIFY status_Flag2_bit4Changed)
    Q_PROPERTY(uint status_Flag2_bit5 MEMBER m_status_Flag2_bit5 NOTIFY status_Flag2_bit5Changed)
    Q_PROPERTY(uint status_Flag2_bit6 MEMBER m_status_Flag2_bit6 NOTIFY status_Flag2_bit6Changed)
    Q_PROPERTY(uint status_Flag2_bit7 MEMBER m_status_Flag2_bit7 NOTIFY status_Flag2_bit7Changed)
    Q_PROPERTY(uint status_Flag2_bit8 MEMBER m_status_Flag2_bit8 NOTIFY status_Flag2_bit8Changed)
    Q_PROPERTY(uint status_Flag3_bit1 MEMBER m_status_Flag3_bit1 NOTIFY status_Flag3_bit1Changed)
    Q_PROPERTY(uint status_Flag3_bit2 MEMBER m_status_Flag3_bit2 NOTIFY status_Flag3_bit2Changed)
    Q_PROPERTY(uint status_Flag3_bit3 MEMBER m_status_Flag3_bit3 NOTIFY status_Flag3_bit3Changed)
    Q_PROPERTY(uint status_Flag3_bit4 MEMBER m_status_Flag3_bit4 NOTIFY status_Flag3_bit4Changed)
    Q_PROPERTY(uint status_Flag3_bit5 MEMBER m_status_Flag3_bit5 NOTIFY status_Flag3_bit5Changed)

    /* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
    Q_PROPERTY(int motor_in_voltage MEMBER m_motor_in_voltage NOTIFY motor_in_voltageChanged)
    Q_PROPERTY(int motor_in_current MEMBER m_motor_in_current NOTIFY motor_in_currentChanged)
    Q_PROPERTY(int motor_temp MEMBER m_motor_temp NOTIFY motor_tempChanged)
    Q_PROPERTY(int motor_controller_temp MEMBER m_motor_controller_temp NOTIFY motor_controller_tempChanged)
    Q_PROPERTY(int car_mode MEMBER m_car_mode NOTIFY car_modeChanged)
    Q_PROPERTY(float version MEMBER m_version NOTIFY versionChanged)
    Q_PROPERTY(int car_Life MEMBER m_car_Life NOTIFY car_LifeChanged)
    Q_PROPERTY(float accel_pedal_percent MEMBER m_accel_pedal_percent NOTIFY accel_pedal_percentChanged)
    Q_PROPERTY(float brake_pedal_percent MEMBER m_brake_pedal_percent NOTIFY brake_pedal_percentChanged)
    Q_PROPERTY(int din1 MEMBER m_din1 NOTIFY din1Changed)
    Q_PROPERTY(int din2 MEMBER m_din2 NOTIFY din2Changed)
    Q_PROPERTY(int din3 MEMBER m_din3 NOTIFY din3Changed)
    Q_PROPERTY(int dout1 MEMBER m_dout1 NOTIFY dout1Changed)
    Q_PROPERTY(int dout2 MEMBER m_dout2 NOTIFY dout2Changed)
    Q_PROPERTY(int dout3 MEMBER m_dout3 NOTIFY dout3Changed)

    /* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
    Q_PROPERTY(float engine_fuel_consumption MEMBER m_engine_fuel_consumption NOTIFY engine_fuel_consumptionChanged)
    Q_PROPERTY(int engine_water_temp MEMBER m_engine_water_temp NOTIFY engine_water_tempChanged)
    Q_PROPERTY(int engine_load MEMBER m_engine_load NOTIFY engine_loadChanged)
    Q_PROPERTY(float engine_target_throttle MEMBER m_engine_target_throttle NOTIFY engine_target_throttleChanged)
    Q_PROPERTY(float engine_actual_throttle MEMBER m_engine_actual_throttle NOTIFY engine_actual_throttleChanged)
    Q_PROPERTY(int engine_oil_pressure MEMBER m_engine_oil_pressure NOTIFY engine_oil_pressureChanged)
    Q_PROPERTY(int engine_inlet_temp MEMBER m_engine_inlet_temp NOTIFY engine_inlet_tempChanged)

    /* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
    Q_PROPERTY(int oilpump_dcac_w_output_current MEMBER m_oilpump_dcac_w_output_current NOTIFY oilpump_dcac_w_output_currentChanged)
    Q_PROPERTY(int oilpump_dcac_v_output_current MEMBER m_oilpump_dcac_v_output_current NOTIFY oilpump_dcac_v_output_currentChanged)
    Q_PROPERTY(int oilpump_dcac_u_output_current MEMBER m_oilpump_dcac_u_output_current NOTIFY oilpump_dcac_u_output_currentChanged)
    Q_PROPERTY(int radiator_temp MEMBER m_radiator_temp NOTIFY radiator_tempChanged)

    /* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
    Q_PROPERTY(int actual_clutch_position MEMBER m_actual_clutch_position NOTIFY actual_clutch_positionChanged)
    Q_PROPERTY(int TCU_fault_code MEMBER m_TCU_fault_code NOTIFY TCU_fault_codeChanged)
    Q_PROPERTY(int axis_rpm MEMBER m_axis_rpm NOTIFY axis_rpmChanged)
    Q_PROPERTY(int FMI MEMBER m_FMI NOTIFY FMIChanged)
    Q_PROPERTY(int CM MEMBER m_CM NOTIFY CMChanged)
    Q_PROPERTY(int OC MEMBER m_OC NOTIFY OCChanged)

    /* 电池管理系统信息,对应BMS_INFO_TYPE */
    Q_PROPERTY(float bat_max_charge_current MEMBER m_bat_max_charge_current NOTIFY bat_max_charge_currentChanged)
    Q_PROPERTY(float bat_max_discharge_current MEMBER m_bat_max_discharge_current NOTIFY bat_max_discharge_currentChanged)
    Q_PROPERTY(float bat_average_voltage MEMBER m_bat_average_voltage NOTIFY bat_average_voltageChanged)
    Q_PROPERTY(int bat_status1 MEMBER m_bat_status1 NOTIFY bat_status1Changed)
    Q_PROPERTY(int bat_status2 MEMBER m_bat_status2 NOTIFY bat_status2Changed)
    Q_PROPERTY(int bat_status3 MEMBER m_bat_status3 NOTIFY bat_status3Changed)
    Q_PROPERTY(int irm_ohm_positive MEMBER m_irm_ohm_positive NOTIFY irm_ohm_positiveChanged)
    Q_PROPERTY(int irm_ohm_negative MEMBER m_irm_ohm_negative NOTIFY irm_ohm_negativeChanged)
    Q_PROPERTY(float bat_max_voltage MEMBER m_bat_max_voltage NOTIFY bat_max_voltageChanged)
    Q_PROPERTY(float bat_min_voltage MEMBER m_bat_min_voltage NOTIFY bat_min_voltageChanged)
    Q_PROPERTY(float batteryTH MEMBER m_batteryTH NOTIFY batteryTHChanged)

    /* 电池信息,对应BATTERY_INFO_TYPE */
    Q_PROPERTY(float bat_voltage1 MEMBER m_bat_voltage1 NOTIFY bat_voltage1Changed)
    Q_PROPERTY(float bat_voltage2 MEMBER m_bat_voltage2 NOTIFY bat_voltage2Changed)
    Q_PROPERTY(float bat_voltage3 MEMBER m_bat_voltage3 NOTIFY bat_voltage3Changed)
    Q_PROPERTY(float bat_voltage4 MEMBER m_bat_voltage4 NOTIFY bat_voltage4Changed)
    Q_PROPERTY(float bat_voltage5 MEMBER m_bat_voltage5 NOTIFY bat_voltage5Changed)
    Q_PROPERTY(float bat_voltage6 MEMBER m_bat_voltage6 NOTIFY bat_voltage6Changed)
    Q_PROPERTY(float bat_voltage7 MEMBER m_bat_voltage7 NOTIFY bat_voltage7Changed)
    Q_PROPERTY(float bat_voltage8 MEMBER m_bat_voltage8 NOTIFY bat_voltage8Changed)
    Q_PROPERTY(float bat_voltage9 MEMBER m_bat_voltage9 NOTIFY bat_voltage9Changed)
    Q_PROPERTY(float bat_voltage10 MEMBER m_bat_voltage10 NOTIFY bat_voltage10Changed)
    Q_PROPERTY(int bat_temp1 MEMBER m_bat_temp1 NOTIFY bat_temp1Changed)
    Q_PROPERTY(int bat_temp2 MEMBER m_bat_temp2 NOTIFY bat_temp2Changed)
    Q_PROPERTY(int bat_temp3 MEMBER m_bat_temp3 NOTIFY bat_temp3Changed)
    Q_PROPERTY(int bat_temp4 MEMBER m_bat_temp4 NOTIFY bat_temp4Changed)
    Q_PROPERTY(int bat_temp5 MEMBER m_bat_temp5 NOTIFY bat_temp5Changed)
    Q_PROPERTY(int bat_temp6 MEMBER m_bat_temp6 NOTIFY bat_temp6Changed)
    Q_PROPERTY(int bat_temp7 MEMBER m_bat_temp7 NOTIFY bat_temp7Changed)
    Q_PROPERTY(int bat_temp8 MEMBER m_bat_temp8 NOTIFY bat_temp8Changed)
    Q_PROPERTY(int bat_temp9 MEMBER m_bat_temp9 NOTIFY bat_temp9Changed)
    Q_PROPERTY(int bat_temp10 MEMBER m_bat_temp10 NOTIFY bat_temp10Changed)

    /* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
    Q_PROPERTY(int ac_fault_code MEMBER m_ac_fault_code NOTIFY ac_fault_codeChanged)
    Q_PROPERTY(int ac_fan_status MEMBER m_ac_fan_status NOTIFY ac_fan_statusChanged)
    Q_PROPERTY(int ac_work_status MEMBER m_ac_work_status NOTIFY ac_work_statusChanged)
    Q_PROPERTY(int ac_Life MEMBER m_ac_Life NOTIFY ac_LifeChanged)
    Q_PROPERTY(int ac_out_temp MEMBER m_ac_out_temp NOTIFY ac_out_tempChanged)
    Q_PROPERTY(int ac_in_temp MEMBER m_ac_in_temp NOTIFY ac_in_tempChanged)
    Q_PROPERTY(int ac_set_temp MEMBER m_ac_set_temp NOTIFY ac_set_tempChanged)
    Q_PROPERTY(int ac_refrigere_req MEMBER m_ac_refrigere_req NOTIFY ac_refrigere_reqChanged)

    //符号片
    Q_PROPERTY(uint lamp_key_on MEMBER m_lamp_key_on NOTIFY lamp_key_onChanged)
    Q_PROPERTY(uint lamp_turn_left MEMBER m_lamp_turn_left NOTIFY lamp_turn_leftChanged)
    Q_PROPERTY(uint lamp_turn_right MEMBER m_lamp_turn_right NOTIFY lamp_turn_rightChanged)
    Q_PROPERTY(uint lamp_double_flash MEMBER m_lamp_double_flash NOTIFY lamp_double_flashChanged)
    Q_PROPERTY(uint lamp_front_fog MEMBER m_lamp_front_fog NOTIFY lamp_front_fogChanged)
    Q_PROPERTY(uint lamp_rear_fog MEMBER m_lamp_rear_fog NOTIFY lamp_rear_fogChanged)
    Q_PROPERTY(uint lamp_high_beam MEMBER m_lamp_high_beam NOTIFY lamp_high_beamChanged)
    Q_PROPERTY(uint lamp_head_light MEMBER m_lamp_head_light NOTIFY lamp_head_lightChanged)
    Q_PROPERTY(uint lamp_reverse_gear MEMBER m_lamp_reverse_gear NOTIFY lamp_reverse_gearChanged)
    Q_PROPERTY(uint lamp_gate1 MEMBER m_lamp_gate1 NOTIFY lamp_gate1Changed)
    Q_PROPERTY(uint lamp_gate2 MEMBER m_lamp_gate2 NOTIFY lamp_gate2Changed)
    Q_PROPERTY(uint lamp_brake MEMBER m_lamp_brake NOTIFY lamp_brakeChanged)
    Q_PROPERTY(uint lamp_parking_brake MEMBER m_lamp_parking_brake NOTIFY lamp_parking_brakeChanged)
    Q_PROPERTY(uint lamp_left_low_air_pressure MEMBER m_lamp_left_low_air_pressure NOTIFY lamp_left_low_air_pressureChanged)
    Q_PROPERTY(uint lamp_right_low_air_pressure MEMBER m_lamp_right_low_air_pressure NOTIFY lamp_right_low_air_pressureChanged)
    Q_PROPERTY(uint lamp_left_shoe_wear MEMBER m_lamp_left_shoe_wear NOTIFY lamp_left_shoe_wearChanged)
    Q_PROPERTY(uint lamp_right_shoe_wear MEMBER m_lamp_right_shoe_wear NOTIFY lamp_right_shoe_wearChanged)
    Q_PROPERTY(uint lamp_defroster MEMBER m_lamp_defroster NOTIFY lamp_defrosterChanged)
    Q_PROPERTY(uint lamp_dryere MEMBER m_lamp_dryere NOTIFY lamp_dryereChanged)
    Q_PROPERTY(uint lamp_charge_plugin MEMBER m_lamp_charge_plugin NOTIFY lamp_charge_pluginChanged)
    Q_PROPERTY(uint lamp_charging MEMBER m_lamp_charging NOTIFY lamp_chargingChanged)
    Q_PROPERTY(uint lamp_water_temp_high MEMBER m_lamp_water_temp_high NOTIFY lamp_water_temp_highChanged)
    Q_PROPERTY(uint lamp_water_level_low MEMBER m_lamp_water_level_low NOTIFY lamp_water_level_lowChanged)
    Q_PROPERTY(uint lamp_oil_level_low MEMBER m_lamp_oil_level_low NOTIFY lamp_oil_level_lowChanged)
    Q_PROPERTY(uint lamp_engine_fault MEMBER m_lamp_engine_fault NOTIFY lamp_engine_faultChanged)
    Q_PROPERTY(uint lamp_motor_out_of_service MEMBER m_lamp_motor_out_of_service NOTIFY lamp_motor_out_of_serviceChanged)
    Q_PROPERTY(uint lamp_moter_fire_igon MEMBER m_lamp_moter_fire_igon NOTIFY lamp_moter_fire_igonChanged)
    Q_PROPERTY(uint lamp_air_filter MEMBER m_lamp_air_filter NOTIFY lamp_air_filterChanged)
    Q_PROPERTY(uint lamp_asr MEMBER m_lamp_asr NOTIFY lamp_asrChanged)
    Q_PROPERTY(uint lamp_abs MEMBER m_lamp_abs NOTIFY lamp_absChanged)
    Q_PROPERTY(uint lamp_ac MEMBER m_lamp_ac NOTIFY lamp_acChanged)
    Q_PROPERTY(uint lamp_high_voltage_maintenance MEMBER m_lamp_high_voltage_maintenance NOTIFY lamp_high_voltage_maintenanceChanged)
    Q_PROPERTY(uint lamp_rear_door_open MEMBER m_lamp_rear_door_open NOTIFY lamp_rear_door_openChanged)
    Q_PROPERTY(uint lamp_low_service_wl MEMBER m_lamp_low_service_wl NOTIFY lamp_low_service_wlChanged)
    Q_PROPERTY(uint lamp_heavy_stop_wl MEMBER m_lamp_heavy_stop_wl NOTIFY lamp_heavy_stop_wlChanged)
    Q_PROPERTY(uint lamp_serious_stop_wl MEMBER m_lamp_serious_stop_wl NOTIFY lamp_serious_stop_wlChanged)
    Q_PROPERTY(uint lamp_battery_main_contact MEMBER m_lamp_battery_main_contact NOTIFY lamp_battery_main_contactChanged)
    Q_PROPERTY(uint lamp_position_light MEMBER m_lamp_position_light NOTIFY lamp_position_lightChanged)
    Q_PROPERTY(uint lamp_oil_pressure_low MEMBER m_lamp_oil_pressure_low NOTIFY lamp_oil_pressure_lowChanged)
    Q_PROPERTY(uint lamp_charge_confirm MEMBER m_lamp_charge_confirm NOTIFY lamp_charge_confirmChanged)

    //仪表
    Q_PROPERTY(uint input_ctrl_01 MEMBER m_input_ctrl_01 NOTIFY input_ctrl_01Changed)
    Q_PROPERTY(uint input_ctrl_02 MEMBER m_input_ctrl_02 NOTIFY input_ctrl_02Changed)
    Q_PROPERTY(uint input_ctrl_03 MEMBER m_input_ctrl_03 NOTIFY input_ctrl_03Changed)
    Q_PROPERTY(uint input_ctrl_04 MEMBER m_input_ctrl_04 NOTIFY input_ctrl_04Changed)
    Q_PROPERTY(uint input_ctrl_05 MEMBER m_input_ctrl_05 NOTIFY input_ctrl_05Changed)
    Q_PROPERTY(uint input_ctrl_06 MEMBER m_input_ctrl_06 NOTIFY input_ctrl_06Changed)
    Q_PROPERTY(uint input_ctrl_07 MEMBER m_input_ctrl_07 NOTIFY input_ctrl_07Changed)
    Q_PROPERTY(uint input_ctrl_08 MEMBER m_input_ctrl_08 NOTIFY input_ctrl_08Changed)
    Q_PROPERTY(uint input_ctrl_09 MEMBER m_input_ctrl_09 NOTIFY input_ctrl_09Changed)
    Q_PROPERTY(uint input_ctrl_10 MEMBER m_input_ctrl_10 NOTIFY input_ctrl_10Changed)
    Q_PROPERTY(uint input_ctrl_11 MEMBER m_input_ctrl_11 NOTIFY input_ctrl_11Changed)
    Q_PROPERTY(uint input_ctrl_12 MEMBER m_input_ctrl_12 NOTIFY input_ctrl_12Changed)
    Q_PROPERTY(uint input_ctrl_13 MEMBER m_input_ctrl_13 NOTIFY input_ctrl_13Changed)
    Q_PROPERTY(uint input_ctrl_14 MEMBER m_input_ctrl_14 NOTIFY input_ctrl_14Changed)
    Q_PROPERTY(uint input_ctrl_15 MEMBER m_input_ctrl_15 NOTIFY input_ctrl_15Changed)
    Q_PROPERTY(uint input_ctrl_16 MEMBER m_input_ctrl_16 NOTIFY input_ctrl_16Changed)
    Q_PROPERTY(uint input_ctrl_17 MEMBER m_input_ctrl_17 NOTIFY input_ctrl_17Changed)
    Q_PROPERTY(uint input_ctrl_18 MEMBER m_input_ctrl_18 NOTIFY input_ctrl_18Changed)
    Q_PROPERTY(uint input_ctrl_19 MEMBER m_input_ctrl_19 NOTIFY input_ctrl_19Changed)
    Q_PROPERTY(uint input_ctrl_20 MEMBER m_input_ctrl_20 NOTIFY input_ctrl_20Changed)
    Q_PROPERTY(uint input_ctrl_21 MEMBER m_input_ctrl_21 NOTIFY input_ctrl_21Changed)
    Q_PROPERTY(uint input_ctrl_22 MEMBER m_input_ctrl_22 NOTIFY input_ctrl_22Changed)
    Q_PROPERTY(uint input_ctrl_23 MEMBER m_input_ctrl_23 NOTIFY input_ctrl_23Changed)
    Q_PROPERTY(uint input_ctrl_24 MEMBER m_input_ctrl_24 NOTIFY input_ctrl_24Changed)
    Q_PROPERTY(uint input_ctrl_25 MEMBER m_input_ctrl_25 NOTIFY input_ctrl_25Changed)
    Q_PROPERTY(uint input_ctrl_26 MEMBER m_input_ctrl_26 NOTIFY input_ctrl_26Changed)
    Q_PROPERTY(uint input_ctrl_27 MEMBER m_input_ctrl_27 NOTIFY input_ctrl_27Changed)
    Q_PROPERTY(uint input_ctrl_28 MEMBER m_input_ctrl_28 NOTIFY input_ctrl_28Changed)
    Q_PROPERTY(uint input_ctrl_29 MEMBER m_input_ctrl_29 NOTIFY input_ctrl_29Changed)
    Q_PROPERTY(uint input_ctrl_30 MEMBER m_input_ctrl_30 NOTIFY input_ctrl_30Changed)
    Q_PROPERTY(uint input_ctrl_31 MEMBER m_input_ctrl_31 NOTIFY input_ctrl_31Changed)
    Q_PROPERTY(uint input_ctrl_32 MEMBER m_input_ctrl_32 NOTIFY input_ctrl_32Changed)
    Q_PROPERTY(uint input_ctrl_33 MEMBER m_input_ctrl_33 NOTIFY input_ctrl_33Changed)
    Q_PROPERTY(uint input_ctrl_34 MEMBER m_input_ctrl_34 NOTIFY input_ctrl_34Changed)
    Q_PROPERTY(uint input_ctrl_35 MEMBER m_input_ctrl_35 NOTIFY input_ctrl_35Changed)

    /* 前模块,对应FRONT_MODULE_TYPE */
    Q_PROPERTY(float front_current01 MEMBER m_front_current01 NOTIFY front_current01Changed)
    Q_PROPERTY(float front_current02 MEMBER m_front_current02 NOTIFY front_current02Changed)
    Q_PROPERTY(float front_current03 MEMBER m_front_current03 NOTIFY front_current03Changed)
    Q_PROPERTY(float front_current04 MEMBER m_front_current04 NOTIFY front_current04Changed)
    Q_PROPERTY(float front_current05 MEMBER m_front_current05 NOTIFY front_current05Changed)
    Q_PROPERTY(float front_current06 MEMBER m_front_current06 NOTIFY front_current06Changed)
    Q_PROPERTY(float front_current07 MEMBER m_front_current07 NOTIFY front_current07Changed)
    Q_PROPERTY(float front_current08 MEMBER m_front_current08 NOTIFY front_current08Changed)
    Q_PROPERTY(float front_current09 MEMBER m_front_current09 NOTIFY front_current09Changed)
    Q_PROPERTY(float front_current10 MEMBER m_front_current10 NOTIFY front_current10Changed)
    Q_PROPERTY(float front_current11 MEMBER m_front_current11 NOTIFY front_current11Changed)
    Q_PROPERTY(float front_current12 MEMBER m_front_current12 NOTIFY front_current12Changed)
    Q_PROPERTY(float front_current13 MEMBER m_front_current13 NOTIFY front_current13Changed)
    Q_PROPERTY(float front_current14 MEMBER m_front_current14 NOTIFY front_current14Changed)
    Q_PROPERTY(float front_current15 MEMBER m_front_current15 NOTIFY front_current15Changed)
    Q_PROPERTY(uint front_switch01 MEMBER m_front_switch01 NOTIFY front_switch01Changed)
    Q_PROPERTY(uint front_switch02 MEMBER m_front_switch02 NOTIFY front_switch02Changed)
    Q_PROPERTY(uint front_switch03 MEMBER m_front_switch03 NOTIFY front_switch03Changed)
    Q_PROPERTY(uint front_switch04 MEMBER m_front_switch04 NOTIFY front_switch04Changed)
    Q_PROPERTY(uint front_switch05 MEMBER m_front_switch05 NOTIFY front_switch05Changed)
    Q_PROPERTY(uint front_switch06 MEMBER m_front_switch06 NOTIFY front_switch06Changed)
    Q_PROPERTY(uint front_switch07 MEMBER m_front_switch07 NOTIFY front_switch07Changed)
    Q_PROPERTY(uint front_switch08 MEMBER m_front_switch08 NOTIFY front_switch08Changed)
    Q_PROPERTY(uint front_switch09 MEMBER m_front_switch09 NOTIFY front_switch09Changed)
    Q_PROPERTY(uint front_switch10 MEMBER m_front_switch10 NOTIFY front_switch10Changed)
    Q_PROPERTY(uint front_switch11 MEMBER m_front_switch11 NOTIFY front_switch11Changed)
    Q_PROPERTY(uint front_switch12 MEMBER m_front_switch12 NOTIFY front_switch12Changed)
    Q_PROPERTY(uint front_switch13 MEMBER m_front_switch13 NOTIFY front_switch13Changed)
    Q_PROPERTY(uint front_switch14 MEMBER m_front_switch14 NOTIFY front_switch14Changed)
    Q_PROPERTY(uint front_switch15 MEMBER m_front_switch15 NOTIFY front_switch15Changed)
    Q_PROPERTY(uint front_switch16 MEMBER m_front_switch16 NOTIFY front_switch16Changed)
    Q_PROPERTY(uint front_switch17 MEMBER m_front_switch17 NOTIFY front_switch17Changed)
    Q_PROPERTY(uint front_switch18 MEMBER m_front_switch18 NOTIFY front_switch18Changed)
    Q_PROPERTY(uint front_switch19 MEMBER m_front_switch19 NOTIFY front_switch19Changed)
    Q_PROPERTY(uint front_switch20 MEMBER m_front_switch20 NOTIFY front_switch20Changed)
    Q_PROPERTY(uint front_switch21 MEMBER m_front_switch21 NOTIFY front_switch21Changed)
    Q_PROPERTY(uint front_switch22 MEMBER m_front_switch22 NOTIFY front_switch22Changed)
    Q_PROPERTY(uint front_switch23 MEMBER m_front_switch23 NOTIFY front_switch23Changed)
    Q_PROPERTY(uint front_switch24 MEMBER m_front_switch24 NOTIFY front_switch24Changed)
    Q_PROPERTY(uint front_switch25 MEMBER m_front_switch25 NOTIFY front_switch25Changed)
    Q_PROPERTY(uint front_switch26 MEMBER m_front_switch26 NOTIFY front_switch26Changed)
    Q_PROPERTY(uint front_switch27 MEMBER m_front_switch27 NOTIFY front_switch27Changed)
    Q_PROPERTY(uint front_switch28 MEMBER m_front_switch28 NOTIFY front_switch28Changed)
    Q_PROPERTY(uint front_switch29 MEMBER m_front_switch29 NOTIFY front_switch29Changed)
    Q_PROPERTY(uint front_switch30 MEMBER m_front_switch30 NOTIFY front_switch30Changed)
    Q_PROPERTY(uint front_switch31 MEMBER m_front_switch31 NOTIFY front_switch31Changed)
    Q_PROPERTY(uint front_switch32 MEMBER m_front_switch32 NOTIFY front_switch32Changed)
    Q_PROPERTY(uint front_switch33 MEMBER m_front_switch33 NOTIFY front_switch33Changed)
    Q_PROPERTY(uint front_switch34 MEMBER m_front_switch34 NOTIFY front_switch34Changed)
    Q_PROPERTY(uint front_switch35 MEMBER m_front_switch35 NOTIFY front_switch35Changed)
    Q_PROPERTY(uint front_switch36 MEMBER m_front_switch36 NOTIFY front_switch36Changed)
    Q_PROPERTY(uint front_switch37 MEMBER m_front_switch37 NOTIFY front_switch37Changed)
    Q_PROPERTY(uint front_switch38 MEMBER m_front_switch38 NOTIFY front_switch38Changed)
    Q_PROPERTY(uint front_switch39 MEMBER m_front_switch39 NOTIFY front_switch39Changed)
    Q_PROPERTY(uint front_switch40 MEMBER m_front_switch40 NOTIFY front_switch40Changed)
    Q_PROPERTY(uint front_switch41 MEMBER m_front_switch41 NOTIFY front_switch41Changed)
    Q_PROPERTY(uint front_switch42 MEMBER m_front_switch42 NOTIFY front_switch42Changed)

    /* 中模块,对应MIDDLE_MODULE_TYPE */
    Q_PROPERTY(float middle_current01 MEMBER m_middle_current01 NOTIFY middle_current01Changed)
    Q_PROPERTY(float middle_current02 MEMBER m_middle_current02 NOTIFY middle_current02Changed)
    Q_PROPERTY(float middle_current03 MEMBER m_middle_current03 NOTIFY middle_current03Changed)
    Q_PROPERTY(float middle_current04 MEMBER m_middle_current04 NOTIFY middle_current04Changed)
    Q_PROPERTY(float middle_current05 MEMBER m_middle_current05 NOTIFY middle_current05Changed)
    Q_PROPERTY(float middle_current06 MEMBER m_middle_current06 NOTIFY middle_current06Changed)
    Q_PROPERTY(float middle_current07 MEMBER m_middle_current07 NOTIFY middle_current07Changed)
    Q_PROPERTY(float middle_current08 MEMBER m_middle_current08 NOTIFY middle_current08Changed)
    Q_PROPERTY(float middle_current09 MEMBER m_middle_current09 NOTIFY middle_current09Changed)
    Q_PROPERTY(float middle_current10 MEMBER m_middle_current10 NOTIFY middle_current10Changed)
    Q_PROPERTY(float middle_current11 MEMBER m_middle_current11 NOTIFY middle_current11Changed)
    Q_PROPERTY(float middle_current12 MEMBER m_middle_current12 NOTIFY middle_current12Changed)
    Q_PROPERTY(float middle_current13 MEMBER m_middle_current13 NOTIFY middle_current13Changed)
    Q_PROPERTY(float middle_current14 MEMBER m_middle_current14 NOTIFY middle_current14Changed)
    Q_PROPERTY(float middle_current15 MEMBER m_middle_current15 NOTIFY middle_current15Changed)
    Q_PROPERTY(uint middle_switch01 MEMBER m_middle_switch01 NOTIFY middle_switch01Changed)
    Q_PROPERTY(uint middle_switch02 MEMBER m_middle_switch02 NOTIFY middle_switch02Changed)
    Q_PROPERTY(uint middle_switch03 MEMBER m_middle_switch03 NOTIFY middle_switch03Changed)
    Q_PROPERTY(uint middle_switch04 MEMBER m_middle_switch04 NOTIFY middle_switch04Changed)
    Q_PROPERTY(uint middle_switch05 MEMBER m_middle_switch05 NOTIFY middle_switch05Changed)
    Q_PROPERTY(uint middle_switch06 MEMBER m_middle_switch06 NOTIFY middle_switch06Changed)
    Q_PROPERTY(uint middle_switch07 MEMBER m_middle_switch07 NOTIFY middle_switch07Changed)
    Q_PROPERTY(uint middle_switch08 MEMBER m_middle_switch08 NOTIFY middle_switch08Changed)
    Q_PROPERTY(uint middle_switch09 MEMBER m_middle_switch09 NOTIFY middle_switch09Changed)
    Q_PROPERTY(uint middle_switch10 MEMBER m_middle_switch10 NOTIFY middle_switch10Changed)
    Q_PROPERTY(uint middle_switch11 MEMBER m_middle_switch11 NOTIFY middle_switch11Changed)
    Q_PROPERTY(uint middle_switch12 MEMBER m_middle_switch12 NOTIFY middle_switch12Changed)
    Q_PROPERTY(uint middle_switch13 MEMBER m_middle_switch13 NOTIFY middle_switch13Changed)
    Q_PROPERTY(uint middle_switch14 MEMBER m_middle_switch14 NOTIFY middle_switch14Changed)
    Q_PROPERTY(uint middle_switch15 MEMBER m_middle_switch15 NOTIFY middle_switch15Changed)
    Q_PROPERTY(uint middle_switch16 MEMBER m_middle_switch16 NOTIFY middle_switch16Changed)
    Q_PROPERTY(uint middle_switch17 MEMBER m_middle_switch17 NOTIFY middle_switch17Changed)
    Q_PROPERTY(uint middle_switch18 MEMBER m_middle_switch18 NOTIFY middle_switch18Changed)
    Q_PROPERTY(uint middle_switch19 MEMBER m_middle_switch19 NOTIFY middle_switch19Changed)
    Q_PROPERTY(uint middle_switch20 MEMBER m_middle_switch20 NOTIFY middle_switch20Changed)
    Q_PROPERTY(uint middle_switch21 MEMBER m_middle_switch21 NOTIFY middle_switch21Changed)
    Q_PROPERTY(uint middle_switch22 MEMBER m_middle_switch22 NOTIFY middle_switch22Changed)
    Q_PROPERTY(uint middle_switch23 MEMBER m_middle_switch23 NOTIFY middle_switch23Changed)
    Q_PROPERTY(uint middle_switch24 MEMBER m_middle_switch24 NOTIFY middle_switch24Changed)
    Q_PROPERTY(uint middle_switch25 MEMBER m_middle_switch25 NOTIFY middle_switch25Changed)
    Q_PROPERTY(uint middle_switch26 MEMBER m_middle_switch26 NOTIFY middle_switch26Changed)
    Q_PROPERTY(uint middle_switch27 MEMBER m_middle_switch27 NOTIFY middle_switch27Changed)
    Q_PROPERTY(uint middle_switch28 MEMBER m_middle_switch28 NOTIFY middle_switch28Changed)
    Q_PROPERTY(uint middle_switch29 MEMBER m_middle_switch29 NOTIFY middle_switch29Changed)
    Q_PROPERTY(uint middle_switch30 MEMBER m_middle_switch30 NOTIFY middle_switch30Changed)
    Q_PROPERTY(uint middle_switch31 MEMBER m_middle_switch31 NOTIFY middle_switch31Changed)
    Q_PROPERTY(uint middle_switch32 MEMBER m_middle_switch32 NOTIFY middle_switch32Changed)
    Q_PROPERTY(uint middle_switch33 MEMBER m_middle_switch33 NOTIFY middle_switch33Changed)
    Q_PROPERTY(uint middle_switch34 MEMBER m_middle_switch34 NOTIFY middle_switch34Changed)
    Q_PROPERTY(uint middle_switch35 MEMBER m_middle_switch35 NOTIFY middle_switch35Changed)
    Q_PROPERTY(uint middle_switch36 MEMBER m_middle_switch36 NOTIFY middle_switch36Changed)
    Q_PROPERTY(uint middle_switch37 MEMBER m_middle_switch37 NOTIFY middle_switch37Changed)
    Q_PROPERTY(uint middle_switch38 MEMBER m_middle_switch38 NOTIFY middle_switch38Changed)
    Q_PROPERTY(uint middle_switch39 MEMBER m_middle_switch39 NOTIFY middle_switch39Changed)
    Q_PROPERTY(uint middle_switch40 MEMBER m_middle_switch40 NOTIFY middle_switch40Changed)
    Q_PROPERTY(uint middle_switch41 MEMBER m_middle_switch41 NOTIFY middle_switch41Changed)
    Q_PROPERTY(uint middle_switch42 MEMBER m_middle_switch42 NOTIFY middle_switch42Changed)

    /* 后模块,对应BACK_MODULE_TYPE */
    Q_PROPERTY(float back_current01 MEMBER m_back_current01 NOTIFY back_current01Changed)
    Q_PROPERTY(float back_current02 MEMBER m_back_current02 NOTIFY back_current02Changed)
    Q_PROPERTY(float back_current03 MEMBER m_back_current03 NOTIFY back_current03Changed)
    Q_PROPERTY(float back_current04 MEMBER m_back_current04 NOTIFY back_current04Changed)
    Q_PROPERTY(float back_current05 MEMBER m_back_current05 NOTIFY back_current05Changed)
    Q_PROPERTY(float back_current06 MEMBER m_back_current06 NOTIFY back_current06Changed)
    Q_PROPERTY(float back_current07 MEMBER m_back_current07 NOTIFY back_current07Changed)
    Q_PROPERTY(float back_current08 MEMBER m_back_current08 NOTIFY back_current08Changed)
    Q_PROPERTY(float back_current09 MEMBER m_back_current09 NOTIFY back_current09Changed)
    Q_PROPERTY(float back_current10 MEMBER m_back_current10 NOTIFY back_current10Changed)
    Q_PROPERTY(float back_current11 MEMBER m_back_current11 NOTIFY back_current11Changed)
    Q_PROPERTY(float back_current12 MEMBER m_back_current12 NOTIFY back_current12Changed)
    Q_PROPERTY(float back_current13 MEMBER m_back_current13 NOTIFY back_current13Changed)
    Q_PROPERTY(float back_current14 MEMBER m_back_current14 NOTIFY back_current14Changed)
    Q_PROPERTY(float back_current15 MEMBER m_back_current15 NOTIFY back_current15Changed)

    Q_PROPERTY(uint back_switch01 MEMBER m_back_switch01 NOTIFY back_switch01Changed)
    Q_PROPERTY(uint back_switch02 MEMBER m_back_switch02 NOTIFY back_switch02Changed)
    Q_PROPERTY(uint back_switch03 MEMBER m_back_switch03 NOTIFY back_switch03Changed)
    Q_PROPERTY(uint back_switch04 MEMBER m_back_switch04 NOTIFY back_switch04Changed)
    Q_PROPERTY(uint back_switch05 MEMBER m_back_switch05 NOTIFY back_switch05Changed)
    Q_PROPERTY(uint back_switch06 MEMBER m_back_switch06 NOTIFY back_switch06Changed)
    Q_PROPERTY(uint back_switch07 MEMBER m_back_switch07 NOTIFY back_switch07Changed)
    Q_PROPERTY(uint back_switch08 MEMBER m_back_switch08 NOTIFY back_switch08Changed)
    Q_PROPERTY(uint back_switch09 MEMBER m_back_switch09 NOTIFY back_switch09Changed)
    Q_PROPERTY(uint back_switch10 MEMBER m_back_switch10 NOTIFY back_switch10Changed)
    Q_PROPERTY(uint back_switch11 MEMBER m_back_switch11 NOTIFY back_switch11Changed)
    Q_PROPERTY(uint back_switch12 MEMBER m_back_switch12 NOTIFY back_switch12Changed)
    Q_PROPERTY(uint back_switch13 MEMBER m_back_switch13 NOTIFY back_switch13Changed)
    Q_PROPERTY(uint back_switch14 MEMBER m_back_switch14 NOTIFY back_switch14Changed)
    Q_PROPERTY(uint back_switch15 MEMBER m_back_switch15 NOTIFY back_switch15Changed)
    Q_PROPERTY(uint back_switch16 MEMBER m_back_switch16 NOTIFY back_switch16Changed)
    Q_PROPERTY(uint back_switch17 MEMBER m_back_switch17 NOTIFY back_switch17Changed)
    Q_PROPERTY(uint back_switch18 MEMBER m_back_switch18 NOTIFY back_switch18Changed)
    Q_PROPERTY(uint back_switch19 MEMBER m_back_switch19 NOTIFY back_switch19Changed)
    Q_PROPERTY(uint back_switch20 MEMBER m_back_switch20 NOTIFY back_switch20Changed)
    Q_PROPERTY(uint back_switch21 MEMBER m_back_switch21 NOTIFY back_switch21Changed)
    Q_PROPERTY(uint back_switch22 MEMBER m_back_switch22 NOTIFY back_switch22Changed)
    Q_PROPERTY(uint back_switch23 MEMBER m_back_switch23 NOTIFY back_switch23Changed)
    Q_PROPERTY(uint back_switch24 MEMBER m_back_switch24 NOTIFY back_switch24Changed)
    Q_PROPERTY(uint back_switch25 MEMBER m_back_switch25 NOTIFY back_switch25Changed)
    Q_PROPERTY(uint back_switch26 MEMBER m_back_switch26 NOTIFY back_switch26Changed)
    Q_PROPERTY(uint back_switch27 MEMBER m_back_switch27 NOTIFY back_switch27Changed)
    Q_PROPERTY(uint back_switch28 MEMBER m_back_switch28 NOTIFY back_switch28Changed)
    Q_PROPERTY(uint back_switch29 MEMBER m_back_switch29 NOTIFY back_switch29Changed)
    Q_PROPERTY(uint back_switch30 MEMBER m_back_switch30 NOTIFY back_switch30Changed)
    Q_PROPERTY(uint back_switch31 MEMBER m_back_switch31 NOTIFY back_switch31Changed)
    Q_PROPERTY(uint back_switch32 MEMBER m_back_switch32 NOTIFY back_switch32Changed)
    Q_PROPERTY(uint back_switch33 MEMBER m_back_switch33 NOTIFY back_switch33Changed)
    Q_PROPERTY(uint back_switch34 MEMBER m_back_switch34 NOTIFY back_switch34Changed)
    Q_PROPERTY(uint back_switch35 MEMBER m_back_switch35 NOTIFY back_switch35Changed)
    Q_PROPERTY(uint back_switch36 MEMBER m_back_switch36 NOTIFY back_switch36Changed)
    Q_PROPERTY(uint back_switch37 MEMBER m_back_switch37 NOTIFY back_switch37Changed)
    Q_PROPERTY(uint back_switch38 MEMBER m_back_switch38 NOTIFY back_switch38Changed)
    Q_PROPERTY(uint back_switch39 MEMBER m_back_switch39 NOTIFY back_switch39Changed)
    Q_PROPERTY(uint back_switch40 MEMBER m_back_switch40 NOTIFY back_switch40Changed)
    Q_PROPERTY(uint back_switch41 MEMBER m_back_switch41 NOTIFY back_switch41Changed)
    Q_PROPERTY(uint back_switch42 MEMBER m_back_switch42 NOTIFY back_switch42Changed)

    Q_PROPERTY(QString versionStr MEMBER m_versionStr NOTIFY versionStrChanged)

    explicit CarViewModel(QObject *parent = 0);
    ~CarViewModel();

    void initialize();
    QString getIniKey(QString path, QString keypath);

protected:
    void run();

signals:
    void faultChanged(QString fault, int value);
    void resetStateChanged();
    void themeChanged();
    void notifyEnableKey(bool);
    void setFb1Alpha(); //设置fb1 的透明度为不透明
    void batNumSetChanged(int);
    void dateTimeSet(int);
    void menu_increase(int);
    void menu_decrease(int);
    void menu_time_tips(int);
    void menu_set_theme();
    void menu_L0Changed(uint);
    void menu_L1Changed(uint);
    void menu_L2Changed(uint);
    void menu_L3Changed(uint);
    void menu_L4Changed(uint);
    void menu_L5Changed(uint);
    void menu_L6Changed(uint);
    void menu_L7Changed(uint);
    void menu_L8Changed(uint);
    void menu_TimePosChanged(uint);
    void menu_DirectionChanged(uint);
    void menu_SettingsSelectChanged(uint);
    void menu_ThemeSelectChanged(uint);
    void upgradeTipsChanged(QString);
    void progressValueChanged(int);
    void autoFlashChanged(int);

    /* 主界面信息帧,对应CAR_INFO_TYPE */
    void ok_keyChanged(int);
    void left_keyChanged(int);
    void cancel_keyChanged(int);
    void right_keyChanged(int);
    void speedChanged(uint);
    void rpmChanged(int);
    void totalVoltageChanged(int);
    void totalCurrentChanged(int);
    void gearChanged(int);
    void odoChanged(int);
    void tripChanged(float);
    void socChanged(uint);
    void apVol1Changed(float);
    void apVol2Changed(float);
    void moter_control_tempChanged(int);
    void moter_tempChanged(int);
    void control_IN01Changed(uint);
    void control_IN02Changed(uint);
    void control_IN03Changed(uint);
    void control_IN04Changed(uint);
    void control_IN05Changed(uint);
    void control_IN06Changed(uint);
    void control_IN07Changed(uint);
    void control_IN08Changed(uint);
    void control_IN09Changed(uint);
    void control_IN10Changed(uint);
    void control_IN11Changed(uint);
    void control_IN12Changed(uint);
    void control_IN13Changed(uint);
    void control_IN14Changed(uint);
    void control_IN15Changed(uint);
    void control_IN16Changed(uint);
    void control_IN17Changed(uint);
    void control_IN18Changed(uint);
    void control_IN19Changed(uint);
    void control_IN20Changed(uint);
    void control_IN21Changed(uint);
    void control_IN22Changed(uint);
    void control_IN23Changed(uint);
    void control_IN24Changed(uint);
    void control_IN25Changed(uint);
    void control_IN26Changed(uint);
    void control_IN27Changed(uint);
    void control_IN28Changed(uint);
    void control_IN29Changed(uint);
    void control_IN30Changed(uint);
    void control_IN31Changed(uint);
    void control_IN32Changed(uint);
    void control_IN33Changed(uint);
    void control_IN34Changed(uint);
    void control_IN35Changed(uint);
    void brake_lightChanged(uint);
    void park_brakeChanged(uint);
    void back_doorChanged(uint);
    void main_powerChanged(uint);
    void power_supplyChanged(QString);
    void climbing_modeChanged(uint);
    void diagnostic_modeChanged(uint);
    void charge_confirmChanged(uint);
    void fault_levelChanged(int);
    void fault_codeChanged(int);
    void SPNChanged(int);
    void urea_levelChanged(float);
    void dateTimeChanged(int);
    void batteryChanged(int);
    void oil_levelChanged(int);

    /* 报警信息帧,对应WARNING_TYPE */
    void low_water_level_warnChanged(uint);
    void low_ap1_warnChanged(uint);
    void low_ap2_warnChanged(uint);
    void water_temp_sensor_warnChanged(uint);
    void oil_quantity_sensor_warnChanged(uint);
    void oil_pressure_sensor_warnChanged(uint);
    void bat_voltage_sensor_warnChanged(uint);
    void ap1_sensor_warnChanged(uint);
    void ap2_sensor_warnChanged(uint);
    void j1939_comm_fault_warnChanged(uint);
    void low_oil_pressure_warnChanged(uint);
    void left_brake_shoe_warnChanged(uint);
    void right_brake_shoe_warnChanged(uint);
    void air_filter_warnChanged(uint);
    void after_treat_warnChanged(uint);
    void water_temp_high_warnChanged(uint);
    void water_temp_missChanged(uint);
    void oil_pressure_data_missChanged(uint);
    void bus_comm_faultChanged(uint);
    void low_oil_warnChanged(uint);

    void status_Flag1_bit1Changed(uint);
    void status_Flag1_bit2Changed(uint);
    void status_Flag1_bit3Changed(uint);
    void status_Flag1_bit4Changed(uint);
    void status_Flag1_bit5Changed(uint);
    void status_Flag1_bit6Changed(uint);
    void status_Flag1_bit7Changed(uint);
    void status_Flag1_bit8Changed(uint);
    void status_Flag2_bit1Changed(uint);
    void status_Flag2_bit2Changed(uint);
    void status_Flag2_bit3Changed(uint);
    void status_Flag2_bit4Changed(uint);
    void status_Flag2_bit5Changed(uint);
    void status_Flag2_bit6Changed(uint);
    void status_Flag2_bit7Changed(uint);
    void status_Flag2_bit8Changed(uint);
    void status_Flag3_bit1Changed(uint);
    void status_Flag3_bit2Changed(uint);
    void status_Flag3_bit3Changed(uint);
    void status_Flag3_bit4Changed(uint);
    void status_Flag3_bit5Changed(uint);

    /* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
    void motor_in_voltageChanged(int);
    void motor_in_currentChanged(int);
    void motor_tempChanged(int);
    void motor_controller_tempChanged(int);
    void car_modeChanged(int);
    void versionChanged(float);
    void car_LifeChanged(int);
    void accel_pedal_percentChanged(float);
    void brake_pedal_percentChanged(float);
    void din1Changed(int);
    void din2Changed(int);
    void din3Changed(int);
    void dout1Changed(int);
    void dout2Changed(int);
    void dout3Changed(int);

    /* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
    void engine_fuel_consumptionChanged(float);
    void engine_water_tempChanged(int);
    void engine_loadChanged(int);
    void engine_target_throttleChanged(float);
    void engine_actual_throttleChanged(float);
    void engine_oil_pressureChanged(int);
    void engine_inlet_tempChanged(int);

    /* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
    void oilpump_dcac_w_output_currentChanged(int);
    void oilpump_dcac_v_output_currentChanged(int);
    void oilpump_dcac_u_output_currentChanged(int);
    void radiator_tempChanged(int);

    /* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
    void actual_clutch_positionChanged(int);
    void TCU_fault_codeChanged(int);
    void axis_rpmChanged(int);
    void FMIChanged(int);
    void CMChanged(int);
    void OCChanged(int);

    /* 电池管理系统信息,对应BMS_INFO_TYPE */
    void bat_max_charge_currentChanged(float);
    void bat_max_discharge_currentChanged(float);
    void bat_average_voltageChanged(float);
    void bat_status1Changed(int);
    void bat_status2Changed(int);
    void bat_status3Changed(int);
    void irm_ohm_positiveChanged(int);
    void irm_ohm_negativeChanged(int);
    void bat_max_voltageChanged(float);
    void bat_min_voltageChanged(float);
    void batteryTHChanged(float);

    /* 电池信息,对应BATTERY_INFO_TYPE */
    void bat_voltage1Changed(float);
    void bat_voltage2Changed(float);
    void bat_voltage3Changed(float);
    void bat_voltage4Changed(float);
    void bat_voltage5Changed(float);
    void bat_voltage6Changed(float);
    void bat_voltage7Changed(float);
    void bat_voltage8Changed(float);
    void bat_voltage9Changed(float);
    void bat_voltage10Changed(float);
    void bat_temp1Changed(int);
    void bat_temp2Changed(int);
    void bat_temp3Changed(int);
    void bat_temp4Changed(int);
    void bat_temp5Changed(int);
    void bat_temp6Changed(int);
    void bat_temp7Changed(int);
    void bat_temp8Changed(int);
    void bat_temp9Changed(int);
    void bat_temp10Changed(int);

    /* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
    void ac_fault_codeChanged(int);
    void ac_fan_statusChanged(int);
    void ac_work_statusChanged(int);
    void ac_LifeChanged(int);
    void ac_out_tempChanged(int);
    void ac_in_tempChanged(int);
    void ac_set_tempChanged(int);
    void ac_refrigere_reqChanged(int);

    //符号片
    void lamp_key_onChanged(uint);
    void lamp_turn_leftChanged(uint);
    void lamp_turn_rightChanged(uint);
    void lamp_double_flashChanged(uint);
    void lamp_front_fogChanged(uint);
    void lamp_rear_fogChanged(uint);
    void lamp_high_beamChanged(uint);
    void lamp_head_lightChanged(uint);
    void lamp_reverse_gearChanged(uint);
    void lamp_gate1Changed(uint);
    void lamp_gate2Changed(uint);
    void lamp_brakeChanged(uint);
    void lamp_parking_brakeChanged(uint);
    void lamp_left_low_air_pressureChanged(uint);
    void lamp_right_low_air_pressureChanged(uint);
    void lamp_left_shoe_wearChanged(uint);
    void lamp_right_shoe_wearChanged(uint);
    void lamp_defrosterChanged(uint);
    void lamp_dryereChanged(uint);
    void lamp_charge_pluginChanged(uint);
    void lamp_chargingChanged(uint);
    void lamp_water_temp_highChanged(uint);
    void lamp_water_level_lowChanged(uint);
    void lamp_oil_level_lowChanged(uint);
    void lamp_engine_faultChanged(uint);
    void lamp_motor_out_of_serviceChanged(uint);
    void lamp_moter_fire_igonChanged(uint);
    void lamp_air_filterChanged(uint);
    void lamp_asrChanged(uint);
    void lamp_absChanged(uint);
    void lamp_acChanged(uint);
    void lamp_high_voltage_maintenanceChanged(uint);
    void lamp_rear_door_openChanged(uint);
    void lamp_low_service_wlChanged(uint);
    void lamp_heavy_stop_wlChanged(uint);
    void lamp_serious_stop_wlChanged(uint);
    void lamp_battery_main_contactChanged(uint);
    void lamp_position_lightChanged(uint);
    void lamp_oil_pressure_lowChanged(uint);
    void lamp_charge_confirmChanged(uint);

    //仪表
    void input_ctrl_01Changed(uint);
    void input_ctrl_02Changed(uint);
    void input_ctrl_03Changed(uint);
    void input_ctrl_04Changed(uint);
    void input_ctrl_05Changed(uint);
    void input_ctrl_06Changed(uint);
    void input_ctrl_07Changed(uint);
    void input_ctrl_08Changed(uint);
    void input_ctrl_09Changed(uint);
    void input_ctrl_10Changed(uint);
    void input_ctrl_11Changed(uint);
    void input_ctrl_12Changed(uint);
    void input_ctrl_13Changed(uint);
    void input_ctrl_14Changed(uint);
    void input_ctrl_15Changed(uint);
    void input_ctrl_16Changed(uint);
    void input_ctrl_17Changed(uint);
    void input_ctrl_18Changed(uint);
    void input_ctrl_19Changed(uint);
    void input_ctrl_20Changed(uint);
    void input_ctrl_21Changed(uint);
    void input_ctrl_22Changed(uint);
    void input_ctrl_23Changed(uint);
    void input_ctrl_24Changed(uint);
    void input_ctrl_25Changed(uint);
    void input_ctrl_26Changed(uint);
    void input_ctrl_27Changed(uint);
    void input_ctrl_28Changed(uint);
    void input_ctrl_29Changed(uint);
    void input_ctrl_30Changed(uint);
    void input_ctrl_31Changed(uint);
    void input_ctrl_32Changed(uint);
    void input_ctrl_33Changed(uint);
    void input_ctrl_34Changed(uint);
    void input_ctrl_35Changed(uint);

    /* 前模块,对应FRONT_MODULE_TYPE */
    void front_current01Changed(float);
    void front_current02Changed(float);
    void front_current03Changed(float);
    void front_current04Changed(float);
    void front_current05Changed(float);
    void front_current06Changed(float);
    void front_current07Changed(float);
    void front_current08Changed(float);
    void front_current09Changed(float);
    void front_current10Changed(float);
    void front_current11Changed(float);
    void front_current12Changed(float);
    void front_current13Changed(float);
    void front_current14Changed(float);
    void front_current15Changed(float);
    void front_switch01Changed(uint);
    void front_switch02Changed(uint);
    void front_switch03Changed(uint);
    void front_switch04Changed(uint);
    void front_switch05Changed(uint);
    void front_switch06Changed(uint);
    void front_switch07Changed(uint);
    void front_switch08Changed(uint);
    void front_switch09Changed(uint);
    void front_switch10Changed(uint);
    void front_switch11Changed(uint);
    void front_switch12Changed(uint);
    void front_switch13Changed(uint);
    void front_switch14Changed(uint);
    void front_switch15Changed(uint);
    void front_switch16Changed(uint);
    void front_switch17Changed(uint);
    void front_switch18Changed(uint);
    void front_switch19Changed(uint);
    void front_switch20Changed(uint);
    void front_switch21Changed(uint);
    void front_switch22Changed(uint);
    void front_switch23Changed(uint);
    void front_switch24Changed(uint);
    void front_switch25Changed(uint);
    void front_switch26Changed(uint);
    void front_switch27Changed(uint);
    void front_switch28Changed(uint);
    void front_switch29Changed(uint);
    void front_switch30Changed(uint);
    void front_switch31Changed(uint);
    void front_switch32Changed(uint);
    void front_switch33Changed(uint);
    void front_switch34Changed(uint);
    void front_switch35Changed(uint);
    void front_switch36Changed(uint);
    void front_switch37Changed(uint);
    void front_switch38Changed(uint);
    void front_switch39Changed(uint);
    void front_switch40Changed(uint);
    void front_switch41Changed(uint);
    void front_switch42Changed(uint);

    /* 中模块,对应MIDDLE_MODULE_TYPE */
    void middle_current01Changed(float);
    void middle_current02Changed(float);
    void middle_current03Changed(float);
    void middle_current04Changed(float);
    void middle_current05Changed(float);
    void middle_current06Changed(float);
    void middle_current07Changed(float);
    void middle_current08Changed(float);
    void middle_current09Changed(float);
    void middle_current10Changed(float);
    void middle_current11Changed(float);
    void middle_current12Changed(float);
    void middle_current13Changed(float);
    void middle_current14Changed(float);
    void middle_current15Changed(float);
    void middle_switch01Changed(uint);
    void middle_switch02Changed(uint);
    void middle_switch03Changed(uint);
    void middle_switch04Changed(uint);
    void middle_switch05Changed(uint);
    void middle_switch06Changed(uint);
    void middle_switch07Changed(uint);
    void middle_switch08Changed(uint);
    void middle_switch09Changed(uint);
    void middle_switch10Changed(uint);
    void middle_switch11Changed(uint);
    void middle_switch12Changed(uint);
    void middle_switch13Changed(uint);
    void middle_switch14Changed(uint);
    void middle_switch15Changed(uint);
    void middle_switch16Changed(uint);
    void middle_switch17Changed(uint);
    void middle_switch18Changed(uint);
    void middle_switch19Changed(uint);
    void middle_switch20Changed(uint);
    void middle_switch21Changed(uint);
    void middle_switch22Changed(uint);
    void middle_switch23Changed(uint);
    void middle_switch24Changed(uint);
    void middle_switch25Changed(uint);
    void middle_switch26Changed(uint);
    void middle_switch27Changed(uint);
    void middle_switch28Changed(uint);
    void middle_switch29Changed(uint);
    void middle_switch30Changed(uint);
    void middle_switch31Changed(uint);
    void middle_switch32Changed(uint);
    void middle_switch33Changed(uint);
    void middle_switch34Changed(uint);
    void middle_switch35Changed(uint);
    void middle_switch36Changed(uint);
    void middle_switch37Changed(uint);
    void middle_switch38Changed(uint);
    void middle_switch39Changed(uint);
    void middle_switch40Changed(uint);
    void middle_switch41Changed(uint);
    void middle_switch42Changed(uint);

    /* 后模块,对应BACK_MODULE_TYPE */
    void back_current01Changed(float);
    void back_current02Changed(float);
    void back_current03Changed(float);
    void back_current04Changed(float);
    void back_current05Changed(float);
    void back_current06Changed(float);
    void back_current07Changed(float);
    void back_current08Changed(float);
    void back_current09Changed(float);
    void back_current10Changed(float);
    void back_current11Changed(float);
    void back_current12Changed(float);
    void back_current13Changed(float);
    void back_current14Changed(float);
    void back_current15Changed(float);
    void back_switch01Changed(uint);
    void back_switch02Changed(uint);
    void back_switch03Changed(uint);
    void back_switch04Changed(uint);
    void back_switch05Changed(uint);
    void back_switch06Changed(uint);
    void back_switch07Changed(uint);
    void back_switch08Changed(uint);
    void back_switch09Changed(uint);
    void back_switch10Changed(uint);
    void back_switch11Changed(uint);
    void back_switch12Changed(uint);
    void back_switch13Changed(uint);
    void back_switch14Changed(uint);
    void back_switch15Changed(uint);
    void back_switch16Changed(uint);
    void back_switch17Changed(uint);
    void back_switch18Changed(uint);
    void back_switch19Changed(uint);
    void back_switch20Changed(uint);
    void back_switch21Changed(uint);
    void back_switch22Changed(uint);
    void back_switch23Changed(uint);
    void back_switch24Changed(uint);
    void back_switch25Changed(uint);
    void back_switch26Changed(uint);
    void back_switch27Changed(uint);
    void back_switch28Changed(uint);
    void back_switch29Changed(uint);
    void back_switch30Changed(uint);
    void back_switch31Changed(uint);
    void back_switch32Changed(uint);
    void back_switch33Changed(uint);
    void back_switch34Changed(uint);
    void back_switch35Changed(uint);
    void back_switch36Changed(uint);
    void back_switch37Changed(uint);
    void back_switch38Changed(uint);
    void back_switch39Changed(uint);
    void back_switch40Changed(uint);
    void back_switch41Changed(uint);
    void back_switch42Changed(uint);

    void versionStrChanged(QString);

    Q_INVOKABLE void addTipsInfo(QString);
    Q_INVOKABLE void delTipsInfo(QString);

public slots:
    void onNotifyResetStatus();
    void tripClearUpdate(bool);
    void batNumSetUpdate(int);
    void menu_L0Update(uint);
    void menu_L1Update(int);
    void menu_L2Update(int);
    void menu_L3Update(int);
    void menu_L4Update(int);
    void menu_L5Update(int);
    void menu_L6Update(int);
    void menu_L7Update(int);
    void menu_L8Update(int);
    void menu_TimePosUpdate(int);
    void menu_DirectionUpdate(int);
    void menu_SettingsSelectUpdate(int);
    void menu_ThemeSelectUpdate(int);
    void upgradeTipsUpdate(QString);
    void progressValueUpdate(int);
    void autoFlashUpdate(int);

    /* 主界面信息帧,对应CAR_INFO_TYPE */
    void speedUpdate(uint);
    void rpmUpdate(int);
    void totalVoltageUpdate(int);
    void totalCurrentUpdate(int);
    void gearUpdate(int);
    void odoUpdate(int);
    void tripUpdate(float);
    void socUpdate(uint);
    void apVol1Update(float);
    void apVol2Update(float);
    void moter_control_tempUpdate(int);
    void moter_tempUpdate(int);

    void main_powerUpdate(uint);
    void power_supplyUpdate(QString);
    void climbing_modeUpdate(uint);
    void diagnostic_modeUpdate(uint);
    void charge_confirmUpdate(uint);
    void fault_levelUpdate(int);
    void fault_codeUpdate(int);
    void SPNUpdate(int);
    void urea_levelUpdate(float);
    void dateTimeUpdate(int);
    void batteryUpdate(int);
    void oil_levelUpdate(int);

    /* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
    void motor_in_voltageUpdate(int);
    void motor_in_currentUpdate(int);
    void motor_tempUpdate(int);
    void motor_controller_tempUpdate(int);
    void car_modeUpdate(int);
    void versionUpdate(float);
    void car_LifeUpdate(int);
    void accel_pedal_percentUpdate(float);
    void brake_pedal_percentUpdate(float);
    void din1Update(int);
    void din2Update(int);
    void din3Update(int);
    void dout1Update(int);
    void dout2Update(int);
    void dout3Update(int);

    /* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
    void engine_fuel_consumptionUpdate(float);
    void engine_water_tempUpdate(int);
    void engine_loadUpdate(int);
    void engine_target_throttleUpdate(float);
    void engine_actual_throttleUpdate(float);
    void engine_oil_pressureUpdate(int);
    void engine_inlet_tempUpdate(int);

    /* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
    void oilpump_dcac_w_output_currentUpdate(int);
    void oilpump_dcac_v_output_currentUpdate(int);
    void oilpump_dcac_u_output_currentUpdate(int);
    void radiator_tempUpdate(int);

    /* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
    void actual_clutch_positionUpdate(int);
    void TCU_fault_codeUpdate(int);
    void axis_rpmUpdate(int);
    void FMIUpdate(int);
    void CMUpdate(int);
    void OCUpdate(int);

    /* 电池管理系统信息,对应BMS_INFO_TYPE */
    void bat_max_charge_currentUpdate(float);
    void bat_max_discharge_currentUpdate(float);
    void bat_average_voltageUpdate(float);
    void bat_status1Update(int);
    void bat_status2Update(int);
    void bat_status3Update(int);
    void irm_ohm_positiveUpdate(int);
    void irm_ohm_negativeUpdate(int);
    void bat_max_voltageUpdate(float);
    void bat_min_voltageUpdate(float);
    void batteryTHUpdate(float);

    /* 电池信息,对应BATTERY_INFO_TYPE */
    void bat_voltageUpdate(int, float);
    void bat_tempUpdate(int, int);

    /* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
    void ac_fault_codeUpdate(int);
    void ac_fan_statusUpdate(int);
    void ac_work_statusUpdate(int);
    void ac_LifeUpdate(int);
    void ac_out_tempUpdate(int);
    void ac_in_tempUpdate(int);
    void ac_set_tempUpdate(int);
    void ac_refrigere_reqUpdate(int);

    //告警
    void warning_01Update(QString);
    void warning_02Update(QString);
    void warning_03Update(QString);
    void warning_04Update(QString);
    void warning_05Update(QString);
    void warning_06Update(QString);
    void warning_07Update(QString);
    void warning_08Update(QString);
    void warning_09Update(QString);
    void warning_10Update(QString);
    void warning_11Update(QString);
    void warning_12Update(QString);
    void warning_13Update(QString);
    void warning_14Update(QString);
    void warning_15Update(QString);
    void warning_16Update(QString);
    void warning_17Update(QString);
    void warning_18Update(QString);
    void warning_19Update(QString);
    void warning_20Update(QString);
    void warning_21Update(QString);
    void warning_22Update(QString);
    void warning_23Update(QString);
    void warning_24Update(QString);
    void warning_25Update(QString);
    void warning_26Update(QString);
    void warning_27Update(QString);
    void warning_28Update(QString);
    void warning_29Update(QString);
    void warning_30Update(QString);
    void warning_31Update(QString);
    void warning_32Update(QString);
    void warning_33Update(QString);
    void warning_34Update(QString);
    void warning_35Update(QString);
    void warning_36Update(QString);
    void warning_37Update(QString);
    void warning_38Update(QString);
    void warning_39Update(QString);
    void warning_40Update(QString);

    //符号片
    void lamp_key_onUpdate(uint);
    void lamp_turn_leftUpdate(uint);
    void lamp_turn_rightUpdate(uint);
    void lamp_double_flashUpdate(uint);
    void lamp_front_fogUpdate(uint);
    void lamp_rear_fogUpdate(uint);
    void lamp_high_beamUpdate(uint);
    void lamp_head_lightUpdate(uint);
    void lamp_reverse_gearUpdate(uint);
    void lamp_gate1Update(uint);
    void lamp_gate2Update(uint);
    void lamp_brakeUpdate(uint);
    void lamp_parking_brakeUpdate(uint);
    void lamp_left_low_air_pressureUpdate(uint);
    void lamp_right_low_air_pressureUpdate(uint);
    void lamp_left_shoe_wearUpdate(uint);
    void lamp_right_shoe_wearUpdate(uint);
    void lamp_defrosterUpdate(uint);
    void lamp_dryereUpdate(uint);
    void lamp_charge_pluginUpdate(uint);
    void lamp_chargingUpdate(uint);
    void lamp_water_temp_highUpdate(uint);
    void lamp_water_level_lowUpdate(uint);
    void lamp_oil_level_lowUpdate(uint);
    void lamp_engine_faultUpdate(uint);
    void lamp_motor_out_of_serviceUpdate(uint);
    void lamp_moter_fire_igonUpdate(uint);
    void lamp_air_filterUpdate(uint);
    void lamp_asrUpdate(uint);
    void lamp_absUpdate(uint);
    void lamp_acUpdate(uint);
    void lamp_high_voltage_maintenanceUpdate(uint);
    void lamp_rear_door_openUpdate(uint);
    void lamp_low_service_wlUpdate(uint);
    void lamp_heavy_stop_wlUpdate(uint);
    void lamp_serious_stop_wlUpdate(uint);
    void lamp_battery_main_contactUpdate(uint);
    void lamp_position_lightUpdate(uint);
    void lamp_oil_pressure_lowUpdate(uint);
    void lamp_charge_confirmUpdate(uint);

    //仪表
    void input_ctrl_01Update(uint);
    void input_ctrl_02Update(uint);
    void input_ctrl_03Update(uint);
    void input_ctrl_04Update(uint);
    void input_ctrl_05Update(uint);
    void input_ctrl_06Update(uint);
    void input_ctrl_07Update(uint);
    void input_ctrl_08Update(uint);
    void input_ctrl_09Update(uint);
    void input_ctrl_10Update(uint);
    void input_ctrl_11Update(uint);
    void input_ctrl_12Update(uint);
    void input_ctrl_13Update(uint);
    void input_ctrl_14Update(uint);
    void input_ctrl_15Update(uint);
    void input_ctrl_16Update(uint);
    void input_ctrl_17Update(uint);
    void input_ctrl_18Update(uint);
    void input_ctrl_19Update(uint);
    void input_ctrl_20Update(uint);
    void input_ctrl_21Update(uint);
    void input_ctrl_22Update(uint);
    void input_ctrl_23Update(uint);
    void input_ctrl_24Update(uint);
    void input_ctrl_25Update(uint);
    void input_ctrl_26Update(uint);
    void input_ctrl_27Update(uint);
    void input_ctrl_28Update(uint);
    void input_ctrl_29Update(uint);
    void input_ctrl_30Update(uint);
    void input_ctrl_31Update(uint);
    void input_ctrl_32Update(uint);
    void input_ctrl_33Update(uint);
    void input_ctrl_34Update(uint);
    void input_ctrl_35Update(uint);

    /* 前模块,对应FRONT_MODULE_TYPE */
    void front_current01Update(float);
    void front_current02Update(float);
    void front_current03Update(float);
    void front_current04Update(float);
    void front_current05Update(float);
    void front_current06Update(float);
    void front_current07Update(float);
    void front_current08Update(float);
    void front_current09Update(float);
    void front_current10Update(float);
    void front_current11Update(float);
    void front_current12Update(float);
    void front_current13Update(float);
    void front_current14Update(float);
    void front_current15Update(float);
    void front_switch01Update(uint);
    void front_switch02Update(uint);
    void front_switch03Update(uint);
    void front_switch04Update(uint);
    void front_switch05Update(uint);
    void front_switch06Update(uint);
    void front_switch07Update(uint);
    void front_switch08Update(uint);
    void front_switch09Update(uint);
    void front_switch10Update(uint);
    void front_switch11Update(uint);
    void front_switch12Update(uint);
    void front_switch13Update(uint);
    void front_switch14Update(uint);
    void front_switch15Update(uint);
    void front_switch16Update(uint);
    void front_switch17Update(uint);
    void front_switch18Update(uint);
    void front_switch19Update(uint);
    void front_switch20Update(uint);
    void front_switch21Update(uint);
    void front_switch22Update(uint);
    void front_switch23Update(uint);
    void front_switch24Update(uint);
    void front_switch25Update(uint);
    void front_switch26Update(uint);
    void front_switch27Update(uint);
    void front_switch28Update(uint);
    void front_switch29Update(uint);
    void front_switch30Update(uint);
    void front_switch31Update(uint);
    void front_switch32Update(uint);
    void front_switch33Update(uint);
    void front_switch34Update(uint);
    void front_switch35Update(uint);
    void front_switch36Update(uint);
    void front_switch37Update(uint);
    void front_switch38Update(uint);
    void front_switch39Update(uint);
    void front_switch40Update(uint);
    void front_switch41Update(uint);
    void front_switch42Update(uint);


    /* 中模块,对应MIDDLE_MODULE_TYPE */
    void middle_current01Update(float);
    void middle_current02Update(float);
    void middle_current03Update(float);
    void middle_current04Update(float);
    void middle_current05Update(float);
    void middle_current06Update(float);
    void middle_current07Update(float);
    void middle_current08Update(float);
    void middle_current09Update(float);
    void middle_current10Update(float);
    void middle_current11Update(float);
    void middle_current12Update(float);
    void middle_current13Update(float);
    void middle_current14Update(float);
    void middle_current15Update(float);
    void middle_switch01Update(uint);
    void middle_switch02Update(uint);
    void middle_switch03Update(uint);
    void middle_switch04Update(uint);
    void middle_switch05Update(uint);
    void middle_switch06Update(uint);
    void middle_switch07Update(uint);
    void middle_switch08Update(uint);
    void middle_switch09Update(uint);
    void middle_switch10Update(uint);
    void middle_switch11Update(uint);
    void middle_switch12Update(uint);
    void middle_switch13Update(uint);
    void middle_switch14Update(uint);
    void middle_switch15Update(uint);
    void middle_switch16Update(uint);
    void middle_switch17Update(uint);
    void middle_switch18Update(uint);
    void middle_switch19Update(uint);
    void middle_switch20Update(uint);
    void middle_switch21Update(uint);
    void middle_switch22Update(uint);
    void middle_switch23Update(uint);
    void middle_switch24Update(uint);
    void middle_switch25Update(uint);
    void middle_switch26Update(uint);
    void middle_switch27Update(uint);
    void middle_switch28Update(uint);
    void middle_switch29Update(uint);
    void middle_switch30Update(uint);
    void middle_switch31Update(uint);
    void middle_switch32Update(uint);
    void middle_switch33Update(uint);
    void middle_switch34Update(uint);
    void middle_switch35Update(uint);
    void middle_switch36Update(uint);
    void middle_switch37Update(uint);
    void middle_switch38Update(uint);
    void middle_switch39Update(uint);
    void middle_switch40Update(uint);
    void middle_switch41Update(uint);
    void middle_switch42Update(uint);

    /* 后模块,对应BACK_MODULE_TYPE */
    void back_current01Update(float);
    void back_current02Update(float);
    void back_current03Update(float);
    void back_current04Update(float);
    void back_current05Update(float);
    void back_current06Update(float);
    void back_current07Update(float);
    void back_current08Update(float);
    void back_current09Update(float);
    void back_current10Update(float);
    void back_current11Update(float);
    void back_current12Update(float);
    void back_current13Update(float);
    void back_current14Update(float);
    void back_current15Update(float);
    void back_switch01Update(uint);
    void back_switch02Update(uint);
    void back_switch03Update(uint);
    void back_switch04Update(uint);
    void back_switch05Update(uint);
    void back_switch06Update(uint);
    void back_switch07Update(uint);
    void back_switch08Update(uint);
    void back_switch09Update(uint);
    void back_switch10Update(uint);
    void back_switch11Update(uint);
    void back_switch12Update(uint);
    void back_switch13Update(uint);
    void back_switch14Update(uint);
    void back_switch15Update(uint);
    void back_switch16Update(uint);
    void back_switch17Update(uint);
    void back_switch18Update(uint);
    void back_switch19Update(uint);
    void back_switch20Update(uint);
    void back_switch21Update(uint);
    void back_switch22Update(uint);
    void back_switch23Update(uint);
    void back_switch24Update(uint);
    void back_switch25Update(uint);
    void back_switch26Update(uint);
    void back_switch27Update(uint);
    void back_switch28Update(uint);
    void back_switch29Update(uint);
    void back_switch30Update(uint);
    void back_switch31Update(uint);
    void back_switch32Update(uint);
    void back_switch33Update(uint);
    void back_switch34Update(uint);
    void back_switch35Update(uint);
    void back_switch36Update(uint);
    void back_switch37Update(uint);
    void back_switch38Update(uint);
    void back_switch39Update(uint);
    void back_switch40Update(uint);
    void back_switch41Update(uint);
    void back_switch42Update(uint);

private:
    void setVoltageByIndex(int index, float value);
    void setTemperatureByIndex(int index, int value);

    CarMenuControl* carMenuControl;
    CarMessageHandle* msgHandle;

    bool bResetStatus = false;

    int m_batNumSet = 0;

    uint m_menu_L0 = 0;
    int m_menu_L1 = 0;
    int m_menu_L2 = 0;
    int m_menu_L3 = 0;
    int m_menu_L4 = 0;
    int m_menu_L5 = 0;
    int m_menu_L6 = 0;
    int m_menu_L7 = 0;
    int m_menu_L8 = 0;
    int m_menu_TimePos = 0;
    int m_menu_Direction = 0;
    int m_menu_SettingsSelect = 0;
    int m_menu_ThemeSelect = 0;
    QString m_upgradeTips = "";
    int m_progressValue = 0;
    int m_autoFlash = 0;

    /* 主界面信息帧,对应CAR_INFO_TYPE */
    int m_ok_key; //key1
    int m_left_key; //key2
    int m_cancel_key; //key4
    int m_right_key; //key3
    uint m_speed; //车速, 0 Km/h
    int m_rpm; //转速, 0 RPM
    int m_totalVoltage; //总电压, 0 V
    int m_totalCurrent; //总电流, 0 A
    int m_gear; //档位, 0
    int m_odo; //总里程, 0 Km
    float m_trip; //单里程, 0.0Km
    uint m_soc; //系统SOC, 0 %
    float m_apVol1; //气压1, 0.00 Mpa
    float m_apVol2; //气压2, 0.00 Mpa
    int m_moter_control_temp; //电机控制器温度, 0 ℃
    int m_moter_temp; //电机温度, 0 ℃

    uint m_main_power; //总电源指示符号片
    QString m_power_supply; //动力模式
    uint m_climbing_mode; //爬坡模式符号片
    uint m_diagnostic_mode; //诊断模式符号片
    uint m_charge_confirm; //充电确认符号片
    int m_fault_level; //故障等级
    int m_fault_code; //故障代码（界面中的系统代码,以10进制显示,代码颜色需随故障等级变化,相见车厂协议文档）
    int m_SPN; //SPN（16进制显示）
    float m_urea_level; //尿素液位, 0.0 %
    int m_dateTime; //时间
    int m_battery; //蓄电池电压
    int m_oil_level;

    /* 报警信息帧,对应WARNING_TYPE */
    uint m_low_water_level_warn; //水位低报警
    uint m_low_ap1_warn; //左气压低报警
    uint m_low_ap2_warn; //右气压低报警
    uint m_water_temp_sensor_warn; //水温传感器报警
    uint m_oil_quantity_sensor_warn; //油量传感器报警
    uint m_oil_pressure_sensor_warn; //机油压力传感器报警
    uint m_bat_voltage_sensor_warn; //电池电压传感器报警
    uint m_ap1_sensor_warn; //气压一传感器报警
    uint m_ap2_sensor_warn; //气压二传感器报警
    uint m_j1939_comm_fault_warn; //J1939通信故障
    uint m_low_oil_pressure_warn; //机油压力低
    uint m_left_brake_shoe_warn; //左刹车蹄片报警
    uint m_right_brake_shoe_warn; //右刹车蹄片报警
    uint m_air_filter_warn; //空滤报警
    uint m_after_treat_warn; //后处理故障
    uint m_water_temp_high_warn; //水温过高报警

    uint m_water_temp_miss;
    uint m_oil_pressure_data_miss;
    uint m_bus_comm_fault;
    uint m_low_oil_warn;

    uint m_status_Flag1_bit1;
    uint m_status_Flag1_bit2;
    uint m_status_Flag1_bit3;
    uint m_status_Flag1_bit4;
    uint m_status_Flag1_bit5;
    uint m_status_Flag1_bit6;
    uint m_status_Flag1_bit7;
    uint m_status_Flag1_bit8;
    uint m_status_Flag2_bit1;
    uint m_status_Flag2_bit2;
    uint m_status_Flag2_bit3;
    uint m_status_Flag2_bit4;
    uint m_status_Flag2_bit5;
    uint m_status_Flag2_bit6;
    uint m_status_Flag2_bit7;
    uint m_status_Flag2_bit8;
    uint m_status_Flag3_bit1;
    uint m_status_Flag3_bit2;
    uint m_status_Flag3_bit3;
    uint m_status_Flag3_bit4;
    uint m_status_Flag3_bit5;

    /* 控制系统信息,对应CONTROL_SYSTEM_INFO_TYPE */
    int m_motor_in_voltage; //电机输入电压, 0 V
    int m_motor_in_current; //电机输入电流, 0 A
    int m_motor_temp; //电机温度, 0 ℃
    int m_motor_controller_temp; //电机控制器温度, 0 ℃
    int m_car_mode; //整车模式, 0
    float m_version; //程序版本, 0.00
    int m_car_Life; //整车控制器Life, 0
    float m_accel_pedal_percent; //加速踏板百分比, 0.0 %
    float m_brake_pedal_percent; //制动踏板百分比, 0.0 %
    int m_din1; //数字量输入1, 00000000（2进制显示）
    int m_din2; //数字量输入2, 00000000（2进制显示）
    int m_din3; //数字量输入3, 00000000（2进制显示）
    int m_dout1; //数字量输出1, 00000000（2进制显示）
    int m_dout2; //数字量输出2, 00000000（2进制显示）
    int m_dout3; //数字量输出3, 00000000（2进制显示）

    /* 发动机系统信息,对应ENGINE_SYSTEM_INFO_TYPE */
    float m_engine_fuel_consumption; //发动机油耗, 0.00 L/H
    int m_engine_water_temp; //发动机水温, 0 ℃
    int m_engine_load; //发动机负荷, 0 %
    float m_engine_target_throttle; //发动机目标油门, 0.0 %
    float m_engine_actual_throttle; //发动机实际油门, 0.0 %
    int m_engine_oil_pressure; //发动机机油压力, Kpa
    int m_engine_inlet_temp; //发动机进气温度, 0 ℃

    /* 辅助系统信息,对应ASSIST_SYSTEM_INFO_TYPE */
    int m_oilpump_dcac_w_output_current; //油泵DC/AC W相输出电流, 0 A
    int m_oilpump_dcac_v_output_current; //油泵DC/AC V相输出电流, 0 A
    int m_oilpump_dcac_u_output_current; //油泵DC/AC U相输出电流, 0 A
    int m_radiator_temp; //散热器温度, 0 ℃

    /* TCU系统信息,对应TCU_SYSTEM_INFO_TYPE */
    int m_actual_clutch_position; //离合实际位置, 0
    int m_TCU_fault_code; //TCU故障信息, 00000000（2进制显示）
    int m_axis_rpm; //变速箱输出轴转速, 0 RPM
    int m_FMI; //FMI, 0
    int m_CM; //CM, 0
    int m_OC; //OC, 0（16进制显示）

    /* 电池管理系统信息,对应BMS_INFO_TYPE */
    float m_bat_max_charge_current; //最大允许充电电流,, 0.0 A
    float m_bat_max_discharge_current; //最大允许放电电流,, 0.0 A
    float m_bat_average_voltage; //单体平均电压, 0.00 V
    int m_bat_status1; //电池状态1, 00000000（2进制显示）
    int m_bat_status2; //电池状态2, 00000000（2进制显示）
    int m_bat_status3; //电池状态3, 00000000（2进制显示）
    int m_irm_ohm_positive; //总正绝缘阻值, 0 KΩ
    int m_irm_ohm_negative; //总负绝缘阻值, 0 KΩ
    float m_bat_max_voltage; //单体最高电压, 0.00 V
    float m_bat_min_voltage; //单体最低电压, 0.00 V
    float m_batteryTH; //单体最高温度, 0.0 ℃

    /* 电池信息,对应BATTERY_INFO_TYPE */
    float m_bat_voltage1; //电池1电压, 0.00 V
    float m_bat_voltage2; //电池2电压, 0.00 V
    float m_bat_voltage3; //电池3电压, 0.00 V
    float m_bat_voltage4; //电池4电压, 0.00 V
    float m_bat_voltage5; //电池5电压, 0.00 V
    float m_bat_voltage6; //电池6电压, 0.00 V
    float m_bat_voltage7; //电池7电压, 0.00 V
    float m_bat_voltage8; //电池8电压, 0.00 V
    float m_bat_voltage9; //电池9电压, 0.00 V
    float m_bat_voltage10; //电池10电压, 0.00 V
    int m_bat_temp1; //电池温度1, 0 ℃
    int m_bat_temp2; //电池温度2, 0 ℃
    int m_bat_temp3; //电池温度3, 0 ℃
    int m_bat_temp4; //电池温度4, 0 ℃
    int m_bat_temp5; //电池温度5, 0 ℃
    int m_bat_temp6; //电池温度6, 0 ℃
    int m_bat_temp7; //电池温度7, 0 ℃
    int m_bat_temp8; //电池温度8, 0 ℃
    int m_bat_temp9; //电池温度9, 0 ℃
    int m_bat_temp10; //电池温度10, 0 ℃

    /* 空调系统信息,对应AC_SYSTEM_INFO_TYPE */
    int m_ac_fault_code; //空调故障代码, 00000000（2进制显示）
    int m_ac_fan_status; //空调风机状态, 00000000（2进制显示）
    int m_ac_work_status; //空调工作状态, 00000000（2进制显示）
    int m_ac_Life; //空调Life, 0
    int m_ac_out_temp; //车外实际温度, 0 ℃
    int m_ac_in_temp; //车内实际温度, 0 ℃
    int m_ac_set_temp; //设定温度, 0 ℃
    int m_ac_refrigere_req; //空调制冷请求, 00000000（2进制显示）

    //告警
    QString m_warning_01 = "";
    QString m_warning_02 = "";
    QString m_warning_03 = "";
    QString m_warning_04 = "";
    QString m_warning_05 = "";
    QString m_warning_06 = "";
    QString m_warning_07 = "";
    QString m_warning_08 = "";
    QString m_warning_09 = "";
    QString m_warning_10 = "";
    QString m_warning_11 = "";
    QString m_warning_12 = "";
    QString m_warning_13 = "";
    QString m_warning_14 = "";
    QString m_warning_15 = "";
    QString m_warning_16 = "";
    QString m_warning_17 = "";
    QString m_warning_18 = "";
    QString m_warning_19 = "";
    QString m_warning_20 = "";
    QString m_warning_21 = "";
    QString m_warning_22 = "";
    QString m_warning_23 = "";
    QString m_warning_24 = "";
    QString m_warning_25 = "";
    QString m_warning_26 = "";
    QString m_warning_27 = "";
    QString m_warning_28 = "";
    QString m_warning_29 = "";
    QString m_warning_30 = "";
    QString m_warning_31 = "";
    QString m_warning_32 = "";
    QString m_warning_33 = "";
    QString m_warning_34 = "";
    QString m_warning_35 = "";
    QString m_warning_36 = "";
    QString m_warning_37 = "";
    QString m_warning_38 = "";
    QString m_warning_39 = "";
    QString m_warning_40 = "";

    //符号片
    uint m_lamp_key_on;
    uint m_lamp_turn_left;
    uint m_lamp_turn_right;
    uint m_lamp_double_flash;
    uint m_lamp_front_fog;
    uint m_lamp_rear_fog;
    uint m_lamp_high_beam;
    uint m_lamp_head_light;
    uint m_lamp_reverse_gear;
    uint m_lamp_gate1;
    uint m_lamp_gate2;
    uint m_lamp_brake;
    uint m_lamp_parking_brake;
    uint m_lamp_left_low_air_pressure;
    uint m_lamp_right_low_air_pressure;
    uint m_lamp_left_shoe_wear;
    uint m_lamp_right_shoe_wear;
    uint m_lamp_defroster;
    uint m_lamp_dryere;
    uint m_lamp_charge_plugin;
    uint m_lamp_charging;
    uint m_lamp_water_temp_high;
    uint m_lamp_water_level_low;
    uint m_lamp_oil_level_low;
    uint m_lamp_engine_fault;
    uint m_lamp_motor_out_of_service;
    uint m_lamp_moter_fire_igon;
    uint m_lamp_air_filter;
    uint m_lamp_asr;
    uint m_lamp_abs;
    uint m_lamp_ac;
    uint m_lamp_high_voltage_maintenance;
    uint m_lamp_rear_door_open;
    uint m_lamp_low_service_wl;
    uint m_lamp_heavy_stop_wl;
    uint m_lamp_serious_stop_wl;
    uint m_lamp_battery_main_contact;
    uint m_lamp_position_light;
    uint m_lamp_oil_pressure_low;
    uint m_lamp_charge_confirm;

    //仪表
    uint m_input_ctrl_01;
    uint m_input_ctrl_02;
    uint m_input_ctrl_03;
    uint m_input_ctrl_04;
    uint m_input_ctrl_05;
    uint m_input_ctrl_06;
    uint m_input_ctrl_07;
    uint m_input_ctrl_08;
    uint m_input_ctrl_09;
    uint m_input_ctrl_10;
    uint m_input_ctrl_11;
    uint m_input_ctrl_12;
    uint m_input_ctrl_13;
    uint m_input_ctrl_14;
    uint m_input_ctrl_15;
    uint m_input_ctrl_16;
    uint m_input_ctrl_17;
    uint m_input_ctrl_18;
    uint m_input_ctrl_19;
    uint m_input_ctrl_20;
    uint m_input_ctrl_21;
    uint m_input_ctrl_22;
    uint m_input_ctrl_23;
    uint m_input_ctrl_24;
    uint m_input_ctrl_25;
    uint m_input_ctrl_26;
    uint m_input_ctrl_27;
    uint m_input_ctrl_28;
    uint m_input_ctrl_29;
    uint m_input_ctrl_30;
    uint m_input_ctrl_31;
    uint m_input_ctrl_32;
    uint m_input_ctrl_33;
    uint m_input_ctrl_34;
    uint m_input_ctrl_35;

    /* 前模块,对应FRONT_MODULE_TYPE */
    float m_front_current01;
    float m_front_current02;
    float m_front_current03;
    float m_front_current04;
    float m_front_current05;
    float m_front_current06;
    float m_front_current07;
    float m_front_current08;
    float m_front_current09;
    float m_front_current10;
    float m_front_current11;
    float m_front_current12;
    float m_front_current13;
    float m_front_current14;
    float m_front_current15;
    uint m_front_switch01;
    uint m_front_switch02;
    uint m_front_switch03;
    uint m_front_switch04;
    uint m_front_switch05;
    uint m_front_switch06;
    uint m_front_switch07;
    uint m_front_switch08;
    uint m_front_switch09;
    uint m_front_switch10;
    uint m_front_switch11;
    uint m_front_switch12;
    uint m_front_switch13;
    uint m_front_switch14;
    uint m_front_switch15;
    uint m_front_switch16;
    uint m_front_switch17;
    uint m_front_switch18;
    uint m_front_switch19;
    uint m_front_switch20;
    uint m_front_switch21;
    uint m_front_switch22;
    uint m_front_switch23;
    uint m_front_switch24;
    uint m_front_switch25;
    uint m_front_switch26;
    uint m_front_switch27;
    uint m_front_switch28;
    uint m_front_switch29;
    uint m_front_switch30;
    uint m_front_switch31;
    uint m_front_switch32;
    uint m_front_switch33;
    uint m_front_switch34;
    uint m_front_switch35;
    uint m_front_switch36;
    uint m_front_switch37;
    uint m_front_switch38;
    uint m_front_switch39;
    uint m_front_switch40;
    uint m_front_switch41;
    uint m_front_switch42;

    /* 中模块,对应MIDDLE_MODULE_TYPE */
    float m_middle_current01;
    float m_middle_current02;
    float m_middle_current03;
    float m_middle_current04;
    float m_middle_current05;
    float m_middle_current06;
    float m_middle_current07;
    float m_middle_current08;
    float m_middle_current09;
    float m_middle_current10;
    float m_middle_current11;
    float m_middle_current12;
    float m_middle_current13;
    float m_middle_current14;
    float m_middle_current15;
    uint m_middle_switch01;
    uint m_middle_switch02;
    uint m_middle_switch03;
    uint m_middle_switch04;
    uint m_middle_switch05;
    uint m_middle_switch06;
    uint m_middle_switch07;
    uint m_middle_switch08;
    uint m_middle_switch09;
    uint m_middle_switch10;
    uint m_middle_switch11;
    uint m_middle_switch12;
    uint m_middle_switch13;
    uint m_middle_switch14;
    uint m_middle_switch15;
    uint m_middle_switch16;
    uint m_middle_switch17;
    uint m_middle_switch18;
    uint m_middle_switch19;
    uint m_middle_switch20;
    uint m_middle_switch21;
    uint m_middle_switch22;
    uint m_middle_switch23;
    uint m_middle_switch24;
    uint m_middle_switch25;
    uint m_middle_switch26;
    uint m_middle_switch27;
    uint m_middle_switch28;
    uint m_middle_switch29;
    uint m_middle_switch30;
    uint m_middle_switch31;
    uint m_middle_switch32;
    uint m_middle_switch33;
    uint m_middle_switch34;
    uint m_middle_switch35;
    uint m_middle_switch36;
    uint m_middle_switch37;
    uint m_middle_switch38;
    uint m_middle_switch39;
    uint m_middle_switch40;
    uint m_middle_switch41;
    uint m_middle_switch42;

    /* 后模块,对应BACK_MODULE_TYPE */
    float m_back_current01;
    float m_back_current02;
    float m_back_current03;
    float m_back_current04;
    float m_back_current05;
    float m_back_current06;
    float m_back_current07;
    float m_back_current08;
    float m_back_current09;
    float m_back_current10;
    float m_back_current11;
    float m_back_current12;
    float m_back_current13;
    float m_back_current14;
    float m_back_current15;
    uint m_back_switch01;
    uint m_back_switch02;
    uint m_back_switch03;
    uint m_back_switch04;
    uint m_back_switch05;
    uint m_back_switch06;
    uint m_back_switch07;
    uint m_back_switch08;
    uint m_back_switch09;
    uint m_back_switch10;
    uint m_back_switch11;
    uint m_back_switch12;
    uint m_back_switch13;
    uint m_back_switch14;
    uint m_back_switch15;
    uint m_back_switch16;
    uint m_back_switch17;
    uint m_back_switch18;
    uint m_back_switch19;
    uint m_back_switch20;
    uint m_back_switch21;
    uint m_back_switch22;
    uint m_back_switch23;
    uint m_back_switch24;
    uint m_back_switch25;
    uint m_back_switch26;
    uint m_back_switch27;
    uint m_back_switch28;
    uint m_back_switch29;
    uint m_back_switch30;
    uint m_back_switch31;
    uint m_back_switch32;
    uint m_back_switch33;
    uint m_back_switch34;
    uint m_back_switch35;
    uint m_back_switch36;
    uint m_back_switch37;
    uint m_back_switch38;
    uint m_back_switch39;
    uint m_back_switch40;
    uint m_back_switch41;
    uint m_back_switch42;

    QString m_versionStr; //版本号,从git获取
};

#endif // CARVIEWMODEL_H

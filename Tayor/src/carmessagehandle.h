#ifndef CARMESSAGEHANDLE_H
#define CARMESSAGEHANDLE_H

#include <QThread>
#include "qnnmsgpubsub.h"
#include "msghandler.h"
#include "common.h"
#include <QTimer>

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

class CarMessageHandle : public QObject
{
    Q_OBJECT
public:
    CarMessageHandle();

    void initialize();
    void parseMessage(QByteArray& recvmsg);
    QByteArray packMessage(const google::protobuf::Message& msg);
    void sendProtoMessageInfo(const google::protobuf::Message& msg);

    void handleProtoAutoFlash(const MessagePtr& msg);
    void handleProtoUpgradeNotify(const MessagePtr& msg);
    void handleProtoKey(const MessagePtr& msg);
    void handleProtoDatetime(const MessagePtr& msg);
    void handleProtoGeneralInfo(const MessagePtr& msg);
    void handleProtoInstrumentFrameInfo(const MessagePtr& msg);
    void handleProtoFontMoudleFrameInfo(const MessagePtr& msg);
    void handleProtoMiddleMoudleFrameInfo(const MessagePtr& msg);
    void handleProtoBackMoudleFrameInfo(const MessagePtr& msg);
    void handleProtoWarningFrameInfo(const MessagePtr& msg);

    void handleProtoControlSystemMenuInfo(const MessagePtr& msg);
    void handleProtoMoterSystemMenuInfo(const MessagePtr& msg);
    void handleProtoAuxiliarySystemMenuInfo(const MessagePtr& msg);
    void handleProtoTcuSystemMenuInfo(const MessagePtr& msg);
    void handleProtoBatteryManageSystemMenuInfo(const MessagePtr& msg);
    void handleProtoBatteryGroupVoltageMenuInfo(const MessagePtr& msg);
    void handleProtoBatteryGroupTemperatureMenuInfo(const MessagePtr& msg);
    void handleProtoAirCtrlSystemMenuInfo(const MessagePtr& msg);

    void handleProtoSymbolLampMiscLampInfo(const MessagePtr& msg);
    void handleProtoSymbolLampCorneringInfo(const MessagePtr& msg);
    void handleProtoSymbolLampLightInfo(const MessagePtr& msg);
    void handleProtoSymbolLampGateInfo(const MessagePtr& msg);
    void handleProtoSymbolLampBrakeInfo(const MessagePtr& msg);
    void handleProtoSymbolLampAirPressureInfo(const MessagePtr& msg);
    void handleProtoSymbolLampShoeWearInfo(const MessagePtr& msg);
    void handleProtoSymbolLampChargingInfo(const MessagePtr& msg);
    void handleProtoSymbolLampWaterInfo(const MessagePtr& msg);
    void handleProtoSymbolLampStopInfo(const MessagePtr& msg);
    void handleProtoSymbolLampMoterInfo(const MessagePtr& msg);
    void handleProtoSymbolLampDynamotorInfo(const MessagePtr& msg);

signals:
    void autoFlashChanged(int);
    void notifyUpgradeStatus(UpgradeMode status, QString msg);

    // 主界面信息
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
    void fault_levelChanged(int);
    void fault_codeChanged(int);
    void SPNChanged(int);
    void oil_levelChanged(int);
    void urea_levelChanged(float);
    void batteryChanged(int);
    void dateTimeChanged(int);
    void power_supplyChanged(QString);
    void climbing_modeChanged(uint);
    void diagnostic_modeChanged(uint);

    //告警信息
    void warning_01Changed(QString);
    void warning_02Changed(QString);
    void warning_03Changed(QString);
    void warning_04Changed(QString);
    void warning_05Changed(QString);
    void warning_06Changed(QString);
    void warning_07Changed(QString);
    void warning_08Changed(QString);
    void warning_09Changed(QString);
    void warning_10Changed(QString);
    void warning_11Changed(QString);
    void warning_12Changed(QString);
    void warning_13Changed(QString);
    void warning_14Changed(QString);
    void warning_15Changed(QString);
    void warning_16Changed(QString);
    void warning_17Changed(QString);
    void warning_18Changed(QString);
    void warning_19Changed(QString);
    void warning_20Changed(QString);
    void warning_21Changed(QString);
    void warning_22Changed(QString);
    void warning_23Changed(QString);
    void warning_24Changed(QString);
    void warning_25Changed(QString);
    void warning_26Changed(QString);
    void warning_27Changed(QString);
    void warning_28Changed(QString);
    void warning_29Changed(QString);
    void warning_30Changed(QString);
    void warning_31Changed(QString);
    void warning_32Changed(QString);
    void warning_33Changed(QString);
    void warning_34Changed(QString);
    void warning_35Changed(QString);
    void warning_36Changed(QString);
    void warning_37Changed(QString);
    void warning_38Changed(QString);
    void warning_39Changed(QString);
    void warning_40Changed(QString);

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

    //仪表信息
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

    // 控制系统信息
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

    // 发动机系统信息
    void engine_fuel_consumptionChanged(float);
    void engine_water_tempChanged(int);
    void engine_loadChanged(int);
    void engine_target_throttleChanged(float);
    void engine_actual_throttleChanged(float);
    void engine_oil_pressureChanged(int);
    void engine_inlet_tempChanged(int);

    // 辅助系统信息
    void oilpump_dcac_w_output_currentChanged(int);
    void oilpump_dcac_v_output_currentChanged(int);
    void oilpump_dcac_u_output_currentChanged(int);
    void radiator_tempChanged(int);

    // TCU系统信息
    void actual_clutch_positionChanged(int);
    void TCU_fault_codeChanged(int);
    void axis_rpmChanged(int);
    void FMIChanged(int);
    void CMChanged(int);
    void OCChanged(int);

    // 电池管理系统信息
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

    // 电池状态信息
    void bat_voltageChanged(int, float);
    void bat_tempChanged(int, int);

    // 空调系统信息
    void ac_fault_codeChanged(int);
    void ac_fan_statusChanged(int);
    void ac_work_statusChanged(int);
    void ac_LifeChanged(int);
    void ac_out_tempChanged(int);
    void ac_in_tempChanged(int);
    void ac_set_tempChanged(int);
    void ac_refrigere_reqChanged(int);

private slots:
    void onReadyRead();

public slots:
    void menuInfoRequest(qint64 MenuNo, qint64 pageNo = 0);
    void datetimeInfoRequest(qint64 msec = 0);
    void onNotifyEnableKey(bool flag=true);
    void onSetFb1Alpha(); //将Fb1Alpha 设置为不透明
    void notifyUpgradeStart();
    void tripMilesClear();

private:
    PubSocket *pubsock;
    SubSocket *subsock;
    MsgHandler handler;
    bool bEnableKeyPress;
};

#endif // CARMESSAGEHANDLE_H

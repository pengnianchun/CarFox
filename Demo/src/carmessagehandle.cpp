#include "carmessagehandle.h"
#include "keymanager.h"
#include "fbhelper.h"

CarMessageHandle::CarMessageHandle()
{
    // init message handler
    initialize();
    bEnableKeyPress = false;

    // init publish socket
    pubsock = new PubSocket();
    pubsock->bind("tcp://*:5556");

    // init subscribe socket
    subsock = new SubSocket();

    // subscribe message
    subsock->subscribeFilter("");

    subsock->connectToAddress("tcp://127.0.0.1:5555");
    connect(subsock, SIGNAL(readyRead()), this, SLOT(onReadyRead()));

}

void CarMessageHandle::parseMessage(QByteArray& recvmsg) {
    handler.parseMessage(recvmsg);
}

QByteArray CarMessageHandle::packMessage(const google::protobuf::Message& msg) {
    return handler.packMessage(msg);
}

void CarMessageHandle::onReadyRead() {
    QByteArray recvData = subsock->read();
    //qDebug() << " --- Recv: " << recvData.toHex();
    handler.parseMessage(recvData);
}

void CarMessageHandle::sendProtoMessageInfo(const google::protobuf::Message& msg) {
    QByteArray packedData;
    packedData = handler.packMessage(msg);
    pubsock->write(packedData);
    //qDebug() << " --- send success !!!";
}

void CarMessageHandle::menuInfoRequest(qint64 MenuNo, qint64 pageNo) {
    Q_PRINT(" --- request menu no : " << MenuNo);
    fyMenuIdRequestInfo::MenuIdRequest menuInfo;
    fyMenuIdRequestInfo::MenuIdRequest_MenuType type = (fyMenuIdRequestInfo::MenuIdRequest_MenuType)MenuNo;
    menuInfo.set_menu_number(type);
    menuInfo.set_page_number(pageNo);
    sendProtoMessageInfo(menuInfo);
}

void CarMessageHandle::datetimeInfoRequest(qint64 msec) {
    Q_PRINT(" --- request time msec : " << msec);
    fySystemSettingsInfo::DateTime timeInfo;
    timeInfo.set_date_time(msec);
    sendProtoMessageInfo(timeInfo);
}

void CarMessageHandle::notifyUpgradeStart() {
    Q_PRINT(" --- request upgrade version !!!" );
    fySystemSettingsInfo::UpgradeSettings upgrade;
    upgrade.set_msg_id(fySystemSettingsInfo::UpgradeSettings::UPDATE_NOTIFY);
    sendProtoMessageInfo(upgrade);
}

void CarMessageHandle::tripMilesClear() {
    Q_PRINT(" --- request clear trip !!! " );
    fySystemSettingsInfo::MilesClearSettings tripClear;
    tripClear.set_trip_miles_clear(true);
    sendProtoMessageInfo(tripClear);
}

void CarMessageHandle::onNotifyEnableKey(bool flag) {
    bEnableKeyPress = flag;
}

void CarMessageHandle::onSetFb1Alpha()
{
    static int onlyOne = 0;
    if (onlyOne == 0) {
        FbHelper::getInstance()->setFb1Alpha(0xff);
        qWarning("=============set fb 0xff");
        onlyOne = 1;
    }
}

//初始化注册
void CarMessageHandle::initialize() {
    handler.registerMsgCallback(fyKeyEvent::KeyFrame::descriptor(), bind(&CarMessageHandle::handleProtoKey, this, _1));
    handler.registerMsgCallback(fySystemSettingsInfo::DateTime::descriptor(), bind(&CarMessageHandle::handleProtoDatetime, this, _1));
    handler.registerMsgCallback(fySystemSettingsInfo::UpgradeSettings::descriptor(), bind(&CarMessageHandle::handleProtoUpgradeNotify, this, _1));
    handler.registerMsgCallback(fySystemSettingsInfo::AnimationFlash::descriptor(), bind(&CarMessageHandle::handleProtoAutoFlash, this, _1));
    handler.registerMsgCallback(fyGeneralInfo::GeneralFrame::descriptor(), bind(&CarMessageHandle::handleProtoGeneralInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::InstrumentFrame::descriptor(), bind(&CarMessageHandle::handleProtoInstrumentFrameInfo, this, _1));
    handler.registerMsgCallback(fyModuleFrontInfo::ModuleFrontFrame::descriptor(), bind(&CarMessageHandle::handleProtoFontMoudleFrameInfo, this, _1));
    handler.registerMsgCallback(fyModuleMiddleInfo::ModuleMiddleFrame::descriptor(), bind(&CarMessageHandle::handleProtoMiddleMoudleFrameInfo, this, _1));
    handler.registerMsgCallback(fyModuleBackInfo::ModuleBackFrame::descriptor(), bind(&CarMessageHandle::handleProtoBackMoudleFrameInfo, this, _1));
    handler.registerMsgCallback(fyWarningInfo::WarningFrame::descriptor(), bind(&CarMessageHandle::handleProtoWarningFrameInfo, this, _1));

    handler.registerMsgCallback(fyControlSystemInfo::ControlSystemMenu::descriptor(), bind(&CarMessageHandle::handleProtoControlSystemMenuInfo, this, _1));
    handler.registerMsgCallback(fyMoterSystemInfo::MoterSystemMenu::descriptor(), bind(&CarMessageHandle::handleProtoMoterSystemMenuInfo, this, _1));
    handler.registerMsgCallback(fyAuxiliarySystemInfo::AuxiliarySystemMenu::descriptor(), bind(&CarMessageHandle::handleProtoAuxiliarySystemMenuInfo, this, _1));
    handler.registerMsgCallback(fyTcuSystemInfo::TcuSystemMenu::descriptor(), bind(&CarMessageHandle::handleProtoTcuSystemMenuInfo, this, _1));
    handler.registerMsgCallback(fyBatteryManageSystemInfo::BatteryManageSystemMenu::descriptor(), bind(&CarMessageHandle::handleProtoBatteryManageSystemMenuInfo, this, _1));
    handler.registerMsgCallback(fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu::descriptor(), bind(&CarMessageHandle::handleProtoBatteryGroupVoltageMenuInfo, this, _1));
    handler.registerMsgCallback(fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu::descriptor(), bind(&CarMessageHandle::handleProtoBatteryGroupTemperatureMenuInfo, this, _1));
    handler.registerMsgCallback(fyAirCtrlSystemInfo::AirCtrlSystemMenu::descriptor(), bind(&CarMessageHandle::handleProtoAirCtrlSystemMenuInfo, this, _1));

    handler.registerMsgCallback(fyInstrumentInfo::MiscLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampMiscLampInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::CorneringLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampCorneringInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::LightLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampLightInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::GateLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampGateInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::BrakeLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampBrakeInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::AirPressureLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampAirPressureInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::ShoeLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampShoeWearInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::ChargingLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampChargingInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::WaterLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampWaterInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::StopLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampStopInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::MoterLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampMoterInfo, this, _1));
    handler.registerMsgCallback(fyInstrumentInfo::DynamotorLampFrame::descriptor(), bind(&CarMessageHandle::handleProtoSymbolLampDynamotorInfo, this, _1));

}

//启动界面通知
void CarMessageHandle::handleProtoAutoFlash(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fySystemSettingsInfo::AnimationFlash> p = down_pointer_cast<fySystemSettingsInfo::AnimationFlash>(msg);

    Q_PRINT(" --- auto_flash value = "<< p->auto_flash() );

    qint64 tempIntValue = 0;
    tempIntValue = p->auto_flash();
    if (tempIntValue == 1) {
        qWarning("=============handleProtoAutoFlash======");

    }

    ValueChangeOnlyNotify(autoFlash, tempIntValue);
}

void CarMessageHandle::handleProtoUpgradeNotify(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fySystemSettingsInfo::UpgradeSettings> p = down_pointer_cast<fySystemSettingsInfo::UpgradeSettings>(msg);

    Q_PRINT(" --- upgrade msg_id      = "<< p->msg_id() );
    Q_PRINT(" --- upgrade msg_content = "<< p->msg_content() );

    UpgradeMode state = (UpgradeMode)p->msg_id();
    QString msgValue = QString::fromStdString(p->msg_content());
    emit notifyUpgradeStatus(state, msgValue);
}

//接收按键消息
void CarMessageHandle::handleProtoKey(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyKeyEvent::KeyFrame> p = down_pointer_cast<fyKeyEvent::KeyFrame>(msg);

    Q_PRINT(" --- key1 value = "<< p->key1() );
    Q_PRINT(" --- key2 value = "<< p->key2() );
    Q_PRINT(" --- key3 value = "<< p->key3() );
    Q_PRINT(" --- key4 value = "<< p->key4() );

    if(bEnableKeyPress) {
        KeyManager::instance()->detectKeyEvent(p->key1(), KeyManager::EnterKey);
        KeyManager::instance()->detectKeyEvent(p->key2(), KeyManager::BackKey);
        KeyManager::instance()->detectKeyEvent(p->key3(), KeyManager::PrevKey);
        KeyManager::instance()->detectKeyEvent(p->key4(), KeyManager::NextKey);
    }
}

//接收时间消息
void CarMessageHandle::handleProtoDatetime(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fySystemSettingsInfo::DateTime> p = down_pointer_cast<fySystemSettingsInfo::DateTime>(msg);

    Q_PRINT(" --- dateTime value = "<< p->date_time() );

    qint64 tempIntValue = 0;
    tempIntValue = p->date_time();
    ValueChangeOnlyNotify(dateTime, tempIntValue);
}

//接收通用消息
void CarMessageHandle::handleProtoGeneralInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyGeneralInfo::GeneralFrame> p = down_pointer_cast<fyGeneralInfo::GeneralFrame>(msg);

    Q_PRINT(" --- totalcurrent value = "<< p->total_current());
    Q_PRINT(" --- totalvoltage value = "<< p->total_voltage());
    Q_PRINT(" --- rpm value = "<< p->rpm());
    Q_PRINT(" --- speed value = "<< p->speed());
    Q_PRINT(" --- gear value = "<< p->gear());
    Q_PRINT(" --- odo value = "<< p->odo());
    Q_PRINT(" --- trip value = "<< p->trip());
    Q_PRINT(" --- soc value = "<< p->soc());
    Q_PRINT(" --- airPress1 value = "<< p->air_press1());
    Q_PRINT(" --- airPress2 value = "<< p->air_press2());
    Q_PRINT(" --- moterControlTemperature value = "<< p->moter_control_temperature());
    Q_PRINT(" --- moterTemperature value = "<< p->moter_temperature());
    Q_PRINT(" --- battery value = "<< p->battery());
    Q_PRINT(" --- spn value = "<< p->spn());
    Q_PRINT(" --- engineWaterTemp value = "<< p->engine_water_temp());
    Q_PRINT(" --- ureaLevel value = "<< p->urea_level());
    Q_PRINT(" --- faultLevel value = "<< p->fault_level());
    Q_PRINT(" --- faultCode value = "<< p->fault_code());

    qint64 tempIntValue = 0;
    float tempFloatValue = 0;

    tempIntValue = p->speed();
    ValueChangeOnlyNotify(speed, tempIntValue);

    tempIntValue = p->rpm();
    ValueChangeOnlyNotify(rpm, tempIntValue);

    tempIntValue = p->total_voltage();
    ValueChangeOnlyNotify(totalVoltage, tempIntValue);

    tempIntValue = p->total_current();
    ValueChangeOnlyNotify(totalCurrent, tempIntValue);

    tempIntValue = p->gear();
    ValueChangeOnlyNotify(gear, tempIntValue);

    tempIntValue = p->odo();
    ValueChangeOnlyNotify(odo, tempIntValue);

    tempFloatValue = p->trip();
    ValueChangeOnlyNotify(trip, tempFloatValue);

    tempIntValue = p->soc();
    ValueChangeOnlyNotify(soc, tempIntValue);

    tempFloatValue = p->air_press1();
    ValueChangeOnlyNotify(apVol1, tempFloatValue);

    tempFloatValue = p->air_press2();
    ValueChangeOnlyNotify(apVol2, tempFloatValue);

    tempIntValue = p->moter_control_temperature();
    ValueChangeOnlyNotify(moter_control_temp, tempIntValue);

    tempIntValue = p->moter_temperature();
    ValueChangeOnlyNotify(moter_temp, tempIntValue);

    tempIntValue = p->fault_level();
    ValueChangeOnlyNotify(fault_level, tempIntValue);

    tempIntValue = p->fault_code();
    ValueChangeOnlyNotify(fault_code, tempIntValue);

    tempIntValue = p->spn();
    ValueChangeOnlyNotify(SPN, tempIntValue);

    tempIntValue = p->engine_water_temp();
    ValueChangeOnlyNotify(engine_water_temp, tempIntValue);

    tempIntValue = p->urea_level();
    ValueChangeOnlyNotify(urea_level, tempIntValue);

    tempIntValue = p->battery();
    ValueChangeOnlyNotify(battery, tempIntValue);

    tempIntValue = p->oil_level();
    ValueChangeOnlyNotify(oil_level, tempIntValue);

    tempIntValue = p->engine_oil_pressure();
    ValueChangeOnlyNotify(engine_oil_pressure, tempIntValue);
}

//接收符号片状态
void CarMessageHandle::handleProtoSymbolLampMiscLampInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::MiscLampFrame> p = down_pointer_cast<fyInstrumentInfo::MiscLampFrame>(msg);

    qint64 tempIntValue = 0;
    QString tempStringValue = "";

    if(p->has_lamp_key_on()) {
        tempIntValue = p->lamp_key_on();
        ValueChangeOnlyNotify(lamp_key_on, tempIntValue);
        Q_PRINT(" --- lamp_key_on value                   = "<< p->lamp_key_on());
    }

    if(p->has_lamp_air_filter()) {
        tempIntValue = p->lamp_air_filter();
        ValueChangeOnlyNotify(lamp_air_filter, tempIntValue);
        Q_PRINT(" --- lamp_air_filter value               = "<< p->lamp_air_filter());
    }

    if(p->has_lamp_asr()) {
        tempIntValue = p->lamp_asr();
        ValueChangeOnlyNotify(lamp_asr, tempIntValue);
        Q_PRINT(" --- lamp_asr value                      = "<< p->lamp_asr());
    }

    if(p->has_lamp_high_voltage_maintenance()) {
        tempIntValue = p->lamp_high_voltage_maintenance();
        ValueChangeOnlyNotify(lamp_high_voltage_maintenance, tempIntValue);
        Q_PRINT(" --- lamp_high_voltage_maintenance value = "<< p->lamp_high_voltage_maintenance());
    }

    if(p->has_lamp_defroster()) {
        tempIntValue = p->lamp_defroster();
        ValueChangeOnlyNotify(lamp_defroster, tempIntValue);
        Q_PRINT(" --- lamp_defroster value                = "<< p->lamp_defroster());
    }

    if(p->has_lamp_dryere()) {
        tempIntValue = p->lamp_dryere();
        ValueChangeOnlyNotify(lamp_dryere, tempIntValue);
        Q_PRINT(" --- lamp_dryere value                   = "<< p->lamp_dryere());
    }

    if(p->has_lamp_abs()) {
        tempIntValue = p->lamp_abs();
        ValueChangeOnlyNotify(lamp_abs, tempIntValue);
        Q_PRINT(" --- lamp_abs value                      = "<< p->lamp_abs());
    }

    if(p->has_lamp_ac()) {
        tempIntValue = p->lamp_ac();
        ValueChangeOnlyNotify(lamp_ac, tempIntValue);
        Q_PRINT(" --- lamp_ac value                       = "<< p->lamp_ac());
    }

    if(p->has_power_supply()) {
        tempStringValue = QString::fromStdString(p->power_supply());
        ValueChangeOnlyNotify(power_supply, tempStringValue);
        Q_PRINT(" --- power_supply value                  = "<< p->power_supply());
    }

    if(p->has_climbing_mode()) {
        tempIntValue = p->climbing_mode();
        ValueChangeOnlyNotify(climbing_mode, tempIntValue);
        Q_PRINT(" --- climbing_mode value                 = "<< p->climbing_mode());
    }

    if(p->has_diagnostic_mode()) {
        tempIntValue = p->diagnostic_mode();
        ValueChangeOnlyNotify(diagnostic_mode, tempIntValue);
        Q_PRINT(" --- diagnostic_mode value               = "<< p->diagnostic_mode());
    }
}

void CarMessageHandle::handleProtoSymbolLampCorneringInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::CorneringLampFrame> p = down_pointer_cast<fyInstrumentInfo::CorneringLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_turn_left()) {
        tempIntValue = p->lamp_turn_left();
        ValueChangeOnlyNotify(lamp_turn_left, tempIntValue);
        Q_PRINT(" --- lamp_turn_left  value               = "<< p->lamp_turn_left());
    }

    if(p->has_lamp_turn_right()) {
        tempIntValue = p->lamp_turn_right();
        ValueChangeOnlyNotify(lamp_turn_right, tempIntValue);
        Q_PRINT(" --- lamp_turn_right value               = "<< p->lamp_turn_right());
    }
}

void CarMessageHandle::handleProtoSymbolLampLightInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::LightLampFrame> p = down_pointer_cast<fyInstrumentInfo::LightLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_double_flash()) {
        tempIntValue = p->lamp_double_flash();
        ValueChangeOnlyNotify(lamp_double_flash, tempIntValue);
        Q_PRINT(" --- lamp_double_flash value             = "<< p->lamp_double_flash());
    }

    if(p->has_lamp_front_fog()) {
        tempIntValue = p->lamp_front_fog();
        ValueChangeOnlyNotify(lamp_front_fog, tempIntValue);
        Q_PRINT(" --- lamp_front_fog value                = "<< p->lamp_front_fog());
    }

    if(p->has_lamp_rear_fog()) {
        tempIntValue = p->lamp_rear_fog();
        ValueChangeOnlyNotify(lamp_rear_fog, tempIntValue);
        Q_PRINT(" --- lamp_rear_fog value                 = "<< p->lamp_rear_fog());
    }

    if(p->has_lamp_high_beam()) {
        tempIntValue = p->lamp_high_beam();
        ValueChangeOnlyNotify(lamp_high_beam, tempIntValue);
        Q_PRINT(" --- lamp_high_beam value                = "<< p->lamp_high_beam());
    }

    if(p->has_lamp_head_light()) {
        tempIntValue = p->lamp_head_light();
        ValueChangeOnlyNotify(lamp_head_light, tempIntValue);
        Q_PRINT(" --- lamp_head_light value               = "<< p->lamp_head_light());
    }

    if(p->has_lamp_reverse_gear()) {
        tempIntValue = p->lamp_reverse_gear();
        ValueChangeOnlyNotify(lamp_reverse_gear, tempIntValue);
        Q_PRINT(" --- lamp_reverse_gear value             = "<< p->lamp_reverse_gear());
    }

    if(p->has_lamp_position_light()) {
        tempIntValue = p->lamp_position_light();
        ValueChangeOnlyNotify(lamp_position_light, tempIntValue);
        Q_PRINT(" --- lamp_position_light value           = "<< p->lamp_position_light());
    }
}

void CarMessageHandle::handleProtoSymbolLampGateInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::GateLampFrame> p = down_pointer_cast<fyInstrumentInfo::GateLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_gate1()) {
        tempIntValue = p->lamp_gate1();
        ValueChangeOnlyNotify(lamp_gate1, tempIntValue);
        Q_PRINT(" --- lamp_gate1 value                    = "<< p->lamp_gate1());
    }

    if(p->has_lamp_gate2()) {
        tempIntValue = p->lamp_gate2();
        ValueChangeOnlyNotify(lamp_gate2, tempIntValue);
        Q_PRINT(" --- lamp_gate2 value                    = "<< p->lamp_gate2());
    }

    if(p->has_lamp_rear_door_open()) {
        tempIntValue = p->lamp_rear_door_open();
        ValueChangeOnlyNotify(lamp_rear_door_open, tempIntValue);
        Q_PRINT(" --- lamp_rear_door_open value           = "<< p->lamp_rear_door_open());
    }
}

void CarMessageHandle::handleProtoSymbolLampBrakeInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::BrakeLampFrame> p = down_pointer_cast<fyInstrumentInfo::BrakeLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_brake()) {
        tempIntValue = p->lamp_brake();
        ValueChangeOnlyNotify(lamp_brake, tempIntValue);
        Q_PRINT(" --- lamp_brake value                    = "<< p->lamp_brake());
    }

    if(p->has_lamp_parking_brake()) {
        tempIntValue = p->lamp_parking_brake();
        ValueChangeOnlyNotify(lamp_parking_brake, tempIntValue);
        Q_PRINT(" --- lamp_parking_brake value            = "<< p->lamp_parking_brake());
    }
}

void CarMessageHandle::handleProtoSymbolLampAirPressureInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::AirPressureLampFrame> p = down_pointer_cast<fyInstrumentInfo::AirPressureLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_left_low_air_pressure()) {
        tempIntValue = p->lamp_left_low_air_pressure();
        ValueChangeOnlyNotify(lamp_left_low_air_pressure, tempIntValue);
        Q_PRINT(" --- lamp_left_low_air_pressure value    = "<< p->lamp_left_low_air_pressure());
    }

    if(p->has_lamp_right_low_air_pressure()) {
        tempIntValue = p->lamp_right_low_air_pressure();
        ValueChangeOnlyNotify(lamp_right_low_air_pressure, tempIntValue);
        Q_PRINT(" --- lamp_right_low_air_pressure value   = "<< p->lamp_right_low_air_pressure());
    }
}

void CarMessageHandle::handleProtoSymbolLampShoeWearInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::ShoeLampFrame> p = down_pointer_cast<fyInstrumentInfo::ShoeLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_left_shoe_wear()) {
        tempIntValue = p->lamp_left_shoe_wear();
        ValueChangeOnlyNotify(lamp_left_shoe_wear, tempIntValue);
        Q_PRINT(" --- lamp_left_shoe_wear value           = "<< p->lamp_left_shoe_wear());
    }

    if(p->has_lamp_right_shoe_wear()) {
        tempIntValue = p->lamp_right_shoe_wear();
        ValueChangeOnlyNotify(lamp_right_shoe_wear, tempIntValue);
        Q_PRINT(" --- lamp_right_shoe_wear value          = "<< p->lamp_right_shoe_wear());
    }
}

void CarMessageHandle::handleProtoSymbolLampChargingInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::ChargingLampFrame> p = down_pointer_cast<fyInstrumentInfo::ChargingLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_charge_confirm()) {
        tempIntValue = p->lamp_charge_confirm();
        ValueChangeOnlyNotify(lamp_charge_confirm, tempIntValue);
        Q_PRINT(" --- lamp_charge_confirm value       = "<< p->lamp_charge_confirm());
    }

    if(p->has_lamp_battery_main_contact()) {
        tempIntValue = p->lamp_battery_main_contact();
        ValueChangeOnlyNotify(lamp_battery_main_contact, tempIntValue);
        Q_PRINT(" --- lamp_battery_main_contact value = "<< p->lamp_battery_main_contact());
    }
}

void CarMessageHandle::handleProtoSymbolLampWaterInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::WaterLampFrame> p = down_pointer_cast<fyInstrumentInfo::WaterLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_water_temp_high()) {
        tempIntValue = p->lamp_water_temp_high();
        ValueChangeOnlyNotify(lamp_water_temp_high, tempIntValue);
        Q_PRINT(" --- lamp_water_temp_high value          = "<< p->lamp_water_temp_high());
    }

    if(p->has_lamp_water_level_low()) {
        tempIntValue = p->lamp_water_level_low();
        ValueChangeOnlyNotify(lamp_water_level_low, tempIntValue);
        Q_PRINT(" --- lamp_water_level_low value          = "<< p->lamp_water_level_low());
    }
}

void CarMessageHandle::handleProtoSymbolLampStopInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::StopLampFrame> p = down_pointer_cast<fyInstrumentInfo::StopLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_low_service_wl()) {
        tempIntValue = p->lamp_low_service_wl();
        ValueChangeOnlyNotify(lamp_low_service_wl, tempIntValue);
        Q_PRINT(" --- lamp_low_service_wl value           = "<< p->lamp_low_service_wl());
    }

    if(p->has_lamp_heavy_stop_wl()) {
        tempIntValue = p->lamp_heavy_stop_wl();
        ValueChangeOnlyNotify(lamp_heavy_stop_wl, tempIntValue);
        Q_PRINT(" --- lamp_heavy_stop_wl value            = "<< p->lamp_heavy_stop_wl());
    }

    if(p->has_lamp_serious_stop_wl()) {
        tempIntValue = p->lamp_serious_stop_wl();
        ValueChangeOnlyNotify(lamp_serious_stop_wl, tempIntValue);
        Q_PRINT(" --- lamp_serious_stop_wl value          = "<< p->lamp_serious_stop_wl());
    }
}

void CarMessageHandle::handleProtoSymbolLampMoterInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::MoterLampFrame> p = down_pointer_cast<fyInstrumentInfo::MoterLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_oil_level_low()) {
        tempIntValue = p->lamp_oil_level_low();
        ValueChangeOnlyNotify(lamp_oil_level_low, tempIntValue);
        Q_PRINT(" --- lamp_oil_level_low value            = "<< p->lamp_oil_level_low());
    }

    if(p->has_lamp_engine_fault()) {
        tempIntValue = p->lamp_engine_fault();
        ValueChangeOnlyNotify(lamp_engine_fault, tempIntValue);
        Q_PRINT(" --- lamp_engine_fault value             = "<< p->lamp_engine_fault());
    }

    if(p->has_lamp_oil_pressure_low()) {
        tempIntValue = p->lamp_oil_pressure_low();
        ValueChangeOnlyNotify(lamp_oil_pressure_low, tempIntValue);
        Q_PRINT(" --- lamp_oil_pressure_low value         = "<< p->lamp_oil_pressure_low());
    }
}

void CarMessageHandle::handleProtoSymbolLampDynamotorInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::DynamotorLampFrame> p = down_pointer_cast<fyInstrumentInfo::DynamotorLampFrame>(msg);

    qint64 tempIntValue = 0;

    if(p->has_lamp_motor_out_of_service()) {
        tempIntValue = p->lamp_motor_out_of_service();
        ValueChangeOnlyNotify(lamp_motor_out_of_service, tempIntValue);
        Q_PRINT(" --- lamp_motor_out_of_service value     = "<< p->lamp_motor_out_of_service());
    }

    if(p->has_lamp_moter_fire_igon()) {
        tempIntValue = p->lamp_moter_fire_igon();
        ValueChangeOnlyNotify(lamp_moter_fire_igon, tempIntValue);
        Q_PRINT(" --- lamp_moter_fire_igon value          = "<< p->lamp_moter_fire_igon());
    }
}

//接收仪表系统消息
void CarMessageHandle::handleProtoInstrumentFrameInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyInstrumentInfo::InstrumentFrame> p = down_pointer_cast<fyInstrumentInfo::InstrumentFrame>(msg);
    qint64 tempIntValue = 0;
    tempIntValue = p->input_ctrl_01();
    ValueChangeOnlyNotify(input_ctrl_01, tempIntValue);
    tempIntValue = p->input_ctrl_02();
    ValueChangeOnlyNotify(input_ctrl_02, tempIntValue);
    tempIntValue = p->input_ctrl_03();
    ValueChangeOnlyNotify(input_ctrl_03, tempIntValue);
    tempIntValue = p->input_ctrl_04();
    ValueChangeOnlyNotify(input_ctrl_04, tempIntValue);
    tempIntValue = p->input_ctrl_05();
    ValueChangeOnlyNotify(input_ctrl_05, tempIntValue);
    tempIntValue = p->input_ctrl_06();
    ValueChangeOnlyNotify(input_ctrl_06, tempIntValue);
    tempIntValue = p->input_ctrl_07();
    ValueChangeOnlyNotify(input_ctrl_07, tempIntValue);
    tempIntValue = p->input_ctrl_08();
    ValueChangeOnlyNotify(input_ctrl_08, tempIntValue);
    tempIntValue = p->input_ctrl_09();
    ValueChangeOnlyNotify(input_ctrl_09, tempIntValue);
    tempIntValue = p->input_ctrl_10();
    ValueChangeOnlyNotify(input_ctrl_10, tempIntValue);
    tempIntValue = p->input_ctrl_11();
    ValueChangeOnlyNotify(input_ctrl_11, tempIntValue);
    tempIntValue = p->input_ctrl_12();
    ValueChangeOnlyNotify(input_ctrl_12, tempIntValue);
    tempIntValue = p->input_ctrl_13();
    ValueChangeOnlyNotify(input_ctrl_13, tempIntValue);
    tempIntValue = p->input_ctrl_14();
    ValueChangeOnlyNotify(input_ctrl_14, tempIntValue);
    tempIntValue = p->input_ctrl_15();
    ValueChangeOnlyNotify(input_ctrl_15, tempIntValue);
    tempIntValue = p->input_ctrl_16();
    ValueChangeOnlyNotify(input_ctrl_16, tempIntValue);
    tempIntValue = p->input_ctrl_17();
    ValueChangeOnlyNotify(input_ctrl_17, tempIntValue);
    tempIntValue = p->input_ctrl_18();
    ValueChangeOnlyNotify(input_ctrl_18, tempIntValue);
    tempIntValue = p->input_ctrl_19();
    ValueChangeOnlyNotify(input_ctrl_19, tempIntValue);
    tempIntValue = p->input_ctrl_20();
    ValueChangeOnlyNotify(input_ctrl_20, tempIntValue);
    tempIntValue = p->input_ctrl_21();
    ValueChangeOnlyNotify(input_ctrl_21, tempIntValue);
    tempIntValue = p->input_ctrl_22();
    ValueChangeOnlyNotify(input_ctrl_22, tempIntValue);
    tempIntValue = p->input_ctrl_23();
    ValueChangeOnlyNotify(input_ctrl_23, tempIntValue);
    tempIntValue = p->input_ctrl_24();
    ValueChangeOnlyNotify(input_ctrl_24, tempIntValue);
    tempIntValue = p->input_ctrl_25();
    ValueChangeOnlyNotify(input_ctrl_25, tempIntValue);
    tempIntValue = p->input_ctrl_26();
    ValueChangeOnlyNotify(input_ctrl_26, tempIntValue);
    tempIntValue = p->input_ctrl_27();
    ValueChangeOnlyNotify(input_ctrl_27, tempIntValue);
    tempIntValue = p->input_ctrl_28();
    ValueChangeOnlyNotify(input_ctrl_28, tempIntValue);
    tempIntValue = p->input_ctrl_29();
    ValueChangeOnlyNotify(input_ctrl_29, tempIntValue);
    tempIntValue = p->input_ctrl_30();
    ValueChangeOnlyNotify(input_ctrl_30, tempIntValue);
    tempIntValue = p->input_ctrl_31();
    ValueChangeOnlyNotify(input_ctrl_31, tempIntValue);
    tempIntValue = p->input_ctrl_32();
    ValueChangeOnlyNotify(input_ctrl_32, tempIntValue);
    tempIntValue = p->input_ctrl_33();
    ValueChangeOnlyNotify(input_ctrl_33, tempIntValue);
    tempIntValue = p->input_ctrl_34();
    ValueChangeOnlyNotify(input_ctrl_34, tempIntValue);
    tempIntValue = p->input_ctrl_35();
    ValueChangeOnlyNotify(input_ctrl_35, tempIntValue);

    Q_PRINT(" --- input_ctrl_01  value = "<< p->input_ctrl_01());
    Q_PRINT(" --- input_ctrl_02  value = "<< p->input_ctrl_02());
    Q_PRINT(" --- input_ctrl_03  value = "<< p->input_ctrl_03());
    Q_PRINT(" --- input_ctrl_04  value = "<< p->input_ctrl_04());
    Q_PRINT(" --- input_ctrl_05  value = "<< p->input_ctrl_05());
    Q_PRINT(" --- input_ctrl_06  value = "<< p->input_ctrl_06());
    Q_PRINT(" --- input_ctrl_07  value = "<< p->input_ctrl_07());
    Q_PRINT(" --- input_ctrl_08  value = "<< p->input_ctrl_08());
    Q_PRINT(" --- input_ctrl_09  value = "<< p->input_ctrl_09());
    Q_PRINT(" --- input_ctrl_10  value = "<< p->input_ctrl_10());
    Q_PRINT(" --- input_ctrl_11  value = "<< p->input_ctrl_11());
    Q_PRINT(" --- input_ctrl_12  value = "<< p->input_ctrl_12());
    Q_PRINT(" --- input_ctrl_13  value = "<< p->input_ctrl_13());
    Q_PRINT(" --- input_ctrl_14  value = "<< p->input_ctrl_14());
    Q_PRINT(" --- input_ctrl_15  value = "<< p->input_ctrl_15());
    Q_PRINT(" --- input_ctrl_16  value = "<< p->input_ctrl_16());
    Q_PRINT(" --- input_ctrl_17  value = "<< p->input_ctrl_17());
    Q_PRINT(" --- input_ctrl_18  value = "<< p->input_ctrl_18());
    Q_PRINT(" --- input_ctrl_19  value = "<< p->input_ctrl_19());
    Q_PRINT(" --- input_ctrl_20  value = "<< p->input_ctrl_20());
    Q_PRINT(" --- input_ctrl_21  value = "<< p->input_ctrl_21());
    Q_PRINT(" --- input_ctrl_22  value = "<< p->input_ctrl_22());
    Q_PRINT(" --- input_ctrl_23  value = "<< p->input_ctrl_23());
    Q_PRINT(" --- input_ctrl_24  value = "<< p->input_ctrl_24());
    Q_PRINT(" --- input_ctrl_25  value = "<< p->input_ctrl_25());
    Q_PRINT(" --- input_ctrl_26  value = "<< p->input_ctrl_26());
    Q_PRINT(" --- input_ctrl_27  value = "<< p->input_ctrl_27());
    Q_PRINT(" --- input_ctrl_28  value = "<< p->input_ctrl_28());
    Q_PRINT(" --- input_ctrl_29  value = "<< p->input_ctrl_29());
    Q_PRINT(" --- input_ctrl_30  value = "<< p->input_ctrl_30());
    Q_PRINT(" --- input_ctrl_31  value = "<< p->input_ctrl_31());
    Q_PRINT(" --- input_ctrl_32  value = "<< p->input_ctrl_32());
    Q_PRINT(" --- input_ctrl_33  value = "<< p->input_ctrl_33());
    Q_PRINT(" --- input_ctrl_34  value = "<< p->input_ctrl_34());
    Q_PRINT(" --- input_ctrl_35  value = "<< p->input_ctrl_35());
}

//接收前模块消息
void CarMessageHandle::handleProtoFontMoudleFrameInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyModuleFrontInfo::ModuleFrontFrame> p = down_pointer_cast<fyModuleFrontInfo::ModuleFrontFrame>(msg);

    float tempFloatValue = 0;
    tempFloatValue = p->output_current_01();
    ValueChangeOnlyNotify(front_current01, tempFloatValue);
    tempFloatValue = p->output_current_02();
    ValueChangeOnlyNotify(front_current02, tempFloatValue);
    tempFloatValue = p->output_current_03();
    ValueChangeOnlyNotify(front_current03, tempFloatValue);
    tempFloatValue = p->output_current_04();
    ValueChangeOnlyNotify(front_current04, tempFloatValue);
    tempFloatValue = p->output_current_05();
    ValueChangeOnlyNotify(front_current05, tempFloatValue);
    tempFloatValue = p->output_current_06();
    ValueChangeOnlyNotify(front_current06, tempFloatValue);
    tempFloatValue = p->output_current_07();
    ValueChangeOnlyNotify(front_current07, tempFloatValue);
    tempFloatValue = p->output_current_08();
    ValueChangeOnlyNotify(front_current08, tempFloatValue);
    tempFloatValue = p->output_current_09();
    ValueChangeOnlyNotify(front_current09, tempFloatValue);
    tempFloatValue = p->output_current_10();
    ValueChangeOnlyNotify(front_current10, tempFloatValue);
    tempFloatValue = p->output_current_11();
    ValueChangeOnlyNotify(front_current11, tempFloatValue);
    tempFloatValue = p->output_current_12();
    ValueChangeOnlyNotify(front_current12, tempFloatValue);
    tempFloatValue = p->output_current_13();
    ValueChangeOnlyNotify(front_current13, tempFloatValue);
    tempFloatValue = p->output_current_14();
    ValueChangeOnlyNotify(front_current14, tempFloatValue);
    tempFloatValue = p->output_current_15();
    ValueChangeOnlyNotify(front_current15, tempFloatValue);

    qint64 tempIntValue = 0;
    tempIntValue = p->switch_01();
    ValueChangeOnlyNotify(front_switch01, tempIntValue);
    tempIntValue = p->switch_02();
    ValueChangeOnlyNotify(front_switch02, tempIntValue);
    tempIntValue = p->switch_03();
    ValueChangeOnlyNotify(front_switch03, tempIntValue);
    tempIntValue = p->switch_04();
    ValueChangeOnlyNotify(front_switch04, tempIntValue);
    tempIntValue = p->switch_05();
    ValueChangeOnlyNotify(front_switch05, tempIntValue);
    tempIntValue = p->switch_06();
    ValueChangeOnlyNotify(front_switch06, tempIntValue);
    tempIntValue = p->switch_07();
    ValueChangeOnlyNotify(front_switch07, tempIntValue);
    tempIntValue = p->switch_08();
    ValueChangeOnlyNotify(front_switch08, tempIntValue);
    tempIntValue = p->switch_09();
    ValueChangeOnlyNotify(front_switch09, tempIntValue);
    tempIntValue = p->switch_10();
    ValueChangeOnlyNotify(front_switch10, tempIntValue);
    tempIntValue = p->switch_11();
    ValueChangeOnlyNotify(front_switch11, tempIntValue);
    tempIntValue = p->switch_12();
    ValueChangeOnlyNotify(front_switch12, tempIntValue);
    tempIntValue = p->switch_13();
    ValueChangeOnlyNotify(front_switch13, tempIntValue);
    tempIntValue = p->switch_14();
    ValueChangeOnlyNotify(front_switch14, tempIntValue);
    tempIntValue = p->switch_15();
    ValueChangeOnlyNotify(front_switch15, tempIntValue);
    tempIntValue = p->switch_16();
    ValueChangeOnlyNotify(front_switch16, tempIntValue);
    tempIntValue = p->switch_17();
    ValueChangeOnlyNotify(front_switch17, tempIntValue);
    tempIntValue = p->switch_18();
    ValueChangeOnlyNotify(front_switch18, tempIntValue);
    tempIntValue = p->switch_19();
    ValueChangeOnlyNotify(front_switch19, tempIntValue);
    tempIntValue = p->switch_20();
    ValueChangeOnlyNotify(front_switch20, tempIntValue);
    tempIntValue = p->switch_21();
    ValueChangeOnlyNotify(front_switch21, tempIntValue);
    tempIntValue = p->switch_22();
    ValueChangeOnlyNotify(front_switch22, tempIntValue);
    tempIntValue = p->switch_23();
    ValueChangeOnlyNotify(front_switch23, tempIntValue);
    tempIntValue = p->switch_24();
    ValueChangeOnlyNotify(front_switch24, tempIntValue);
    tempIntValue = p->switch_25();
    ValueChangeOnlyNotify(front_switch25, tempIntValue);
    tempIntValue = p->switch_26();
    ValueChangeOnlyNotify(front_switch26, tempIntValue);
    tempIntValue = p->switch_27();
    ValueChangeOnlyNotify(front_switch27, tempIntValue);
    tempIntValue = p->switch_28();
    ValueChangeOnlyNotify(front_switch28, tempIntValue);
    tempIntValue = p->switch_29();
    ValueChangeOnlyNotify(front_switch29, tempIntValue);
    tempIntValue = p->switch_30();
    ValueChangeOnlyNotify(front_switch30, tempIntValue);
    tempIntValue = p->switch_31();
    ValueChangeOnlyNotify(front_switch31, tempIntValue);
    tempIntValue = p->switch_32();
    ValueChangeOnlyNotify(front_switch32, tempIntValue);
    tempIntValue = p->switch_33();
    ValueChangeOnlyNotify(front_switch33, tempIntValue);
    tempIntValue = p->switch_34();
    ValueChangeOnlyNotify(front_switch34, tempIntValue);
    tempIntValue = p->switch_35();
    ValueChangeOnlyNotify(front_switch35, tempIntValue);
    tempIntValue = p->switch_36();
    ValueChangeOnlyNotify(front_switch36, tempIntValue);
    tempIntValue = p->switch_37();
    ValueChangeOnlyNotify(front_switch37, tempIntValue);
    tempIntValue = p->switch_38();
    ValueChangeOnlyNotify(front_switch38, tempIntValue);
    tempIntValue = p->switch_39();
    ValueChangeOnlyNotify(front_switch39, tempIntValue);
    tempIntValue = p->switch_40();
    ValueChangeOnlyNotify(front_switch40, tempIntValue);
    tempIntValue = p->switch_41();
    ValueChangeOnlyNotify(front_switch41, tempIntValue);
    tempIntValue = p->switch_42();
    ValueChangeOnlyNotify(front_switch42, tempIntValue);

    Q_PRINT(" --- output_current_01 value = "<< p->output_current_01());
    Q_PRINT(" --- output_current_02 value = "<< p->output_current_02());
    Q_PRINT(" --- output_current_03 value = "<< p->output_current_03());
    Q_PRINT(" --- output_current_04 value = "<< p->output_current_04());
    Q_PRINT(" --- output_current_05 value = "<< p->output_current_05());
    Q_PRINT(" --- output_current_06 value = "<< p->output_current_06());
    Q_PRINT(" --- output_current_07 value = "<< p->output_current_07());
    Q_PRINT(" --- output_current_08 value = "<< p->output_current_08());
    Q_PRINT(" --- output_current_09 value = "<< p->output_current_09());
    Q_PRINT(" --- output_current_10 value = "<< p->output_current_10());
    Q_PRINT(" --- output_current_11 value = "<< p->output_current_11());
    Q_PRINT(" --- output_current_12 value = "<< p->output_current_12());
    Q_PRINT(" --- output_current_13 value = "<< p->output_current_13());
    Q_PRINT(" --- output_current_14 value = "<< p->output_current_14());
    Q_PRINT(" --- output_current_15 value = "<< p->output_current_15());
    Q_PRINT(" ---         switch_01 value = "<< p->switch_01());
    Q_PRINT(" ---         switch_02 value = "<< p->switch_02());
    Q_PRINT(" ---         switch_03 value = "<< p->switch_03());
    Q_PRINT(" ---         switch_04 value = "<< p->switch_04());
    Q_PRINT(" ---         switch_05 value = "<< p->switch_05());
    Q_PRINT(" ---         switch_06 value = "<< p->switch_06());
    Q_PRINT(" ---         switch_07 value = "<< p->switch_07());
    Q_PRINT(" ---         switch_08 value = "<< p->switch_08());
    Q_PRINT(" ---         switch_09 value = "<< p->switch_09());
    Q_PRINT(" ---         switch_10 value = "<< p->switch_10());
    Q_PRINT(" ---         switch_11 value = "<< p->switch_11());
    Q_PRINT(" ---         switch_12 value = "<< p->switch_12());
    Q_PRINT(" ---         switch_13 value = "<< p->switch_13());
    Q_PRINT(" ---         switch_14 value = "<< p->switch_14());
    Q_PRINT(" ---         switch_15 value = "<< p->switch_15());
    Q_PRINT(" ---         switch_16 value = "<< p->switch_16());
    Q_PRINT(" ---         switch_17 value = "<< p->switch_17());
    Q_PRINT(" ---         switch_18 value = "<< p->switch_18());
    Q_PRINT(" ---         switch_19 value = "<< p->switch_19());
    Q_PRINT(" ---         switch_20 value = "<< p->switch_20());
    Q_PRINT(" ---         switch_21 value = "<< p->switch_21());
    Q_PRINT(" ---         switch_22 value = "<< p->switch_22());
    Q_PRINT(" ---         switch_23 value = "<< p->switch_23());
    Q_PRINT(" ---         switch_24 value = "<< p->switch_24());
    Q_PRINT(" ---         switch_25 value = "<< p->switch_25());
    Q_PRINT(" ---         switch_26 value = "<< p->switch_26());
    Q_PRINT(" ---         switch_27 value = "<< p->switch_27());
    Q_PRINT(" ---         switch_28 value = "<< p->switch_28());
    Q_PRINT(" ---         switch_29 value = "<< p->switch_29());
    Q_PRINT(" ---         switch_30 value = "<< p->switch_30());
    Q_PRINT(" ---         switch_31 value = "<< p->switch_31());
    Q_PRINT(" ---         switch_32 value = "<< p->switch_32());
    Q_PRINT(" ---         switch_33 value = "<< p->switch_33());
    Q_PRINT(" ---         switch_34 value = "<< p->switch_34());
    Q_PRINT(" ---         switch_35 value = "<< p->switch_35());
    Q_PRINT(" ---         switch_36 value = "<< p->switch_36());
    Q_PRINT(" ---         switch_37 value = "<< p->switch_37());
    Q_PRINT(" ---         switch_38 value = "<< p->switch_38());
    Q_PRINT(" ---         switch_39 value = "<< p->switch_39());
    Q_PRINT(" ---         switch_40 value = "<< p->switch_40());
    Q_PRINT(" ---         switch_41 value = "<< p->switch_41());
    Q_PRINT(" ---         switch_42 value = "<< p->switch_42());
}

//接收中模块消息
void CarMessageHandle::handleProtoMiddleMoudleFrameInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyModuleMiddleInfo::ModuleMiddleFrame> p = down_pointer_cast<fyModuleMiddleInfo::ModuleMiddleFrame>(msg);

    float tempFloatValue = 0;
    tempFloatValue = p->output_current_01();
    ValueChangeOnlyNotify(middle_current01, tempFloatValue);
    tempFloatValue = p->output_current_02();
    ValueChangeOnlyNotify(middle_current02, tempFloatValue);
    tempFloatValue = p->output_current_03();
    ValueChangeOnlyNotify(middle_current03, tempFloatValue);
    tempFloatValue = p->output_current_04();
    ValueChangeOnlyNotify(middle_current04, tempFloatValue);
    tempFloatValue = p->output_current_05();
    ValueChangeOnlyNotify(middle_current05, tempFloatValue);
    tempFloatValue = p->output_current_06();
    ValueChangeOnlyNotify(middle_current06, tempFloatValue);
    tempFloatValue = p->output_current_07();
    ValueChangeOnlyNotify(middle_current07, tempFloatValue);
    tempFloatValue = p->output_current_08();
    ValueChangeOnlyNotify(middle_current08, tempFloatValue);
    tempFloatValue = p->output_current_09();
    ValueChangeOnlyNotify(middle_current09, tempFloatValue);
    tempFloatValue = p->output_current_10();
    ValueChangeOnlyNotify(middle_current10, tempFloatValue);
    tempFloatValue = p->output_current_11();
    ValueChangeOnlyNotify(middle_current11, tempFloatValue);
    tempFloatValue = p->output_current_12();
    ValueChangeOnlyNotify(middle_current12, tempFloatValue);
    tempFloatValue = p->output_current_13();
    ValueChangeOnlyNotify(middle_current13, tempFloatValue);
    tempFloatValue = p->output_current_14();
    ValueChangeOnlyNotify(middle_current14, tempFloatValue);
    tempFloatValue = p->output_current_15();
    ValueChangeOnlyNotify(middle_current15, tempFloatValue);

    qint64 tempIntValue = 0;
    tempIntValue = p->switch_01();
    ValueChangeOnlyNotify(middle_switch01, tempIntValue);
    tempIntValue = p->switch_02();
    ValueChangeOnlyNotify(middle_switch02, tempIntValue);
    tempIntValue = p->switch_03();
    ValueChangeOnlyNotify(middle_switch03, tempIntValue);
    tempIntValue = p->switch_04();
    ValueChangeOnlyNotify(middle_switch04, tempIntValue);
    tempIntValue = p->switch_05();
    ValueChangeOnlyNotify(middle_switch05, tempIntValue);
    tempIntValue = p->switch_06();
    ValueChangeOnlyNotify(middle_switch06, tempIntValue);
    tempIntValue = p->switch_07();
    ValueChangeOnlyNotify(middle_switch07, tempIntValue);
    tempIntValue = p->switch_08();
    ValueChangeOnlyNotify(middle_switch08, tempIntValue);
    tempIntValue = p->switch_09();
    ValueChangeOnlyNotify(middle_switch09, tempIntValue);
    tempIntValue = p->switch_10();
    ValueChangeOnlyNotify(middle_switch10, tempIntValue);
    tempIntValue = p->switch_11();
    ValueChangeOnlyNotify(middle_switch11, tempIntValue);
    tempIntValue = p->switch_12();
    ValueChangeOnlyNotify(middle_switch12, tempIntValue);
    tempIntValue = p->switch_13();
    ValueChangeOnlyNotify(middle_switch13, tempIntValue);
    tempIntValue = p->switch_14();
    ValueChangeOnlyNotify(middle_switch14, tempIntValue);
    tempIntValue = p->switch_15();
    ValueChangeOnlyNotify(middle_switch15, tempIntValue);
    tempIntValue = p->switch_16();
    ValueChangeOnlyNotify(middle_switch16, tempIntValue);
    tempIntValue = p->switch_17();
    ValueChangeOnlyNotify(middle_switch17, tempIntValue);
    tempIntValue = p->switch_18();
    ValueChangeOnlyNotify(middle_switch18, tempIntValue);
    tempIntValue = p->switch_19();
    ValueChangeOnlyNotify(middle_switch19, tempIntValue);
    tempIntValue = p->switch_20();
    ValueChangeOnlyNotify(middle_switch20, tempIntValue);
    tempIntValue = p->switch_21();
    ValueChangeOnlyNotify(middle_switch21, tempIntValue);
    tempIntValue = p->switch_22();
    ValueChangeOnlyNotify(middle_switch22, tempIntValue);
    tempIntValue = p->switch_23();
    ValueChangeOnlyNotify(middle_switch23, tempIntValue);
    tempIntValue = p->switch_24();
    ValueChangeOnlyNotify(middle_switch24, tempIntValue);
    tempIntValue = p->switch_25();
    ValueChangeOnlyNotify(middle_switch25, tempIntValue);
    tempIntValue = p->switch_26();
    ValueChangeOnlyNotify(middle_switch26, tempIntValue);
    tempIntValue = p->switch_27();
    ValueChangeOnlyNotify(middle_switch27, tempIntValue);
    tempIntValue = p->switch_28();
    ValueChangeOnlyNotify(middle_switch28, tempIntValue);
    tempIntValue = p->switch_29();
    ValueChangeOnlyNotify(middle_switch29, tempIntValue);
    tempIntValue = p->switch_30();
    ValueChangeOnlyNotify(middle_switch30, tempIntValue);
    tempIntValue = p->switch_31();
    ValueChangeOnlyNotify(middle_switch31, tempIntValue);
    tempIntValue = p->switch_32();
    ValueChangeOnlyNotify(middle_switch32, tempIntValue);
    tempIntValue = p->switch_33();
    ValueChangeOnlyNotify(middle_switch33, tempIntValue);
    tempIntValue = p->switch_34();
    ValueChangeOnlyNotify(middle_switch34, tempIntValue);
    tempIntValue = p->switch_35();
    ValueChangeOnlyNotify(middle_switch35, tempIntValue);
    tempIntValue = p->switch_36();
    ValueChangeOnlyNotify(middle_switch36, tempIntValue);
    tempIntValue = p->switch_37();
    ValueChangeOnlyNotify(middle_switch37, tempIntValue);
    tempIntValue = p->switch_38();
    ValueChangeOnlyNotify(middle_switch38, tempIntValue);
    tempIntValue = p->switch_39();
    ValueChangeOnlyNotify(middle_switch39, tempIntValue);
    tempIntValue = p->switch_40();
    ValueChangeOnlyNotify(middle_switch40, tempIntValue);
    tempIntValue = p->switch_41();
    ValueChangeOnlyNotify(middle_switch41, tempIntValue);
    tempIntValue = p->switch_42();
    ValueChangeOnlyNotify(middle_switch42, tempIntValue);

    Q_PRINT(" --- output_current_01 value = "<< p->output_current_01());
    Q_PRINT(" --- output_current_02 value = "<< p->output_current_02());
    Q_PRINT(" --- output_current_03 value = "<< p->output_current_03());
    Q_PRINT(" --- output_current_04 value = "<< p->output_current_04());
    Q_PRINT(" --- output_current_05 value = "<< p->output_current_05());
    Q_PRINT(" --- output_current_06 value = "<< p->output_current_06());
    Q_PRINT(" --- output_current_07 value = "<< p->output_current_07());
    Q_PRINT(" --- output_current_08 value = "<< p->output_current_08());
    Q_PRINT(" --- output_current_09 value = "<< p->output_current_09());
    Q_PRINT(" --- output_current_10 value = "<< p->output_current_10());
    Q_PRINT(" --- output_current_11 value = "<< p->output_current_11());
    Q_PRINT(" --- output_current_12 value = "<< p->output_current_12());
    Q_PRINT(" --- output_current_13 value = "<< p->output_current_13());
    Q_PRINT(" --- output_current_14 value = "<< p->output_current_14());
    Q_PRINT(" --- output_current_15 value = "<< p->output_current_15());
    Q_PRINT(" ---         switch_01 value = "<< p->switch_01());
    Q_PRINT(" ---         switch_02 value = "<< p->switch_02());
    Q_PRINT(" ---         switch_03 value = "<< p->switch_03());
    Q_PRINT(" ---         switch_04 value = "<< p->switch_04());
    Q_PRINT(" ---         switch_05 value = "<< p->switch_05());
    Q_PRINT(" ---         switch_06 value = "<< p->switch_06());
    Q_PRINT(" ---         switch_07 value = "<< p->switch_07());
    Q_PRINT(" ---         switch_08 value = "<< p->switch_08());
    Q_PRINT(" ---         switch_09 value = "<< p->switch_09());
    Q_PRINT(" ---         switch_10 value = "<< p->switch_10());
    Q_PRINT(" ---         switch_11 value = "<< p->switch_11());
    Q_PRINT(" ---         switch_12 value = "<< p->switch_12());
    Q_PRINT(" ---         switch_13 value = "<< p->switch_13());
    Q_PRINT(" ---         switch_14 value = "<< p->switch_14());
    Q_PRINT(" ---         switch_15 value = "<< p->switch_15());
    Q_PRINT(" ---         switch_16 value = "<< p->switch_16());
    Q_PRINT(" ---         switch_17 value = "<< p->switch_17());
    Q_PRINT(" ---         switch_18 value = "<< p->switch_18());
    Q_PRINT(" ---         switch_19 value = "<< p->switch_19());
    Q_PRINT(" ---         switch_20 value = "<< p->switch_20());
    Q_PRINT(" ---         switch_21 value = "<< p->switch_21());
    Q_PRINT(" ---         switch_22 value = "<< p->switch_22());
    Q_PRINT(" ---         switch_23 value = "<< p->switch_23());
    Q_PRINT(" ---         switch_24 value = "<< p->switch_24());
    Q_PRINT(" ---         switch_25 value = "<< p->switch_25());
    Q_PRINT(" ---         switch_26 value = "<< p->switch_26());
    Q_PRINT(" ---         switch_27 value = "<< p->switch_27());
    Q_PRINT(" ---         switch_28 value = "<< p->switch_28());
    Q_PRINT(" ---         switch_29 value = "<< p->switch_29());
    Q_PRINT(" ---         switch_30 value = "<< p->switch_30());
    Q_PRINT(" ---         switch_31 value = "<< p->switch_31());
    Q_PRINT(" ---         switch_32 value = "<< p->switch_32());
    Q_PRINT(" ---         switch_33 value = "<< p->switch_33());
    Q_PRINT(" ---         switch_34 value = "<< p->switch_34());
    Q_PRINT(" ---         switch_35 value = "<< p->switch_35());
    Q_PRINT(" ---         switch_36 value = "<< p->switch_36());
    Q_PRINT(" ---         switch_37 value = "<< p->switch_37());
    Q_PRINT(" ---         switch_38 value = "<< p->switch_38());
    Q_PRINT(" ---         switch_39 value = "<< p->switch_39());
    Q_PRINT(" ---         switch_40 value = "<< p->switch_40());
    Q_PRINT(" ---         switch_41 value = "<< p->switch_41());
    Q_PRINT(" ---         switch_42 value = "<< p->switch_42());
}

//接收后模块消息
void CarMessageHandle::handleProtoBackMoudleFrameInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyModuleBackInfo::ModuleBackFrame> p = down_pointer_cast<fyModuleBackInfo::ModuleBackFrame>(msg);

    float tempFloatValue = 0;
    tempFloatValue = p->output_current_01();
    ValueChangeOnlyNotify(back_current01, tempFloatValue);
    tempFloatValue = p->output_current_02();
    ValueChangeOnlyNotify(back_current02, tempFloatValue);
    tempFloatValue = p->output_current_03();
    ValueChangeOnlyNotify(back_current03, tempFloatValue);
    tempFloatValue = p->output_current_04();
    ValueChangeOnlyNotify(back_current04, tempFloatValue);
    tempFloatValue = p->output_current_05();
    ValueChangeOnlyNotify(back_current05, tempFloatValue);
    tempFloatValue = p->output_current_06();
    ValueChangeOnlyNotify(back_current06, tempFloatValue);
    tempFloatValue = p->output_current_07();
    ValueChangeOnlyNotify(back_current07, tempFloatValue);
    tempFloatValue = p->output_current_08();
    ValueChangeOnlyNotify(back_current08, tempFloatValue);
    tempFloatValue = p->output_current_09();
    ValueChangeOnlyNotify(back_current09, tempFloatValue);
    tempFloatValue = p->output_current_10();
    ValueChangeOnlyNotify(back_current10, tempFloatValue);
    tempFloatValue = p->output_current_11();
    ValueChangeOnlyNotify(back_current11, tempFloatValue);
    tempFloatValue = p->output_current_12();
    ValueChangeOnlyNotify(back_current12, tempFloatValue);
    tempFloatValue = p->output_current_13();
    ValueChangeOnlyNotify(back_current13, tempFloatValue);
    tempFloatValue = p->output_current_14();
    ValueChangeOnlyNotify(back_current14, tempFloatValue);
    tempFloatValue = p->output_current_15();
    ValueChangeOnlyNotify(back_current15, tempFloatValue);

    qint64 tempIntValue = 0;
    tempIntValue = p->switch_01();
    ValueChangeOnlyNotify(back_switch01, tempIntValue);
    tempIntValue = p->switch_02();
    ValueChangeOnlyNotify(back_switch02, tempIntValue);
    tempIntValue = p->switch_03();
    ValueChangeOnlyNotify(back_switch03, tempIntValue);
    tempIntValue = p->switch_04();
    ValueChangeOnlyNotify(back_switch04, tempIntValue);
    tempIntValue = p->switch_05();
    ValueChangeOnlyNotify(back_switch05, tempIntValue);
    tempIntValue = p->switch_06();
    ValueChangeOnlyNotify(back_switch06, tempIntValue);
    tempIntValue = p->switch_07();
    ValueChangeOnlyNotify(back_switch07, tempIntValue);
    tempIntValue = p->switch_08();
    ValueChangeOnlyNotify(back_switch08, tempIntValue);
    tempIntValue = p->switch_09();
    ValueChangeOnlyNotify(back_switch09, tempIntValue);
    tempIntValue = p->switch_10();
    ValueChangeOnlyNotify(back_switch10, tempIntValue);
    tempIntValue = p->switch_11();
    ValueChangeOnlyNotify(back_switch11, tempIntValue);
    tempIntValue = p->switch_12();
    ValueChangeOnlyNotify(back_switch12, tempIntValue);
    tempIntValue = p->switch_13();
    ValueChangeOnlyNotify(back_switch13, tempIntValue);
    tempIntValue = p->switch_14();
    ValueChangeOnlyNotify(back_switch14, tempIntValue);
    tempIntValue = p->switch_15();
    ValueChangeOnlyNotify(back_switch15, tempIntValue);
    tempIntValue = p->switch_16();
    ValueChangeOnlyNotify(back_switch16, tempIntValue);
    tempIntValue = p->switch_17();
    ValueChangeOnlyNotify(back_switch17, tempIntValue);
    tempIntValue = p->switch_18();
    ValueChangeOnlyNotify(back_switch18, tempIntValue);
    tempIntValue = p->switch_19();
    ValueChangeOnlyNotify(back_switch19, tempIntValue);
    tempIntValue = p->switch_20();
    ValueChangeOnlyNotify(back_switch20, tempIntValue);
    tempIntValue = p->switch_21();
    ValueChangeOnlyNotify(back_switch21, tempIntValue);
    tempIntValue = p->switch_22();
    ValueChangeOnlyNotify(back_switch22, tempIntValue);
    tempIntValue = p->switch_23();
    ValueChangeOnlyNotify(back_switch23, tempIntValue);
    tempIntValue = p->switch_24();
    ValueChangeOnlyNotify(back_switch24, tempIntValue);
    tempIntValue = p->switch_25();
    ValueChangeOnlyNotify(back_switch25, tempIntValue);
    tempIntValue = p->switch_26();
    ValueChangeOnlyNotify(back_switch26, tempIntValue);
    tempIntValue = p->switch_27();
    ValueChangeOnlyNotify(back_switch27, tempIntValue);
    tempIntValue = p->switch_28();
    ValueChangeOnlyNotify(back_switch28, tempIntValue);
    tempIntValue = p->switch_29();
    ValueChangeOnlyNotify(back_switch29, tempIntValue);
    tempIntValue = p->switch_30();
    ValueChangeOnlyNotify(back_switch30, tempIntValue);
    tempIntValue = p->switch_31();
    ValueChangeOnlyNotify(back_switch31, tempIntValue);
    tempIntValue = p->switch_32();
    ValueChangeOnlyNotify(back_switch32, tempIntValue);
    tempIntValue = p->switch_33();
    ValueChangeOnlyNotify(back_switch33, tempIntValue);
    tempIntValue = p->switch_34();
    ValueChangeOnlyNotify(back_switch34, tempIntValue);
    tempIntValue = p->switch_35();
    ValueChangeOnlyNotify(back_switch35, tempIntValue);
    tempIntValue = p->switch_36();
    ValueChangeOnlyNotify(back_switch36, tempIntValue);
    tempIntValue = p->switch_37();
    ValueChangeOnlyNotify(back_switch37, tempIntValue);
    tempIntValue = p->switch_38();
    ValueChangeOnlyNotify(back_switch38, tempIntValue);
    tempIntValue = p->switch_39();
    ValueChangeOnlyNotify(back_switch39, tempIntValue);
    tempIntValue = p->switch_40();
    ValueChangeOnlyNotify(back_switch40, tempIntValue);
    tempIntValue = p->switch_41();
    ValueChangeOnlyNotify(back_switch41, tempIntValue);
    tempIntValue = p->switch_42();
    ValueChangeOnlyNotify(back_switch42, tempIntValue);

    Q_PRINT(" --- output_current_01 value = "<< p->output_current_01());
    Q_PRINT(" --- output_current_02 value = "<< p->output_current_02());
    Q_PRINT(" --- output_current_03 value = "<< p->output_current_03());
    Q_PRINT(" --- output_current_04 value = "<< p->output_current_04());
    Q_PRINT(" --- output_current_05 value = "<< p->output_current_05());
    Q_PRINT(" --- output_current_06 value = "<< p->output_current_06());
    Q_PRINT(" --- output_current_07 value = "<< p->output_current_07());
    Q_PRINT(" --- output_current_08 value = "<< p->output_current_08());
    Q_PRINT(" --- output_current_09 value = "<< p->output_current_09());
    Q_PRINT(" --- output_current_10 value = "<< p->output_current_10());
    Q_PRINT(" --- output_current_11 value = "<< p->output_current_11());
    Q_PRINT(" --- output_current_12 value = "<< p->output_current_12());
    Q_PRINT(" --- output_current_13 value = "<< p->output_current_13());
    Q_PRINT(" --- output_current_14 value = "<< p->output_current_14());
    Q_PRINT(" --- output_current_15 value = "<< p->output_current_15());
    Q_PRINT(" ---         switch_01 value = "<< p->switch_01());
    Q_PRINT(" ---         switch_02 value = "<< p->switch_02());
    Q_PRINT(" ---         switch_03 value = "<< p->switch_03());
    Q_PRINT(" ---         switch_04 value = "<< p->switch_04());
    Q_PRINT(" ---         switch_05 value = "<< p->switch_05());
    Q_PRINT(" ---         switch_06 value = "<< p->switch_06());
    Q_PRINT(" ---         switch_07 value = "<< p->switch_07());
    Q_PRINT(" ---         switch_08 value = "<< p->switch_08());
    Q_PRINT(" ---         switch_09 value = "<< p->switch_09());
    Q_PRINT(" ---         switch_10 value = "<< p->switch_10());
    Q_PRINT(" ---         switch_11 value = "<< p->switch_11());
    Q_PRINT(" ---         switch_12 value = "<< p->switch_12());
    Q_PRINT(" ---         switch_13 value = "<< p->switch_13());
    Q_PRINT(" ---         switch_14 value = "<< p->switch_14());
    Q_PRINT(" ---         switch_15 value = "<< p->switch_15());
    Q_PRINT(" ---         switch_16 value = "<< p->switch_16());
    Q_PRINT(" ---         switch_17 value = "<< p->switch_17());
    Q_PRINT(" ---         switch_18 value = "<< p->switch_18());
    Q_PRINT(" ---         switch_19 value = "<< p->switch_19());
    Q_PRINT(" ---         switch_20 value = "<< p->switch_20());
    Q_PRINT(" ---         switch_21 value = "<< p->switch_21());
    Q_PRINT(" ---         switch_22 value = "<< p->switch_22());
    Q_PRINT(" ---         switch_23 value = "<< p->switch_23());
    Q_PRINT(" ---         switch_24 value = "<< p->switch_24());
    Q_PRINT(" ---         switch_25 value = "<< p->switch_25());
    Q_PRINT(" ---         switch_26 value = "<< p->switch_26());
    Q_PRINT(" ---         switch_27 value = "<< p->switch_27());
    Q_PRINT(" ---         switch_28 value = "<< p->switch_28());
    Q_PRINT(" ---         switch_29 value = "<< p->switch_29());
    Q_PRINT(" ---         switch_30 value = "<< p->switch_30());
    Q_PRINT(" ---         switch_31 value = "<< p->switch_31());
    Q_PRINT(" ---         switch_32 value = "<< p->switch_32());
    Q_PRINT(" ---         switch_33 value = "<< p->switch_33());
    Q_PRINT(" ---         switch_34 value = "<< p->switch_34());
    Q_PRINT(" ---         switch_35 value = "<< p->switch_35());
    Q_PRINT(" ---         switch_36 value = "<< p->switch_36());
    Q_PRINT(" ---         switch_37 value = "<< p->switch_37());
    Q_PRINT(" ---         switch_38 value = "<< p->switch_38());
    Q_PRINT(" ---         switch_39 value = "<< p->switch_39());
    Q_PRINT(" ---         switch_40 value = "<< p->switch_40());
    Q_PRINT(" ---         switch_41 value = "<< p->switch_41());
    Q_PRINT(" ---         switch_42 value = "<< p->switch_42());
}

//接收系统告警消息
void CarMessageHandle::handleProtoWarningFrameInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyWarningInfo::WarningFrame> p = down_pointer_cast<fyWarningInfo::WarningFrame>(msg);

    QString tempStringValue = "";
    if(p->has_warning_01()) {
        tempStringValue = QString::fromStdString(p->warning_01());
        ValueChangeOnlyNotify(warning_01, tempStringValue);
        Q_PRINT(" --- warning_01 = "<< p->warning_01());
    }
    if(p->has_warning_02()) {
        tempStringValue = QString::fromStdString(p->warning_02());
        ValueChangeOnlyNotify(warning_02, tempStringValue);
        Q_PRINT(" --- warning_02 = "<< p->warning_02());
    }
    if(p->has_warning_03()) {
        tempStringValue = QString::fromStdString(p->warning_03());
        ValueChangeOnlyNotify(warning_03, tempStringValue);
        Q_PRINT(" --- warning_03 = "<< p->warning_03());
    }
    if(p->has_warning_04()) {
        tempStringValue = QString::fromStdString(p->warning_04());
        ValueChangeOnlyNotify(warning_04, tempStringValue);
        Q_PRINT(" --- warning_04 = "<< p->warning_04());
    }
    if(p->has_warning_05()) {
        tempStringValue = QString::fromStdString(p->warning_05());
        ValueChangeOnlyNotify(warning_05, tempStringValue);
        Q_PRINT(" --- warning_05 = "<< p->warning_05());
    }
    if(p->has_warning_06()) {
        tempStringValue = QString::fromStdString(p->warning_06());
        ValueChangeOnlyNotify(warning_06, tempStringValue);
        Q_PRINT(" --- warning_06 = "<< p->warning_06());
    }
    if(p->has_warning_07()) {
        tempStringValue = QString::fromStdString(p->warning_07());
        ValueChangeOnlyNotify(warning_07, tempStringValue);
        Q_PRINT(" --- warning_07 = "<< p->warning_07());
    }
    if(p->has_warning_08()) {
        tempStringValue = QString::fromStdString(p->warning_08());
        ValueChangeOnlyNotify(warning_08, tempStringValue);
        Q_PRINT(" --- warning_08 = "<< p->warning_08());
    }
    if(p->has_warning_09()) {
        tempStringValue = QString::fromStdString(p->warning_09());
        ValueChangeOnlyNotify(warning_09, tempStringValue);
        Q_PRINT(" --- warning_09 = "<< p->warning_09());
    }
    if(p->has_warning_10()) {
        tempStringValue = QString::fromStdString(p->warning_10());
        ValueChangeOnlyNotify(warning_10, tempStringValue);
        Q_PRINT(" --- warning_10 = "<< p->warning_10());
    }
    if(p->has_warning_11()) {
        tempStringValue = QString::fromStdString(p->warning_11());
        ValueChangeOnlyNotify(warning_11, tempStringValue);
        Q_PRINT(" --- warning_11 = "<< p->warning_11());
    }
    if(p->has_warning_12()) {
        tempStringValue = QString::fromStdString(p->warning_12());
        ValueChangeOnlyNotify(warning_12, tempStringValue);
        Q_PRINT(" --- warning_12 = "<< p->warning_12());
    }
    if(p->has_warning_13()) {
        tempStringValue = QString::fromStdString(p->warning_13());
        ValueChangeOnlyNotify(warning_13, tempStringValue);
        Q_PRINT(" --- warning_13 = "<< p->warning_13());
    }
    if(p->has_warning_14()) {
        tempStringValue = QString::fromStdString(p->warning_14());
        ValueChangeOnlyNotify(warning_14, tempStringValue);
        Q_PRINT(" --- warning_14 = "<< p->warning_14());
    }
    if(p->has_warning_15()) {
        tempStringValue = QString::fromStdString(p->warning_15());
        ValueChangeOnlyNotify(warning_15, tempStringValue);
        Q_PRINT(" --- warning_15 = "<< p->warning_15());
    }
    if(p->has_warning_16()) {
        tempStringValue = QString::fromStdString(p->warning_16());
        ValueChangeOnlyNotify(warning_16, tempStringValue);
        Q_PRINT(" --- warning_16 = "<< p->warning_16());
    }
    if(p->has_warning_17()) {
        tempStringValue = QString::fromStdString(p->warning_17());
        ValueChangeOnlyNotify(warning_17, tempStringValue);
        Q_PRINT(" --- warning_17 = "<< p->warning_17());
    }
    if(p->has_warning_18()) {
        tempStringValue = QString::fromStdString(p->warning_18());
        ValueChangeOnlyNotify(warning_18, tempStringValue);
        Q_PRINT(" --- warning_18 = "<< p->warning_18());
    }
    if(p->has_warning_19()) {
        tempStringValue = QString::fromStdString(p->warning_19());
        ValueChangeOnlyNotify(warning_19, tempStringValue);
        Q_PRINT(" --- warning_19 = "<< p->warning_19());
    }
    if(p->has_warning_20()) {
        tempStringValue = QString::fromStdString(p->warning_20());
        ValueChangeOnlyNotify(warning_20, tempStringValue);
        Q_PRINT(" --- warning_20 = "<< p->warning_20());
    }
    if(p->has_warning_21()) {
        tempStringValue = QString::fromStdString(p->warning_21());
        ValueChangeOnlyNotify(warning_21, tempStringValue);
        Q_PRINT(" --- warning_21 = "<< p->warning_21());
    }
    if(p->has_warning_22()) {
        tempStringValue = QString::fromStdString(p->warning_22());
        ValueChangeOnlyNotify(warning_22, tempStringValue);
        Q_PRINT(" --- warning_22 = "<< p->warning_22());
    }
    if(p->has_warning_23()) {
        tempStringValue = QString::fromStdString(p->warning_23());
        ValueChangeOnlyNotify(warning_23, tempStringValue);
        Q_PRINT(" --- warning_23 = "<< p->warning_23());
    }
    if(p->has_warning_24()) {
        tempStringValue = QString::fromStdString(p->warning_24());
        ValueChangeOnlyNotify(warning_24, tempStringValue);
        Q_PRINT(" --- warning_24 = "<< p->warning_24());
    }
    if(p->has_warning_25()) {
        tempStringValue = QString::fromStdString(p->warning_25());
        ValueChangeOnlyNotify(warning_25, tempStringValue);
        Q_PRINT(" --- warning_25 = "<< p->warning_25());
    }
    if(p->has_warning_26()) {
        tempStringValue = QString::fromStdString(p->warning_26());
        ValueChangeOnlyNotify(warning_26, tempStringValue);
        Q_PRINT(" --- warning_26 = "<< p->warning_26());
    }
    if(p->has_warning_27()) {
        tempStringValue = QString::fromStdString(p->warning_27());
        ValueChangeOnlyNotify(warning_27, tempStringValue);
        Q_PRINT(" --- warning_27 = "<< p->warning_27());
    }
    if(p->has_warning_28()) {
        tempStringValue = QString::fromStdString(p->warning_28());
        ValueChangeOnlyNotify(warning_28, tempStringValue);
        Q_PRINT(" --- warning_28 = "<< p->warning_28());
    }
    if(p->has_warning_29()) {
        tempStringValue = QString::fromStdString(p->warning_29());
        ValueChangeOnlyNotify(warning_29, tempStringValue);
        Q_PRINT(" --- warning_29 = "<< p->warning_29());
    }
    if(p->has_warning_30()) {
        tempStringValue = QString::fromStdString(p->warning_30());
        ValueChangeOnlyNotify(warning_30, tempStringValue);
        Q_PRINT(" --- warning_30 = "<< p->warning_30());
    }
    if(p->has_warning_31()) {
        tempStringValue = QString::fromStdString(p->warning_31());
        ValueChangeOnlyNotify(warning_31, tempStringValue);
        Q_PRINT(" --- warning_31 = "<< p->warning_31());
    }
    if(p->has_warning_32()) {
        tempStringValue = QString::fromStdString(p->warning_32());
        ValueChangeOnlyNotify(warning_32, tempStringValue);
        Q_PRINT(" --- warning_32 = "<< p->warning_32());
    }
    if(p->has_warning_33()) {
        tempStringValue = QString::fromStdString(p->warning_33());
        ValueChangeOnlyNotify(warning_33, tempStringValue);
        Q_PRINT(" --- warning_33 = "<< p->warning_33());
    }
    if(p->has_warning_34()) {
        tempStringValue = QString::fromStdString(p->warning_34());
        ValueChangeOnlyNotify(warning_34, tempStringValue);
        Q_PRINT(" --- warning_34 = "<< p->warning_34());
    }
    if(p->has_warning_35()) {
        tempStringValue = QString::fromStdString(p->warning_35());
        ValueChangeOnlyNotify(warning_35, tempStringValue);
        Q_PRINT(" --- warning_35 = "<< p->warning_35());
    }
    if(p->has_warning_36()) {
        tempStringValue = QString::fromStdString(p->warning_36());
        ValueChangeOnlyNotify(warning_36, tempStringValue);
        Q_PRINT(" --- warning_36 = "<< p->warning_36());
    }
    if(p->has_warning_37()) {
        tempStringValue = QString::fromStdString(p->warning_37());
        ValueChangeOnlyNotify(warning_37, tempStringValue);
        Q_PRINT(" --- warning_37 = "<< p->warning_37());
    }
    if(p->has_warning_38()) {
        tempStringValue = QString::fromStdString(p->warning_38());
        ValueChangeOnlyNotify(warning_38, tempStringValue);
        Q_PRINT(" --- warning_38 = "<< p->warning_38());
    }
    if(p->has_warning_39()) {
        tempStringValue = QString::fromStdString(p->warning_39());
        ValueChangeOnlyNotify(warning_39, tempStringValue);
        Q_PRINT(" --- warning_39 = "<< p->warning_39());
    }
    if(p->has_warning_40()) {
        tempStringValue = QString::fromStdString(p->warning_40());
        ValueChangeOnlyNotify(warning_40, tempStringValue);
        Q_PRINT(" --- warning_40 = "<< p->warning_40());
    }
}

//接收控制系统消息
void CarMessageHandle::handleProtoControlSystemMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyControlSystemInfo::ControlSystemMenu> p = down_pointer_cast<fyControlSystemInfo::ControlSystemMenu>(msg);

    Q_PRINT(" --- motor_in_voltage value = "<< p->motor_in_voltage());
    Q_PRINT(" --- motor_in_current value = "<< p->motor_in_current());
    Q_PRINT(" --- motor_temp value = "<< p->motor_temp());
    Q_PRINT(" --- motor_controller_temp value = "<< p->motor_controller_temp());
    Q_PRINT(" --- car_mode value = "<< p->car_mode());
    Q_PRINT(" --- version value = "<< p->version());
    Q_PRINT(" --- car_life value = "<< p->car_life());
    Q_PRINT(" --- accel_pedal_percent value = "<< p->accel_pedal_percent());
    Q_PRINT(" --- brake_pedal_percent value = "<< p->brake_pedal_percent());
    Q_PRINT(" --- din1 value = "<< p->din1());
    Q_PRINT(" --- din2 value = "<< p->din2());
    Q_PRINT(" --- din3 value = "<< p->din3());
    Q_PRINT(" --- dout1 value = "<< p->dout1());
    Q_PRINT(" --- dout2 value = "<< p->dout2());
    Q_PRINT(" --- dout3 value = "<< p->dout3());

    qint64 tempIntValue = 0;
    float tempFloatValue = 0;

    tempIntValue = p->motor_in_voltage();
    ValueChangeOnlyNotify(motor_in_voltage, tempIntValue);

    tempIntValue = p->motor_in_current();
    ValueChangeOnlyNotify(motor_in_current, tempIntValue);

    tempIntValue = p->motor_temp();
    ValueChangeOnlyNotify(motor_temp, tempIntValue);

    tempIntValue = p->motor_controller_temp();
    ValueChangeOnlyNotify(motor_controller_temp, tempIntValue);

    tempIntValue = p->car_mode();
    ValueChangeOnlyNotify(car_mode, tempIntValue);

    tempFloatValue = p->version();
    ValueChangeOnlyNotify(version, tempFloatValue);

    tempIntValue = p->car_life();
    ValueChangeOnlyNotify(car_Life, tempIntValue);

    tempFloatValue = p->accel_pedal_percent();
    ValueChangeOnlyNotify(accel_pedal_percent, tempFloatValue);

    tempFloatValue = p->brake_pedal_percent();
    ValueChangeOnlyNotify(brake_pedal_percent, tempFloatValue);

    tempIntValue = p->din1();
    ValueChangeOnlyNotify(din1, tempIntValue);

    tempIntValue = p->din2();
    ValueChangeOnlyNotify(din2, tempIntValue);

    tempIntValue = p->din3();
    ValueChangeOnlyNotify(din3, tempIntValue);

    tempIntValue = p->dout1();
    ValueChangeOnlyNotify(dout1, tempIntValue);

    tempIntValue = p->dout2();
    ValueChangeOnlyNotify(dout2, tempIntValue);

    tempIntValue = p->dout3();
    ValueChangeOnlyNotify(dout3, tempIntValue);
}

//接收发动机系统消息
void CarMessageHandle::handleProtoMoterSystemMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyMoterSystemInfo::MoterSystemMenu> p = down_pointer_cast<fyMoterSystemInfo::MoterSystemMenu>(msg);

    Q_PRINT(" --- engine_fuel_consumption value = "<< p->engine_fuel_consumption());
    Q_PRINT(" --- engine_load value = "<< p->engine_load());
    Q_PRINT(" --- engine_target_throttle value = "<< p->engine_target_throttle());
    Q_PRINT(" --- engine_actual_throttle value = "<< p->engine_actual_throttle());
    Q_PRINT(" --- engine_oil_pressure value = "<< p->engine_oil_pressure());
    Q_PRINT(" --- engine_inlet_temperature value = "<< p->engine_inlet_temperature());

    qint64 tempIntValue = 0;
    float tempFloatValue = 0;

    tempFloatValue = p->engine_fuel_consumption();
    ValueChangeOnlyNotify(engine_fuel_consumption, tempFloatValue);

    tempIntValue = p->engine_load();
    ValueChangeOnlyNotify(engine_load, tempIntValue);

    tempFloatValue = p->engine_target_throttle();
    ValueChangeOnlyNotify(engine_target_throttle, tempFloatValue);

    tempFloatValue = p->engine_actual_throttle();
    ValueChangeOnlyNotify(engine_actual_throttle, tempFloatValue);

    tempIntValue = p->engine_inlet_temperature();
    ValueChangeOnlyNotify(engine_inlet_temp, tempIntValue);

}

//接收辅助系统消息
void CarMessageHandle::handleProtoAuxiliarySystemMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyAuxiliarySystemInfo::AuxiliarySystemMenu> p = down_pointer_cast<fyAuxiliarySystemInfo::AuxiliarySystemMenu>(msg);

    Q_PRINT(" --- oil_pump_dcac_w_output_current value = "<< p->oil_pump_dcac_w_output_current());
    Q_PRINT(" --- oil_pump_dcac_v_output_current value = "<< p->oil_pump_dcac_v_output_current());
    Q_PRINT(" --- oil_pump_dcac_u_output_current value = "<< p->oil_pump_dcac_u_output_current());
    Q_PRINT(" --- radiator_temperature value = "<< p->radiator_temperature());

    qint64 tempIntValue = 0;

    tempIntValue = p->oil_pump_dcac_w_output_current();
    ValueChangeOnlyNotify(oilpump_dcac_w_output_current, tempIntValue);

    tempIntValue = p->oil_pump_dcac_v_output_current();
    ValueChangeOnlyNotify(oilpump_dcac_v_output_current, tempIntValue);

    tempIntValue = p->oil_pump_dcac_u_output_current();
    ValueChangeOnlyNotify(oilpump_dcac_u_output_current, tempIntValue);

    tempIntValue = p->radiator_temperature();
    ValueChangeOnlyNotify(radiator_temp, tempIntValue);
}

//接收TCU系统消息
void CarMessageHandle::handleProtoTcuSystemMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyTcuSystemInfo::TcuSystemMenu> p = down_pointer_cast<fyTcuSystemInfo::TcuSystemMenu>(msg);

    Q_PRINT(" --- actual_clutch_position value = "<< p->actual_clutch_position());
    Q_PRINT(" --- tcu_fault_code value = "<< p->tcu_fault_code());
    Q_PRINT(" --- axis_rpm value = "<< p->axis_rpm());
    Q_PRINT(" --- fmi value = "<< p->fmi());
    Q_PRINT(" --- cm value = "<< p->cm());
    Q_PRINT(" --- oc value = "<< p->oc());

    qint64 tempIntValue = 0;

    tempIntValue = p->actual_clutch_position();
    ValueChangeOnlyNotify(actual_clutch_position, tempIntValue);

    tempIntValue = p->tcu_fault_code();
    ValueChangeOnlyNotify(TCU_fault_code, tempIntValue);

    tempIntValue = p->axis_rpm();
    ValueChangeOnlyNotify(axis_rpm, tempIntValue);

    tempIntValue = p->fmi();
    ValueChangeOnlyNotify(FMI, tempIntValue);

    tempIntValue = p->cm();
    ValueChangeOnlyNotify(CM, tempIntValue);

    tempIntValue = p->oc();
    ValueChangeOnlyNotify(OC, tempIntValue);
}

//接收电池管理系统消息
void CarMessageHandle::handleProtoBatteryManageSystemMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyBatteryManageSystemInfo::BatteryManageSystemMenu> p = down_pointer_cast<fyBatteryManageSystemInfo::BatteryManageSystemMenu>(msg);

    Q_PRINT(" --- bat_max_charge_current value = "<< p->bat_max_charge_current());
    Q_PRINT(" --- bat_max_discharge_current value = "<< p->bat_max_discharge_current());
    Q_PRINT(" --- bat_average_voltage value = "<< p->bat_average_voltage());
    Q_PRINT(" --- bat_status1 value = "<< p->bat_status1());
    Q_PRINT(" --- bat_status2 value = "<< p->bat_status2());
    Q_PRINT(" --- bat_status3 value = "<< p->bat_status3());
    Q_PRINT(" --- irm_ohm_positive value = "<< p->irm_ohm_positive());
    Q_PRINT(" --- irm_ohm_negative value = "<< p->irm_ohm_negative());
    Q_PRINT(" --- bat_max_voltage value = "<< p->bat_max_voltage());
    Q_PRINT(" --- bat_min_voltage value = "<< p->bat_min_voltage());
    Q_PRINT(" --- battery_highest_temp value = "<< p->battery_highest_temp());

    qint64 tempIntValue = 0;
    float tempFloatValue = 0;

    tempFloatValue = p->bat_max_charge_current();
    ValueChangeOnlyNotify(bat_max_charge_current, tempFloatValue);

    tempFloatValue = p->bat_max_discharge_current();
    ValueChangeOnlyNotify(bat_max_discharge_current, tempFloatValue);

    tempFloatValue = p->bat_average_voltage();
    ValueChangeOnlyNotify(bat_average_voltage, tempFloatValue);

    tempIntValue = p->bat_status1();
    ValueChangeOnlyNotify(bat_status1, tempIntValue);

    tempIntValue = p->bat_status2();
    ValueChangeOnlyNotify(bat_status2, tempIntValue);

    tempIntValue = p->bat_status3();
    ValueChangeOnlyNotify(bat_status3, tempIntValue);

    tempIntValue = p->irm_ohm_positive();
    ValueChangeOnlyNotify(irm_ohm_positive, tempIntValue);

    tempIntValue = p->irm_ohm_negative();
    ValueChangeOnlyNotify(irm_ohm_negative, tempIntValue);

    tempFloatValue = p->bat_max_voltage();
    ValueChangeOnlyNotify(bat_max_voltage, tempFloatValue);

    tempFloatValue = p->bat_min_voltage();
    ValueChangeOnlyNotify(bat_min_voltage, tempFloatValue);

    tempFloatValue = p->battery_highest_temp();
    ValueChangeOnlyNotify(batteryTH, tempFloatValue);
}

//接收电池电压状态消息
void CarMessageHandle::handleProtoBatteryGroupVoltageMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu> p = down_pointer_cast<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu>(msg);

    Q_PRINT(" --- voltageGroup->box_number() = "<< p->box_number());
    for(int i=0; i<p->voltage_info_size(); i++) {
        const fyBatteryGroupVoltageInfo::BatterySingleVoltage* voltage = p->mutable_voltage_info(i);
        float tempFloatValue = voltage->voltage();
        ValueChangeFollowNotify(bat_voltage, tempFloatValue, i+1);
        Q_PRINT(" --- voltage->addr_number() = "<< voltage->addr_number());
        Q_PRINT(" --- voltage->voltage()     = "<< voltage->voltage());
    }
}

//接收电池温度状态消息
void CarMessageHandle::handleProtoBatteryGroupTemperatureMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu> p = down_pointer_cast<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu>(msg);

    Q_PRINT(" --- temperatureGroup->box_number() = "<< p->box_number());
    for(int i=0; i<p->temp_info_size(); i++) {
        const fyBatteryGroupTemperatureInfo::BatterySingleTemperature* temperature = p->mutable_temp_info(i);
        qint64 tempIntValue = temperature->temperature();
        ValueChangeFollowNotify(bat_temp, tempIntValue, i+1);
        Q_PRINT(" --- temperature->addr_number() = "<< temperature->addr_number());
        Q_PRINT(" --- temperature->temperature() = "<< temperature->temperature());
    }
}

//接收空调系统消息
void CarMessageHandle::handleProtoAirCtrlSystemMenuInfo(const MessagePtr& msg) {
    Q_PRINT(" --- handleProto: " << msg->GetTypeName() <<" --------------");
    shared_ptr<fyAirCtrlSystemInfo::AirCtrlSystemMenu> p = down_pointer_cast<fyAirCtrlSystemInfo::AirCtrlSystemMenu>(msg);

    Q_PRINT(" --- ac_fault_code value = "<< p->ac_fault_code());
    Q_PRINT(" --- ac_fan_status value = "<< p->ac_fan_status());
    Q_PRINT(" --- ac_work_status value = "<< p->ac_work_status());
    Q_PRINT(" --- ac_life value = "<< p->ac_life());
    Q_PRINT(" --- ac_out_temp value = "<< p->ac_out_temp());
    Q_PRINT(" --- ac_in_temp value = "<< p->ac_in_temp());
    Q_PRINT(" --- ac_set_temp value = "<< p->ac_set_temp());
    Q_PRINT(" --- ac_refrigere_req value = "<< p->ac_refrigere_req());

    qint64 tempIntValue = 0;

    tempIntValue = p->ac_fault_code();
    ValueChangeOnlyNotify(ac_fault_code, tempIntValue);

    tempIntValue = p->ac_fan_status();
    ValueChangeOnlyNotify(ac_fan_status, tempIntValue);

    tempIntValue = p->ac_work_status();
    ValueChangeOnlyNotify(ac_work_status, tempIntValue);

    tempIntValue = p->ac_life();
    ValueChangeOnlyNotify(ac_Life, tempIntValue);

    tempIntValue = p->ac_out_temp();
    ValueChangeOnlyNotify(ac_out_temp, tempIntValue);

    tempIntValue = p->ac_in_temp();
    ValueChangeOnlyNotify(ac_in_temp, tempIntValue);

    tempIntValue = p->ac_set_temp();
    ValueChangeOnlyNotify(ac_set_temp, tempIntValue);

    tempIntValue = p->ac_refrigere_req();
    ValueChangeOnlyNotify(ac_refrigere_req, tempIntValue);
}

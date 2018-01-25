
#include "CustomCarMsgWorker.hpp"


CustomCarMsgWorker::CustomCarMsgWorker()
{

}

void CustomCarMsgWorker::onStarted()
{
    //1. 首先得到一些重要的对象
    mKeyManager = std::make_shared<KeyManager>(); // 创建按键管理类
    mThemeConfig = std::make_shared<ThemeConfig>(); // 创建主题配置类

    connect(mThemeConfig.get(), &ThemeConfig::themeNoChanged, this, &CustomCarMsgWorker::handleThemeModeChanged);
    handleThemeModeChanged(mThemeConfig->getThemeNo());

    CarMsgWorker::onStarted();
    qDebug() << "CustomCarMsgWorker::onStarted";

//    enableKeys(true);
    emit initialized();
}

// Note: 该函数在子线程中执行, 下行
void CustomCarMsgWorker::enableKeys(bool enable)
{
    disconnect(mKeyManager.get(), &KeyManager::keyPressed, this, &CustomCarMsgWorker::keyPressed);
    disconnect(mKeyManager.get(), &KeyManager::keyReleased, this, &CustomCarMsgWorker::keyReleased);
    disconnect(mKeyManager.get(), &KeyManager::keyDoublePressed, this, &CustomCarMsgWorker::keyDoublePressed);
    disconnect(mKeyManager.get(), &KeyManager::doubleKeysPressed, this, &CustomCarMsgWorker::doubleKeysPressed);
    disconnect(mKeyManager.get(), &KeyManager::keyLongPressed, this, &CustomCarMsgWorker::keyLongPressed);
    disconnect(mKeyManager.get(), &KeyManager::keyShortPressed, this, &CustomCarMsgWorker::keyShortPressed);

    if (enable) {
        connect(mKeyManager.get(), &KeyManager::keyPressed, this, &CustomCarMsgWorker::keyPressed);
        connect(mKeyManager.get(), &KeyManager::keyReleased, this, &CustomCarMsgWorker::keyReleased);
        connect(mKeyManager.get(), &KeyManager::keyDoublePressed, this, &CustomCarMsgWorker::keyDoublePressed);
        connect(mKeyManager.get(), &KeyManager::doubleKeysPressed, this, &CustomCarMsgWorker::doubleKeysPressed);
        connect(mKeyManager.get(), &KeyManager::keyLongPressed, this, &CustomCarMsgWorker::keyLongPressed);
        connect(mKeyManager.get(), &KeyManager::keyShortPressed, this, &CustomCarMsgWorker::keyShortPressed);
    }
}

void CustomCarMsgWorker::themeSet(qint8 setNo)
{
    mThemeConfig->setThemeNo(setNo);
}

void CustomCarMsgWorker::handleThemeModeChanged(qint8 themeNo)
{
    updateStates<qint8>(mStateData.themeMode.data, themeNo, [=](qint8 value) {
        emit this->themeModeChanged(value);
    });
}


void CustomCarMsgWorker::registerCallback()
{
    mHandler.registerMsgCallback(fyKeyEvent::KeyFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoKey, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::AnimationFlash::descriptor(), bind(&CustomCarMsgWorker::handleProtoAutoFlash, this, _1));
    mHandler.registerMsgCallback(fyGeneralInfo::GeneralFrame::descriptor(), bind(&CustomCarMsgWorker::handleGeneralInfoFrame, this, _1));

    mHandler.registerMsgCallback(fySystemSettingsInfo::DateTime::descriptor(), bind(&CustomCarMsgWorker::handleProtoDatetime, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::UpgradeSettings::descriptor(), bind(&CustomCarMsgWorker::handleProtoUpgradeNotify, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::InstrumentFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoInstrumentFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleFrontInfo::ModuleFrontFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoFontMoudleFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleMiddleInfo::ModuleMiddleFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoMiddleMoudleFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleBackInfo::ModuleBackFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoBackMoudleFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyWarningInfo::WarningFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoWarningFrameInfo, this, _1));

    mHandler.registerMsgCallback(fyControlSystemInfo::ControlSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoControlSystemMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyMoterSystemInfo::MoterSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoMoterSystemMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyAuxiliarySystemInfo::AuxiliarySystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoAuxiliarySystemMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyTcuSystemInfo::TcuSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoTcuSystemMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyBatteryManageSystemInfo::BatteryManageSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryManageSystemMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryGroupVoltageMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryGroupTemperatureMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyAirCtrlSystemInfo::AirCtrlSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoAirCtrlSystemMenuInfo, this, _1));

    mHandler.registerMsgCallback(fyInstrumentInfo::MiscLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampMiscLampInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::CorneringLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampCorneringInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::LightLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampLightInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::GateLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampGateInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::BrakeLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampBrakeInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::AirPressureLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampAirPressureInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::ShoeLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampShoeWearInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::ChargingLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampChargingInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::WaterLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampWaterInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::StopLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampStopInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::MoterLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampMoterInfo, this, _1));
    mHandler.registerMsgCallback(fyInstrumentInfo::DynamotorLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoSymbolLampDynamotorInfo, this, _1));

}

void CustomCarMsgWorker::handleProtoKey(const carfox::MessagePtr &msg)
{
    qDebug() << "CustomCarMsgWorker::handleProtoKey";
    shared_ptr<fyKeyEvent::KeyFrame> p = carfox::down_pointer_cast<fyKeyEvent::KeyFrame>(msg);
    mKeyManager->detectKeyEvent(p->key1(), CustomEnum::EnterKey);
    mKeyManager->detectKeyEvent(p->key2(), CustomEnum::BackKey);
    mKeyManager->detectKeyEvent(p->key3(), CustomEnum::PrevKey);
    mKeyManager->detectKeyEvent(p->key4(), CustomEnum::NextKey);
}

/*
 *  处理动画完成之后的信号
 * 1. igOn
 * 2. 报警信号启动 alarmOn
 * 3. igOff
 */
void CustomCarMsgWorker::handleProtoAutoFlash(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::AnimationFlash> p = carfox::down_pointer_cast<fySystemSettingsInfo::AnimationFlash>(msg);
    updateStates<qint8>(mStateData.carMode.data, p->auto_flash(), [this](qint8 value) {
        emit this->carModeChanged(value);
    });
}

void CustomCarMsgWorker::handleGeneralInfoFrame(const carfox::MessagePtr &msg)
{
    shared_ptr<fyGeneralInfo::GeneralFrame> p = carfox::down_pointer_cast<fyGeneralInfo::GeneralFrame>(msg);
    qDebug() << "===gear value:" << p->gear();
    updateStates<qint16>(mStateData.carSpeed.data, p->speed(), [this](qint32 value) {
        emit this->carSpeedChanged(value);
    });
    updateStates<qint16>(mStateData.rpm.data, p->rpm(), [this](qint32 value) {
        emit this->rpmChanged(value);
    });
    updateStates<qint16>(mStateData.totalVoltage.data, p->total_voltage(), [this](qint32 value) {
        emit this->totalVoltageChanged(value);
    });
    updateStates<qint16>(mStateData.totalCurrent.data, p->total_current(), [this](qint32 value) {
        emit this->totalCurrentChanged(value);
    });
    updateStates<qint16>(mStateData.gear.data, p->gear(), [this](qint32 value) {
        emit this->gearChanged(value);
    });
    updateStates<quint16>(mStateData.odo.data, p->odo(), [this](quint32 value) {
        emit this->odoChanged(value);
    });
    updateStates<float>(mStateData.trip.data, p->trip(), [this](float value) {
        emit this->tripChanged(value);
    });
    updateStates<quint16>(mStateData.soc.data, p->soc(), [this](quint32 value) {
        emit this->socChanged(value);
    });
    updateStates<float>(mStateData.apVol1.data, p->air_press1(), [this](float value) {
        emit this->apVol1Changed(value);
    });
    updateStates<float>(mStateData.apVol2.data, p->air_press2(), [this](float value) {
        emit this->apVol2Changed(value);
    });
    updateStates<qint16>(mStateData.moter_control_temp.data, p->moter_control_temperature(), [this](qint32 value) {
        emit this->moter_control_tempChanged(value);
    });
    updateStates<qint16>(mStateData.moter_temp.data, p->moter_temperature(), [this](qint32 value) {
        emit this->moter_tempChanged(value);
    });
    updateStates<qint16>(mStateData.battery.data, p->battery(), [this](qint32 value) {
        emit this->batteryChanged(value);
    });
    updateStates<qint16>(mStateData.spn.data, p->spn(), [this](qint32 value) {
        emit this->spnChanged(value);
    });
    updateStates<qint16>(mStateData.engine_water_temp.data, p->engine_water_temp(), [this](qint32 value) {
        emit this->engine_water_tempChanged(value);
    });
    updateStates<qint16>(mStateData.urea_level.data, p->urea_level(), [this](qint32 value) {
        emit this->urea_levelChanged(value);
    });
    updateStates<quint16>(mStateData.fault_level.data, p->fault_level(), [this](quint32 value) {
        emit this->fault_levelChanged(value);
    });
    updateStates<qint16>(mStateData.fault_code.data, p->fault_code(), [this](qint32 value) {
        emit this->fault_codeChanged(value);
    });
    updateStates<quint16>(mStateData.oil_level.data, p->oil_level(), [this](quint32 value) {
        emit this->oil_levelChanged(value);
    });
    updateStates<float>(mStateData.engine_oil_pressure.data, p->engine_oil_pressure(), [this](float value) {
        emit this->engine_oil_pressureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoDatetime(const carfox::MessagePtr &msg) {
    shared_ptr<fyGeneralInfo::GeneralFrame> p = carfox::down_pointer_cast<fyGeneralInfo::GeneralFrame>(msg);
}

void CustomCarMsgWorker::handleProtoUpgradeNotify(const carfox::MessagePtr &msg) {
    shared_ptr<fySystemSettingsInfo::UpgradeSettings> p = carfox::down_pointer_cast<fySystemSettingsInfo::UpgradeSettings>(msg);
}

void CustomCarMsgWorker::handleProtoInstrumentFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::InstrumentFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::InstrumentFrame>(msg);
    updateStates<qint8>(mStateData.input_ctrl_01.data, p->input_ctrl_01(), [this](qint8 value) {
        emit this->input_ctrl_01Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_02.data, p->input_ctrl_02(), [this](qint8 value) {
        emit this->input_ctrl_02Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_03.data, p->input_ctrl_03(), [this](qint8 value) {
        emit this->input_ctrl_03Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_04.data, p->input_ctrl_04(), [this](qint8 value) {
        emit this->input_ctrl_04Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_05.data, p->input_ctrl_05(), [this](qint8 value) {
        emit this->input_ctrl_05Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_06.data, p->input_ctrl_06(), [this](qint8 value) {
        emit this->input_ctrl_06Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_07.data, p->input_ctrl_07(), [this](qint8 value) {
        emit this->input_ctrl_07Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_08.data, p->input_ctrl_08(), [this](qint8 value) {
        emit this->input_ctrl_08Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_09.data, p->input_ctrl_09(), [this](qint8 value) {
        emit this->input_ctrl_09Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_10.data, p->input_ctrl_10(), [this](qint8 value) {
        emit this->input_ctrl_10Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_11.data, p->input_ctrl_11(), [this](qint8 value) {
        emit this->input_ctrl_11Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_12.data, p->input_ctrl_12(), [this](qint8 value) {
        emit this->input_ctrl_12Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_13.data, p->input_ctrl_13(), [this](qint8 value) {
        emit this->input_ctrl_13Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_14.data, p->input_ctrl_14(), [this](qint8 value) {
        emit this->input_ctrl_14Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_15.data, p->input_ctrl_15(), [this](qint8 value) {
        emit this->input_ctrl_15Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_16.data, p->input_ctrl_16(), [this](qint8 value) {
        emit this->input_ctrl_16Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_17.data, p->input_ctrl_17(), [this](qint8 value) {
        emit this->input_ctrl_17Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_18.data, p->input_ctrl_18(), [this](qint8 value) {
        emit this->input_ctrl_18Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_19.data, p->input_ctrl_19(), [this](qint8 value) {
        emit this->input_ctrl_19Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_20.data, p->input_ctrl_20(), [this](qint8 value) {
        emit this->input_ctrl_20Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_21.data, p->input_ctrl_21(), [this](qint8 value) {
        emit this->input_ctrl_21Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_22.data, p->input_ctrl_22(), [this](qint8 value) {
        emit this->input_ctrl_22Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_23.data, p->input_ctrl_23(), [this](qint8 value) {
        emit this->input_ctrl_23Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_24.data, p->input_ctrl_24(), [this](qint8 value) {
        emit this->input_ctrl_24Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_25.data, p->input_ctrl_25(), [this](qint8 value) {
        emit this->input_ctrl_25Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_26.data, p->input_ctrl_26(), [this](qint8 value) {
        emit this->input_ctrl_26Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_27.data, p->input_ctrl_27(), [this](qint8 value) {
        emit this->input_ctrl_27Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_28.data, p->input_ctrl_28(), [this](qint8 value) {
        emit this->input_ctrl_28Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_29.data, p->input_ctrl_29(), [this](qint8 value) {
        emit this->input_ctrl_29Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_30.data, p->input_ctrl_30(), [this](qint8 value) {
        emit this->input_ctrl_30Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_31.data, p->input_ctrl_31(), [this](qint8 value) {
        emit this->input_ctrl_31Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_32.data, p->input_ctrl_32(), [this](qint8 value) {
        emit this->input_ctrl_32Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_33.data, p->input_ctrl_33(), [this](qint8 value) {
        emit this->input_ctrl_33Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_34.data, p->input_ctrl_34(), [this](qint8 value) {
        emit this->input_ctrl_34Changed(value);
    });
    updateStates<qint8>(mStateData.input_ctrl_35.data, p->input_ctrl_35(), [this](qint8 value) {
        emit this->input_ctrl_35Changed(value);
    });
}

void CustomCarMsgWorker::handleProtoFontMoudleFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyModuleFrontInfo::ModuleFrontFrame> p = carfox::down_pointer_cast<fyModuleFrontInfo::ModuleFrontFrame>(msg);
}

void CustomCarMsgWorker::handleProtoMiddleMoudleFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyModuleMiddleInfo::ModuleMiddleFrame> p = carfox::down_pointer_cast<fyModuleMiddleInfo::ModuleMiddleFrame>(msg);
}

void CustomCarMsgWorker::handleProtoBackMoudleFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyModuleBackInfo::ModuleBackFrame> p = carfox::down_pointer_cast<fyModuleBackInfo::ModuleBackFrame>(msg);
}

void CustomCarMsgWorker::handleProtoWarningFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyWarningInfo::WarningFrame> p = carfox::down_pointer_cast<fyWarningInfo::WarningFrame>(msg);
}

void CustomCarMsgWorker::handleProtoControlSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyControlSystemInfo::ControlSystemMenu> p = carfox::down_pointer_cast<fyControlSystemInfo::ControlSystemMenu>(msg);
    updateStates<float>(mStateData.motor_in_voltage.data, p->motor_in_voltage(), [this](float value) {
        emit this->motor_in_voltageChanged(value);
    });
    updateStates<float>(mStateData.motor_in_current.data, p->motor_in_current(), [this](float value) {
        emit this->motor_in_currentChanged(value);
    });
    updateStates<qint16>(mStateData.motor_temp.data, p->motor_temp(), [this](qint16 value) {
        emit this->motor_tempChanged(value);
    });
    updateStates<qint16>(mStateData.motor_controller_temp.data, p->motor_controller_temp(), [this](qint16 value) {
        emit this->motor_controller_tempChanged(value);
    });
    updateStates<qint16>(mStateData.car_mode.data, p->car_mode(), [this](qint16 value) {
        emit this->car_modeChanged(value);
    });
    updateStates<double>(mStateData.version.data, p->version(), [this](double value) {
        emit this->versionChanged(value);
    });
    updateStates<qint16>(mStateData.car_life.data, p->car_life(), [this](qint16 value) {
        emit this->car_lifeChanged(value);
    });
    updateStates<float>(mStateData.accel_pedal_percent.data, p->accel_pedal_percent(), [this](float value) {
        emit this->accel_pedal_percentChanged(value);
    });
    updateStates<float>(mStateData.brake_pedal_percent.data, p->brake_pedal_percent(), [this](float value) {
        emit this->brake_pedal_percentChanged(value);
    });
    updateStates<quint16>(mStateData.din1.data, p->din1(), [this](quint16 value) {
        emit this->din1Changed(value);
    });
    updateStates<quint16>(mStateData.din2.data, p->din2(), [this](quint16 value) {
        emit this->din2Changed(value);
    });
    updateStates<quint16>(mStateData.din3.data, p->din3(), [this](quint16 value) {
        emit this->din3Changed(value);
    });
    updateStates<quint16>(mStateData.dout1.data, p->dout1(), [this](quint16 value) {
        emit this->dout1Changed(value);
    });
    updateStates<quint16>(mStateData.dout2.data, p->dout2(), [this](quint16 value) {
        emit this->dout2Changed(value);
    });
    updateStates<quint16>(mStateData.dout3.data, p->dout3(), [this](quint16 value) {
        emit this->dout3Changed(value);
    });
}

void CustomCarMsgWorker::handleProtoMoterSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyMoterSystemInfo::MoterSystemMenu> p = carfox::down_pointer_cast<fyMoterSystemInfo::MoterSystemMenu>(msg);
    updateStates<float>(mStateData.engine_fuel_consumption.data, p->engine_fuel_consumption(), [this](float value) {
        emit this->engine_fuel_consumptionChanged(value);
    });
    updateStates<float>(mStateData.engine_load.data, p->engine_load(), [this](float value) {
        emit this->engine_loadChanged(value);
    });
    updateStates<float>(mStateData.engine_target_throttle.data, p->engine_target_throttle(), [this](float value) {
        emit this->engine_target_throttleChanged(value);
    });
    updateStates<float>(mStateData.engine_actual_throttle.data, p->engine_actual_throttle(), [this](float value) {
        emit this->engine_actual_throttleChanged(value);
    });
    updateStates<qint16>(mStateData.engine_inlet_temperature.data, p->engine_inlet_temperature(), [this](qint16 value) {
        emit this->engine_inlet_temperatureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoAuxiliarySystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyAuxiliarySystemInfo::AuxiliarySystemMenu> p = carfox::down_pointer_cast<fyAuxiliarySystemInfo::AuxiliarySystemMenu>(msg);
    updateStates<float>(mStateData.oil_pump_dcac_w_output_current.data, p->oil_pump_dcac_w_output_current(), [this](float value) {
        emit this->oil_pump_dcac_w_output_currentChanged(value);
    });
    updateStates<float>(mStateData.oil_pump_dcac_v_output_current.data, p->oil_pump_dcac_v_output_current(), [this](float value) {
        emit this->oil_pump_dcac_v_output_currentChanged(value);
    });
    updateStates<float>(mStateData.oil_pump_dcac_u_output_current.data, p->oil_pump_dcac_u_output_current(), [this](float value) {
        emit this->oil_pump_dcac_u_output_currentChanged(value);
    });
    updateStates<qint16>(mStateData.radiator_temperature.data, p->radiator_temperature(), [this](qint16 value) {
        emit this->radiator_temperatureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoTcuSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyTcuSystemInfo::TcuSystemMenu> p = carfox::down_pointer_cast<fyTcuSystemInfo::TcuSystemMenu>(msg);
    updateStates<qint16>(mStateData.actual_clutch_position.data, p->actual_clutch_position(), [this](qint16 value) {
        emit this->actual_clutch_positionChanged(value);
    });
    updateStates<quint16>(mStateData.tcu_fault_code.data, p->tcu_fault_code(), [this](quint16 value) {
        emit this->tcu_fault_codeChanged(value);
    });
    updateStates<qint16>(mStateData.axis_rpm.data, p->axis_rpm(), [this](qint16 value) {
        emit this->axis_rpmChanged(value);
    });
    updateStates<qint16>(mStateData.fmi.data, p->fmi(), [this](qint16 value) {
        emit this->fmiChanged(value);
    });
    updateStates<qint16>(mStateData.cm.data, p->cm(), [this](qint16 value) {
        emit this->cmChanged(value);
    });
    updateStates<quint16>(mStateData.oc.data, p->oc(), [this](quint16 value) {
        emit this->ocChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoBatteryManageSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryManageSystemInfo::BatteryManageSystemMenu> p = carfox::down_pointer_cast<fyBatteryManageSystemInfo::BatteryManageSystemMenu>(msg);
    updateStates<float>(mStateData.bat_max_charge_current.data, p->bat_max_charge_current(), [this](float value) {
        emit this->bat_max_charge_currentChanged(value);
    });
    updateStates<float>(mStateData.bat_max_discharge_current.data, p->bat_max_discharge_current(), [this](float value) {
        emit this->bat_max_discharge_currentChanged(value);
    });
    updateStates<float>(mStateData.bat_average_voltage.data, p->bat_average_voltage(), [this](float value) {
        emit this->bat_average_voltageChanged(value);
    });
    updateStates<quint16>(mStateData.bat_status1.data, p->bat_status1(), [this](quint16 value) {
        emit this->bat_status1Changed(value);
    });
    updateStates<quint16>(mStateData.bat_status2.data, p->bat_status2(), [this](quint16 value) {
        emit this->bat_status2Changed(value);
    });
    updateStates<quint16>(mStateData.bat_status3.data, p->bat_status3(), [this](quint16 value) {
        emit this->bat_status3Changed(value);
    });
    updateStates<float>(mStateData.irm_ohm_positive.data, p->irm_ohm_positive(), [this](float value) {
        emit this->irm_ohm_positiveChanged(value);
    });
    updateStates<float>(mStateData.irm_ohm_negative.data, p->irm_ohm_negative(), [this](float value) {
        emit this->irm_ohm_negativeChanged(value);
    });
    updateStates<float>(mStateData.bat_max_voltage.data, p->bat_max_voltage(), [this](float value) {
        emit this->bat_max_voltageChanged(value);
    });
    updateStates<float>(mStateData.bat_min_voltage.data, p->bat_min_voltage(), [this](float value) {
        emit this->bat_min_voltageChanged(value);
    });
    updateStates<float>(mStateData.battery_highest_temp.data, p->battery_highest_temp(), [this](float value) {
        emit this->battery_highest_tempChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoBatteryGroupVoltageMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu> p = carfox::down_pointer_cast<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu>(msg);
}

void CustomCarMsgWorker::handleProtoBatteryGroupTemperatureMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu> p = carfox::down_pointer_cast<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu>(msg);
}

void CustomCarMsgWorker::handleProtoAirCtrlSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyAirCtrlSystemInfo::AirCtrlSystemMenu> p = carfox::down_pointer_cast<fyAirCtrlSystemInfo::AirCtrlSystemMenu>(msg);
    updateStates<quint16>(mStateData.ac_fault_code.data, p->ac_fault_code(), [this](quint16 value) {
        emit this->ac_fault_codeChanged(value);
    });
    updateStates<quint16>(mStateData.ac_fan_status.data, p->ac_fan_status(), [this](quint16 value) {
        emit this->ac_fan_statusChanged(value);
    });
    updateStates<quint16>(mStateData.ac_work_status.data, p->ac_work_status(), [this](quint16 value) {
        emit this->ac_work_statusChanged(value);
    });
    updateStates<quint16>(mStateData.ac_life.data, p->ac_life(), [this](quint16 value) {
        emit this->ac_lifeChanged(value);
    });
    updateStates<qint16>(mStateData.ac_out_temp.data, p->ac_out_temp(), [this](qint16 value) {
        emit this->ac_out_tempChanged(value);
    });
    updateStates<qint16>(mStateData.ac_in_temp.data, p->ac_in_temp(), [this](qint16 value) {
        emit this->ac_in_tempChanged(value);
    });
    updateStates<qint16>(mStateData.ac_set_temp.data, p->ac_set_temp(), [this](qint16 value) {
        emit this->ac_set_tempChanged(value);
    });
    updateStates<quint16>(mStateData.ac_refrigere_req.data, p->ac_refrigere_req(), [this](quint16 value) {
        emit this->ac_refrigere_reqChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampMiscLampInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::MiscLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::MiscLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_key_on.data, p->lamp_key_on(), [this](qint8 value) {
        emit this->lamp_key_onChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_air_filter.data, p->lamp_air_filter(), [this](qint8 value) {
        emit this->lamp_air_filterChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_asr.data, p->lamp_asr(), [this](qint8 value) {
        emit this->lamp_asrChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_high_voltage_maintenance.data, p->lamp_high_voltage_maintenance(), [this](qint8 value) {
        emit this->lamp_high_voltage_maintenanceChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_defroster.data, p->lamp_defroster(), [this](qint8 value) {
        emit this->lamp_defrosterChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_dryere.data, p->lamp_dryere(), [this](qint8 value) {
        emit this->lamp_dryereChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_abs.data, p->lamp_abs(), [this](qint8 value) {
        emit this->lamp_absChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_ac.data, p->lamp_ac(), [this](qint8 value) {
        emit this->lamp_acChanged(value);
    });
    updateStates<QString>(mStateData.power_supply.data, QString::fromStdString(p->power_supply()), [this](QString value) {
        emit this->power_supplyChanged(value.toStdString());
    });
    updateStates<qint8>(mStateData.climbing_mode.data, p->climbing_mode(), [this](qint8 value) {
        emit this->climbing_modeChanged(value);
    });
    updateStates<qint8>(mStateData.diagnostic_mode.data, p->diagnostic_mode(), [this](qint8 value) {
        emit this->diagnostic_modeChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampCorneringInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::CorneringLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::CorneringLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_turn_left.data, p->lamp_turn_left(), [this](qint8 value) {
        emit this->lamp_turn_leftChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_turn_right.data, p->lamp_turn_right(), [this](qint8 value) {
        emit this->lamp_turn_rightChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampLightInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::LightLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::LightLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_double_flash.data, p->lamp_double_flash(), [this](qint8 value) {
        emit this->lamp_double_flashChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_front_fog.data, p->lamp_front_fog(), [this](qint8 value) {
        emit this->lamp_front_fogChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_rear_fog.data, p->lamp_rear_fog(), [this](qint8 value) {
        emit this->lamp_rear_fogChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_high_beam.data, p->lamp_high_beam(), [this](qint8 value) {
        emit this->lamp_high_beamChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_head_light.data, p->lamp_head_light(), [this](qint8 value) {
        emit this->lamp_head_lightChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_reverse_gear.data, p->lamp_reverse_gear(), [this](qint8 value) {
        emit this->lamp_reverse_gearChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_position_light.data, p->lamp_position_light(), [this](qint8 value) {
        emit this->lamp_position_lightChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampGateInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::GateLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::GateLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_gate1.data, p->lamp_gate1(), [this](qint8 value) {
        emit this->lamp_gate1Changed(value);
    });
    updateStates<qint8>(mStateData.lamp_gate2.data, p->lamp_gate2(), [this](qint8 value) {
        emit this->lamp_gate2Changed(value);
    });
    updateStates<qint8>(mStateData.lamp_rear_door_open.data, p->lamp_rear_door_open(), [this](qint8 value) {
        emit this->lamp_rear_door_openChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampBrakeInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::BrakeLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::BrakeLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_brake.data, p->lamp_brake(), [this](qint8 value) {
        emit this->lamp_brakeChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_parking_brake.data, p->lamp_parking_brake(), [this](qint8 value) {
        emit this->lamp_parking_brakeChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampAirPressureInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::AirPressureLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::AirPressureLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_left_low_air_pressure.data, p->lamp_left_low_air_pressure(), [this](qint8 value) {
        emit this->lamp_left_low_air_pressureChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_right_low_air_pressure.data, p->lamp_right_low_air_pressure(), [this](qint8 value) {
        emit this->lamp_right_low_air_pressureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampShoeWearInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::ShoeLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::ShoeLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_left_shoe_wear.data, p->lamp_left_shoe_wear(), [this](qint8 value) {
        emit this->lamp_left_shoe_wearChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_right_shoe_wear.data, p->lamp_right_shoe_wear(), [this](qint8 value) {
        emit this->lamp_right_shoe_wearChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampChargingInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::ChargingLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::ChargingLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_charge_confirm.data, p->lamp_charge_confirm(), [this](qint8 value) {
        emit this->lamp_charge_confirmChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_battery_main_contact.data, p->lamp_battery_main_contact(), [this](qint8 value) {
        emit this->lamp_battery_main_contactChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampWaterInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::WaterLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::WaterLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_water_temp_high.data, p->lamp_water_temp_high(), [this](qint8 value) {
        emit this->lamp_water_temp_highChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_water_level_low.data, p->lamp_water_level_low(), [this](qint8 value) {
        emit this->lamp_water_level_lowChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampStopInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::StopLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::StopLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_low_service_wl.data, p->lamp_low_service_wl(), [this](qint8 value) {
        emit this->lamp_low_service_wlChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_heavy_stop_wl.data, p->lamp_heavy_stop_wl(), [this](qint8 value) {
        emit this->lamp_heavy_stop_wlChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_serious_stop_wl.data, p->lamp_serious_stop_wl(), [this](qint8 value) {
        emit this->lamp_serious_stop_wlChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampMoterInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::MoterLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::MoterLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_oil_level_low.data, p->lamp_oil_level_low(), [this](qint8 value) {
        emit this->lamp_oil_level_lowChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_oil_pressure_low.data, p->lamp_oil_pressure_low(), [this](qint8 value) {
        emit this->lamp_oil_pressure_lowChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_engine_fault.data, p->lamp_engine_fault(), [this](qint8 value) {
        emit this->lamp_engine_faultChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampDynamotorInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::DynamotorLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::DynamotorLampFrame>(msg);
    updateStates<qint8>(mStateData.lamp_motor_out_of_service.data, p->lamp_motor_out_of_service(), [this](qint8 value) {
        emit this->lamp_motor_out_of_serviceChanged(value);
    });
    updateStates<qint8>(mStateData.lamp_moter_fire_igon.data, p->lamp_moter_fire_igon(), [this](qint8 value) {
        emit this->lamp_moter_fire_igonChanged(value);
    });
}


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
}

void CustomCarMsgWorker::handleProtoBatteryGroupVoltageMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu> p = carfox::down_pointer_cast<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu>(msg);
}

void CustomCarMsgWorker::handleProtoBatteryGroupTemperatureMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu> p = carfox::down_pointer_cast<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu>(msg);
}

void CustomCarMsgWorker::handleProtoAirCtrlSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyAirCtrlSystemInfo::AirCtrlSystemMenu> p = carfox::down_pointer_cast<fyAirCtrlSystemInfo::AirCtrlSystemMenu>(msg);
}


void CustomCarMsgWorker::handleProtoSymbolLampMiscLampInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::MiscLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::MiscLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampCorneringInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::CorneringLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::CorneringLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampLightInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::LightLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::LightLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampGateInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::GateLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::GateLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampBrakeInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::BrakeLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::BrakeLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampAirPressureInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::AirPressureLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::AirPressureLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampShoeWearInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::ShoeLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::ShoeLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampChargingInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::ChargingLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::ChargingLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampWaterInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::WaterLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::WaterLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampStopInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::StopLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::StopLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampMoterInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::MoterLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::MoterLampFrame>(msg);
}

void CustomCarMsgWorker::handleProtoSymbolLampDynamotorInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::DynamotorLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::DynamotorLampFrame>(msg);
}

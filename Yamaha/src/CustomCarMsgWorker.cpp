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

void CustomCarMsgWorker::menuInfoRequest(qint64 MenuNo, qint64 pageNo) {
    fyMenuIdRequestInfo::MenuIdRequest menuInfo;
    fyMenuIdRequestInfo::MenuIdRequest_MenuType type = (fyMenuIdRequestInfo::MenuIdRequest_MenuType)MenuNo;
    menuInfo.set_menu_number(type);
    menuInfo.set_page_number(pageNo);
    sendProtoMsg(menuInfo);
}

void CustomCarMsgWorker::yxMenuIdRequest(qint64 MenuNo, qint64 pageNo) {
    fyMenuIdRequestInfo::YxMenuIdRequest menuInfo;
    fyMenuIdRequestInfo::YxMenuIdRequest_yx_MenuType type = (fyMenuIdRequestInfo::YxMenuIdRequest_yx_MenuType)MenuNo;
    menuInfo.set_yx_menu_number(type);
    menuInfo.set_yx_page_number(pageNo);
    sendProtoMsg(menuInfo);
}

void CustomCarMsgWorker::datetimeInfoRequest(qint64 msec) {
    fySystemSettingsInfo::DateTime timeInfo;
    timeInfo.set_date_time(msec);
    sendProtoMsg(timeInfo);
}

void CustomCarMsgWorker::upgradeStartRequest() {
    fySystemSettingsInfo::UpgradeSettings upgrade;
    upgrade.set_msg_id(fySystemSettingsInfo::UpgradeSettings::UPDATE_NOTIFY);
    sendProtoMsg(upgrade);
}

void CustomCarMsgWorker::tripMilesClearRequest() {
    fySystemSettingsInfo::MilesClearSettings tripClear;
    tripClear.set_trip_miles_clear(true);
    sendProtoMsg(tripClear);
}

void CustomCarMsgWorker::registerCallback()
{
    //通用信息
    mHandler.registerMsgCallback(fyGeneralInfo::KeyFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoKey, this, _1));
    mHandler.registerMsgCallback(fyGeneralInfo::GeneralFrame::descriptor(), bind(&CustomCarMsgWorker::handleGeneralInfoFrame, this, _1));
    mHandler.registerMsgCallback(fyGeneralInfo::ControlFrame::descriptor(), bind(&CustomCarMsgWorker::handleControlInfoFrame, this, _1));
    mHandler.registerMsgCallback(fyGeneralInfo::CustomFrame::descriptor(), bind(&CustomCarMsgWorker::handleCustomInfoFrame, this, _1));
    mHandler.registerMsgCallback(fyGeneralInfo::mixedFrame::descriptor(), bind(&CustomCarMsgWorker::handleMixedInfoFrame, this, _1));
    //系统设置信息
    mHandler.registerMsgCallback(fySystemSettingsInfo::DateTime::descriptor(), bind(&CustomCarMsgWorker::handleProtoDatetime, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::MilesClearSettings::descriptor(), bind(&CustomCarMsgWorker::handleMilesClear, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::UpgradeSettings::descriptor(), bind(&CustomCarMsgWorker::handleProtoUpgradeNotify, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::CloseBuzzerSettings::descriptor(), bind(&CustomCarMsgWorker::handleProtoCloseBuzzer, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::DateTimeVerify::descriptor(), bind(&CustomCarMsgWorker::handleProtoDateTimeVerify, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::MilesClearVerify::descriptor(), bind(&CustomCarMsgWorker::handleProtoMilesClearVerify, this, _1));
    mHandler.registerMsgCallback(fySystemSettingsInfo::CloseBuzzerVerify::descriptor(), bind(&CustomCarMsgWorker::handleProtoCloseBuzzerVerify, this, _1));
    //控制系统信息
    mHandler.registerMsgCallback(fyControlSystemInfo::ControlSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoControlSystemMenuInfo, this, _1));
    //仪表信息
    mHandler.registerMsgCallback(fyInstrumentInfo::InstrumentFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoInstrumentFrameInfo, this, _1));
    //前模块信息
    mHandler.registerMsgCallback(fyModuleFrontInfo::ModuleFrontElectricFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoFrontElectricFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleFrontInfo::ModuleFrontFaultFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoFrontFaultFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleFrontInfo::ModuleFrontControlFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoFrontControlFrameInfo, this, _1));
    //中模块信息
    mHandler.registerMsgCallback(fyModuleMiddleInfo::ModuleMiddleElectricFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoMiddleElectricFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleMiddleInfo::ModuleMiddleFaultFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoMiddleFaultFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleMiddleInfo::ModuleMiddleControlFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoMiddleControlFrameInfo, this, _1));
    //后模块信息
    mHandler.registerMsgCallback(fyModuleBackInfo::ModuleBackElectricFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoBackElectricFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleBackInfo::ModuleBackFaultFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoBackFaultFrameInfo, this, _1));
    mHandler.registerMsgCallback(fyModuleBackInfo::ModuleBackControlFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoBackControlFrameInfo, this, _1));
    //警告信息
    mHandler.registerMsgCallback(fyWarningInfo::WarningFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoWarningFrameInfo, this, _1));
    //发动机系统信息
    mHandler.registerMsgCallback(fyMoterSystemInfo::MoterSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoMoterSystemMenuInfo, this, _1));
    //辅助系统信息
    mHandler.registerMsgCallback(fyAuxiliarySystemInfo::AuxiliarySystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoAuxiliarySystemMenuInfo, this, _1));
    //TCU系统信息
    mHandler.registerMsgCallback(fyTcuSystemInfo::TcuSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoTcuSystemMenuInfo, this, _1));
    //电池管理系统信息
    mHandler.registerMsgCallback(fyBatteryManageSystemInfo::BatteryManageSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryManageSystemMenuInfo, this, _1));
    //电池组电压信息
    //mHandler.registerMsgCallback(fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryGroupVoltageMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyBatteryGroupVoltageInfo::BatterySingleVoltage::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatterySingleVoltageMenuInfo, this, _1));
    //电池组温度信息
    //mHandler.registerMsgCallback(fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryGroupTemperatureMenuInfo, this, _1));
    mHandler.registerMsgCallback(fyBatteryGroupTemperatureInfo::BatterySingleTemperature::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatterySingleTemperatureMenuInfo, this, _1));
    //空调系统信息
    mHandler.registerMsgCallback(fyAirCtrlSystemInfo::AirCtrlSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoAirCtrlSystemMenuInfo, this, _1));
    //DC/DC状态信息系统
    mHandler.registerMsgCallback(fyDcStatusMessageSystemInfo::DcStatusMessageMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoDcStatusMessageMenuInfo, this, _1));
    //符号信息
    mHandler.registerMsgCallback(fyPicLampInfo::PicLampFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoPicLampFrameInfo, this, _1));
    //胎压监测系统
    mHandler.registerMsgCallback(fyTirePressInfo::TirePressInfoFrame::descriptor(), bind(&CustomCarMsgWorker::handleProtoTirePressInfoFrameInfo, this, _1));
    //请求菜单返回信息
    //mHandler.registerMsgCallback(fyMenuIdRequestInfo::MenuIdRequest::descriptor(), bind(&CustomCarMsgWorker::menuInfoRequest, this, _1));
    //mHandler.registerMsgCallback(fyMenuIdRequestInfo::YxMenuIdRequest::descriptor(), bind(&CustomCarMsgWorker::yxMenuIdRequest, this, _1));
    mHandler.registerMsgCallback(fyMenuIdRequestInfo::yxMenuIdVerity::descriptor(), bind(&CustomCarMsgWorker::handleProtoYxMenuIdRequest, this, _1));
    //整车控制系统诊断信息
    mHandler.registerMsgCallback(fyControlSystemDiagnoseInfo::ControlSystemDiagnoseMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoControlSystemDiagnoseMenuInfo, this, _1));
    //动力电池诊断系统信息
    mHandler.registerMsgCallback(fyImpetusBatteryDiagnoseSystemInfo::BatteryDiagnoseSystemMenu::descriptor(), bind(&CustomCarMsgWorker::handleProtoBatteryDiagnoseSystemMenuInfo, this, _1));
}
//按键操作
void CustomCarMsgWorker::handleProtoKey(const carfox::MessagePtr &msg)
{
    qDebug() << "CustomCarMsgWorker::handleProtoKey";
    shared_ptr<fyGeneralInfo::KeyFrame> p = carfox::down_pointer_cast<fyGeneralInfo::KeyFrame>(msg);
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
/*
void CustomCarMsgWorker::handleProtoAutoFlash(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::AnimationFlash> p = carfox::down_pointer_cast<fySystemSettingsInfo::AnimationFlash>(msg);
    updateStates<qint8>(mStateData.carMode.data, p->auto_flash(), [this](qint8 value) {
        emit this->carModeChanged(value);
    });
}
*/
//基本信息
void CustomCarMsgWorker::handleGeneralInfoFrame(const carfox::MessagePtr &msg)
{
    shared_ptr<fyGeneralInfo::GeneralFrame> p = carfox::down_pointer_cast<fyGeneralInfo::GeneralFrame>(msg);
    qDebug() << "===gear value:" << p->gear();
    updateStates<float>(mStateData.carSpeed.data, p->speed(), [this](float value) {
        emit this->carSpeedChanged(value);
    });
    updateStates<float>(mStateData.rpm.data, p->rpm(), [this](float value) {
        emit this->rpmChanged(value);
    });
    updateStates<qint32>(mStateData.battery.data, p->battery(), [this](qint32 value) {
        emit this->batteryChanged(value);
    });
    updateStates<qint32>(mStateData.dateTime.data, p->date_time(), [this](quint32 value) {
        emit this->dateTimeChanged(value);
    });
    updateStates<qint32>(mStateData.gear.data, p->gear(), [this](qint32 value) {
        emit this->gearChanged(value);
    });
    updateStates<quint32>(mStateData.odo.data, p->odo(), [this](quint32 value) {
        emit this->odoChanged(value);
    });
    updateStates<float>(mStateData.trip.data, p->trip(), [this](float value) {
        emit this->tripChanged(value);
    });
}
//控制信息
void CustomCarMsgWorker::handleControlInfoFrame(const carfox::MessagePtr &msg)
{
    shared_ptr<fyGeneralInfo::ControlFrame> p = carfox::down_pointer_cast<fyGeneralInfo::ControlFrame>(msg);
    updateStates<qint32>(mStateData.carMode.data, p->control_signal(), [this](qint32 value) {
        emit this->carModeChanged(value);
    });
}
//扩展信息
void CustomCarMsgWorker::handleCustomInfoFrame(const carfox::MessagePtr &msg)
{
    shared_ptr<fyGeneralInfo::CustomFrame> p = carfox::down_pointer_cast<fyGeneralInfo::CustomFrame>(msg);
    updateStates<float>(mStateData.totalVoltage.data, p->total_voltage(), [this](float value) {
        emit this->totalVoltageChanged(value);
    });
    updateStates<float>(mStateData.totalCurrent.data, p->total_current(), [this](float value) {
        emit this->totalCurrentChanged(value);
    });
    updateStates<float>(mStateData.soc.data, p->soc(), [this](float value) {
        emit this->socChanged(value);
    });
    updateStates<float>(mStateData.apVol1.data, p->air_press1(), [this](float value) {
        emit this->apVol1Changed(value);
    });
    updateStates<float>(mStateData.apVol2.data, p->air_press2(), [this](float value) {
        emit this->apVol2Changed(value);
    });
    updateStates<qint32>(mStateData.moterControlTemp.data, p->moter_control_temperature(), [this](qint32 value) {
        emit this->moterControlTempChanged(value);
    });
    updateStates<qint32>(mStateData.moterTemp.data, p->moter_temperature(), [this](qint32 value) {
        emit this->moterTempChanged(value);
    });
    updateStates<qint32>(mStateData.engineWaterTemp.data, p->engine_water_temp(), [this](qint32 value) {
        emit this->engineWaterTempChanged(value);
    });
    updateStates<quint32>(mStateData.faultLevel.data, p->fault_level(), [this](quint32 value) {
        emit this->faultLevelChanged(value);
    });
    updateStates<qint32>(mStateData.faultCode.data, p->fault_code(), [this](qint32 value) {
        emit this->faultCodeChanged(value);
    });
    updateStates<qint32>(mStateData.spn.data, p->spn(), [this](qint32 value) {
        emit this->spnChanged(value);
    });
    updateStates<qint32>(mStateData.ureaLevel.data, p->urea_level(), [this](qint32 value) {
        emit this->ureaLevelChanged(value);
    });
    updateStates<quint32>(mStateData.oilLevel.data, p->oil_level(), [this](quint32 value) {
        emit this->oilLevelChanged(value);
    });
    updateStates<float>(mStateData.engineOilPressure.data, p->engine_oil_pressure(), [this](float value) {
        emit this->engineOilPressureChanged(value);
    });
    updateStates<float>(mStateData.aloneBatteryLowVoltage.data, p->alone_battery_low_voltage(), [this](float value) {
        emit this->aloneBatteryLowVoltageChanged(value);
    });
    updateStates<float>(mStateData.aloneBatteryHighVoltage.data, p->alone_battery_high_voltage(), [this](float value) {
        emit this->aloneBatteryHighVoltageChanged(value);
    });
    updateStates<qint32>(mStateData.batteryHighTemperature.data, p->battery_high_temperature(), [this](qint32 value) {
        emit this->batteryHighTemperatureChanged(value);
    });
    updateStates<qint32>(mStateData.batteryLowTemperature.data, p->battery_low_temperature(), [this](qint32 value) {
        emit this->batteryLowTemperatureChanged(value);
    });
    updateStates<float>(mStateData.batteryPackEnergy.data, p->battery_pack_energy(), [this](float value) {
        emit this->batteryPackEnergyChanged(value);
    });
}
//杂项信息查询
void CustomCarMsgWorker::handleMixedInfoFrame(const carfox::MessagePtr &msg)
{
    shared_ptr<fyGeneralInfo::mixedFrame> p = carfox::down_pointer_cast<fyGeneralInfo::mixedFrame>(msg);
    updateStates<qint32>(mStateData.velocityRatio.data, p->velocity_ratio(), [this](qint32 value) {
        emit this->velocityRatioChanged(value);
    });
    updateStates<bool>(mStateData.buzzerStatus.data, p->buzzer_status(), [this](bool value) {
        emit this->buzzerStatusChanged(value);
    });
}
//日期
void CustomCarMsgWorker::handleProtoDatetime(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::DateTime> p = carfox::down_pointer_cast<fySystemSettingsInfo::DateTime>(msg);
    updateStates<qint32>(mStateData.dateTime.data, p->date_time(), [this](qint32 value) {
        emit this->dateTimeChanged(value);
    });
}
void CustomCarMsgWorker::handleProtoDateTimeVerify(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::DateTimeVerify> p = carfox::down_pointer_cast<fySystemSettingsInfo::DateTimeVerify>(msg);
    updateStates<bool>(mStateData.checkDateTimeSetting.data, p->check_date_time(), [this](bool value) {
        emit this->checkDateTimeChanged(value);
    });
}
//里程清零
void CustomCarMsgWorker::handleMilesClear(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::MilesClearSettings> p = carfox::down_pointer_cast<fySystemSettingsInfo::MilesClearSettings>(msg);
    updateStates<bool>(mStateData.tripMilesClear.data, p->trip_miles_clear(), [this](bool value) {
        emit this->tripMilesClearChanged(value);
    });
}
void CustomCarMsgWorker::handleProtoMilesClearVerify(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::MilesClearVerify> p = carfox::down_pointer_cast<fySystemSettingsInfo::MilesClearVerify>(msg);
    updateStates<bool>(mStateData.checkMilesClear.data, p->check_miles_clear(), [this](bool value) {
        emit this->checkMilesClearChanged(value);
    });
}
//升级
void CustomCarMsgWorker::handleProtoUpgradeNotify(const carfox::MessagePtr &msg) {
    shared_ptr<fySystemSettingsInfo::UpgradeSettings> p = carfox::down_pointer_cast<fySystemSettingsInfo::UpgradeSettings>(msg);
    updateStates<qint32>(mStateData.upgradeMsgId.data, p->msg_id(), [this](qint32 value) {
        emit this->upgradeMsgIdChanged(value);
    });
    updateStates<QString>(mStateData.upgradeMsgCtx.data, QString::fromStdString(p->msg_content()), [this](QString value) {
        emit this->upgradeMsgCtxChanged(value);
    });
}
//关闭蜂鸣器
void CustomCarMsgWorker::handleProtoCloseBuzzer(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::CloseBuzzerSettings> p = carfox::down_pointer_cast<fySystemSettingsInfo::CloseBuzzerSettings>(msg);
    updateStates<bool>(mStateData.closeBuzzerClear.data, p->close_buzzer(), [this](bool value) {
        emit this->closeBuzzerClearChanged(value);
    });
}
void CustomCarMsgWorker::handleProtoCloseBuzzerVerify(const carfox::MessagePtr &msg)
{
    shared_ptr<fySystemSettingsInfo::CloseBuzzerVerify> p = carfox::down_pointer_cast<fySystemSettingsInfo::CloseBuzzerVerify>(msg);
    updateStates<bool>(mStateData.checkCloseBuzzerClear.data, p->check_close_buzzer(), [this](bool value) {
        emit this->checkCloseBuzzerClearChanged(value);
    });
}
//控制信息
void CustomCarMsgWorker::handleProtoControlSystemMenuInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyControlSystemInfo::ControlSystemMenu> p = carfox::down_pointer_cast<fyControlSystemInfo::ControlSystemMenu>(msg);
    updateStates<float>(mStateData.motorInVoltage.data, p->motor_in_voltage(), [this](float value) {
        emit this->motorInVoltageChanged(value);
    });
    updateStates<float>(mStateData.motorInCurrent.data, p->motor_in_current(), [this](float value) {
        emit this->motorInCurrentChanged(value);
    });
    updateStates<qint32>(mStateData.motorTemp.data, p->motor_temp(), [this](qint32 value) {
        emit this->motorTempChanged(value);
    });
    updateStates<qint32>(mStateData.motorControllerTemp.data, p->motor_controller_temp(), [this](qint32 value) {
        emit this->motorControllerTempChanged(value);
    });
    updateStates<qint32>(mStateData.carVcuMode.data, p->car_mode(), [this](qint32 value) {
        emit this->carVcuModeChanged(value);
    });
    updateStates<double>(mStateData.version.data, p->version(), [this](double value) {
        emit this->versionChanged(value);
    });
    updateStates<qint32>(mStateData.carLife.data, p->car_life(), [this](qint32 value) {
        emit this->carLifeChanged(value);
    });
    updateStates<float>(mStateData.accelPedalPercent.data, p->accel_pedal_percent(), [this](float value) {
        emit this->accelPedalPercentChanged(value);
    });
    updateStates<float>(mStateData.brakePedalPercent.data, p->brake_pedal_percent(), [this](float value) {
        emit this->brakePedalPercentChanged(value);
    });
    updateStates<quint32>(mStateData.din1.data, p->din1(), [this](quint32 value) {
        emit this->din1Changed(value);
    });
    updateStates<quint32>(mStateData.din2.data, p->din2(), [this](quint32 value) {
        emit this->din2Changed(value);
    });
    updateStates<quint32>(mStateData.din3.data, p->din3(), [this](quint32 value) {
        emit this->din3Changed(value);
    });
    updateStates<quint32>(mStateData.dout1.data, p->dout1(), [this](quint32 value) {
        emit this->dout1Changed(value);
    });
    updateStates<quint32>(mStateData.dout2.data, p->dout2(), [this](quint32 value) {
        emit this->dout2Changed(value);
    });
    updateStates<quint32>(mStateData.dout3.data, p->dout3(), [this](quint32 value) {
        emit this->dout3Changed(value);
    });
    updateStates<quint32>(mStateData.driveSystemStatus.data, p->drive_system_status(), [this](quint32 value) {
        emit this->driveSystemStatusChanged(value);
    });
    updateStates<quint32>(mStateData.driveMotorStatus.data, p->drive_motor_status(), [this](quint32 value) {
        emit this->driveMotorStatusChanged(value);
    });
    updateStates<quint32>(mStateData.mechanicalBrakeStatus.data, p->mechanical_brake_status(), [this](quint32 value) {
        emit this->mechanicalBrakeStatusChanged(value);
    });
    updateStates<bool>(mStateData.keyAcc.data, p->key_acc(), [this](bool value) {
        emit this->keyAccChanged(value);
    });
    updateStates<bool>(mStateData.keyOn.data, p->key_on(), [this](bool value) {
        emit this->keyOnChanged(value);
    });
    updateStates<bool>(mStateData.highVoltageInterLock.data, p->high_voltage_interlock(), [this](bool value) {
        emit this->highVoltageInterlockChanged(value);
    });
    updateStates<bool>(mStateData.highVoltagePowerUp.data, p->high_voltage_power_up(), [this](bool value) {
        emit this->highVoltagePowerUpChanged(value);
    });
    updateStates<bool>(mStateData.airCompressorWork.data, p->air_compressor_work(), [this](bool value) {
        emit this->airCompressorWorkChanged(value);
    });
    updateStates<bool>(mStateData.boosterPumpWork.data, p->booster_pump_work(), [this](bool value) {
        emit this->boosterPumpWorkChanged(value);
    });
    updateStates<float>(mStateData.airCompressorMotorSpeed.data, p->air_compressor_motor_speed(), [this](float value) {
        emit this->airCompressorMotorSpeedChanged(value);
    });
    updateStates<float>(mStateData.steeringAssistMotorSpeed.data, p->steering_assist_motor_speed(), [this](float value) {
        emit this->steeringAssistMotorSpeedChanged(value);
    });
    updateStates<qint32>(mStateData.steeringAssistMotorTemp.data, p->steering_assist_motor_temp(), [this](qint32 value) {
        emit this->steeringAssistMotorTempChanged(value);
    });
    updateStates<qint32>(mStateData.airCompressorMotorTemp.data, p->air_compressor_motor_temp(), [this](qint32 value) {
        emit this->airCompressorMotorTempChanged(value);
    });
    updateStates<qint32>(mStateData.airCompressorControlTemp.data, p->air_compressor_control_temp(), [this](qint32 value) {
        emit this->airCompressorControlTempChanged(value);
    });
    updateStates<qint32>(mStateData.steeringControlDeviceTemp.data, p->steering_control_device_temp(), [this](qint32 value) {
        emit this->steeringControlDeviceTempChanged(value);
    });
    updateStates<float>(mStateData.airPress3.data, p->air_press3(), [this](float value) {
        emit this->airPress3Changed(value);
    });
    updateStates<float>(mStateData.airPress4.data, p->air_press4(), [this](float value) {
        emit this->airPress4Changed(value);
    });
    updateStates<float>(mStateData.airPress5.data, p->air_press5(), [this](float value) {
        emit this->airPress5Changed(value);
    });
    updateStates<qint32>(mStateData.highestAlarmGrade.data, p->highest_alarm_grade(), [this](qint32 value) {
        emit this->highestAlarmGradeChanged(value);
    });
    updateStates<qint32>(mStateData.faultAlarmSituation.data, p->fault_alarm_situation(), [this](qint32 value) {
        emit this->faultAlarmSituationChanged(value);
    });
    updateStates<qint32>(mStateData.driveGearsMode.data, p->drive_gears_mode(), [this](qint32 value) {
        emit this->driveGearsModeChanged(value);
    });
    updateStates<qint32>(mStateData.bduSwitch.data, p->bdu_switch(), [this](qint32 value) {
        emit this->bduSwitchChanged(value);
    });
}
//仪表开关量信息
void CustomCarMsgWorker::handleProtoInstrumentFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyInstrumentInfo::InstrumentFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::InstrumentFrame>(msg);
    updateStates<bool>(mStateData.inputCtrl01.data, p->input_ctrl_01(), [this](bool value) {
        emit this->inputCtrl01Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl02.data, p->input_ctrl_02(), [this](bool value) {
        emit this->inputCtrl02Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl03.data, p->input_ctrl_03(), [this](bool value) {
        emit this->inputCtrl03Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl04.data, p->input_ctrl_04(), [this](bool value) {
        emit this->inputCtrl04Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl05.data, p->input_ctrl_05(), [this](bool value) {
        emit this->inputCtrl05Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl06.data, p->input_ctrl_06(), [this](bool value) {
        emit this->inputCtrl06Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl07.data, p->input_ctrl_07(), [this](bool value) {
        emit this->inputCtrl07Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl08.data, p->input_ctrl_08(), [this](bool value) {
        emit this->inputCtrl08Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl09.data, p->input_ctrl_09(), [this](bool value) {
        emit this->inputCtrl09Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl10.data, p->input_ctrl_10(), [this](bool value) {
        emit this->inputCtrl10Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl11.data, p->input_ctrl_11(), [this](bool value) {
        emit this->inputCtrl11Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl12.data, p->input_ctrl_12(), [this](bool value) {
        emit this->inputCtrl12Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl13.data, p->input_ctrl_13(), [this](bool value) {
        emit this->inputCtrl13Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl14.data, p->input_ctrl_14(), [this](bool value) {
        emit this->inputCtrl14Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl15.data, p->input_ctrl_15(), [this](bool value) {
        emit this->inputCtrl15Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl16.data, p->input_ctrl_16(), [this](bool value) {
        emit this->inputCtrl16Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl17.data, p->input_ctrl_17(), [this](bool value) {
        emit this->inputCtrl17Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl18.data, p->input_ctrl_18(), [this](bool value) {
        emit this->inputCtrl18Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl19.data, p->input_ctrl_19(), [this](bool value) {
        emit this->inputCtrl19Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl20.data, p->input_ctrl_20(), [this](bool value) {
        emit this->inputCtrl20Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl21.data, p->input_ctrl_21(), [this](bool value) {
        emit this->inputCtrl21Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl22.data, p->input_ctrl_22(), [this](bool value) {
        emit this->inputCtrl22Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl23.data, p->input_ctrl_23(), [this](bool value) {
        emit this->inputCtrl23Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl24.data, p->input_ctrl_24(), [this](bool value) {
        emit this->inputCtrl24Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl25.data, p->input_ctrl_25(), [this](bool value) {
        emit this->inputCtrl25Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl26.data, p->input_ctrl_26(), [this](bool value) {
        emit this->inputCtrl26Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl27.data, p->input_ctrl_27(), [this](bool value) {
        emit this->inputCtrl27Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl28.data, p->input_ctrl_28(), [this](bool value) {
        emit this->inputCtrl28Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl29.data, p->input_ctrl_29(), [this](bool value) {
        emit this->inputCtrl29Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl30.data, p->input_ctrl_30(), [this](bool value) {
        emit this->inputCtrl30Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl31.data, p->input_ctrl_31(), [this](bool value) {
        emit this->inputCtrl31Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl32.data, p->input_ctrl_32(), [this](bool value) {
        emit this->inputCtrl32Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl33.data, p->input_ctrl_33(), [this](bool value) {
        emit this->inputCtrl33Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl34.data, p->input_ctrl_34(), [this](bool value) {
        emit this->inputCtrl34Changed(value);
    });
    updateStates<bool>(mStateData.inputCtrl35.data, p->input_ctrl_35(), [this](bool value) {
        emit this->inputCtrl35Changed(value);
    });
}
//前模块输出电流
void CustomCarMsgWorker::handleProtoFrontElectricFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleFrontInfo::ModuleFrontElectricFrame> p = carfox::down_pointer_cast<fyModuleFrontInfo::ModuleFrontElectricFrame>(msg);
    updateStates<float>(mStateData.frontOutputCurrent01.data, p->output_current_01(), [this](float value) {
       emit this->frontOutputCurrent01Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent02.data, p->output_current_02(), [this](float value) {
       emit this->frontOutputCurrent02Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent03.data, p->output_current_03(), [this](float value) {
       emit this->frontOutputCurrent03Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent04.data, p->output_current_04(), [this](float value) {
       emit this->frontOutputCurrent04Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent05.data, p->output_current_05(), [this](float value) {
       emit this->frontOutputCurrent05Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent06.data, p->output_current_06(), [this](float value) {
       emit this->frontOutputCurrent06Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent07.data, p->output_current_07(), [this](float value) {
       emit this->frontOutputCurrent07Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent08.data, p->output_current_08(), [this](float value) {
       emit this->frontOutputCurrent08Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent09.data, p->output_current_09(), [this](float value) {
       emit this->frontOutputCurrent09Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent10.data, p->output_current_10(), [this](float value) {
       emit this->frontOutputCurrent10Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent11.data, p->output_current_11(), [this](float value) {
       emit this->frontOutputCurrent11Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent12.data, p->output_current_12(), [this](float value) {
       emit this->frontOutputCurrent12Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent13.data, p->output_current_13(), [this](float value) {
       emit this->frontOutputCurrent13Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent14.data, p->output_current_14(), [this](float value) {
       emit this->frontOutputCurrent14Changed(value);
    });
    updateStates<float>(mStateData.frontOutputCurrent15.data, p->output_current_15(), [this](float value) {
       emit this->frontOutputCurrent15Changed(value);
    });
}
//前模块输出状态
void CustomCarMsgWorker::handleProtoFrontFaultFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleFrontInfo::ModuleFrontFaultFrame> p = carfox::down_pointer_cast<fyModuleFrontInfo::ModuleFrontFaultFrame>(msg);
    updateStates<qint32>(mStateData.frontOutputFault01.data, p->output_fault_01(), [this](qint32 value) {
       emit this->frontOutputFault01Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault02.data, p->output_fault_02(), [this](qint32 value) {
       emit this->frontOutputFault02Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault03.data, p->output_fault_03(), [this](qint32 value) {
       emit this->frontOutputFault03Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault04.data, p->output_fault_04(), [this](qint32 value) {
       emit this->frontOutputFault04Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault05.data, p->output_fault_05(), [this](qint32 value) {
       emit this->frontOutputFault05Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault06.data, p->output_fault_06(), [this](qint32 value) {
       emit this->frontOutputFault06Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault07.data, p->output_fault_07(), [this](qint32 value) {
       emit this->frontOutputFault07Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault08.data, p->output_fault_08(), [this](qint32 value) {
       emit this->frontOutputFault08Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault09.data, p->output_fault_09(), [this](qint32 value) {
       emit this->frontOutputFault09Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault10.data, p->output_fault_10(), [this](qint32 value) {
       emit this->frontOutputFault10Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault11.data, p->output_fault_11(), [this](qint32 value) {
       emit this->frontOutputFault11Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault12.data, p->output_fault_12(), [this](qint32 value) {
       emit this->frontOutputFault12Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault13.data, p->output_fault_13(), [this](qint32 value) {
       emit this->frontOutputFault13Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault14.data, p->output_fault_14(), [this](qint32 value) {
       emit this->frontOutputFault14Changed(value);
    });
    updateStates<qint32>(mStateData.frontOutputFault15.data, p->output_fault_15(), [this](qint32 value) {
       emit this->frontOutputFault15Changed(value);
    });
}
//前模块输入控制
void CustomCarMsgWorker::handleProtoFrontControlFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleFrontInfo::ModuleFrontControlFrame> p = carfox::down_pointer_cast<fyModuleFrontInfo::ModuleFrontControlFrame>(msg);
    updateStates<bool>(mStateData.frontSwitch01.data, p->switch_01(), [this](bool value) {
       emit this->frontSwitch01Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch02.data, p->switch_02(), [this](bool value) {
       emit this->frontSwitch02Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch03.data, p->switch_03(), [this](bool value) {
       emit this->frontSwitch03Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch04.data, p->switch_04(), [this](bool value) {
       emit this->frontSwitch04Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch05.data, p->switch_05(), [this](bool value) {
       emit this->frontSwitch05Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch06.data, p->switch_06(), [this](bool value) {
       emit this->frontSwitch06Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch07.data, p->switch_07(), [this](bool value) {
       emit this->frontSwitch07Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch08.data, p->switch_08(), [this](bool value) {
       emit this->frontSwitch08Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch09.data, p->switch_09(), [this](bool value) {
       emit this->frontSwitch09Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch10.data, p->switch_10(), [this](bool value) {
       emit this->frontSwitch10Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch11.data, p->switch_11(), [this](bool value) {
       emit this->frontSwitch11Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch12.data, p->switch_12(), [this](bool value) {
       emit this->frontSwitch12Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch13.data, p->switch_13(), [this](bool value) {
       emit this->frontSwitch13Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch14.data, p->switch_14(), [this](bool value) {
       emit this->frontSwitch14Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch15.data, p->switch_15(), [this](bool value) {
       emit this->frontSwitch15Changed(value);
    });
    updateStates<bool>(mStateData.frontSwitch16.data, p->switch_16(), [this](bool value) {
       emit this->frontSwitch16Changed(value);
    });
    updateStates<float>(mStateData.frontAnalogInput01.data, p->analog_input_01(), [this](float value) {
       emit this->frontAnalogInput01Changed(value);
    });
    updateStates<float>(mStateData.frontAnalogInput01.data, p->analog_input_02(), [this](float value) {
       emit this->frontAnalogInput02Changed(value);
    });
    updateStates<qint32>(mStateData.frontHzInput.data, p->hz_input(), [this](qint32 value) {
       emit this->frontHzInputChanged(value);
    });
    updateStates<qint32>(mStateData.frontSpeedInput.data, p->speed_input(), [this](qint32 value) {
       emit this->frontSpeedInputChanged(value);
    });
}
//中模块输出电流
void CustomCarMsgWorker::handleProtoMiddleElectricFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleMiddleInfo::ModuleMiddleElectricFrame> p = carfox::down_pointer_cast<fyModuleMiddleInfo::ModuleMiddleElectricFrame>(msg);
    updateStates<float>(mStateData.middleOutputCurrent01.data, p->output_current_01(), [this](float value) {
       emit this->middleOutputCurrent01Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent02.data, p->output_current_02(), [this](float value) {
       emit this->middleOutputCurrent02Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent03.data, p->output_current_03(), [this](float value) {
       emit this->middleOutputCurrent03Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent04.data, p->output_current_04(), [this](float value) {
       emit this->middleOutputCurrent04Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent05.data, p->output_current_05(), [this](float value) {
       emit this->middleOutputCurrent05Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent06.data, p->output_current_06(), [this](float value) {
       emit this->middleOutputCurrent06Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent07.data, p->output_current_07(), [this](float value) {
       emit this->middleOutputCurrent07Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent08.data, p->output_current_08(), [this](float value) {
       emit this->middleOutputCurrent08Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent09.data, p->output_current_09(), [this](float value) {
       emit this->middleOutputCurrent09Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent10.data, p->output_current_10(), [this](float value) {
       emit this->middleOutputCurrent10Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent11.data, p->output_current_11(), [this](float value) {
       emit this->middleOutputCurrent11Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent12.data, p->output_current_12(), [this](float value) {
       emit this->middleOutputCurrent12Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent13.data, p->output_current_13(), [this](float value) {
       emit this->middleOutputCurrent13Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent14.data, p->output_current_14(), [this](float value) {
       emit this->middleOutputCurrent14Changed(value);
    });
    updateStates<float>(mStateData.middleOutputCurrent15.data, p->output_current_15(), [this](float value) {
       emit this->middleOutputCurrent15Changed(value);
    });
}
//中模块输出状态
void CustomCarMsgWorker::handleProtoMiddleFaultFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleMiddleInfo::ModuleMiddleFaultFrame> p = carfox::down_pointer_cast<fyModuleMiddleInfo::ModuleMiddleFaultFrame>(msg);
    updateStates<qint32>(mStateData.middleOutputFault01.data, p->output_fault_01(), [this](qint32 value) {
       emit this->middleOutputFault01Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault02.data, p->output_fault_02(), [this](qint32 value) {
       emit this->middleOutputFault02Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault03.data, p->output_fault_03(), [this](qint32 value) {
       emit this->middleOutputFault03Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault04.data, p->output_fault_04(), [this](qint32 value) {
       emit this->middleOutputFault04Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault05.data, p->output_fault_05(), [this](qint32 value) {
       emit this->middleOutputFault05Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault06.data, p->output_fault_06(), [this](qint32 value) {
       emit this->middleOutputFault06Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault07.data, p->output_fault_07(), [this](qint32 value) {
       emit this->middleOutputFault07Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault08.data, p->output_fault_08(), [this](qint32 value) {
       emit this->middleOutputFault08Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault09.data, p->output_fault_09(), [this](qint32 value) {
       emit this->middleOutputFault09Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault10.data, p->output_fault_10(), [this](qint32 value) {
       emit this->middleOutputFault10Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault11.data, p->output_fault_11(), [this](qint32 value) {
       emit this->middleOutputFault11Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault12.data, p->output_fault_12(), [this](qint32 value) {
       emit this->middleOutputFault12Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault13.data, p->output_fault_13(), [this](qint32 value) {
       emit this->middleOutputFault13Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault14.data, p->output_fault_14(), [this](qint32 value) {
       emit this->middleOutputFault14Changed(value);
    });
    updateStates<qint32>(mStateData.middleOutputFault15.data, p->output_fault_15(), [this](qint32 value) {
       emit this->middleOutputFault15Changed(value);
    });
}
//中模块输入控制
void CustomCarMsgWorker::handleProtoMiddleControlFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleMiddleInfo::ModuleMiddleControlFrame> p = carfox::down_pointer_cast<fyModuleMiddleInfo::ModuleMiddleControlFrame>(msg);
    updateStates<bool>(mStateData.middleSwitch01.data, p->switch_01(), [this](bool value) {
       emit this->middleSwitch01Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch02.data, p->switch_02(), [this](bool value) {
       emit this->middleSwitch02Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch03.data, p->switch_03(), [this](bool value) {
       emit this->middleSwitch03Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch04.data, p->switch_04(), [this](bool value) {
       emit this->middleSwitch04Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch05.data, p->switch_05(), [this](bool value) {
       emit this->middleSwitch05Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch06.data, p->switch_06(), [this](bool value) {
       emit this->middleSwitch06Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch07.data, p->switch_07(), [this](bool value) {
       emit this->middleSwitch07Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch08.data, p->switch_08(), [this](bool value) {
       emit this->middleSwitch08Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch09.data, p->switch_09(), [this](bool value) {
       emit this->middleSwitch09Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch10.data, p->switch_10(), [this](bool value) {
       emit this->middleSwitch10Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch11.data, p->switch_11(), [this](bool value) {
       emit this->middleSwitch11Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch12.data, p->switch_12(), [this](bool value) {
       emit this->middleSwitch12Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch13.data, p->switch_13(), [this](bool value) {
       emit this->middleSwitch13Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch14.data, p->switch_14(), [this](bool value) {
       emit this->middleSwitch14Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch15.data, p->switch_15(), [this](bool value) {
       emit this->middleSwitch15Changed(value);
    });
    updateStates<bool>(mStateData.middleSwitch16.data, p->switch_16(), [this](bool value) {
       emit this->middleSwitch16Changed(value);
    });
    updateStates<float>(mStateData.middleAnalogInput01.data, p->analog_input_01(), [this](float value) {
       emit this->middleAnalogInput01Changed(value);
    });
    updateStates<float>(mStateData.middleAnalogInput02.data, p->analog_input_02(), [this](float value) {
       emit this->middleAnalogInput02Changed(value);
    });
    updateStates<qint32>(mStateData.middleHzInput.data, p->hz_input(), [this](qint32 value) {
       emit this->middleHzInputChanged(value);
    });
    updateStates<qint32>(mStateData.middleSpeedInput.data, p->speed_input(), [this](qint32 value) {
       emit this->middleSpeedInputChanged(value);
    });
}
//后模块输出电流
void CustomCarMsgWorker::handleProtoBackElectricFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleBackInfo::ModuleBackElectricFrame> p = carfox::down_pointer_cast<fyModuleBackInfo::ModuleBackElectricFrame>(msg);
    updateStates<float>(mStateData.backOutputCurrent01.data, p->output_current_01(), [this](float value) {
       emit this->backOutputCurrent01Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent02.data, p->output_current_02(), [this](float value) {
       emit this->backOutputCurrent02Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent03.data, p->output_current_03(), [this](float value) {
       emit this->backOutputCurrent03Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent04.data, p->output_current_04(), [this](float value) {
       emit this->backOutputCurrent04Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent05.data, p->output_current_05(), [this](float value) {
       emit this->backOutputCurrent05Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent06.data, p->output_current_06(), [this](float value) {
       emit this->backOutputCurrent06Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent07.data, p->output_current_07(), [this](float value) {
       emit this->backOutputCurrent07Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent08.data, p->output_current_08(), [this](float value) {
       emit this->backOutputCurrent08Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent09.data, p->output_current_09(), [this](float value) {
       emit this->backOutputCurrent09Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent10.data, p->output_current_10(), [this](float value) {
       emit this->backOutputCurrent10Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent11.data, p->output_current_11(), [this](float value) {
       emit this->backOutputCurrent11Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent12.data, p->output_current_12(), [this](float value) {
       emit this->backOutputCurrent12Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent13.data, p->output_current_13(), [this](float value) {
       emit this->backOutputCurrent13Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent14.data, p->output_current_14(), [this](float value) {
       emit this->backOutputCurrent14Changed(value);
    });
    updateStates<float>(mStateData.backOutputCurrent15.data, p->output_current_15(), [this](float value) {
       emit this->backOutputCurrent15Changed(value);
    });
}
//后模块输出状态
void CustomCarMsgWorker::handleProtoBackFaultFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleBackInfo::ModuleBackFaultFrame> p = carfox::down_pointer_cast<fyModuleBackInfo::ModuleBackFaultFrame>(msg);
    updateStates<qint32>(mStateData.backOutputFault01.data, p->output_fault_01(), [this](qint32 value) {
       emit this->backOutputFault01Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault02.data, p->output_fault_02(), [this](qint32 value) {
       emit this->backOutputFault02Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault03.data, p->output_fault_03(), [this](qint32 value) {
       emit this->backOutputFault03Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault04.data, p->output_fault_04(), [this](qint32 value) {
       emit this->backOutputFault04Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault05.data, p->output_fault_05(), [this](qint32 value) {
       emit this->backOutputFault05Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault06.data, p->output_fault_06(), [this](qint32 value) {
       emit this->backOutputFault06Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault07.data, p->output_fault_07(), [this](qint32 value) {
       emit this->backOutputFault07Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault08.data, p->output_fault_08(), [this](qint32 value) {
       emit this->backOutputFault08Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault09.data, p->output_fault_09(), [this](qint32 value) {
       emit this->backOutputFault09Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault10.data, p->output_fault_10(), [this](qint32 value) {
       emit this->backOutputFault10Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault11.data, p->output_fault_11(), [this](qint32 value) {
       emit this->backOutputFault11Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault12.data, p->output_fault_12(), [this](qint32 value) {
       emit this->backOutputFault12Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault13.data, p->output_fault_13(), [this](qint32 value) {
       emit this->backOutputFault13Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault14.data, p->output_fault_14(), [this](qint32 value) {
       emit this->backOutputFault14Changed(value);
    });
    updateStates<qint32>(mStateData.backOutputFault15.data, p->output_fault_15(), [this](qint32 value) {
       emit this->backOutputFault15Changed(value);
    });
}
//后模块输入控制
void CustomCarMsgWorker::handleProtoBackControlFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyModuleBackInfo::ModuleBackControlFrame> p = carfox::down_pointer_cast<fyModuleBackInfo::ModuleBackControlFrame>(msg);
    updateStates<bool>(mStateData.backSwitch01.data, p->switch_01(), [this](bool value) {
       emit this->backSwitch01Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch02.data, p->switch_02(), [this](bool value) {
       emit this->backSwitch02Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch03.data, p->switch_03(), [this](bool value) {
       emit this->backSwitch03Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch04.data, p->switch_04(), [this](bool value) {
       emit this->backSwitch04Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch05.data, p->switch_05(), [this](bool value) {
       emit this->backSwitch05Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch06.data, p->switch_06(), [this](bool value) {
       emit this->backSwitch06Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch07.data, p->switch_07(), [this](bool value) {
       emit this->backSwitch07Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch08.data, p->switch_08(), [this](bool value) {
       emit this->backSwitch08Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch09.data, p->switch_09(), [this](bool value) {
       emit this->backSwitch09Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch10.data, p->switch_10(), [this](bool value) {
       emit this->backSwitch10Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch11.data, p->switch_11(), [this](bool value) {
       emit this->backSwitch11Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch12.data, p->switch_12(), [this](bool value) {
       emit this->backSwitch12Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch13.data, p->switch_13(), [this](bool value) {
       emit this->backSwitch13Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch14.data, p->switch_14(), [this](bool value) {
       emit this->backSwitch14Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch15.data, p->switch_15(), [this](bool value) {
       emit this->backSwitch15Changed(value);
    });
    updateStates<bool>(mStateData.backSwitch16.data, p->switch_16(), [this](bool value) {
       emit this->backSwitch16Changed(value);
    });
    updateStates<float>(mStateData.backAnalogInput01.data, p->analog_input_01(), [this](float value) {
       emit this->backAnalogInput01Changed(value);
    });
    updateStates<float>(mStateData.backAnalogInput02.data, p->analog_input_02(), [this](float value) {
       emit this->backAnalogInput02Changed(value);
    });
    updateStates<qint32>(mStateData.backHzInput.data, p->hz_input(), [this](qint32 value) {
       emit this->backHzInputChanged(value);
    });
    updateStates<qint32>(mStateData.backSpeedInput.data, p->speed_input(), [this](qint32 value) {
       emit this->backSpeedInputChanged(value);
    });
}
//警告提示
void CustomCarMsgWorker::handleProtoWarningFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyWarningInfo::WarningFrame> p = carfox::down_pointer_cast<fyWarningInfo::WarningFrame>(msg);
    updateStates<qint32>(mStateData.warningId.data, p->warning_id(), [this](qint32 value) {
       emit this->warningIdChanged(value);
    });
}
//发动机信息
void CustomCarMsgWorker::handleProtoMoterSystemMenuInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyMoterSystemInfo::MoterSystemMenu> p = carfox::down_pointer_cast<fyMoterSystemInfo::MoterSystemMenu>(msg);
    updateStates<float>(mStateData.engineFuelConsumption.data, p->engine_fuel_consumption(), [this](float value) {
       emit this->engineFuelConsumptionChanged(value);
    });
    updateStates<qint32>(mStateData.engineLoad.data, p->engine_load(), [this](qint32 value) {
       emit this->engineLoadChanged(value);
    });
    updateStates<float>(mStateData.engineTargetThrottle.data, p->engine_target_throttle(), [this](float value) {
       emit this->engineTargetThrottleChanged(value);
    });
    updateStates<float>(mStateData.engineActualThrottle.data, p->engine_actual_throttle(), [this](float value) {
       emit this->engineActualThrottleChanged(value);
    });
    updateStates<qint32>(mStateData.engineInletTemperature.data, p->engine_inlet_temperature(), [this](qint32 value) {
       emit this->engineInletTemperatureChanged(value);
    });
}
//辅助信息
void CustomCarMsgWorker::handleProtoAuxiliarySystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyAuxiliarySystemInfo::AuxiliarySystemMenu> p = carfox::down_pointer_cast<fyAuxiliarySystemInfo::AuxiliarySystemMenu>(msg);
    updateStates<float>(mStateData.oilPumpDcacWoutputCurrent.data, p->oil_pump_dcac_w_output_current(), [this](float value) {
        emit this->oilPumpDcacWoutputCurrentChanged(value);
    });
    updateStates<float>(mStateData.oilPumpDcacVoutputCurrent.data, p->oil_pump_dcac_v_output_current(), [this](float value) {
        emit this->oilPumpDcacVoutputCurrentChanged(value);
    });
    updateStates<float>(mStateData.oilPumpDcacUoutputCurrent.data, p->oil_pump_dcac_u_output_current(), [this](float value) {
        emit this->oilPumpDcacUoutputCurrentChanged(value);
    });
    updateStates<qint32>(mStateData.radiatorTemperature.data, p->radiator_temperature(), [this](qint32 value) {
        emit this->radiatorTemperatureChanged(value);
    });
}
//TCU信息
void CustomCarMsgWorker::handleProtoTcuSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyTcuSystemInfo::TcuSystemMenu> p = carfox::down_pointer_cast<fyTcuSystemInfo::TcuSystemMenu>(msg);
    updateStates<qint32>(mStateData.actualClutchPosition.data, p->actual_clutch_position(), [this](qint32 value) {
        emit this->actualClutchPositionChanged(value);
    });
    updateStates<quint32>(mStateData.tcuFaultCode.data, p->tcu_fault_code(), [this](quint32 value) {
        emit this->tcuFaultCodeChanged(value);
    });
    updateStates<qint32>(mStateData.axisRpm.data, p->axis_rpm(), [this](qint32 value) {
        emit this->axisRpmChanged(value);
    });
    updateStates<qint32>(mStateData.fmi.data, p->fmi(), [this](qint32 value) {
        emit this->fmiChanged(value);
    });
    updateStates<qint32>(mStateData.cm.data, p->cm(), [this](qint32 value) {
        emit this->cmChanged(value);
    });
    updateStates<quint32>(mStateData.oc.data, p->oc(), [this](quint32 value) {
        emit this->ocChanged(value);
    });
}
//电池管理信息
void CustomCarMsgWorker::handleProtoBatteryManageSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryManageSystemInfo::BatteryManageSystemMenu> p = carfox::down_pointer_cast<fyBatteryManageSystemInfo::BatteryManageSystemMenu>(msg);
    updateStates<float>(mStateData.batMaxChargeCurrent.data, p->bat_max_charge_current(), [this](float value) {
        emit this->batMaxChargeCurrentChanged(value);
    });
    updateStates<float>(mStateData.batMaxDischargeCurrent.data, p->bat_max_discharge_current(), [this](float value) {
        emit this->batMaxDischargeCurrentChanged(value);
    });
    updateStates<float>(mStateData.batAverageVoltage.data, p->bat_average_voltage(), [this](float value) {
        emit this->batAverageVoltageChanged(value);
    });
    updateStates<quint32>(mStateData.batStatus1.data, p->bat_status1(), [this](quint32 value) {
        emit this->batStatus1Changed(value);
    });
    updateStates<quint32>(mStateData.batStatus2.data, p->bat_status2(), [this](quint32 value) {
        emit this->batStatus2Changed(value);
    });
    updateStates<quint32>(mStateData.batStatus3.data, p->bat_status3(), [this](quint32 value) {
        emit this->batStatus3Changed(value);
    });
    updateStates<float>(mStateData.irmOhmPositive.data, p->irm_ohm_positive(), [this](float value) {
        emit this->irmOhmPositiveChanged(value);
    });
    updateStates<float>(mStateData.irmOhmNegative.data, p->irm_ohm_negative(), [this](float value) {
        emit this->irmOhmNegativeChanged(value);
    });
    updateStates<float>(mStateData.batMaxVoltage.data, p->bat_max_voltage(), [this](float value) {
        emit this->batMaxVoltageChanged(value);
    });
    updateStates<float>(mStateData.batMinVoltage.data, p->bat_min_voltage(), [this](float value) {
        emit this->batMinVoltageChanged(value);
    });
    updateStates<float>(mStateData.batteryHighestTemp.data, p->battery_highest_temp(), [this](float value) {
        emit this->batteryHighestTempChanged(value);
    });
    updateStates<float>(mStateData.bmsVersion.data, p->bms_version(), [this](float value) {
        emit this->bmsVersionChanged(value);
    });
    updateStates<qint32>(mStateData.bmsModuleAmount.data, p->bms_module_amount(), [this](qint32 value) {
        emit this->bmsModuleAmountChanged(value);
    });
    updateStates<qint32>(mStateData.bmsLife.data, p->bms_life(), [this](qint32 value) {
        emit this->bmsLifeChanged(value);
    });
    updateStates<qint32>(mStateData.batteryPackHighestTemp.data, p->battery_pack_highest_temp(), [this](qint32 value) {
        emit this->batteryPackHighestTempChanged(value);
    });
    updateStates<qint32>(mStateData.batteryPackMinTemp.data, p->battery_pack_min_temp(), [this](qint32 value) {
        emit this->batteryPackMinTempChanged(value);
    });
    updateStates<float>(mStateData.batteryManagePackEnergy.data, p->battery_pack_elec(), [this](float value) {
        emit this->batteryManagePackEnergyChanged(value);
    });
    updateStates<qint32>(mStateData.bmsControlStatus.data, p->bms_control_status(), [this](qint32 value) {
        emit this->bmsControlStatusChanged(value);
    });
    updateStates<qint32>(mStateData.batAmount.data, p->bat_amount(), [this](qint32 value) {
        emit this->batAmountChanged(value);
    });
    updateStates<qint32>(mStateData.rechargeStatus.data, p->recharge_status(), [this](qint32 value) {
        emit this->rechargeStatusChanged(value);
    });
    updateStates<qint32>(mStateData.tempStyletAmount.data, p->temp_stylet_amount(), [this](qint32 value) {
        emit this->tempStyletAmountChanged(value);
    });
    updateStates<qint32>(mStateData.outletPositiveTemp.data, p->outlet_positive_temp(), [this](qint32 value) {
        emit this->outletPositiveTempChanged(value);
    });
    updateStates<qint32>(mStateData.outletNegativeTemp.data, p->outlet_negative_temp(), [this](qint32 value) {
        emit this->outletNegativeTempChanged(value);
    });
    updateStates<qint32>(mStateData.powerBatteryType.data, p->power_battery_type(), [this](qint32 value) {
        emit this->powerBatteryTypeChanged(value);
    });
    updateStates<qint32>(mStateData.powerBatteryRecharge.data, p->power_battery_recharge(), [this](qint32 value) {
        emit this->powerBatteryRechargeChanged(value);
    });
}
//单体电压
void CustomCarMsgWorker::handleProtoBatterySingleVoltageMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupVoltageInfo::BatterySingleVoltage> p = carfox::down_pointer_cast<fyBatteryGroupVoltageInfo::BatterySingleVoltage>(msg);
    mBatVoltageData.clear();
    for(uint i=0; i<p->addr_number(); i++) {
        mBatVoltageData.insert(QString::number(i+1), p->voltage(i));
    }
    /*
    for(int i=0; i<60; i++) {
        mBatVoltageData.insert(QString::number(i+1), 0.66 + i);
    }
    */
    emit this->batVoltageChanged(mBatVoltageData);
    //qDebug() << "mBatVoltageData:::::::::::::::::::::::::::::::" << mBatVoltageData;
}
//单体温度
void CustomCarMsgWorker::handleProtoBatterySingleTemperatureMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupTemperatureInfo::BatterySingleTemperature> p = carfox::down_pointer_cast<fyBatteryGroupTemperatureInfo::BatterySingleTemperature>(msg);
    mBatTempData.clear();
    /*
    for(int i=0; i<20; i++) {
        mBatTempData.insert(QString::number(i+1), 0.11 + i);
    }
    */
    for(uint i=0; i<p->addr_number(); i++) {
        mBatTempData.insert(QString::number(i+1), p->temperature(i));
    }
    emit this->batTempChanged(mBatTempData);
}
//空调信息
void CustomCarMsgWorker::handleProtoAirCtrlSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyAirCtrlSystemInfo::AirCtrlSystemMenu> p = carfox::down_pointer_cast<fyAirCtrlSystemInfo::AirCtrlSystemMenu>(msg);
    updateStates<quint32>(mStateData.acFaultCode.data, p->ac_fault_code(), [this](quint32 value) {
        emit this->acFaultCodeChanged(value);
    });
    updateStates<quint32>(mStateData.acFanStatus.data, p->ac_fan_status(), [this](quint32 value) {
        emit this->acFanStatusChanged(value);
    });
    updateStates<quint32>(mStateData.acWorkStatus.data, p->ac_work_status(), [this](quint32 value) {
        emit this->acWorkStatusChanged(value);
    });
    updateStates<quint32>(mStateData.acLife.data, p->ac_life(), [this](quint32 value) {
        emit this->acLifeChanged(value);
    });
    updateStates<qint32>(mStateData.acOutTemp.data, p->ac_out_temp(), [this](qint32 value) {
        emit this->acOutTempChanged(value);
    });
    updateStates<qint32>(mStateData.acInTemp.data, p->ac_in_temp(), [this](qint32 value) {
        emit this->acInTempChanged(value);
    });
    updateStates<qint32>(mStateData.acSetTemp.data, p->ac_set_temp(), [this](qint32 value) {
        emit this->acSetTempChanged(value);
    });
    updateStates<quint32>(mStateData.acRefrigereReq.data, p->ac_refrigere_req(), [this](quint32 value) {
        emit this->acRefrigereReqChanged(value);
    });
}
//DC/DC状态信息
void CustomCarMsgWorker::handleProtoDcStatusMessageMenuInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyDcStatusMessageSystemInfo::DcStatusMessageMenu> p = carfox::down_pointer_cast<fyDcStatusMessageSystemInfo::DcStatusMessageMenu>(msg);
    updateStates<float>(mStateData.dcLowVoltage.data, p->dc_low_voltage(), [this](float value) {
        emit this->dcLowVoltageChanged(value);
    });
    updateStates<float>(mStateData.dcLowCurrent.data, p->dc_low_current(), [this](float value) {
        emit this->dcLowCurrentChanged(value);
    });
    updateStates<qint32>(mStateData.dcTemp.data, p->dc_temp(), [this](qint32 value) {
        emit this->dcTempChanged(value);
    });
    updateStates<qint32>(mStateData.dcStatus2.data, p->dc_status(), [this](qint32 value) {
        emit this->dcStatus2Changed(value);
    });
    updateStates<bool>(mStateData.dcUndervoltage.data, p->dc_undervoltage(), [this](bool value) {
        emit this->dcUndervoltageChanged(value);
    });
    updateStates<bool>(mStateData.dcOvervoltage.data, p->dc_overvoltage(), [this](bool value) {
        emit this->dcOvervoltageChanged(value);
    });
    updateStates<bool>(mStateData.dcOverheating.data, p->dc_overheating(), [this](bool value) {
        emit this->dcOverheatingChanged(value);
    });
    updateStates<bool>(mStateData.dcShortCircuit.data, p->dc_short_circuit(), [this](bool value) {
        emit this->dcShortCircuitChanged(value);
    });
    updateStates<bool>(mStateData.dcWorkStatus.data, p->dc_work_status(), [this](bool value) {
        emit this->dcWorkStatusChanged(value);
    });
}
//符号片显示
void CustomCarMsgWorker::handleProtoPicLampFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyPicLampInfo::PicLampFrame> p = carfox::down_pointer_cast<fyPicLampInfo::PicLampFrame>(msg);
    updateStates<bool>(mStateData.lampKeyOn.data, p->lamp_key_on(), [this](bool value) {
        emit this->lampKeyOnChanged(value);
    });
    updateStates<bool>(mStateData.lampAirFilter.data, p->lamp_air_filter(), [this](bool value) {
        emit this->lampAirFilterChanged(value);
    });
    updateStates<bool>(mStateData.lampAsr.data, p->lamp_asr(), [this](bool value) {
        emit this->lampAsrChanged(value);
    });
    updateStates<bool>(mStateData.lampHighVoltageMaintenance.data, p->lamp_high_voltage_maintenance(), [this](bool value) {
        emit this->lampHighVoltageMaintenanceChanged(value);
    });
    updateStates<bool>(mStateData.lampDefroster.data, p->lamp_defroster(), [this](bool value) {
        emit this->lampDefrosterChanged(value);
    });
    updateStates<bool>(mStateData.lampDryere.data, p->lamp_dryere(), [this](bool value) {
        emit this->lampDryereChanged(value);
    });
    updateStates<bool>(mStateData.lampAbs.data, p->lamp_abs(), [this](bool value) {
        emit this->lampAbsChanged(value);
    });
    updateStates<bool>(mStateData.lampAc.data, p->lamp_ac(), [this](bool value) {
        emit this->lampAcChanged(value);
    });
    updateStates<bool>(mStateData.powerSupply.data, p->power_pure_electric_mode(), [this](bool value) {
        emit this->powerSupplyChanged(value);
    });
    updateStates<bool>(mStateData.powerPlugInMode.data, p->power_plug_in_mode(), [this](bool value) {
        emit this->powerPlugInModeChanged(value);
    });
    updateStates<bool>(mStateData.powerByvridMode.data, p->power_byvrid_mode(), [this](bool value) {
        emit this->powerByvridModeChanged(value);
    });
    updateStates<bool>(mStateData.climbingMode.data, p->climbing_mode(), [this](bool value) {
        emit this->climbingModeChanged(value);
    });
    updateStates<bool>(mStateData.diagnosticMode.data, p->diagnostic_mode(), [this](bool value) {
        emit this->diagnosticModeChanged(value);
    });
    updateStates<bool>(mStateData.lampTurnLeft.data, p->lamp_turn_left(), [this](bool value) {
        emit this->lampTurnLeftChanged(value);
    });
    updateStates<bool>(mStateData.lampTurnRight.data, p->lamp_turn_right(), [this](bool value) {
        emit this->lampTurnRightChanged(value);
    });
    updateStates<bool>(mStateData.lampDoubleFlash.data, p->lamp_double_flash(), [this](bool value) {
        emit this->lampDoubleFlashChanged(value);
    });
    updateStates<bool>(mStateData.lampFrontFog.data, p->lamp_front_fog(), [this](bool value) {
        emit this->lampFrontFogChanged(value);
    });
    updateStates<bool>(mStateData.lampRearFog.data, p->lamp_rear_fog(), [this](bool value) {
        emit this->lampRearFogChanged(value);
    });
    updateStates<bool>(mStateData.lampHighBeam.data, p->lamp_high_beam(), [this](bool value) {
        emit this->lampHighBeamChanged(value);
    });
    updateStates<bool>(mStateData.lampHeadLight.data, p->lamp_head_light(), [this](bool value) {
        emit this->lampHeadLightChanged(value);
    });
    updateStates<bool>(mStateData.lampReverseGear.data, p->lamp_reverse_gear(), [this](bool value) {
        emit this->lampReverseGearChanged(value);
    });
    updateStates<bool>(mStateData.lampPositionLight.data, p->lamp_position_light(), [this](bool value) {
        emit this->lampPositionLightChanged(value);
    });
    updateStates<bool>(mStateData.lampGate1.data, p->lamp_gate1(), [this](bool value) {
        emit this->lampGate1Changed(value);
    });
    updateStates<bool>(mStateData.lampGate2.data, p->lamp_gate2(), [this](bool value) {
        emit this->lampGate2Changed(value);
    });
    updateStates<bool>(mStateData.lampRearDoorOpen.data, p->lamp_rear_door_open(), [this](bool value) {
        emit this->lampRearDoorOpenChanged(value);
    });
    updateStates<bool>(mStateData.lampBrake.data, p->lamp_brake(), [this](bool value) {
        emit this->lampBrakeChanged(value);
    });
    updateStates<bool>(mStateData.lampParkingBrake.data, p->lamp_parking_brake(), [this](bool value) {
        emit this->lampParkingBrakeChanged(value);
    });
    updateStates<bool>(mStateData.lampLeftLowAirPressure.data, p->lamp_left_low_air_pressure(), [this](bool value) {
        emit this->lampLeftLowAirPressureChanged(value);
    });
    updateStates<bool>(mStateData.lampRightLowAirPressure.data, p->lamp_right_low_air_pressure(), [this](bool value) {
        emit this->lampRightLowAirPressureChanged(value);
    });
    updateStates<bool>(mStateData.lampLeftShoeWear.data, p->lamp_left_shoe_wear(), [this](bool value) {
        emit this->lampLeftShoeWearChanged(value);
    });
    updateStates<bool>(mStateData.lampRightShoeWear.data, p->lamp_right_shoe_wear(), [this](bool value) {
        emit this->lampRightShoeWearChanged(value);
    });
    updateStates<bool>(mStateData.lampChargeConfirm.data, p->lamp_charge_confirm(), [this](bool value) {
        emit this->lampChargeConfirmChanged(value);
    });
    updateStates<bool>(mStateData.lampBatteryMainContact.data, p->lamp_battery_main_contact(), [this](bool value) {
        emit this->lampBatteryMainContactChanged(value);
    });
    updateStates<bool>(mStateData.lampWaterTempHigh.data, p->lamp_water_temp_high(), [this](bool value) {
        emit this->lampWaterTempHighChanged(value);
    });
    updateStates<bool>(mStateData.lampWaterLevelLow.data, p->lamp_water_level_low(), [this](bool value) {
        emit this->lampWaterLevelLowChanged(value);
    });
    updateStates<bool>(mStateData.lampLowServiceWl.data, p->lamp_low_service_wl(), [this](bool value) {
        emit this->lampLowServiceWlChanged(value);
    });
    updateStates<bool>(mStateData.lampHeavyStopWl.data, p->lamp_heavy_stop_wl(), [this](bool value) {
        emit this->lampHeavyStopWlChanged(value);
    });
    updateStates<bool>(mStateData.lampSeriousStopWl.data, p->lamp_serious_stop_wl(), [this](bool value) {
        emit this->lampSeriousStopWlChanged(value);
    });
    updateStates<bool>(mStateData.lampOilLevelLow.data, p->lamp_oil_level_low(), [this](bool value) {
        emit this->lampOilLevelLowChanged(value);
    });
    updateStates<bool>(mStateData.lampOilPressureLow.data, p->lamp_oil_pressure_low(), [this](bool value) {
        emit this->lampOilPressureLowChanged(value);
    });
    updateStates<bool>(mStateData.lampEngineFault.data, p->lamp_engine_fault(), [this](bool value) {
        emit this->lampEngineFaultChanged(value);
    });
    updateStates<bool>(mStateData.lampMotorOutOfService.data, p->lamp_motor_out_of_service(), [this](bool value) {
        emit this->lampMotorOutOfServiceChanged(value);
    });
    updateStates<bool>(mStateData.lampMoterFireIgon.data, p->lamp_moter_fire_igon(), [this](bool value) {
        emit this->lampMoterFireIgonChanged(value);
    });
    updateStates<bool>(mStateData.lampAfterTreat.data, p->lamp_after_treat(), [this](bool value) {
        emit this->lampAfterTreatChanged(value);
    });
    updateStates<bool>(mStateData.lampWarningLed.data, p->lamp_warning_led(), [this](bool value) {
        emit this->lampWarningLedChanged(value);
    });
    updateStates<bool>(mStateData.airPress1Lamp.data, p->air_press1(), [this](bool value) {
        emit this->airPress1LampChanged(value);
    });
    updateStates<bool>(mStateData.airPress2Lamp.data, p->air_press2(), [this](bool value) {
        emit this->airPress2LampChanged(value);
    });
    updateStates<bool>(mStateData.airPress3Lamp.data, p->air_press3(), [this](bool value) {
        emit this->airPress3LampChanged(value);
    });
    updateStates<bool>(mStateData.airPress4Lamp.data, p->air_press4(), [this](bool value) {
        emit this->airPress4LampChanged(value);
    });
    updateStates<bool>(mStateData.airPress5Lamp.data, p->air_press5(), [this](bool value) {
        emit this->airPress5LampChanged(value);
    });
    updateStates<bool>(mStateData.powerDoorsOpen.data, p->power_doors_open(), [this](bool value) {
        emit this->powerDoorsOpenChanged(value);
    });
    updateStates<bool>(mStateData.powerBatteryCutOff.data, p->power_battery_cut_off(), [this](bool value) {
        emit this->powerBatteryCutOffChanged(value);
    });
    updateStates<bool>(mStateData.seatbeltNotFastened.data, p->seatbelt_not_fastened(), [this](bool value) {
        emit this->seatbeltNotFastenedChanged(value);
    });
    updateStates<bool>(mStateData.forwardGear.data, p->forward_gear(), [this](bool value) {
        emit this->forwardGearChanged(value);
    });
    updateStates<bool>(mStateData.neutralGear.data, p->neutral_gear(), [this](bool value) {
        emit this->neutralGearChanged(value);
    });
    updateStates<bool>(mStateData.reverseGear.data, p->reverse_gear(), [this](bool value) {
        emit this->reverseGearChanged(value);
    });
    updateStates<bool>(mStateData.electronicInSlope.data, p->electronic_in_slope(), [this](bool value) {
        emit this->electronicInSlopeChanged(value);
    });
    updateStates<bool>(mStateData.ascd.data, p->ascd(), [this](bool value) {
        emit this->ascdChanged(value);
    });
    updateStates<bool>(mStateData.ready.data, p->ready(), [this](bool value) {
        emit this->readyChanged(value);
    });
    updateStates<bool>(mStateData.powerAccumulatorsChargeStatus.data, p->power_accumulators_charge_status(), [this](bool value) {
        emit this->powerAccumulatorsChargeStatusChanged(value);
    });
    updateStates<bool>(mStateData.cableConnect.data, p->cable_connect(), [this](bool value) {
        emit this->cableConnectChanged(value);
    });
    updateStates<bool>(mStateData.controlMotorOverheating.data, p->control_motor_overheating(), [this](bool value) {
        emit this->controlMotorOverheatingChanged(value);
    });
    updateStates<bool>(mStateData.powerAccumulatorsFault.data, p->power_accumulators_fault(), [this](bool value) {
        emit this->powerAccumulatorsFaultChanged(value);
    });
    updateStates<bool>(mStateData.driverSystemFault.data, p->driver_system_fault(), [this](bool value) {
        emit this->driverSystemFaultChanged(value);
    });
    updateStates<bool>(mStateData.severityInsulationFault.data, p->severity_insulation_fault(), [this](bool value) {
        emit this->severityInsulationFaultChanged(value);
    });
    updateStates<bool>(mStateData.slightInsulationFault.data, p->slight_insulation_fault(), [this](bool value) {
        emit this->slightInsulationFaultChanged(value);
    });
    updateStates<bool>(mStateData.motorPowerLimitation.data, p->motor_power_limitation(), [this](bool value) {
        emit this->motorPowerLimitationChanged(value);
    });
    updateStates<bool>(mStateData.bmsAlarm.data, p->bms_alarm(), [this](bool value) {
        emit this->bmsAlarmChanged(value);
    });
    updateStates<bool>(mStateData.socLowAram.data, p->soc_low_aram(), [this](bool value) {
        emit this->socLowAramChanged(value);
    });
    updateStates<bool>(mStateData.safetySystemAlarm.data, p->safety_system_alarm(), [this](bool value) {
        emit this->safetySystemAlarmChanged(value);
    });
    updateStates<bool>(mStateData.leftDoorsOpenAlarm.data, p->left_doors_open_alarm(), [this](bool value) {
        emit this->leftDoorsOpenAlarmChanged(value);
    });
    updateStates<bool>(mStateData.rightDoorsOpenAlarm.data, p->right_doors_open_alarm(), [this](bool value) {
        emit this->rightDoorsOpenAlarmChanged(value);
    });
    updateStates<bool>(mStateData.barrierFreeMarchReach.data, p->barrier_free_march_reach(), [this](bool value) {
        emit this->barrierFreeMarchReachChanged(value);
    });
    updateStates<bool>(mStateData.gateChargeOpen.data, p->gate_charge_open(), [this](bool value) {
        emit this->gateChargeOpenChanged(value);
    });
    updateStates<bool>(mStateData.driverSeatAlarm.data, p->driver_seat_alarm(), [this](bool value) {
        emit this->driverSeatAlarmChanged(value);
    });
    updateStates<bool>(mStateData.ecasSystemFaultLed.data, p->ecas_system_fault_led(), [this](bool value) {
        emit this->ecasSystemFaultLedChanged(value);
    });
    updateStates<bool>(mStateData.ecasAlarmLed.data, p->ecas_alarm_led(), [this](bool value) {
        emit this->ecasAlarmLedChanged(value);
    });
    updateStates<bool>(mStateData.ecasKneelingStatusLed.data, p->ecas_kneeling_status_led(), [this](bool value) {
        emit this->ecasKneelingStatusLedChanged(value);
    });
    updateStates<bool>(mStateData.ecasSpecialHeightLed.data, p->ecas_special_height_led(), [this](bool value) {
        emit this->ecasSpecialHeightLedChanged(value);
    });
    updateStates<bool>(mStateData.dropOffDoorbell.data, p->drop_off_doorbell(), [this](bool value) {
        emit this->dropOffDoorbellChanged(value);
    });
    updateStates<bool>(mStateData.wait.data, p->wait(), [this](bool value) {
        emit this->waitChanged(value);
    });
    updateStates<bool>(mStateData.frontDoorExigencyAlarm.data, p->front_door_exigency_alarm(), [this](bool value) {
        emit this->frontDoorExigencyAlarmChanged(value);
    });
    updateStates<bool>(mStateData.middleDoorExigencyAlarm.data, p->middle_door_exigency_alarm(), [this](bool value) {
        emit this->middleDoorExigencyAlarmChanged(value);
    });
    updateStates<bool>(mStateData.stop.data, p->stop(), [this](bool value) {
        emit this->stopChanged(value);
    });
}
//胎压监测系统信息
void CustomCarMsgWorker::handleProtoTirePressInfoFrameInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyTirePressInfo::TirePressInfoFrame> p = carfox::down_pointer_cast<fyTirePressInfo::TirePressInfoFrame>(msg);
    updateStates<float>(mStateData.frontLeftTirePress.data, p->front_left_tire_press(), [this](float value) {
        emit this->frontLeftTirePressChanged(value);
    });
    updateStates<float>(mStateData.fronRightTirePress.data, p->fron_right_tire_press(), [this](float value) {
        emit this->fronRightTirePressChanged(value);
    });
    updateStates<float>(mStateData.backLeftTirePress1.data, p->back_left_tire_press1(), [this](float value) {
        emit this->backLeftTirePress1Changed(value);
    });
    updateStates<float>(mStateData.backRightTirePress1.data, p->back_right_tire_press1(), [this](float value) {
        emit this->backRightTirePress1Changed(value);
    });
    updateStates<float>(mStateData.backLeftTirePress2.data, p->back_left_tire_press2(), [this](float value) {
        emit this->backLeftTirePress2Changed(value);
    });
    updateStates<float>(mStateData.backRightTirePress2.data, p->back_right_tire_press2(), [this](float value) {
        emit this->backRightTirePress2Changed(value);
    });
    updateStates<qint32>(mStateData.frontLeftTireTemp.data, p->front_left_tire_temp(), [this](qint32 value) {
        emit this->frontLeftTireTempChanged(value);
    });
    updateStates<qint32>(mStateData.frontRightTireTemp.data, p->front_right_tire_temp(), [this](qint32 value) {
        emit this->frontRightTireTempChanged(value);
    });
    updateStates<qint32>(mStateData.backLeftTireTemp1.data, p->back_left_tire_temp1(), [this](qint32 value) {
        emit this->backLeftTireTemp1Changed(value);
    });
    updateStates<qint32>(mStateData.backRightTireTemp1.data, p->back_right_tire_temp1(), [this](qint32 value) {
        emit this->backRightTireTemp1Changed(value);
    });
    updateStates<qint32>(mStateData.backLeftTireTemp2.data, p->back_left_tire_temp2(), [this](qint32 value) {
        emit this->backLeftTireTemp2Changed(value);
    });
    updateStates<qint32>(mStateData.backRightTireTemp2.data, p->back_right_tire_temp2(), [this](qint32 value) {
        emit this->backRightTireTemp2Changed(value);
    });
}
//请求菜单信息返回状态
void CustomCarMsgWorker::handleProtoYxMenuIdRequest(const carfox::MessagePtr &msg)
{
    shared_ptr<fyMenuIdRequestInfo::yxMenuIdVerity> p = carfox::down_pointer_cast<fyMenuIdRequestInfo::yxMenuIdVerity>(msg);
    updateStates<bool>(mStateData.yxCheckRequestMenu.data, p->yx_check_request_menu(), [this](bool value) {
        emit this->yxCheckRequestMenuChanged(value);
    });
}
//控制系统诊断信息
void CustomCarMsgWorker::handleProtoControlSystemDiagnoseMenuInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyControlSystemDiagnoseInfo::ControlSystemDiagnoseMenu> p = carfox::down_pointer_cast<fyControlSystemDiagnoseInfo::ControlSystemDiagnoseMenu>(msg);
    updateStates<bool>(mStateData.driveFaultAlarm.data, p->drive_fault_alarm(), [this](bool value) {
        emit this->driveFaultAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlOvervoltageAlarm.data, p->control_overvoltage_alarm(), [this](bool value) {
        emit this->controlOvervoltageAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlUndervoltageAlarm.data, p->control_undervoltage_alarm(), [this](bool value) {
        emit this->controlUndervoltageAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlEncodingFault.data, p->control_encoding_fault(), [this](bool value) {
        emit this->controlEncodingFaultChanged(value);
    });
    updateStates<bool>(mStateData.controlHighTempAlarm.data, p->control_high_temp_alarm(), [this](bool value) {
        emit this->controlHighTempAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlHighTempAbortAlarm.data, p->control_high_temp_abort_alarm(), [this](bool value) {
        emit this->controlHighTempAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlMainContactorFault.data, p->control_main_contactor_fault(), [this](bool value) {
        emit this->controlMainContactorFaultChanged(value);
    });
    updateStates<bool>(mStateData.controlOvercurrentAlarm.data, p->control_overcurrent_alarm(), [this](bool value) {
        emit this->controlOvercurrentAlarmChanged(value);
    });
    updateStates<bool>(mStateData.motorHighTempAlarm.data, p->motor_high_temp_alarm(), [this](bool value) {
        emit this->motorHighTempAlarmChanged(value);
    });
    updateStates<bool>(mStateData.motorHigtTempAbortAlarm.data, p->motor_higt_temp_abort_alarm(), [this](bool value) {
        emit this->motorHigtTempAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.motorRotaryFault.data, p->motor_rotary_fault(), [this](bool value) {
        emit this->motorRotaryFaultChanged(value);
    });
    updateStates<bool>(mStateData.controlMotorPowerLimitation.data, p->motor_power_limitation(), [this](bool value) {
        emit this->controlMotorPowerLimitationChanged(value);
    });
    updateStates<bool>(mStateData.motorRotaryLimitation.data, p->motor_rotary_limitation(), [this](bool value) {
        emit this->motorRotaryLimitationChanged(value);
    });
    updateStates<bool>(mStateData.motorWaterTempOvertop.data, p->motor_water_temp_overtop(), [this](bool value) {
        emit this->motorWaterTempOvertopChanged(value);
    });
    updateStates<bool>(mStateData.acceleratorPedalFault.data, p->accelerator_pedal_fault(), [this](bool value) {
        emit this->acceleratorPedalFaultChanged(value);
    });
    updateStates<bool>(mStateData.brakePedalFaule.data, p->brake_pedal_faule(), [this](bool value) {
        emit this->brakePedalFauleChanged(value);
    });
    updateStates<bool>(mStateData.seatbeltAlarm.data, p->seatbelt_alarm(), [this](bool value) {
        emit this->seatbeltAlarmChanged(value);
    });
    updateStates<bool>(mStateData.seatSwitchAlarm.data, p->seat_switch_alarm(), [this](bool value) {
        emit this->seatSwitchAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlRightDoorsOpenAlarm.data, p->right_doors_open_alarm(), [this](bool value) {
        emit this->controlRightDoorsOpenAlarmChanged(value);
    });
    updateStates<bool>(mStateData.controlLeftDoorsOpenAlarm.data, p->left_doors_open_alarm(), [this](bool value) {
        emit this->controlLeftDoorsOpenAlarmChanged(value);
    });
    updateStates<bool>(mStateData.chauffeurDoorsNotClose.data, p->chauffeur_doors_not_close(), [this](bool value) {
        emit this->chauffeurDoorsNotCloseChanged(value);
    });
    updateStates<bool>(mStateData.highTensionSwitchOpen.data, p->high_tension_switch_open(), [this](bool value) {
        emit this->highTensionSwitchOpenChanged(value);
    });
    updateStates<bool>(mStateData.chargeDoorOpen.data, p->charge_door_open(), [this](bool value) {
        emit this->chargeDoorOpenChanged(value);
    });
    updateStates<bool>(mStateData.safetyDoorOpen.data, p->safety_door_open(), [this](bool value) {
        emit this->safetyDoorOpenChanged(value);
    });
    updateStates<bool>(mStateData.lowVoltageSwitchOpen.data, p->low_voltage_switch_open(), [this](bool value) {
        emit this->lowVoltageSwitchOpenChanged(value);
    });
    updateStates<bool>(mStateData.absSystemFault.data, p->abs_system_fault(), [this](bool value) {
        emit this->absSystemFaultChanged(value);
    });
    updateStates<bool>(mStateData.airCompressorControlHighTemp.data, p->air_compressor_control_high_temp(), [this](bool value) {
        emit this->airCompressorControlHighTempChanged(value);
    });
    updateStates<bool>(mStateData.airCompressorMotorHighTemp.data, p->air_compressor_motor_high_temp(), [this](bool value) {
        emit this->airCompressorMotorHighTempChanged(value);
    });
    updateStates<bool>(mStateData.boosterPumpControlHighTemp.data, p->booster_pump_control_high_temp(), [this](bool value) {
        emit this->boosterPumpControlHighTempChanged(value);
    });
    updateStates<bool>(mStateData.boosterPumpMotorHighTemp.data, p->booster_pump_motor_high_temp(), [this](bool value) {
        emit this->boosterPumpMotorHighTempChanged(value);
    });
    updateStates<float>(mStateData.vcuVersion.data, p->vcu_version(), [this](float value) {
        emit this->vcuVersionChanged(value);
    });
    updateStates<qint32>(mStateData.vcuLife.data, p->vcu_life(), [this](qint32 value) {
        emit this->vcuLifeChanged(value);
    });
}
//动力电池诊断信息
void CustomCarMsgWorker::handleProtoBatteryDiagnoseSystemMenuInfo(const carfox::MessagePtr &msg)
{
    shared_ptr<fyImpetusBatteryDiagnoseSystemInfo::BatteryDiagnoseSystemMenu> p = carfox::down_pointer_cast<fyImpetusBatteryDiagnoseSystemInfo::BatteryDiagnoseSystemMenu>(msg);
    updateStates<bool>(mStateData.batVoltageMaxAlarm.data, p->bat_voltage_max_alarm(), [this](bool value) {
        emit this->batVoltageMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batVoltageMaxAbortAlarm.data, p->bat_voltage_max_abort_alarm(), [this](bool value) {
        emit this->batVoltageMaxAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batVoltageMinAlarm.data, p->bat_voltage_min_alarm(), [this](bool value) {
        emit this->batVoltageMinAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batVoltageMinAbortAlarm.data, p->bat_voltage_min_abort_alarm(), [this](bool value) {
        emit this->batVoltageMinAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.chargeCurrentMaxAlarm.data, p->charge_current_max_alarm(), [this](bool value) {
        emit this->chargeCurrentMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.dischargeCurrentMaxAlarm.data, p->discharge_current_max_alarm(), [this](bool value) {
        emit this->dischargeCurrentMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.dischargeCurrentMaxAbortAlarm.data, p->discharge_current_max_abort_alarm(), [this](bool value) {
        emit this->dischargeCurrentMaxAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.dischargeCurrentTempMinAlarm.data, p->discharge_current_temp_min_alarm(), [this](bool value) {
        emit this->dischargeCurrentTempMinAlarmChanged(value);
    });
    updateStates<bool>(mStateData.dischargeCurrentTempMinAbortAlarm.data, p->discharge_current_temp_min_abort_alarm(), [this](bool value) {
        emit this->dischargeCurrentTempMinAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.chargeCurrentTempMaxAlarm.data, p->charge_current_temp_max_alarm(), [this](bool value) {
        emit this->chargeCurrentTempMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.chargeCurrentTempMaxAbortAlarm.data, p->charge_current_temp_max_abort_alarm(), [this](bool value) {
        emit this->chargeCurrentTempMaxAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batTempMaxAlarm.data, p->bat_temp_max_alarm(), [this](bool value) {
        emit this->batTempMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batTempMaxAbortAlarm.data, p->bat_temp_max_abort_alarm(), [this](bool value) {
        emit this->batTempMaxAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.dropoutVoltageMaxAlarm.data, p->dropout_voltage_max_alarm(), [this](bool value) {
        emit this->dropoutVoltageMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.dropoutVoltageMaxAbortAlarm.data, p->dropout_voltage_max_abort_alarm(), [this](bool value) {
        emit this->dropoutVoltageMaxAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.chargeVoltageMaxAlarm.data, p->charge_voltage_max_alarm(), [this](bool value) {
        emit this->chargeVoltageMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batTempDifferentAlarm.data, p->bat_temp_different_alarm(), [this](bool value) {
        emit this->batTempDifferentAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batChargeTempMinAbortAlarm.data, p->bat_charge_temp_min_abort_alarm(), [this](bool value) {
        emit this->batChargeTempMinAbortAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batChargeTempMinAlarm.data, p->bat_charge_temp_min_alarm(), [this](bool value) {
        emit this->batChargeTempMinAlarmChanged(value);
    });
    updateStates<bool>(mStateData.socMinAlarm.data, p->soc_min_alarm(), [this](bool value) {
        emit this->socMinAlarmChanged(value);
    });
    updateStates<bool>(mStateData.socMaxAlarm.data, p->soc_max_alarm(), [this](bool value) {
        emit this->socMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.batModuleCommunicationFail.data, p->bat_module_communication_fail(), [this](bool value) {
        emit this->batModuleCommunicationFailChanged(value);
    });
    updateStates<bool>(mStateData.bmsSystemFault.data, p->bms_system_fault(), [this](bool value) {
        emit this->bmsSystemFaultChanged(value);
    });
    updateStates<bool>(mStateData.batteryFault.data, p->battery_fault(), [this](bool value) {
        emit this->batteryFaultChanged(value);
    });
    updateStates<bool>(mStateData.energyRecoveryCurrentMaxAlarm.data, p->energy_recovery_current_max_alarm(), [this](bool value) {
        emit this->energyRecoveryCurrentMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.energyRecoveryVoltageMaxAlarm.data, p->energy_recovery_voltage_max_alarm(), [this](bool value) {
        emit this->energyRecoveryVoltageMaxAlarmChanged(value);
    });
    updateStates<bool>(mStateData.energyRecoveryVoltageMaxAbort.data, p->energy_recovery_voltage_max_abort(), [this](bool value) {
        emit this->energyRecoveryVoltageMaxAbortChanged(value);
    });
    updateStates<bool>(mStateData.energyRecoveryCancel.data, p->energy_recovery_cancel(), [this](bool value) {
        emit this->energyRecoveryCancelChanged(value);
    });
    updateStates<bool>(mStateData.socJumpAlarm.data, p->soc_jump_alarm(), [this](bool value) {
        emit this->socJumpAlarmChanged(value);
    });
    updateStates<bool>(mStateData.mismatchingAlarm.data, p->mismatching_alarm(), [this](bool value) {
        emit this->mismatchingAlarmChanged(value);
    });
    updateStates<bool>(mStateData.vehicleMountedTypeMax.data, p->vehicle_mounted_type_max(), [this](bool value) {
        emit this->vehicleMountedTypeMaxChanged(value);
    });
    updateStates<bool>(mStateData.vehicleMountedTypeMin.data, p->vehicle_mounted_type_min(), [this](bool value) {
        emit this->vehicleMountedTypeMinChanged(value);
    });
    updateStates<bool>(mStateData.vehicleMountedTypeOvercharge.data, p->vehicle_mounted_type_overcharge(), [this](bool value) {
        emit this->vehicleMountedTypeOverchargeChanged(value);
    });
}

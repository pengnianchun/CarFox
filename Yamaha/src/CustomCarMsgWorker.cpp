
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
    updateStates<qint16>(mStateData.moterControlTemp.data, p->moter_control_temperature(), [this](qint32 value) {
        emit this->moterControlTempChanged(value);
    });
    updateStates<qint16>(mStateData.moterTemp.data, p->moter_temperature(), [this](qint32 value) {
        emit this->moterTempChanged(value);
    });
    updateStates<qint16>(mStateData.battery.data, p->battery(), [this](qint32 value) {
        emit this->batteryChanged(value);
    });
    updateStates<qint16>(mStateData.spn.data, p->spn(), [this](qint32 value) {
        emit this->spnChanged(value);
    });
    updateStates<qint16>(mStateData.engineWaterTemp.data, p->engine_water_temp(), [this](qint32 value) {
        emit this->engineWaterTempChanged(value);
    });
    updateStates<qint16>(mStateData.ureaLevel.data, p->urea_level(), [this](qint32 value) {
        emit this->ureaLevelChanged(value);
    });
    updateStates<quint16>(mStateData.faultLevel.data, p->fault_level(), [this](quint32 value) {
        emit this->faultLevelChanged(value);
    });
    updateStates<qint16>(mStateData.faultCode.data, p->fault_code(), [this](qint32 value) {
        emit this->faultCodeChanged(value);
    });
    updateStates<quint16>(mStateData.oilLevel.data, p->oil_level(), [this](quint32 value) {
        emit this->oilLevelChanged(value);
    });
    updateStates<float>(mStateData.engineOilPressure.data, p->engine_oil_pressure(), [this](float value) {
        emit this->engineOilPressureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoDatetime(const carfox::MessagePtr &msg) {
    shared_ptr<fySystemSettingsInfo::DateTime> p = carfox::down_pointer_cast<fySystemSettingsInfo::DateTime>(msg);
    updateStates<qint32>(mStateData.dateTime.data, p->date_time(), [this](qint32 value) {
        emit this->dateTimeChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoUpgradeNotify(const carfox::MessagePtr &msg) {
    shared_ptr<fySystemSettingsInfo::UpgradeSettings> p = carfox::down_pointer_cast<fySystemSettingsInfo::UpgradeSettings>(msg);
    updateStates<qint8>(mStateData.upgradeMsgId.data, p->msg_id(), [this](qint8 value) {
        emit this->upgradeMsgIdChanged(value);
    });
    updateStates<QString>(mStateData.upgradeMsgCtx.data, QString::fromStdString(p->msg_content()), [this](QString value) {
        emit this->upgradeMsgCtxChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoInstrumentFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::InstrumentFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::InstrumentFrame>(msg);
    updateStates<qint8>(mStateData.inputCtrl01.data, p->input_ctrl_01(), [this](qint8 value) {
        emit this->inputCtrl01Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl02.data, p->input_ctrl_02(), [this](qint8 value) {
        emit this->inputCtrl02Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl03.data, p->input_ctrl_03(), [this](qint8 value) {
        emit this->inputCtrl03Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl04.data, p->input_ctrl_04(), [this](qint8 value) {
        emit this->inputCtrl04Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl05.data, p->input_ctrl_05(), [this](qint8 value) {
        emit this->inputCtrl05Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl06.data, p->input_ctrl_06(), [this](qint8 value) {
        emit this->inputCtrl06Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl07.data, p->input_ctrl_07(), [this](qint8 value) {
        emit this->inputCtrl07Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl08.data, p->input_ctrl_08(), [this](qint8 value) {
        emit this->inputCtrl08Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl09.data, p->input_ctrl_09(), [this](qint8 value) {
        emit this->inputCtrl09Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl10.data, p->input_ctrl_10(), [this](qint8 value) {
        emit this->inputCtrl10Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl11.data, p->input_ctrl_11(), [this](qint8 value) {
        emit this->inputCtrl11Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl12.data, p->input_ctrl_12(), [this](qint8 value) {
        emit this->inputCtrl12Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl13.data, p->input_ctrl_13(), [this](qint8 value) {
        emit this->inputCtrl13Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl14.data, p->input_ctrl_14(), [this](qint8 value) {
        emit this->inputCtrl14Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl15.data, p->input_ctrl_15(), [this](qint8 value) {
        emit this->inputCtrl15Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl16.data, p->input_ctrl_16(), [this](qint8 value) {
        emit this->inputCtrl16Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl17.data, p->input_ctrl_17(), [this](qint8 value) {
        emit this->inputCtrl17Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl18.data, p->input_ctrl_18(), [this](qint8 value) {
        emit this->inputCtrl18Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl19.data, p->input_ctrl_19(), [this](qint8 value) {
        emit this->inputCtrl19Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl20.data, p->input_ctrl_20(), [this](qint8 value) {
        emit this->inputCtrl20Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl21.data, p->input_ctrl_21(), [this](qint8 value) {
        emit this->inputCtrl21Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl22.data, p->input_ctrl_22(), [this](qint8 value) {
        emit this->inputCtrl22Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl23.data, p->input_ctrl_23(), [this](qint8 value) {
        emit this->inputCtrl23Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl24.data, p->input_ctrl_24(), [this](qint8 value) {
        emit this->inputCtrl24Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl25.data, p->input_ctrl_25(), [this](qint8 value) {
        emit this->inputCtrl25Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl26.data, p->input_ctrl_26(), [this](qint8 value) {
        emit this->inputCtrl26Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl27.data, p->input_ctrl_27(), [this](qint8 value) {
        emit this->inputCtrl27Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl28.data, p->input_ctrl_28(), [this](qint8 value) {
        emit this->inputCtrl28Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl29.data, p->input_ctrl_29(), [this](qint8 value) {
        emit this->inputCtrl29Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl30.data, p->input_ctrl_30(), [this](qint8 value) {
        emit this->inputCtrl30Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl31.data, p->input_ctrl_31(), [this](qint8 value) {
        emit this->inputCtrl31Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl32.data, p->input_ctrl_32(), [this](qint8 value) {
        emit this->inputCtrl32Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl33.data, p->input_ctrl_33(), [this](qint8 value) {
        emit this->inputCtrl33Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl34.data, p->input_ctrl_34(), [this](qint8 value) {
        emit this->inputCtrl34Changed(value);
    });
    updateStates<qint8>(mStateData.inputCtrl35.data, p->input_ctrl_35(), [this](qint8 value) {
        emit this->inputCtrl35Changed(value);
    });
}

void CustomCarMsgWorker::handleProtoFontMoudleFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyModuleFrontInfo::ModuleFrontFrame> p = carfox::down_pointer_cast<fyModuleFrontInfo::ModuleFrontFrame>(msg);
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
    updateStates<qint8>(mStateData.frontSwitch01.data, p->switch_01(), [this](qint8 value) {
       emit this->frontSwitch01Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch02.data, p->switch_02(), [this](qint8 value) {
       emit this->frontSwitch02Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch03.data, p->switch_03(), [this](qint8 value) {
       emit this->frontSwitch03Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch04.data, p->switch_04(), [this](qint8 value) {
       emit this->frontSwitch04Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch05.data, p->switch_05(), [this](qint8 value) {
       emit this->frontSwitch05Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch06.data, p->switch_06(), [this](qint8 value) {
       emit this->frontSwitch06Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch07.data, p->switch_07(), [this](qint8 value) {
       emit this->frontSwitch07Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch08.data, p->switch_08(), [this](qint8 value) {
       emit this->frontSwitch08Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch09.data, p->switch_09(), [this](qint8 value) {
       emit this->frontSwitch09Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch10.data, p->switch_10(), [this](qint8 value) {
       emit this->frontSwitch10Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch11.data, p->switch_11(), [this](qint8 value) {
       emit this->frontSwitch11Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch12.data, p->switch_12(), [this](qint8 value) {
       emit this->frontSwitch12Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch13.data, p->switch_13(), [this](qint8 value) {
       emit this->frontSwitch13Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch14.data, p->switch_14(), [this](qint8 value) {
       emit this->frontSwitch14Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch15.data, p->switch_15(), [this](qint8 value) {
       emit this->frontSwitch15Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch16.data, p->switch_16(), [this](qint8 value) {
       emit this->frontSwitch16Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch17.data, p->switch_17(), [this](qint8 value) {
       emit this->frontSwitch17Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch18.data, p->switch_18(), [this](qint8 value) {
       emit this->frontSwitch18Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch19.data, p->switch_19(), [this](qint8 value) {
       emit this->frontSwitch19Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch20.data, p->switch_20(), [this](qint8 value) {
       emit this->frontSwitch20Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch21.data, p->switch_21(), [this](qint8 value) {
       emit this->frontSwitch21Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch22.data, p->switch_22(), [this](qint8 value) {
       emit this->frontSwitch22Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch23.data, p->switch_23(), [this](qint8 value) {
       emit this->frontSwitch23Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch24.data, p->switch_24(), [this](qint8 value) {
       emit this->frontSwitch24Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch25.data, p->switch_25(), [this](qint8 value) {
       emit this->frontSwitch25Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch26.data, p->switch_26(), [this](qint8 value) {
       emit this->frontSwitch26Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch27.data, p->switch_27(), [this](qint8 value) {
       emit this->frontSwitch27Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch28.data, p->switch_28(), [this](qint8 value) {
       emit this->frontSwitch28Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch29.data, p->switch_29(), [this](qint8 value) {
       emit this->frontSwitch29Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch30.data, p->switch_30(), [this](qint8 value) {
       emit this->frontSwitch30Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch31.data, p->switch_31(), [this](qint8 value) {
       emit this->frontSwitch31Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch32.data, p->switch_32(), [this](qint8 value) {
       emit this->frontSwitch32Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch33.data, p->switch_33(), [this](qint8 value) {
       emit this->frontSwitch33Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch34.data, p->switch_34(), [this](qint8 value) {
       emit this->frontSwitch34Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch35.data, p->switch_35(), [this](qint8 value) {
       emit this->frontSwitch35Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch36.data, p->switch_36(), [this](qint8 value) {
       emit this->frontSwitch36Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch37.data, p->switch_37(), [this](qint8 value) {
       emit this->frontSwitch37Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch38.data, p->switch_38(), [this](qint8 value) {
       emit this->frontSwitch38Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch39.data, p->switch_39(), [this](qint8 value) {
       emit this->frontSwitch39Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch40.data, p->switch_40(), [this](qint8 value) {
       emit this->frontSwitch40Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch41.data, p->switch_41(), [this](qint8 value) {
       emit this->frontSwitch41Changed(value);
    });
    updateStates<qint8>(mStateData.frontSwitch42.data, p->switch_42(), [this](qint8 value) {
       emit this->frontSwitch42Changed(value);
    });
}

void CustomCarMsgWorker::handleProtoMiddleMoudleFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyModuleMiddleInfo::ModuleMiddleFrame> p = carfox::down_pointer_cast<fyModuleMiddleInfo::ModuleMiddleFrame>(msg);
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
    updateStates<qint8>(mStateData.middleSwitch01.data, p->switch_01(), [this](qint8 value) {
        emit this->middleSwitch01Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch02.data, p->switch_02(), [this](qint8 value) {
        emit this->middleSwitch02Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch03.data, p->switch_03(), [this](qint8 value) {
        emit this->middleSwitch03Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch04.data, p->switch_04(), [this](qint8 value) {
        emit this->middleSwitch04Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch05.data, p->switch_05(), [this](qint8 value) {
        emit this->middleSwitch05Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch06.data, p->switch_06(), [this](qint8 value) {
        emit this->middleSwitch06Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch07.data, p->switch_07(), [this](qint8 value) {
        emit this->middleSwitch07Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch08.data, p->switch_08(), [this](qint8 value) {
        emit this->middleSwitch08Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch09.data, p->switch_09(), [this](qint8 value) {
        emit this->middleSwitch09Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch10.data, p->switch_10(), [this](qint8 value) {
        emit this->middleSwitch10Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch11.data, p->switch_11(), [this](qint8 value) {
        emit this->middleSwitch11Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch12.data, p->switch_12(), [this](qint8 value) {
        emit this->middleSwitch12Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch13.data, p->switch_13(), [this](qint8 value) {
        emit this->middleSwitch13Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch14.data, p->switch_14(), [this](qint8 value) {
        emit this->middleSwitch14Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch15.data, p->switch_15(), [this](qint8 value) {
        emit this->middleSwitch15Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch16.data, p->switch_16(), [this](qint8 value) {
        emit this->middleSwitch16Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch17.data, p->switch_17(), [this](qint8 value) {
        emit this->middleSwitch17Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch18.data, p->switch_18(), [this](qint8 value) {
        emit this->middleSwitch18Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch19.data, p->switch_19(), [this](qint8 value) {
        emit this->middleSwitch19Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch20.data, p->switch_20(), [this](qint8 value) {
        emit this->middleSwitch20Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch21.data, p->switch_21(), [this](qint8 value) {
        emit this->middleSwitch21Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch22.data, p->switch_22(), [this](qint8 value) {
        emit this->middleSwitch22Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch23.data, p->switch_23(), [this](qint8 value) {
        emit this->middleSwitch23Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch24.data, p->switch_24(), [this](qint8 value) {
        emit this->middleSwitch24Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch25.data, p->switch_25(), [this](qint8 value) {
        emit this->middleSwitch25Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch26.data, p->switch_26(), [this](qint8 value) {
        emit this->middleSwitch26Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch27.data, p->switch_27(), [this](qint8 value) {
        emit this->middleSwitch27Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch28.data, p->switch_28(), [this](qint8 value) {
        emit this->middleSwitch28Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch29.data, p->switch_29(), [this](qint8 value) {
        emit this->middleSwitch29Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch30.data, p->switch_30(), [this](qint8 value) {
        emit this->middleSwitch30Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch31.data, p->switch_31(), [this](qint8 value) {
        emit this->middleSwitch31Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch32.data, p->switch_32(), [this](qint8 value) {
        emit this->middleSwitch32Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch33.data, p->switch_33(), [this](qint8 value) {
        emit this->middleSwitch33Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch34.data, p->switch_34(), [this](qint8 value) {
        emit this->middleSwitch34Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch35.data, p->switch_35(), [this](qint8 value) {
        emit this->middleSwitch35Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch36.data, p->switch_36(), [this](qint8 value) {
        emit this->middleSwitch36Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch37.data, p->switch_37(), [this](qint8 value) {
        emit this->middleSwitch37Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch38.data, p->switch_38(), [this](qint8 value) {
        emit this->middleSwitch38Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch39.data, p->switch_39(), [this](qint8 value) {
        emit this->middleSwitch39Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch40.data, p->switch_40(), [this](qint8 value) {
        emit this->middleSwitch40Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch41.data, p->switch_41(), [this](qint8 value) {
        emit this->middleSwitch41Changed(value);
    });
    updateStates<qint8>(mStateData.middleSwitch42.data, p->switch_42(), [this](qint8 value) {
        emit this->middleSwitch42Changed(value);
    });
}

void CustomCarMsgWorker::handleProtoBackMoudleFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyModuleBackInfo::ModuleBackFrame> p = carfox::down_pointer_cast<fyModuleBackInfo::ModuleBackFrame>(msg);
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
     updateStates<qint8>(mStateData.backSwitch01.data, p->switch_01(), [this](qint8 value) {
        emit this->backSwitch01Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch02.data, p->switch_02(), [this](qint8 value) {
        emit this->backSwitch02Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch03.data, p->switch_03(), [this](qint8 value) {
        emit this->backSwitch03Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch04.data, p->switch_04(), [this](qint8 value) {
        emit this->backSwitch04Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch05.data, p->switch_05(), [this](qint8 value) {
        emit this->backSwitch05Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch06.data, p->switch_06(), [this](qint8 value) {
        emit this->backSwitch06Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch07.data, p->switch_07(), [this](qint8 value) {
        emit this->backSwitch07Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch08.data, p->switch_08(), [this](qint8 value) {
        emit this->backSwitch08Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch09.data, p->switch_09(), [this](qint8 value) {
        emit this->backSwitch09Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch10.data, p->switch_10(), [this](qint8 value) {
        emit this->backSwitch10Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch11.data, p->switch_11(), [this](qint8 value) {
        emit this->backSwitch11Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch12.data, p->switch_12(), [this](qint8 value) {
        emit this->backSwitch12Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch13.data, p->switch_13(), [this](qint8 value) {
        emit this->backSwitch13Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch14.data, p->switch_14(), [this](qint8 value) {
        emit this->backSwitch14Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch15.data, p->switch_15(), [this](qint8 value) {
        emit this->backSwitch15Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch16.data, p->switch_16(), [this](qint8 value) {
        emit this->backSwitch16Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch17.data, p->switch_17(), [this](qint8 value) {
        emit this->backSwitch17Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch18.data, p->switch_18(), [this](qint8 value) {
        emit this->backSwitch18Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch19.data, p->switch_19(), [this](qint8 value) {
        emit this->backSwitch19Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch20.data, p->switch_20(), [this](qint8 value) {
        emit this->backSwitch20Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch21.data, p->switch_21(), [this](qint8 value) {
        emit this->backSwitch21Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch22.data, p->switch_22(), [this](qint8 value) {
        emit this->backSwitch22Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch23.data, p->switch_23(), [this](qint8 value) {
        emit this->backSwitch23Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch24.data, p->switch_24(), [this](qint8 value) {
        emit this->backSwitch24Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch25.data, p->switch_25(), [this](qint8 value) {
        emit this->backSwitch25Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch26.data, p->switch_26(), [this](qint8 value) {
        emit this->backSwitch26Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch27.data, p->switch_27(), [this](qint8 value) {
        emit this->backSwitch27Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch28.data, p->switch_28(), [this](qint8 value) {
        emit this->backSwitch28Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch29.data, p->switch_29(), [this](qint8 value) {
        emit this->backSwitch29Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch30.data, p->switch_30(), [this](qint8 value) {
        emit this->backSwitch30Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch31.data, p->switch_31(), [this](qint8 value) {
        emit this->backSwitch31Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch32.data, p->switch_32(), [this](qint8 value) {
        emit this->backSwitch32Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch33.data, p->switch_33(), [this](qint8 value) {
        emit this->backSwitch33Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch34.data, p->switch_34(), [this](qint8 value) {
        emit this->backSwitch34Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch35.data, p->switch_35(), [this](qint8 value) {
        emit this->backSwitch35Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch36.data, p->switch_36(), [this](qint8 value) {
        emit this->backSwitch36Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch37.data, p->switch_37(), [this](qint8 value) {
        emit this->backSwitch37Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch38.data, p->switch_38(), [this](qint8 value) {
        emit this->backSwitch38Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch39.data, p->switch_39(), [this](qint8 value) {
        emit this->backSwitch39Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch40.data, p->switch_40(), [this](qint8 value) {
        emit this->backSwitch40Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch41.data, p->switch_41(), [this](qint8 value) {
        emit this->backSwitch41Changed(value);
     });
     updateStates<qint8>(mStateData.backSwitch42.data, p->switch_42(), [this](qint8 value) {
        emit this->backSwitch42Changed(value);
     });
}

void CustomCarMsgWorker::handleProtoWarningFrameInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyWarningInfo::WarningFrame> p = carfox::down_pointer_cast<fyWarningInfo::WarningFrame>(msg);
    updateStates<QString>(mStateData.warning01.data, QString::fromStdString(p->warning_01()), [this](QString value) {
       emit this->warning01Changed(value);
    });
    updateStates<QString>(mStateData.warning02.data, QString::fromStdString(p->warning_02()), [this](QString value) {
       emit this->warning02Changed(value);
    });
    updateStates<QString>(mStateData.warning03.data, QString::fromStdString(p->warning_03()), [this](QString value) {
       emit this->warning03Changed(value);
    });
    updateStates<QString>(mStateData.warning04.data, QString::fromStdString(p->warning_04()), [this](QString value) {
       emit this->warning04Changed(value);
    });
    updateStates<QString>(mStateData.warning05.data, QString::fromStdString(p->warning_05()), [this](QString value) {
       emit this->warning05Changed(value);
    });
    updateStates<QString>(mStateData.warning06.data, QString::fromStdString(p->warning_06()), [this](QString value) {
       emit this->warning06Changed(value);
    });
    updateStates<QString>(mStateData.warning07.data, QString::fromStdString(p->warning_07()), [this](QString value) {
       emit this->warning07Changed(value);
    });
    updateStates<QString>(mStateData.warning08.data, QString::fromStdString(p->warning_08()), [this](QString value) {
       emit this->warning08Changed(value);
    });
    updateStates<QString>(mStateData.warning09.data, QString::fromStdString(p->warning_09()), [this](QString value) {
       emit this->warning09Changed(value);
    });
    updateStates<QString>(mStateData.warning10.data, QString::fromStdString(p->warning_10()), [this](QString value) {
       emit this->warning10Changed(value);
    });
    updateStates<QString>(mStateData.warning11.data, QString::fromStdString(p->warning_11()), [this](QString value) {
       emit this->warning11Changed(value);
    });
    updateStates<QString>(mStateData.warning12.data, QString::fromStdString(p->warning_12()), [this](QString value) {
       emit this->warning12Changed(value);
    });
    updateStates<QString>(mStateData.warning13.data, QString::fromStdString(p->warning_13()), [this](QString value) {
       emit this->warning13Changed(value);
    });
    updateStates<QString>(mStateData.warning14.data, QString::fromStdString(p->warning_14()), [this](QString value) {
       emit this->warning14Changed(value);
    });
    updateStates<QString>(mStateData.warning15.data, QString::fromStdString(p->warning_15()), [this](QString value) {
       emit this->warning15Changed(value);
    });
    updateStates<QString>(mStateData.warning16.data, QString::fromStdString(p->warning_16()), [this](QString value) {
       emit this->warning16Changed(value);
    });
    updateStates<QString>(mStateData.warning17.data, QString::fromStdString(p->warning_17()), [this](QString value) {
       emit this->warning17Changed(value);
    });
    updateStates<QString>(mStateData.warning18.data, QString::fromStdString(p->warning_18()), [this](QString value) {
       emit this->warning18Changed(value);
    });
    updateStates<QString>(mStateData.warning19.data, QString::fromStdString(p->warning_19()), [this](QString value) {
       emit this->warning19Changed(value);
    });
    updateStates<QString>(mStateData.warning20.data, QString::fromStdString(p->warning_20()), [this](QString value) {
       emit this->warning20Changed(value);
    });
    updateStates<QString>(mStateData.warning21.data, QString::fromStdString(p->warning_21()), [this](QString value) {
       emit this->warning21Changed(value);
    });
    updateStates<QString>(mStateData.warning22.data, QString::fromStdString(p->warning_22()), [this](QString value) {
       emit this->warning22Changed(value);
    });
    updateStates<QString>(mStateData.warning23.data, QString::fromStdString(p->warning_23()), [this](QString value) {
       emit this->warning23Changed(value);
    });
    updateStates<QString>(mStateData.warning24.data, QString::fromStdString(p->warning_24()), [this](QString value) {
       emit this->warning24Changed(value);
    });
    updateStates<QString>(mStateData.warning25.data, QString::fromStdString(p->warning_25()), [this](QString value) {
       emit this->warning25Changed(value);
    });
    updateStates<QString>(mStateData.warning26.data, QString::fromStdString(p->warning_26()), [this](QString value) {
       emit this->warning26Changed(value);
    });
    updateStates<QString>(mStateData.warning27.data, QString::fromStdString(p->warning_27()), [this](QString value) {
       emit this->warning27Changed(value);
    });
    updateStates<QString>(mStateData.warning28.data, QString::fromStdString(p->warning_28()), [this](QString value) {
       emit this->warning28Changed(value);
    });
    updateStates<QString>(mStateData.warning29.data, QString::fromStdString(p->warning_29()), [this](QString value) {
       emit this->warning29Changed(value);
    });
    updateStates<QString>(mStateData.warning30.data, QString::fromStdString(p->warning_30()), [this](QString value) {
       emit this->warning30Changed(value);
    });
    updateStates<QString>(mStateData.warning31.data, QString::fromStdString(p->warning_31()), [this](QString value) {
       emit this->warning31Changed(value);
    });
    updateStates<QString>(mStateData.warning32.data, QString::fromStdString(p->warning_32()), [this](QString value) {
       emit this->warning32Changed(value);
    });
    updateStates<QString>(mStateData.warning33.data, QString::fromStdString(p->warning_33()), [this](QString value) {
       emit this->warning33Changed(value);
    });
    updateStates<QString>(mStateData.warning34.data, QString::fromStdString(p->warning_34()), [this](QString value) {
       emit this->warning34Changed(value);
    });
    updateStates<QString>(mStateData.warning35.data, QString::fromStdString(p->warning_35()), [this](QString value) {
       emit this->warning35Changed(value);
    });
    updateStates<QString>(mStateData.warning36.data, QString::fromStdString(p->warning_36()), [this](QString value) {
       emit this->warning36Changed(value);
    });
    updateStates<QString>(mStateData.warning37.data, QString::fromStdString(p->warning_37()), [this](QString value) {
       emit this->warning37Changed(value);
    });
    updateStates<QString>(mStateData.warning38.data, QString::fromStdString(p->warning_38()), [this](QString value) {
       emit this->warning38Changed(value);
    });
    updateStates<QString>(mStateData.warning39.data, QString::fromStdString(p->warning_39()), [this](QString value) {
       emit this->warning39Changed(value);
    });
    updateStates<QString>(mStateData.warning40.data, QString::fromStdString(p->warning_40()), [this](QString value) {
       emit this->warning40Changed(value);
    });
}

void CustomCarMsgWorker::handleProtoControlSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyControlSystemInfo::ControlSystemMenu> p = carfox::down_pointer_cast<fyControlSystemInfo::ControlSystemMenu>(msg);
    updateStates<float>(mStateData.motorInVoltage.data, p->motor_in_voltage(), [this](float value) {
        emit this->motorInVoltageChanged(value);
    });
    updateStates<float>(mStateData.motorInCurrent.data, p->motor_in_current(), [this](float value) {
        emit this->motorInCurrentChanged(value);
    });
    updateStates<qint16>(mStateData.motorTemp.data, p->motor_temp(), [this](qint16 value) {
        emit this->motorTempChanged(value);
    });
    updateStates<qint16>(mStateData.motorControllerTemp.data, p->motor_controller_temp(), [this](qint16 value) {
        emit this->motorControllerTempChanged(value);
    });
    updateStates<qint16>(mStateData.carVcuMode.data, p->car_mode(), [this](qint16 value) {
        emit this->carVcuModeChanged(value);
    });
    updateStates<double>(mStateData.version.data, p->version(), [this](double value) {
        emit this->versionChanged(value);
    });
    updateStates<qint16>(mStateData.carLife.data, p->car_life(), [this](qint16 value) {
        emit this->carLifeChanged(value);
    });
    updateStates<float>(mStateData.accelPedalPercent.data, p->accel_pedal_percent(), [this](float value) {
        emit this->accelPedalPercentChanged(value);
    });
    updateStates<float>(mStateData.brakePedalPercent.data, p->brake_pedal_percent(), [this](float value) {
        emit this->brakePedalPercentChanged(value);
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
    updateStates<float>(mStateData.engineFuelConsumption.data, p->engine_fuel_consumption(), [this](float value) {
        emit this->engineFuelConsumptionChanged(value);
    });
    updateStates<float>(mStateData.engineLoad.data, p->engine_load(), [this](float value) {
        emit this->engineLoadChanged(value);
    });
    updateStates<float>(mStateData.engineTargetThrottle.data, p->engine_target_throttle(), [this](float value) {
        emit this->engineTargetThrottleChanged(value);
    });
    updateStates<float>(mStateData.engineActualThrottle.data, p->engine_actual_throttle(), [this](float value) {
        emit this->engineActualThrottleChanged(value);
    });
    updateStates<qint16>(mStateData.engineInletTemperature.data, p->engine_inlet_temperature(), [this](qint16 value) {
        emit this->engineInletTemperatureChanged(value);
    });
}

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
    updateStates<qint16>(mStateData.radiatorTemperature.data, p->radiator_temperature(), [this](qint16 value) {
        emit this->radiatorTemperatureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoTcuSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyTcuSystemInfo::TcuSystemMenu> p = carfox::down_pointer_cast<fyTcuSystemInfo::TcuSystemMenu>(msg);
    updateStates<qint16>(mStateData.actualClutchPosition.data, p->actual_clutch_position(), [this](qint16 value) {
        emit this->actualClutchPositionChanged(value);
    });
    updateStates<quint16>(mStateData.tcuFaultCode.data, p->tcu_fault_code(), [this](quint16 value) {
        emit this->tcuFaultCodeChanged(value);
    });
    updateStates<qint16>(mStateData.axisRpm.data, p->axis_rpm(), [this](qint16 value) {
        emit this->axisRpmChanged(value);
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
    updateStates<float>(mStateData.batMaxChargeCurrent.data, p->bat_max_charge_current(), [this](float value) {
        emit this->batMaxChargeCurrentChanged(value);
    });
    updateStates<float>(mStateData.batMaxDischargeCurrent.data, p->bat_max_discharge_current(), [this](float value) {
        emit this->batMaxDischargeCurrentChanged(value);
    });
    updateStates<float>(mStateData.batAverageVoltage.data, p->bat_average_voltage(), [this](float value) {
        emit this->batAverageVoltageChanged(value);
    });
    updateStates<quint16>(mStateData.batStatus1.data, p->bat_status1(), [this](quint16 value) {
        emit this->batStatus1Changed(value);
    });
    updateStates<quint16>(mStateData.batStatus2.data, p->bat_status2(), [this](quint16 value) {
        emit this->batStatus2Changed(value);
    });
    updateStates<quint16>(mStateData.batStatus3.data, p->bat_status3(), [this](quint16 value) {
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
}

void CustomCarMsgWorker::handleProtoBatteryGroupVoltageMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu> p = carfox::down_pointer_cast<fyBatteryGroupVoltageInfo::BatteryGroupVoltageMenu>(msg);
}

void CustomCarMsgWorker::handleProtoBatteryGroupTemperatureMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu> p = carfox::down_pointer_cast<fyBatteryGroupTemperatureInfo::BatteryGroupTemperatureMenu>(msg);
}

void CustomCarMsgWorker::handleProtoAirCtrlSystemMenuInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyAirCtrlSystemInfo::AirCtrlSystemMenu> p = carfox::down_pointer_cast<fyAirCtrlSystemInfo::AirCtrlSystemMenu>(msg);
    updateStates<quint16>(mStateData.acFaultCode.data, p->ac_fault_code(), [this](quint16 value) {
        emit this->acFaultCodeChanged(value);
    });
    updateStates<quint16>(mStateData.acFanStatus.data, p->ac_fan_status(), [this](quint16 value) {
        emit this->acFanStatusChanged(value);
    });
    updateStates<quint16>(mStateData.acWorkStatus.data, p->ac_work_status(), [this](quint16 value) {
        emit this->acWorkStatusChanged(value);
    });
    updateStates<quint16>(mStateData.acLife.data, p->ac_life(), [this](quint16 value) {
        emit this->acLifeChanged(value);
    });
    updateStates<qint16>(mStateData.acOutTemp.data, p->ac_out_temp(), [this](qint16 value) {
        emit this->acOutTempChanged(value);
    });
    updateStates<qint16>(mStateData.acInTemp.data, p->ac_in_temp(), [this](qint16 value) {
        emit this->acInTempChanged(value);
    });
    updateStates<qint16>(mStateData.acSetTemp.data, p->ac_set_temp(), [this](qint16 value) {
        emit this->acSetTempChanged(value);
    });
    updateStates<quint16>(mStateData.acRefrigereReq.data, p->ac_refrigere_req(), [this](quint16 value) {
        emit this->acRefrigereReqChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampMiscLampInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::MiscLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::MiscLampFrame>(msg);
    updateStates<qint8>(mStateData.lampKeyOn.data, p->lamp_key_on(), [this](qint8 value) {
        emit this->lampKeyOnChanged(value);
    });
    updateStates<qint8>(mStateData.lampAirFilter.data, p->lamp_air_filter(), [this](qint8 value) {
        emit this->lampAirFilterChanged(value);
    });
    updateStates<qint8>(mStateData.lampAsr.data, p->lamp_asr(), [this](qint8 value) {
        emit this->lampAsrChanged(value);
    });
    updateStates<qint8>(mStateData.lampHighVoltageMaintenance.data, p->lamp_high_voltage_maintenance(), [this](qint8 value) {
        emit this->lampHighVoltageMaintenanceChanged(value);
    });
    updateStates<qint8>(mStateData.lampDefroster.data, p->lamp_defroster(), [this](qint8 value) {
        emit this->lampDefrosterChanged(value);
    });
    updateStates<qint8>(mStateData.lampDryere.data, p->lamp_dryere(), [this](qint8 value) {
        emit this->lampDryereChanged(value);
    });
    updateStates<qint8>(mStateData.lampAbs.data, p->lamp_abs(), [this](qint8 value) {
        emit this->lampAbsChanged(value);
    });
    updateStates<qint8>(mStateData.lampAc.data, p->lamp_ac(), [this](qint8 value) {
        emit this->lampAcChanged(value);
    });
    updateStates<QString>(mStateData.powerSupply.data, QString::fromStdString(p->power_supply()), [this](QString value) {
        emit this->powerSupplyChanged(value);
    });
    updateStates<qint8>(mStateData.climbingMode.data, p->climbing_mode(), [this](qint8 value) {
        emit this->climbingModeChanged(value);
    });
    updateStates<qint8>(mStateData.diagnosticMode.data, p->diagnostic_mode(), [this](qint8 value) {
        emit this->diagnosticModeChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampCorneringInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::CorneringLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::CorneringLampFrame>(msg);
    updateStates<qint8>(mStateData.lampTurnLeft.data, p->lamp_turn_left(), [this](qint8 value) {
        emit this->lampTurnLeftChanged(value);
    });
    updateStates<qint8>(mStateData.lampTurnRight.data, p->lamp_turn_right(), [this](qint8 value) {
        emit this->lampTurnRightChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampLightInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::LightLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::LightLampFrame>(msg);
    updateStates<qint8>(mStateData.lampDoubleFlash.data, p->lamp_double_flash(), [this](qint8 value) {
        emit this->lampDoubleFlashChanged(value);
    });
    updateStates<qint8>(mStateData.lampFrontFog.data, p->lamp_front_fog(), [this](qint8 value) {
        emit this->lampFrontFogChanged(value);
    });
    updateStates<qint8>(mStateData.lampRearFog.data, p->lamp_rear_fog(), [this](qint8 value) {
        emit this->lampRearFogChanged(value);
    });
    updateStates<qint8>(mStateData.lampHighBeam.data, p->lamp_high_beam(), [this](qint8 value) {
        emit this->lampHighBeamChanged(value);
    });
    updateStates<qint8>(mStateData.lampHeadLight.data, p->lamp_head_light(), [this](qint8 value) {
        emit this->lampHeadLightChanged(value);
    });
    updateStates<qint8>(mStateData.lampReverseGear.data, p->lamp_reverse_gear(), [this](qint8 value) {
        emit this->lampReverseGearChanged(value);
    });
    updateStates<qint8>(mStateData.lampPositionLight.data, p->lamp_position_light(), [this](qint8 value) {
        emit this->lampPositionLightChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampGateInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::GateLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::GateLampFrame>(msg);
    updateStates<qint8>(mStateData.lampGate1.data, p->lamp_gate1(), [this](qint8 value) {
        emit this->lampGate1Changed(value);
    });
    updateStates<qint8>(mStateData.lampGate2.data, p->lamp_gate2(), [this](qint8 value) {
        emit this->lampGate2Changed(value);
    });
    updateStates<qint8>(mStateData.lampRearDoorOpen.data, p->lamp_rear_door_open(), [this](qint8 value) {
        emit this->lampRearDoorOpenChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampBrakeInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::BrakeLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::BrakeLampFrame>(msg);
    updateStates<qint8>(mStateData.lampBrake.data, p->lamp_brake(), [this](qint8 value) {
        emit this->lampBrakeChanged(value);
    });
    updateStates<qint8>(mStateData.lampParkingBrake.data, p->lamp_parking_brake(), [this](qint8 value) {
        emit this->lampParkingBrakeChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampAirPressureInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::AirPressureLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::AirPressureLampFrame>(msg);
    updateStates<qint8>(mStateData.lampLeftLowAirPressure.data, p->lamp_left_low_air_pressure(), [this](qint8 value) {
        emit this->lampLeftLowAirPressureChanged(value);
    });
    updateStates<qint8>(mStateData.lampRightLowAirPressure.data, p->lamp_right_low_air_pressure(), [this](qint8 value) {
        emit this->lampRightLowAirPressureChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampShoeWearInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::ShoeLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::ShoeLampFrame>(msg);
    updateStates<qint8>(mStateData.lampLeftShoeWear.data, p->lamp_left_shoe_wear(), [this](qint8 value) {
        emit this->lampLeftShoeWearChanged(value);
    });
    updateStates<qint8>(mStateData.lampRightShoeWear.data, p->lamp_right_shoe_wear(), [this](qint8 value) {
        emit this->lampRightShoeWearChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampChargingInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::ChargingLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::ChargingLampFrame>(msg);
    updateStates<qint8>(mStateData.lampChargeConfirm.data, p->lamp_charge_confirm(), [this](qint8 value) {
        emit this->lampChargeConfirmChanged(value);
    });
    updateStates<qint8>(mStateData.lampBatteryMainContact.data, p->lamp_battery_main_contact(), [this](qint8 value) {
        emit this->lampBatteryMainContactChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampWaterInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::WaterLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::WaterLampFrame>(msg);
    updateStates<qint8>(mStateData.lampWaterTempHigh.data, p->lamp_water_temp_high(), [this](qint8 value) {
        emit this->lampWaterTempHighChanged(value);
    });
    updateStates<qint8>(mStateData.lampWaterLevelLow.data, p->lamp_water_level_low(), [this](qint8 value) {
        emit this->lampWaterLevelLowChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampStopInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::StopLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::StopLampFrame>(msg);
    updateStates<qint8>(mStateData.lampLowServiceWl.data, p->lamp_low_service_wl(), [this](qint8 value) {
        emit this->lampLowServiceWlChanged(value);
    });
    updateStates<qint8>(mStateData.lampHeavyStopWl.data, p->lamp_heavy_stop_wl(), [this](qint8 value) {
        emit this->lampHeavyStopWlChanged(value);
    });
    updateStates<qint8>(mStateData.lampSeriousStopWl.data, p->lamp_serious_stop_wl(), [this](qint8 value) {
        emit this->lampSeriousStopWlChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampMoterInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::MoterLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::MoterLampFrame>(msg);
    updateStates<qint8>(mStateData.lampOilLevelLow.data, p->lamp_oil_level_low(), [this](qint8 value) {
        emit this->lampOilLevelLowChanged(value);
    });
    updateStates<qint8>(mStateData.lampOilPressureLow.data, p->lamp_oil_pressure_low(), [this](qint8 value) {
        emit this->lampOilPressureLowChanged(value);
    });
    updateStates<qint8>(mStateData.lampEngineFault.data, p->lamp_engine_fault(), [this](qint8 value) {
        emit this->lampEngineFaultChanged(value);
    });
}

void CustomCarMsgWorker::handleProtoSymbolLampDynamotorInfo(const carfox::MessagePtr &msg) {
    shared_ptr<fyInstrumentInfo::DynamotorLampFrame> p = carfox::down_pointer_cast<fyInstrumentInfo::DynamotorLampFrame>(msg);
    updateStates<qint8>(mStateData.lampMotorOutOfService.data, p->lamp_motor_out_of_service(), [this](qint8 value) {
        emit this->lampMotorOutOfServiceChanged(value);
    });
    updateStates<qint8>(mStateData.lampMoterFireIgon.data, p->lamp_moter_fire_igon(), [this](qint8 value) {
        emit this->lampMoterFireIgonChanged(value);
    });
}

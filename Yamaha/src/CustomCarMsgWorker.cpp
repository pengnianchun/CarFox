
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

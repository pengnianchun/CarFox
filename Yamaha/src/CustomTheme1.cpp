#include "CustomTheme1.hpp"

CustomTheme1::CustomTheme1(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{
    qCInfo(Yamaha);
}

void CustomTheme1::create()
{
    qCDebug(Yamaha);
    // 主界面
    addLayer("qrc:/Theme/Theme1/HomePanel.qml", "HomePanel", carfox::Layer::InstantShow);
    // 公交信息查询
    addLayer("qrc:/Theme/Theme2/CarInfo.qml", "CarInfo", carfox::Layer::ManualShow);
    // 控制系统信息
    addLayer("qrc:/Common/ControlSystem.qml", "ControlSystem", carfox::Layer::ManualShow);
    // 发动机系统信息
    addLayer("qrc:/Common/EngineSystem.qml", "EngineSystem", carfox::Layer::ManualShow);
    // 辅助系统信息
    addLayer("qrc:/Common/AuxiliarySystem.qml", "AuxiliarySystem", carfox::Layer::ManualShow);
    // TCU系统信息
    addLayer("qrc:/Common/TcuSystem.qml", "TcuSystem", carfox::Layer::ManualShow);
    // 电池管理系统
    addLayer("qrc:/Common/BatterySystem.qml", "BatterySystem", carfox::Layer::ManualShow);
    // 电池组信息
    addLayer("qrc:/Common/BatteryStatus.qml", "BatteryStatus", carfox::Layer::ManualShow);
    // 空调系统信息
    addLayer("qrc:/Common/AirConditioning.qml", "AirConditioning", carfox::Layer::ManualShow);
    // InstrumentSystem
    addLayer("qrc:/Common/InstrumentSystem.qml", "InstrumentSystem", carfox::Layer::ManualShow);
    // InstrumentModule
    addLayer("qrc:/Common/InstrumentModule.qml", "InstrumentModule", carfox::Layer::ManualShow);
}

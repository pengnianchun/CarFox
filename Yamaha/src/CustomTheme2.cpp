#include "CustomTheme2.hpp"

CustomTheme2::CustomTheme2(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme2::create()
{
    qDebug() << "CustomTheme2::create";
    // 主界面 for instant show
    //addLayer("qrc:/Theme2/Qml/Theme2/MainPanel.qml", "Themem2MainPanel", carfox::Layer::InstantShow);
    // 触发界面 for manual show
    //addLayer("qrc:/Theme2/Qml/Theme2/TriggerPanel.qml", "Theme2TriggerPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Splash/Splash.qml", "Splash", carfox::Layer::InstantShow);
    addLayer("qrc:/Theme/Theme2/Qml/HomePanel.qml", "HomePanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/AfterModuleWeir.qml", "AfterModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/AirConditioningWeir.qml", "AirCondition", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/AuxiliarySystemWeir.qml", "AuxiliarySystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/BatteryStatusWeir.qml", "BatteryStatus", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/BatterySystemWeir.qml", "BatterySystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/BeforeModuleWeir.qml", "BeforeModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/CenterModuleWeir.qml", "CenterModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/ControlSystemWeir.qml", "ControlSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/EngineSystemWeir.qml", "EngineSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/InstrumentSystemWeir.qml", "InstrumentSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/MenuMainDetailWeir.qml", "MenuMainDetail", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/MenuPanelWeir.qml", "MenuPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/SettingSystemWeir.qml", "SettingSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/TcuSystemWeir.qml", "TcuSystem", carfox::Layer::ManualShow);
}

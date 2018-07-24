#include "CustomTheme12.hpp"

CustomTheme12::CustomTheme12(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme12::create()
{
    qDebug() << "CustomTheme12::create";
    // 主界面 for instant show
    //addLayer("qrc:/Theme2/Qml/Theme2/MainPanel.qml", "Themem2MainPanel", carfox::Layer::InstantShow);
    // 触发界面 for manual show
    //addLayer("qrc:/Theme2/Qml/Theme2/TriggerPanel.qml", "Theme2TriggerPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Splash/Splash.qml", "Splash", carfox::Layer::InstantShow);
    addLayer("qrc:/Theme/Theme2/Qml/HomePanel.qml", "HomePanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/MenuBack.qml", "MenuBack", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/MenuPanelWeir.qml", "MenuPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/AirConditioningWeir.qml", "AirCondition", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/AuxiliarySystemWeir.qml", "AuxiliarySystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/BatteryStatusWeir.qml", "BatteryStatus", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/BatterySystemWeir.qml", "BatterySystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/ControlSystemWeir.qml", "ControlSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/EngineSystemWeir.qml", "EngineSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/InstrumentSystemWeir.qml", "InstrumentSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/MenuMainDetailWeir.qml", "MenuMainDetail", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/SettingSystemWeir.qml", "SettingSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/TcuSystemWeir.qml", "TcuSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/MenuMainWeir.qml", "MenuMain", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/InstrumentModuleWeir.qml", "InstrumentModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/AutomaticRoutine.qml", "AutomaticRoutine", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/DcdcSystemMenu.qml", "DcdcSystemMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/OtherInformationMenu.qml", "OtherInformationMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme2/Qml/Menu/TirePressureMenu.qml", "TirePressureMenu", carfox::Layer::ManualShow);
}

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
    addLayer("qrc:/Theme2/Qml/Theme2/HomePanel.qml", "HomePanel", carfox::Layer::InstantShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/AfterModuleWeir.qml", "AfterModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/AirConditioningWeir.qml", "AirCondition", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/AuxiliarySystemWeir.qml", "AuxiliarySystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/BatteryStatusWeir.qml", "BatteryStatus", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/BatterySystemWeir.qml", "BatterySystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/BeforeModuleWeir.qml", "BeforeModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/CenterModuleWeir.qml", "CenterModule", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/ControlSystemWeir.qml", "ControlSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/EngineSystemWeir.qml", "EngineSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/InstrumentSystemWeir.qml", "InstrumentSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/MenuMainDetailWeir.qml", "MenuMainDetail", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/MenuMainWeir.qml", "MenuMain", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/MenuPanelWeir.qml", "MenuPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/SettingSystemWeir.qml", "SettingSystem", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme2/Qml/Theme2/Component/TcuSystemWeir.qml", "TcuSystem", carfox::Layer::ManualShow);
}

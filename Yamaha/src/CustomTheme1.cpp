#include "CustomTheme1.hpp"

CustomTheme1::CustomTheme1(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme1::create()
{
    qDebug() << "CustomTheme1::create";
    // 主界面 for instant show
    //addLayer("qrc:/Theme/Theme1/Qml/MainPanel.qml", "Themem1MainPanel", carfox::Layer::InstantShow);
    // 触发界面 for manual show
    //addLayer("qrc:/Theme/Theme1/Qml/TriggerPanel.qml", "Theme1TriggerPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Splash/Splash.qml", "Splash", carfox::Layer::InstantShow);
    addLayer("qrc:/Theme/Theme1/Qml/HomePanel.qml", "HomePanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/MenuPanel.qml", "MenuPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/IndicatorPanel.qml", "IndicatorPanel", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/DcdcSystemMenu.qml", "DcdcSystemMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/InstrumentSysMenu.qml", "InstrumentSysMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/LightAdjustMenu.qml", "LightAdjustMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/MoterBatteryMenu.qml", "MoterBatteryMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/OtherInformationMenu.qml", "OtherInformationMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/TimeSettingsMenu.qml", "TimeSettingsMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/TirePressureMenu.qml", "TirePressureMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/VcuSystemMenu.qml", "VcuSystemMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/VideoConvertMenu.qml", "VideoConvertMenu", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/Menu/ThemeSetting.qml", "ThemeSetting", carfox::Layer::ManualShow);
    addLayer("qrc:/Theme/Theme1/Qml/UpdatePanel.qml", "UpdateTheme1", carfox::Layer::ManualShow);
}

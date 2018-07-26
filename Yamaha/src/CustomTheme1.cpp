#include "CustomTheme1.hpp"

CustomTheme1::CustomTheme1(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme1::create()
{
    qDebug() << "CustomTheme1::create";
    // 主界面
    addLayer("qrc:/Theme/theme1/HomePanel.qml", "HomePanel", carfox::Layer::InstantShow);
    // 界面
    //addLayer("qrc:/Theme/Theme1/Qml/TriggerPanel.qml", "Theme1TriggerPanel", carfox::Layer::ManualShow);
}

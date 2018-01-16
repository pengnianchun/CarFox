#include "CustomTheme1.hpp"

CustomTheme1::CustomTheme1(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme1::create()
{
    qDebug() << "CustomTheme1::create";
    // 主界面 for instant show
       addLayer("qrc:/Theme1/Qml/Theme1/MainPanel.qml", "Themem1MainPanel", carfox::Layer::InstantShow);
       // 触发界面 for manual show
       addLayer("qrc:/Theme1/Qml/Theme1/TriggerPanel.qml", "Theme1TriggerPanel", carfox::Layer::ManualShow);
}

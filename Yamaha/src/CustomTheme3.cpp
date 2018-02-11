#include "CustomTheme3.hpp"

CustomTheme3::CustomTheme3(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme3::create()
{
    qDebug() << "CustomTheme3::create";
    // 主界面 for instant show
       addLayer("qrc:/Theme/Theme3/Qml/MainPanel.qml", "Themem3MainPanel", carfox::Layer::InstantShow);
       // 触发界面 for manual show
       addLayer("qrc:/Theme/Theme3/Qml/TriggerPanel.qml", "Theme3TriggerPanel", carfox::Layer::ManualShow);
}

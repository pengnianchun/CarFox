#include "CustomTheme2.hpp"

CustomTheme2::CustomTheme2(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme2::create()
{
    qDebug() << "CustomTheme2::create";
    // 主界面 for instant show
       addLayer("qrc:/Theme2/Qml/Theme2/MainPanel.qml", "Themem2MainPanel", carfox::Layer::InstantShow);
       // 触发界面 for manual show
       addLayer("qrc:/Theme2/Qml/Theme2/TriggerPanel.qml", "Theme2TriggerPanel", carfox::Layer::ManualShow);
}

#include "CustomTheme4.hpp"

CustomTheme4::CustomTheme4(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme4::create()
{
    qDebug() << "CustomTheme1::create";
    // 主界面 for instant show
//       addLayer("qrc:/Theme4/Qml/Theme4/MainPanel.qml", "Themem4MainPanel", carfox::Layer::InstantShow);
//       // 触发界面 for manual show
//       addLayer("qrc:/Theme4/Qml/Theme4/TriggerPanel.qml", "Theme4TriggerPanel", carfox::Layer::ManualShow);
}

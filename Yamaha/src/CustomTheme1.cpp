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
}

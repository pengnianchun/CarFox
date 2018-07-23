#include "CustomTheme2.hpp"

CustomTheme2::CustomTheme2(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme2::create()
{
    qDebug() << "CustomTheme2::create";
    // 主界面
    addLayer("qrc:/Theme/theme2/HomePanel.qml", "HomePanel", carfox::Layer::InstantShow);
    // 导航
    addLayer("qrc:/Theme/theme2/Navigation.qml", "Navigation", carfox::Layer::ManualShow);
    // 电话
    addLayer("qrc:/Theme/theme2/Phone.qml", "Phone", carfox::Layer::ManualShow);
    // 音乐
    addLayer("qrc:/Theme/theme2/Music.qml", "Music", carfox::Layer::ManualShow);
    // 广播
    addLayer("qrc:/Theme/theme2/Radio.qml", "Radio", carfox::Layer::ManualShow);
    // 设置
    addLayer("qrc:/Theme/theme2/Setting.qml", "Setting", carfox::Layer::ManualShow);
    // ADAS
    addLayer("qrc:/Theme/theme2/Adas.qml", "Adas", carfox::Layer::ManualShow);
    // 雷达
    addLayer("qrc:/Theme/theme2/Radar.qml", "Radar", carfox::Layer::ManualShow);
    // 胎压
    addLayer("qrc:/Theme/theme2/TirePressure.qml", "TirePressure", carfox::Layer::ManualShow);
    // 倒车影像
    addLayer("qrc:/Theme/theme2/BackCamera.qml", "BackCamera", carfox::Layer::ManualShow);
    // 驾驶行为分析
    addLayer("qrc:/Theme/theme2/DriveAnalysis.qml", "DriveAnalysis", carfox::Layer::ManualShow);
    // 智能维保预测
    addLayer("qrc:/Theme/theme2/Consumption.qml", "Consumption", carfox::Layer::ManualShow);
    // 历史能耗分析
    addLayer("qrc:/Theme/theme2/ConsumptionHistory.qml", "ConsumptionHistory", carfox::Layer::ManualShow);
    // 整车诊断
    addLayer("qrc:/Theme/theme2/Diagnostic.qml", "Diagnostic", carfox::Layer::ManualShow);
    // 整车调度
    addLayer("qrc:/Theme/theme2/Schedule.qml", "Schedule", carfox::Layer::ManualShow);
    // 驾驶求助
    addLayer("qrc:/Theme/theme2/Ask4Help.qml", "Ask4Help", carfox::Layer::ManualShow);
    // 天气日历
    addLayer("qrc:/Theme/theme2/CalendarWeather.qml", "CalendarWeather", carfox::Layer::ManualShow);
    // 公交信息查询
    addLayer("qrc:/Theme/theme2/CarInfo.qml", "CarInfo", carfox::Layer::ManualShow);
}

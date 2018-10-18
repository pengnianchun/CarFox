#include "CustomTheme2.hpp"

CustomTheme2::CustomTheme2(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{
    qCInfo(Yamaha);
}

void CustomTheme2::create()
{
    qCInfo(Yamaha);
    // 主界面
    addLayer("qrc:/Theme/Theme2/HomePanel.qml", "HomePanel", carfox::Layer::InstantShow);
    // 导航
    addLayer("qrc:/Theme/Theme2/Navigation.qml", "Navigation", carfox::Layer::ManualShow);
    // 电话
    addLayer("qrc:/Theme/Theme2/Phone.qml", "Phone", carfox::Layer::ManualShow);
    // 音乐
    addLayer("qrc:/Theme/Theme2/Music.qml", "Music", carfox::Layer::ManualShow);
    // 广播
    addLayer("qrc:/Theme/Theme2/Radio.qml", "Radio", carfox::Layer::ManualShow);
    // 设置
    addLayer("qrc:/Theme/Theme2/Setting.qml", "Setting", carfox::Layer::ManualShow);
    // ADAS
    addLayer("qrc:/Theme/Theme2/Adas.qml", "Adas", carfox::Layer::ManualShow);
    // 雷达
    addLayer("qrc:/Theme/Theme2/Radar.qml", "Radar", carfox::Layer::ManualShow);
    // 胎压
    addLayer("qrc:/Theme/Theme2/TirePressure.qml", "TirePressure", carfox::Layer::ManualShow);
    // 倒车影像
    addLayer("qrc:/Theme/Theme2/BackCamera.qml", "BackCamera", carfox::Layer::ManualShow);
    // 驾驶行为分析
    addLayer("qrc:/Theme/Theme2/DriveAnalysis.qml", "DriveAnalysis", carfox::Layer::ManualShow);
    // 智能维保预测
    addLayer("qrc:/Theme/Theme2/Consumption.qml", "Consumption", carfox::Layer::ManualShow);
    // 历史能耗分析
    addLayer("qrc:/Theme/Theme2/ConsumptionHistory.qml", "ConsumptionHistory", carfox::Layer::ManualShow);
    // 整车诊断
    addLayer("qrc:/Theme/Theme2/Diagnostic.qml", "Diagnostic", carfox::Layer::ManualShow);
    // 整车调度
    addLayer("qrc:/Theme/Theme2/Schedule.qml", "Schedule", carfox::Layer::ManualShow);
    // 驾驶求助
    addLayer("qrc:/Theme/Theme2/Ask4Help.qml", "Ask4Help", carfox::Layer::ManualShow);
    // 天气日历
    addLayer("qrc:/Theme/Theme2/CalendarWeather.qml", "CalendarWeather", carfox::Layer::ManualShow);
    // 公交信息查询
    addLayer("qrc:/Theme/Theme2/CarInfo.qml", "CarInfo", carfox::Layer::ManualShow);
    // 控制系统信息
    addLayer("qrc:/Common/ControlSystem.qml", "ControlSystem", carfox::Layer::ManualShow);
    // 发动机系统信息
    addLayer("qrc:/Common/EngineSystem.qml", "EngineSystem", carfox::Layer::ManualShow);
    // 辅助系统信息
    addLayer("qrc:/Common/AuxiliarySystem.qml", "AuxiliarySystem", carfox::Layer::ManualShow);
    // TCU系统信息
    addLayer("qrc:/Common/TcuSystem.qml", "TcuSystem", carfox::Layer::ManualShow);
    // 电池管理系统
    addLayer("qrc:/Common/BatterySystem.qml", "BatterySystem", carfox::Layer::ManualShow);
    // 电池组信息
    addLayer("qrc:/Common/BatteryStatus.qml", "BatteryStatus", carfox::Layer::ManualShow);
    // 空调系统信息
    addLayer("qrc:/Common/AirConditioning.qml", "AirConditioning", carfox::Layer::ManualShow);
    // InstrumentSystem
    addLayer("qrc:/Common/InstrumentSystem.qml", "InstrumentSystem", carfox::Layer::ManualShow);
    // InstrumentModule
    addLayer("qrc:/Common/InstrumentModule.qml", "InstrumentModule", carfox::Layer::ManualShow);
}

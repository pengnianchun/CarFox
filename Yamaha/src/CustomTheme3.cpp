#include "CustomTheme3.hpp"

CustomTheme3::CustomTheme3(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId)
    : carfox::Theme(contextProperties, themeId)
{

}

void CustomTheme3::create()
{
    qDebug() << "CustomTheme3::create";
    // 主界面 for instant show
//       addLayer("qrc:/Theme/Theme3/Qml/MainPanel.qml", "Themem3MainPanel", carfox::Layer::InstantShow);
//       // 触发界面 for manual show
//       addLayer("qrc:/Theme/Theme3/Qml/TriggerPanel.qml", "Theme3TriggerPanel", carfox::Layer::ManualShow);

       addLayer("qrc:/Theme/Theme3/Qml/MainPanel.qml","MainPanel",carfox::Layer::InstantShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/MenuPanel.qml","MenuPanel",carfox::Layer::ManualShow);
//       addLayer("qrc:/Theme/Theme3/Qml/Menu/BatteryManageSysInfo.qml","BatteryManageSysInfo",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/BringhtnessControl.qml","BringhtnessControl",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/DCDC.qml","DCDC",carfox::Layer::ManualShow);
//       addLayer("qrc:/Theme/Theme3/Qml/Menu/IconPanel.qml","IconPanel",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/MiscellaneousInforQuery.qml","MiscellaneousInforQuery",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/PowerBattery1.qml","PowerBattery1",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/PowerBattery2.qml","PowerBattery2",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/SBatteryTempInfo.qml","SBatteryTempInfo",carfox::Layer::ManualShow);
//       addLayer("qrc:/Theme/Theme3/Qml/Menu/SBatteryVoltageInfo.qml","SBatteryVoltageInfo",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/TimeSetting.qml","TimeSetting",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/TPMS.qml","TPMS",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/VCU.qml","VCU",carfox::Layer::ManualShow);
       addLayer("qrc:/Theme/Theme3/Qml/Menu/VehicleCtrlSysDiagInterface.qml","VehicleCtrlSysDiagInterface",carfox::Layer::ManualShow);
}

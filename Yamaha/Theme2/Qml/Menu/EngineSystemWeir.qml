import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    x: 360
    y: 130
    width: 750
    height: 350

    menuLayerId: "EngineSystem"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        // default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }


    //发动机系统信息
    property int engineWaterTemp: CarMsg.engineWaterTemp //发动机水温
    property double engineOilPressure: CarMsg.engineOilPressure //发动机机油压力
    property double engineFuelConsumption: CarMsg.engineFuelConsumption //发动机油耗
    property int engineLoad: CarMsg.engineLoad //发动机负荷
    property double engineTargetThrottle: CarMsg.engineTargetThrottle //发动机目标油门
    property double engineActualThrottle: CarMsg.engineActualThrottle //发动机实际油门
    property int engineInletTemperature: CarMsg.engineInletTemperature //发动机进气温度

    onEngineWaterTempChanged: { //发动机水温
        listmodelone.setProperty(0, "value", engineWaterTemp);
    }
    onEngineOilPressureChanged: { //发动机机油压力
        listmodelone.setProperty(1, "value", engineOilPressure);
    }
    onEngineFuelConsumptionChanged: { //发动机油耗
        listmodelone.setProperty(2, "value", engineFuelConsumption);
    }
    onEngineLoadChanged: { //发动机负荷
        listmodelone.setProperty(3, "value", engineLoad);
    }
    onEngineTargetThrottleChanged: { //发动机目标油门
        listmodeltwo.setProperty(0, "value", engineTargetThrottle);
    }
    onEngineActualThrottleChanged: { //发动机实际油门
        listmodeltwo.setProperty(1, "value", engineActualThrottle);
    }
    onEngineInletTemperatureChanged: { //发动机进气温度
        listmodeltwo.setProperty(2, "value", engineInletTemperature);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "发动机水温";value: "0";unit: "℃" }
        ListElement { name: "发动机机油压力";value: "00000000";unit: "KPM" }
        ListElement { name: "发动机油耗";value: "0";unit: "L/H" }
        ListElement { name: "发动机负荷";value: "0";unit: "%" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "发动机目标油门";value: "0.0";unit: "%" }
        ListElement { name: "发动机实际油门";value: "0.0";unit: "%" }
        ListElement { name: "发动机进气温度";value: "00000000";unit: "℃" }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 50

        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 60
        }

        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 60
        }
    }
}

import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
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

    Component.onCompleted: {
        //CarMsg.sendMenuInfo(?, ?);
    }

    //发动机系统信息
    property string engineFuelConsumption: CarMsg.engineFuelConsumption.toFixed(2) //发动机油耗
    property string engineLoad: CarMsg.engineLoad //发动机负荷
    property string engineTargetThrottle: CarMsg.engineTargetThrottle.toFixed(1) //发动机目标油门
    property string engineActualThrottle: CarMsg.engineActualThrottle.toFixed(1) //发动机实际油门
    property string engineInletTemperature: CarMsg.engineInletTemperature //发动机进气温度

    onEngineFuelConsumptionChanged: { //发动机油耗
        listmodelone.setProperty(0, "value", engineFuelConsumption);
    }
    onEngineLoadChanged: { //发动机负荷
        listmodelone.setProperty(1, "value", engineLoad);
    }
    onEngineTargetThrottleChanged: { //发动机目标油门
        listmodelone.setProperty(2, "value", engineTargetThrottle);
    }
    onEngineActualThrottleChanged: { //发动机实际油门
        listmodelone.setProperty(3, "value", engineActualThrottle);
    }
    onEngineInletTemperatureChanged: { //发动机进气温度
        listmodelone.setProperty(4, "value", engineInletTemperature);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "发动机油耗"; value: "0"; unit: "L/H" }
        ListElement { name: "发动机负荷"; value: "0"; unit: "%" }
        ListElement { name: "发动机目标油门"; value: "0.0"; unit: "%" }
        ListElement { name: "发动机实际油门"; value: "0.0"; unit: "%" }
        ListElement { name: "发动机进气温度"; value: "00000000"; unit: "℃" }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 50

        ListViewWeir {
            listModel: listmodelone
            width: parent.width
            height: parent.height
            fontSizeList: 15
            unitWidthList: 60
        }
    }
}

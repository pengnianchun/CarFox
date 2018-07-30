import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    menuLayerId: "EngineSystem"
    parentMenuId: "MenuMainDetail"

    //发动机系统信息
    property string engineFuelConsumption: CarMsg.engineFuelConsumption.toFixed(2) //发动机油耗
    property string engineLoad: CarMsg.engineLoad.toFixed(2) //发动机负荷
    property string engineTargetThrottle: CarMsg.engineTargetThrottle.toFixed(2) //发动机目标油门
    property string engineActualThrottle: CarMsg.engineActualThrottle.toFixed(2) //发动机实际油门
    property string engineInletTemperature: CarMsg.engineInletTemperature.toFixed(0) //发动机进气温度

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
        ListElement { name: "发动机油耗"; value: "0.00"; unit: "L/H" }
        ListElement { name: "发动机负荷"; value: "0.00"; unit: "%" }
        ListElement { name: "发动机目标油门"; value: "0.00"; unit: "%" }
        ListElement { name: "发动机实际油门"; value: "0.00"; unit: "%" }
        ListElement { name: "发动机进气温度"; value: "0"; unit: "℃" }
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("发动机系统信息")
        color: "white"
        font.pixelSize: 28
    }

    Image {
        anchors.top: title.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Modules/infoSearch/bg_title.png"
    }

    ListViewWeir {
        x: 200
        y: 80
        width: 400
        height: 300
        listModel: listmodelone
        fontSizeList: 12
        unitWidthList: 60
    }

    enterMenu: function() {
        // default
    }

    hideMenu: function() {
        // default
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
}

import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
//import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    width: 800
    height: 410

    menuLayerId: "AuxiliarySystem"
    parentMenuId: "MenuMainDetail"

    //辅助系统信息
    property string oilPumpDcacWoutputCurrent: CarMsg.oilPumpDcacWoutputCurrent.toFixed(0) //油泵DC/AC W相输出电流
    property string oilPumpDcacVoutputCurrent: CarMsg.oilPumpDcacVoutputCurrent.toFixed(0) //油泵DC/AC V相输出电流
    property string oilPumpDcacUoutputCurrent: CarMsg.oilPumpDcacUoutputCurrent.toFixed(0) //油泵DC/AC U相输出电流
    property string radiatorTemperature: CarMsg.radiatorTemperature //散热器温度

    onOilPumpDcacWoutputCurrentChanged: { //油泵DC/AC W相输出电流
        listmodelone.setProperty(0, "value", oilPumpDcacWoutputCurrent);
    }
    onOilPumpDcacVoutputCurrentChanged: { //油泵DC/AC V相输出电流
        listmodelone.setProperty(1, "value", oilPumpDcacVoutputCurrent);
    }
    onOilPumpDcacUoutputCurrentChanged: { //油泵DC/AC U相输出电流
        listmodelone.setProperty(2, "value", oilPumpDcacUoutputCurrent);
    }
    onRadiatorTemperatureChanged: { //散热器温度
        listmodelone.setProperty(3, "value", radiatorTemperature);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "油泵DC/AC W相输出电流"; value: "0"; unit: "A" }
        ListElement { name: "油泵DC/AC V相输出电流"; value: "0"; unit: "A" }
        ListElement { name: "油泵DC/AC U相输出电流"; value: "0"; unit: "A" }
        ListElement { name: "散热器温度"; value: "0"; unit: "℃" }
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("辅助系统信息")
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
        fontSizeList: 15
        unitWidthList: 45
    }

    enterMenu: function() {
        //default
    }

    hideMenu: function() {
        //default
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

import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/Theme2"

MenuItem {
    width: 800
    height: 410

    menuLayerId: "BatteryStatus"
    parentMenuId: "MenuMainDetail"

    property var voltageIndex: CarMsg.voltageIndex
    property var voltageInfo: CarMsg.voltageInfo
    property var tempIndex: CarMsg.tempIndex
    property var tempInfo: CarMsg.tempInfo

    onVoltageInfoChanged: {
        battery_model.clear();
        battery_model.append({"name":"电池序号","value":"电池电压","unit":"单位"});
        for(var i in voltageInfo){
            battery_model.append({"name":voltageIndex[i].toString(),"value":voltageInfo[i].toFixed(2),"unit":"V"});
        }
    }

    onTempInfoChanged: {
        temperature_model.clear();
        temperature_model.append({"name":"电池序号","value":"电池温度","unit":"单位"});
        for(var i in tempInfo){
            temperature_model.append({"name":tempIndex[i].toString(),"value":tempInfo[i].toFixed(0),"unit":"℃"});
        }
    }

    ListModel { id: battery_model }
    ListModel { id: temperature_model }

    Image {
        x: 275
        y: 25
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/more_before.png"
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("电池组信息")
        color: "white"
        font.pixelSize: 28
    }

    Image {
        x: 525
        y: 25
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/more.png"
    }

    Image {
        anchors.top: title.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Modules/infoSearch/bg_title.png"
    }

    FishSpinner {
        width: 100
        height: 100
        anchors.centerIn: batIndex
        visible: battery_model.count < 5
    }

    FishSpinner {
        width: 100
        height: 100
        anchors.centerIn: batTemp
        visible: temperature_model.count < 5
    }

    //电池组信息
    Column {
        id: batIndex
        x: 140
        y: 80
        width: 300
        height: 300
        Repeater {
            width: parent.width - 50
            height: parent.height
            model: battery_model
            delegate: TextValueWeir {
                width: 200
                height: 25
                textTitle: name
                textValue: value
                unitValue: unit
                fontColor: "#00a7f5"
                textWidth: 180
                fontSize: 12
                unitWidth: 45
                leftAlignStatus: false
            }
        }
    }

    Column {
        id: batTemp
        x: 500
        y: 80
        width: 300
        height: 300
        Repeater {
            width: parent.width - 50
            height: parent.height
            model: temperature_model
            delegate: TextValueWeir {
                width: 200
                height: 25
                textTitle: name
                textValue: value
                unitValue: unit
                fontColor: "#00a7f5"
                textWidth: 150
                fontSize: 12
                unitWidth: 45
                leftAlignStatus: false
            }
        }
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

    onVisibleChanged: {
        if (visible) {
            CarMsg.sendMenuInfo(26, 0);
        }
    }

    Component.onCompleted: {

    }
}

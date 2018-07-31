import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
//import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    width: 800
    height: 410

    menuLayerId: "BatteryStatus"
    parentMenuId: "MenuMainDetail"

    property var voltageInfo: CarMsg.voltageInfo
    property var tempInfo: CarMsg.tempInfo

    onVoltageInfoChanged: {
        battery_model.clear();
        for(var i in voltageInfo){
            battery_model.append({"number":i,"voltage":voltageInfo[i].toFixed(2)});
        }
    }

    onTempInfoChanged: {
        temperature_model.clear();
        for(var i in tempInfo){
            temperature_model.append({"number":i,"temperature":tempInfo[i].toFixed(0)});
        }
    }

    ListModel { id: battery_model }
    ListModel { id: temperature_model }

    ListModel {
        id: listmodel1
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel2
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel3
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel4
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel5
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel6
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel7
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }
    ListModel {
        id: listmodel8
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
        ListElement { name: ""; value: ""; unit: "" }
    }

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

    //电池组信息
    ColumnLayout {
        z: 1
        width: 750
        height: 350
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        spacing: -150

        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "01~10"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel7
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "11~20"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel8
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }

        Item {
            width: parent.width;
            height: 30
            TextFieldWeir {
                textValue: "(单位：V)"
                width: 50
                height: 30
                textHeight: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
        }

        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "01~10"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel1
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 0
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "11~20"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel2
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "21~30"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel3
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 1
                textValue: "31~40"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel4
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "41~50"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel5
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "51~60"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel6
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        TextFieldWeir {
            x: 940
            y: 330
            z: 3
            textValue: "(单位：℃)"
            width: 50
            height: 30
            textHeight: 30
            fontSize: 12
            fontColor: "#00a7f5"
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

    Component.onCompleted: {
        //CarMsg.sendMenuInfo(?, ?);
    }
}

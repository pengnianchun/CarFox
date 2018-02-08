import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "qrc:/Common/JS/InstrumentInfo.js" as InstrumentInfo
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "../../JS/InstrumentController.js" as InstrumentController

MenuItem {
    menuLayerId: "BeforeModule"
    parentMenuId: "MenuMainDetail"
    width: 900
    height: 350
    x: 265
    y: 120
    property var listModelIdArray: [listmodel_one,listmodel_two,listmodel_three,listmodel_four]

    Component.onCompleted: {
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        InstrumentController.initializeBeforeModule(listModelIdArray,instrumentInfoResource);
    }

    enterMenu: function(){}
    hideMenu: function(){
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){}
    nextMenu: function(){}

    ListModel {
        id: listmodel_one
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
    }
    ListModel {
        id: listmodel_two
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
    }
    ListModel {
        id: listmodel_three
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodel_four
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "";checkstatus:true }
    }
    RowLayout {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        Rectangle {
            width: 530
            height: 270
            color: "transparent"
            border.color: "#ffffff"
            radius: 20
            Rectangle {
                width: 50
                height: 20
                color: "#000000"
                anchors.top: parent.top
                anchors.topMargin: -10
                anchors.horizontalCenter: parent.horizontalCenter
                TextFieldWeir {
                    textWidth: parent.width
                    textHeight: parent.height
                    textValue: "输出"
                    fontBold: true
                    fontSize: 15
                }
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                listModel: listmodel_one
                width: parent.width/4-70
                height: parent.height
                widthListView: parent.width/4-100
                fontSizeList: 15
                listRadioType: 2
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 260
                listModel: listmodel_two
                width: parent.width/4-70
                height: parent.height
                widthListView: parent.width/4-100
                fontSizeList: 15
                unitWidthList: 40
                listRadioType: 2
            }
        }
        Rectangle {
            width: 395
            height: 270
            color: "transparent"
            border.color: "#ffffff"
            radius: 20
            Rectangle {
                width: 50
                height: 20
                color: "#000000"
                anchors.top: parent.top
                anchors.topMargin: -10
                anchors.horizontalCenter: parent.horizontalCenter
                TextFieldWeir {
                    textWidth: parent.width
                    textHeight: parent.height
                    textValue: "输入"
                    fontBold: true
                    fontSize: 15
                }
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                listModel: listmodel_three
                width: parent.width/4-130
                height: parent.height
                widthListView: parent.width/4-150
                fontSizeList: 15
                unitWidthList: 40
                listRadioType: 1
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 210
                listModel: listmodel_four
                width: parent.width/4-70
                height: parent.height
                widthListView: parent.width/4-100
                fontSizeList: 15
                unitWidthList: 40
                listRadioType: 1
            }
        }
    }
    ColumnLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        RowLayout {
            spacing: 100
            TextRadioWeir {
                id: analog_input1
                width: 260
                height: 30
                radioType: 2
                textTitle: "模拟量输入 1"
                textValue: "1.0"//0.1倍
                unitValue: "Ω"
                checkRadioStatus: true
                fontSize: 15
                unitWidth: 60
            }
            TextRadioWeir {
                id: analog_input2
                width: 260
                height: 30
                radioType: 2
                textTitle: "模拟量输入 2"
                textValue: "1.0"//0.1倍
                unitValue: "Ω"
                checkRadioStatus: true
                fontSize: 15
                unitWidth: 60
            }
        }
        RowLayout {
            spacing: 100
            TextRadioWeir {
                id: frequency_input
                width: 260
                height: 30
                radioType: 2
                textTitle: "频率输入"
                textValue: "1.0"
                unitValue: "HZ"
                checkRadioStatus: true
                fontSize: 15
                unitWidth: 60
            }
            TextRadioWeir {
                id: speed_input
                width: 260
                height: 30
                radioType: 2
                textTitle: "车速输入"
                textValue: "120"
                unitValue: "KM/H"
                checkRadioStatus: true
                fontSize: 15
                unitWidth: 60
            }
        }
    }
}

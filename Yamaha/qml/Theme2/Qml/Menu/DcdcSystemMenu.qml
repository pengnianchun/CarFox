import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    width: 1440
    height: 544

    menuLayerId: "DcdcSystemMenu"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        // default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }

    Component.onCompleted: {
        CarMsg.sendMenuInfo(26, 0);
    }

    property string dcLowVoltage: CarMsg.dcLowVoltage.toFixed(1) //DCDC低压电压
    property string dcLowCurrent: CarMsg.dcLowCurrent.toFixed(1) //DCDC低压电流
    property string dcTemp: CarMsg.dcTemp.toFixed(0) //DCDC温度
    property string dcStatus: CarMsg.dcStatus2.toFixed(0) //DCDC状态2
    property string dcUndervoltage: CarMsg.dcUndervoltage ? "正常" : "报警" //DCDC欠压
    property string dcOvervoltage: CarMsg.dcOvervoltage ? "正常" : "报警" //DCDC过压
    property string dcOverheating: CarMsg.dcOverheating ? "正常" : "报警" //DCDC过热
    property string dcShortCircuit: CarMsg.dcShortCircuit ? "正常" : "报警" //DCDC短路
    property string dcWorkStatus: CarMsg.dcWorkStatus ? "正常" : "报警" //DCDC工作状态

    onDcLowVoltageChanged: { //DCDC低压电压
        listmodelone.setProperty(0, "value", dcLowVoltage)
    }
    onDcTempChanged: { //DCDC温度
        listmodelone.setProperty(1, "value", dcTemp)
    }
    onDcUndervoltageChanged: { //DCDC欠压
        listmodelone.setProperty(2, "value", dcUndervoltage)
    }
    onDcOverheatingChanged: { //DCDC过热
        listmodelone.setProperty(3, "value", dcOverheating)
    }
    onDcStatusChanged: { //DCDC状态2
        if (dcStatus === "1") {
            listmodelone.setProperty(4, "value", "工作");
        } else if (dcStatus === "2") {
            listmodelone.setProperty(4, "value", "断开");
        } else {
            listmodelone.setProperty(4, "value", "报警");
        }
    }

    onDcLowCurrentChanged: { //DCDC低压电流
        listmodeltwo.setProperty(0, "value", dcLowCurrent)
    }
    onDcWorkStatusChanged: { //DCDC工作状态
        listmodeltwo.setProperty(1, "value", dcWorkStatus)
    }
    onDcOvervoltageChanged: { //DCDC过压
        listmodeltwo.setProperty(2, "value", dcOvervoltage)
    }
    onDcShortCircuitChanged: { //DCDC短路
        listmodeltwo.setProperty(3, "value", dcShortCircuit)
    }

    ListModel {
        id: listmodelone
        ListElement { name: "DCDC低压电压"; value: ""; unit: "V" }
        ListElement { name: "DCDC温度"; value: ""; unit: "℃" }
        ListElement { name: "DCDC欠压"; value: ""; unit: "" }
        ListElement { name: "DCDC过热"; value: ""; unit: "" }
        ListElement { name: "DCDC状态"; value: ""; unit: "" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "DCDC低压电流"; value: ""; unit: "A" }
        ListElement { name: "DCDC工作状态"; value: ""; unit: "" }
        ListElement { name: "DCDC过压"; value: ""; unit: "" }
        ListElement { name: "DCDC短路"; value: ""; unit: "" }
    }

    RowLayout {
        width: 560
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 50

        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 15
            titleColorList: "#00a7f5"
            listViewSpacing: 25
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 15
            titleColorList: "#00a7f5"
            listViewSpacing: 25
        }
    }
}

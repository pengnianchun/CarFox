import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "DcdcSystemMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property string dcLowVoltage: CarMsg.dcLowVoltage.toFixed(1)
    property string dcLowCurrent: CarMsg.dcLowCurrent.toFixed(1)
    property string dcTemp: CarMsg.dcTemp.toFixed(0)
    property string dcStatus: CarMsg.dcStatus2.toFixed(0)
    property string dcUndervoltage: CarMsg.dcUndervoltage ? "正常" : "报警"
    property string dcOvervoltage: CarMsg.dcOvervoltage ? "正常" : "报警"
    property string dcOverheating: CarMsg.dcOverheating ? "正常" : "报警"
    property string dcShortCircuit: CarMsg.dcShortCircuit ? "正常" : "报警"
    property string dcWorkStatus: CarMsg.dcWorkStatus ? "正常" : "报警"

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }
    }
    TextFieldWeir {
        id: title
        textValue: "DC/DC系统信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    onDcStatusChanged: {
        if(dcStatus === "1"){
            listmodelone.setProperty(4,"value","工作");
        }else if(dcStatus === "2"){
            listmodelone.setProperty(4,"value","断开");
        }else{
            listmodelone.setProperty(4,"value","报警");
        }
    }
    onDcLowCurrentChanged: { listmodelone.setProperty(0,"value",dcLowVoltage) }
    onDcLowVoltageChanged: { listmodeltwo.setProperty(0,"value",dcLowCurrent) }
    onDcTempChanged: { listmodelone.setProperty(1,"value",dcTemp) }
    onDcOvervoltageChanged: { listmodeltwo.setProperty(2,"value",dcOvervoltage) }
    onDcOverheatingChanged: { listmodelone.setProperty(3,"value",dcOverheating) }
    onDcUndervoltageChanged: { listmodelone.setProperty(2,"value",dcUndervoltage) }
    onDcShortCircuitChanged: { listmodeltwo.setProperty(3,"value",dcShortCircuit) }
    onDcWorkStatusChanged: { listmodeltwo.setProperty(1,"value",dcWorkStatus) }
    ListModel {
        id: listmodelone
        ListElement { name: "DCDC低压电压";value: "";unit: "V" }
        ListElement { name: "DCDC温度";value: "";unit: "℃" }
        ListElement { name: "DCDC欠压";value: "";unit: "" }
        ListElement { name: "DCDC过热";value: "";unit: "" }
        ListElement { name: "DCDC状态";value: "";unit: "" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "DCDC低压电流";value: "";unit: "A" }
        ListElement { name: "DCDC工作状态";value: "";unit: "" }
        ListElement { name: "DCDC过压";value: "";unit: "" }
        ListElement { name: "DCDC短路";value: "";unit: "" }
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
            fontSizeList: 12
            titleColorList: "#00a7f5"
            listViewSpacing: 25
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 12
            titleColorList: "#00a7f5"
            listViewSpacing: 25
        }
    }
}

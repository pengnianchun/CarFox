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

    menuLayerId: "AirCondition"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        // default
    }
    hideMenu: function(){
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

    //空调系统信息
    property string acFaultCode: CarMsg.acFaultCode.toString(2) //空调故障代码
    property string acFanStatus: CarMsg.acFanStatus.toString(2) //空调风机状态
    property string acWorkStatus: CarMsg.acWorkStatus.toString(2) //空调工作状态
    property string acLife: CarMsg.acLife //空调Life
    property string acOutTemp: CarMsg.acOutTemp //车外实际温度
    property string acInTemp: CarMsg.acInTemp //车内实际温度
    property string acSetTemp: CarMsg.acSetTemp //设定温度
    property string acRefrigereReq: CarMsg.acRefrigereReq.toString(2) //空调制冷请求

    onAcFaultCodeChanged: { //空调故障代码
        listmodelone.setProperty(0, "value", acFaultCode);
    }
    onAcFanStatusChanged: { //空调风机状态
        listmodelone.setProperty(1, "value", acFanStatus);
    }
    onAcWorkStatusChanged: { //空调工作状态
        listmodelone.setProperty(2, "value", acWorkStatus);
    }
    onAcLifeChanged: { //空调Life
        listmodelone.setProperty(3, "value", acLife);
    }
    onAcOutTempChanged: { //车外实际温度
        listmodeltwo.setProperty(0, "value", acOutTemp);
    }
    onAcInTempChanged: { //车内实际温度
        listmodeltwo.setProperty(1, "value", acInTemp);
    }
    onAcSetTempChanged: { //设定温度
        listmodeltwo.setProperty(2, "value", acSetTemp);
    }
    onAcRefrigereReqChanged: { //空调制冷请求
        listmodeltwo.setProperty(3, "value", acRefrigereReq);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "空调故障代码"; value: "00000000"; unit: "" }
        ListElement { name: "空调风电状态"; value: "00000000"; unit: "" }
        ListElement { name: "空调工作状态"; value: "00000000"; unit: "" }
        ListElement { name: "空调 Life"; value: "0"; unit: "" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "车外实际温度"; value: "0"; unit: "℃" }
        ListElement { name: "车内实际温度"; value: "0"; unit: "℃" }
        ListElement { name: "设定温度"; value: "0"; unit: "℃" }
        ListElement { name: "空调制冷请求"; value: "00000000"; unit: "" }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 50

        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 40
        }
    }
}

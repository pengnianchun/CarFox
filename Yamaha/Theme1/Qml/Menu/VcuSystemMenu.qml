import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "VcuSystemMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainController.backMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }
    }
    TextFieldWeir {
        id: title
        textValue: "整车系统信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    ListModel {
        id: listmodelone
        //脚刹 无 手刹 无
        ListElement { name: "驱动系统状态";value: "ready";unit: "" }
        //正常工作 非回收 非零锁 非定速
        ListElement { name: "驱动电机状态";value: "正常工作";unit: "" }
        ListElement { name: "钥匙acc档";value: "关闭";unit: "" }
        ListElement { name: "高压互锁状态";value: "互锁";unit: "" }
        ListElement { name: "空压机工作状态";value: "停止";unit: "" }
        ListElement { name: "空压机电机转速";value: "26.9";unit: "r/min" }
        ListElement { name: "空压机电机温度";value: "000";unit: "℃" }
        ListElement { name: "空压控制器温度";value: "000";unit: "℃" }
        ListElement { name: "气压3";value: "0.00";unit: "mpa" }
        ListElement { name: "气压4";value: "0.00";unit: "mpa" }
        ListElement { name: "气压5";value: "0.00";unit: "mpa" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "钥匙on档";value: "关闭";unit: "" }
        ListElement { name: "高压上电状态";value: "下电";unit: "" }
        ListElement { name: "助力泵工作状态";value: "停止";unit: "" }
        ListElement { name: "转向助力电机转速";value: "0000";unit: "r/min" }
        ListElement { name: "转向助力电机温度";value: "000";unit: "℃" }
        ListElement { name: "转向控制器温度";value: "000";unit: "℃" }
        ListElement { name: "最高报警等级";value: "无故障";unit: "" }
        ListElement { name: "故障报警形式";value: "正常";unit: "" }
        ListElement { name: "档位驱动模式";value: "直驱模式";unit: "" }
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
            fontSizeList: 11
            titleColorList: "#00a7f5"
            listViewSpacing: 25
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 11
            titleColorList: "#00a7f5"
            listViewSpacing: 25
            unitWidthList: 40
        }
    }
}

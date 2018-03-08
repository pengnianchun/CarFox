import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "DcdcSystemMenu"
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
        textValue: "DC/DC系统信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    ListModel {
        id: listmodelone
        ListElement { name: "DCDC低压电压";value: "26.9";unit: "V" }
        ListElement { name: "DCDC温度";value: "24";unit: "℃" }
        ListElement { name: "DCDC欠压";value: "正常";unit: "" }
        ListElement { name: "DCDC过热";value: "正常";unit: "" }
        ListElement { name: "DCDC状态2";value: "工作";unit: "" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "DCDC低压电流";value: "4.1";unit: "A" }
        ListElement { name: "DCDC工作状态";value: "启动工作";unit: "" }
        ListElement { name: "DCDC过压";value: "正常";unit: "" }
        ListElement { name: "DCDC短路";value: "正常";unit: "" }
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
        }
    }
}

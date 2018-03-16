import QtQuick 2.6
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "OtherInformationMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }
    }
    TextFieldWeir {
        id: title
        textValue: "杂项信息查询"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    TextValueWeir {
        width: 200
        height: 30
        textTitle: "速比"
        textValue: "1500"
        unitValue: ""
        titleColor: "#00a7f5"
        textWidth: 400
        fontSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 190
        leftAlignStatus: true
    }
    TextValueWeir {
        property bool hummerStatus: true
        width: 200
        height: 30
        textTitle: "蜂鸣器"
        textValue: hummerStatus ? "开启" : "关闭"
        unitValue: ""
        titleColor: "#00a7f5"
        textWidth: 400
        fontSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 240
        leftAlignStatus: true
    }
}

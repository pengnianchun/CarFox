import QtQuick 2.6
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
import CustomEnum 1.0
import "../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    menuLayerId: "BatterySystem"
    parentMenuId: "MenuMainDetail"
    width: 750
    height: 350
    x: 360
    y: 130

    enterMenu: function(){}
    hideMenu: function(){
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){}
    nextMenu: function(){}

    ListModel {
        id: listmodelone
        ListElement { name: "电池总电压";value: "0";unit: "V" }
        ListElement { name: "最大允许充电电流";value: "0";unit: "A" }
        ListElement { name: "最大允许放电电流";value: "0";unit: "A" }
        ListElement { name: "单体平均电压";value: "0.00";unit: "V" }
        ListElement { name: "电池状态 1";value: "0000000";unit: "" }
        ListElement { name: "电池状态 2";value: "0000000";unit: "" }
        ListElement { name: "电池状态 3";value: "0000000";unit: "" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "总正绝缘电阻";value: "0";unit: "KΩ" }
        ListElement { name: "总负绝缘电阻";value: "0";unit: "KΩ" }
        ListElement { name: "单体最高电圧";value: "0.00";unit: "V" }
        ListElement { name: "单体最低电压";value: "0.00";unit: "V" }
        ListElement { name: "单体最高温度";value: "-40";unit: "℃" }
        ListElement { name: "充放电电流";value: "0";unit: "A" }
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

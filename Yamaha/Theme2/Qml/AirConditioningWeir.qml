import QtQuick 2.6
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
import CustomEnum 1.0
import "../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    menuLayerId: "AirCondition"
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
        ListElement { name: "空调故障代码";value: "00000000";unit: "" }
        ListElement { name: "空调风电状态";value: "00000000";unit: "" }
        ListElement { name: "空调工作状态";value: "00000000";unit: "" }
        ListElement { name: "空调 Life";value: "0";unit: "" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "车外实际温度";value: "0";unit: "℃" }
        ListElement { name: "车内实际温度";value: "0";unit: "℃" }
        ListElement { name: "设定温度";value: "0";unit: "℃" }
        ListElement { name: "空调制冷请求";value: "00000000";unit: "" }
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

import QtQuick 2.6
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    menuLayerId: "TcuSystem"
    parentMenuId: "MenuMainDetail"
    width: 750
    height: 350
    x: 360
    y: 130

    enterMenu: function(){}
    hideMenu: function(){
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){}
    nextMenu: function(){}

    ListModel {
        id: listmodelone
        ListElement { name: "离合实际位置";value: "0";unit: "" }
        ListElement { name: "档位";value: "0";unit: "" }
        ListElement { name: "TCU故障信息";value: "00000000";unit: "" }
        ListElement { name: "变速箱输出轴转速";value: "0";unit: "" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "FMI";value: "0";unit: "" }
        ListElement { name: "SPW";value: "0";unit: "" }
        ListElement { name: "CM";value: "0";unit: "" }
        ListElement { name: "OC";value: "0";unit: "" }
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
        }
    }
}

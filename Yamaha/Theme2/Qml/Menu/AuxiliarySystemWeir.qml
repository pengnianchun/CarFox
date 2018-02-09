import QtQuick 2.6
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    menuLayerId: "AuxiliarySystem"
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
        ListElement { name: "油泵DC/AC W相输出电流";value: "0";unit: "A" }
        ListElement { name: "油泵DC/AC V相输出电流";value: "0";unit: "A" }
        ListElement { name: "油泵DC/AC U相输出电流";value: "0";unit: "A" }
        ListElement { name: "散热器温度";value: "0";unit: "℃" }
        ListElement { name: "故障代码";value: "0";unit: "" }
    }
    ListViewWeir {
        listModel: listmodelone
        width: parent.width
        height: parent.height
        textWidthList: 500
        fontSizeList: 15
    }
}

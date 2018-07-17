import QtQuick 2.0
import CustomEnum 1.0
import "qrc:/Component/Component"


MenuItem {
    id: root_item;

    width: 750
    height: 350

    menuLayerId: "AuxiliarySystem"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        //default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        //MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }
}

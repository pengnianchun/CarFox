import QtQuick 2.0
import CustomEnum 1.0
import "qrc:/Component/Component"


MenuItem {
    id: root_item;

    width: 750
    height: 350


    ListModel {
        id: modelRight
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_littleLight.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_insulationRed.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/motor_notworking.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryCut.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryFault.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/lampBatHigtTemp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryFireAlarm.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/engineFailue.png"; }
    }

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

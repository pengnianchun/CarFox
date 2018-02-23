import QtQuick 2.0
import CustomEnum 1.0
import "../../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "InstrumentSysMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainController.backMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }
    }

    Item {
        x: 670
        y: 108
        width: 100
        height: 20
        Text {
            id: title
            anchors.centerIn: parent
            text: "仪表系统信息"
            color: "white"
            font.pixelSize: 25
            //font.family:FontName.fontCurrentFzLt
        }
    }
}
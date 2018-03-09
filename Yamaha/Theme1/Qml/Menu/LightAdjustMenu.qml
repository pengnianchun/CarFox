import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "LightAdjustMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.backMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }
    }
    TextFieldWeir {
        id: title
        textValue: "灯光调节信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }    
}

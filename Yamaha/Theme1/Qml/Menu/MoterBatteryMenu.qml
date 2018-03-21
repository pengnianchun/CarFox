import QtQuick 2.6
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "MoterBatteryMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property int boxNumberVoltage: CarMsg.boxNumberVoltage
    property var voltageInfo: CarMsg.voltageInfo

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }
    }
    TextFieldWeir {
        id: title
        textValue: "动力电池信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    onVoltageInfoChanged: {
        console.log("=============0000=================" + boxNumberVoltage);
        console.log("=============1111=================" + voltageInfo);
        console.log("=============2222=================" + JSON.stringify(voltageInfo));
    }
}

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

    property int percentageValue: 50

    enterMenu: function(){
    }
    hideMenu: function(){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
            UiController.currentLayerId = "closeLight";
    }
    previousMenu: function(){
        if(percentageValue > 0){
            percentageValue-=10;
            progress.width = (percentageValue/100)*270;
            CarMsg.sendBrightnessControl(percentageValue);
        }else{}
    }
    nextMenu: function(){
        if(percentageValue < 100){
            percentageValue+=10;
            progress.width = (percentageValue/100)*270;
            CarMsg.sendBrightnessControl(percentageValue);
        }else{}
    }
    TextFieldWeir {
        id: title
        textValue: "亮度调节信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    Rectangle {
        z: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 240
        width: 280
        height: 80
        color: "transparent"
        border.color: "#ffffff"
        border.width: 2
        radius: 10
        TextFieldWeir {
            id: percentage
            anchors.centerIn: parent
            textValue: percentageValue.toString() + " %"
            width: 100
            height: 40
            textWidth: 100
            textHeight: 40
            fontSize: 24
            fontBold: true
            fontColor: "#ffffff"
        }
    }
    Rectangle {
        id: progress
        z: 1
        anchors.left: parent.left
        anchors.leftMargin: 585
        anchors.top: parent.top
        anchors.topMargin: 245
        width: (50/100)*270
        height: 70
        color: "#007ab3"
        radius: 9
    }
}

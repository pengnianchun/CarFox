import QtQuick 2.6
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"
import VideoImageItem 1.0

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "VideoConvertMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property int videoSwitchValue: 0

    enterMenu: function(){
        if(bKeyEnable){
            videoSwitchValue = 0;
            CarMsg.sendVideoSwitchControl(videoSwitchValue);
        }
    }
    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            UiController.currentLayerId = "closeVideo";
            bKeyEnable = false;
        }
    }
    previousMenu: function(){
        if(bKeyEnable){
            videoSwitchValue --;
            if(videoSwitchValue < 0){
                videoSwitchValue = 3
            }
            CarMsg.sendVideoSwitchControl(videoSwitchValue);
        }
    }
    nextMenu: function(){
        if(bKeyEnable){
            videoSwitchValue ++;
            if(videoSwitchValue >= 4){
                videoSwitchValue = 0
            }
            CarMsg.sendVideoSwitchControl(videoSwitchValue);
        }
    }

    TextFieldWeir {
        id: title
        textValue: "视频切换信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    TextFieldWeir {
        id: switch_ctr
        textValue: ""
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 130
    }
    onVideoSwitchValueChanged: {
        if(videoSwitchValue === 0){switch_ctr.textValue = "通道1"; switch_ctr.fontColor = "red";}
        if(videoSwitchValue === 1){switch_ctr.textValue = "通道2"; switch_ctr.fontColor = "red";}
        if(videoSwitchValue === 2){switch_ctr.textValue = "通道3"; switch_ctr.fontColor = "red";}
        if(videoSwitchValue === 3){switch_ctr.textValue = "通道4"; switch_ctr.fontColor = "red";}
    }
}

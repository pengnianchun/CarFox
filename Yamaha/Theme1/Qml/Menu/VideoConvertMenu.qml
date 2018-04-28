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
        textValue: "视频转化信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    Item {
        id: item
        VideoImageItem {
            videoImage: [
                LvdsImage {
                    id: videoImage  // "180*0*1080*544"
                    rect:  "360*182*720*288"
                    active: title.visible
                }
            ]
        }
    }
//    Image {                     //调用挖空图片资源
//        id: vedioFrameMask      //此ID没有被调用
//        x:0
//        y:0
//        width: 1440
//        height: 544
//        opacity: 1.0            //设置成不透明的
//        source: "qrc:/Theme/Theme1/Image/AutoSplash/testyx.png"
//    }

}

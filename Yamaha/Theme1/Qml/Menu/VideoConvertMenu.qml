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

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
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
}

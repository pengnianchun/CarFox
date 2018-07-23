import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Component/Component"
import "../../JS/MenuMainController.js" as MenuMainController

MenuItem {
    width: 1440
    height: 544
    visible: false

    menuLayerId: "MenuMain"
    parentMenuId: "MenuPanel"

    property int menuCurrentIndex: 0
    property bool mainRingStatus: false
    property bool keyBoardStatus: true

    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string mainRingImageBg: sourceImageUrl + "DialPanel/mainRingBg.png"
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png"
    property string centerBackGroundImage: sourceImageUrl + "SubMenu/centerBg.png"
    property string arrowUpImage: sourceImageUrl + "SubMenu/arrowUp.png"
    property string arrowDownImage: sourceImageUrl + "SubMenu/arrowDown.png"

    enterMenu: function() {
        if(keyBoardStatus){
            UiController.setLayerProperty("MenuPanel", "animationAction", 1);
            UiController.setLayerProperty("MenuPanel", "menuCurrentIndex", menuCurrentIndex);
            keyBoardStatus = false;
        }
    }
    hideMenu: function() {
        if(keyBoardStatus){
            UiController.setLayerProperty("MenuPanel", "keyBoardStatus", true);
            UiController.setLayerProperty("MenuPanel", "mainRingStatus", true);
            UiController.hideRootMenu();
            menuCurrentIndex = 0;
            keyBoardStatus = false;
        }
    }
    nextMenu: function() {
        if(keyBoardStatus){
            //菜单切换下一步处理
            menuCurrentIndex = (menuCurrentIndex + 1) % MenuMainController.menuInfoTitleArray.length;
        }
    }
    previousMenu: function() {
        if(keyBoardStatus){
            //菜单切换上一步处理
            if (menuCurrentIndex === 0) {
                menuCurrentIndex = MenuMainController.menuInfoTitleArray.length - 1
            } else {
                menuCurrentIndex = (menuCurrentIndex - 1) % MenuMainController.menuInfoTitleArray.length
            }
        }
    }

    Item {
        x: 436
        y: 1
        z: mainRingStatus ? 1 : 3
        width: 560
        height: 540

        Image {
            id: arrow_up
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 110
            source: arrowUpImage
        }
        Image {
            id: arrow_down
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 110
            source: arrowDownImage
        }
        Image {
            id: menu_info
            anchors.centerIn: parent
            source: sourceImageUrl + "SubMenu/" + MenuMainController.menuInfoIconArray[menuCurrentIndex]
        }
        TextFieldWeir {
            width: 200
            height: 20
            textWidth: 200
            textHeight: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 180
            textValue: MenuMainController.menuInfoTitleArray[menuCurrentIndex]
        }
    }
}

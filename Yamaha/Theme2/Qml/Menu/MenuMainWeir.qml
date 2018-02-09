import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Common/Component"

MenuItem {
    id: menu_main
    width: 1440
    height: 544
    visible: false
    menuLayerId: "MenuMain"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string mainRingImageBg: sourceImageUrl + "DialPanel/mainRingBg.png";
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png";
    property string centerBackGroundImage: sourceImageUrl + "SubMenu/centerBg.png";
    property string arrowUpImage: sourceImageUrl + "SubMenu/arrowUp.png";
    property string arrowDownImage: sourceImageUrl + "SubMenu/arrowDown.png";
    property var menuInfoIconArray: ["icon1.png","icon2.png","icon3.png","icon4.png","icon5.png","icon6.png","icon7.png","icon8.png","icon9.png"]
    property var menuInfoTitleArray: ["控制","发动机","辅助","TCU","电池管理","电池状态","空调","仪表","设置"]
    property int menuCurrentIndex: 0
    property bool mainRingStatus: false
    property bool keyBoardStatus: true
    property bool menuPanelInfoStatus: false

    enterMenu: function(){
        if(keyBoardStatus){
            UiController.setLayerProperty("MenuPanel","animationAction",1);
            UiController.setLayerProperty("MenuPanel","menuCurrentIndex",menuCurrentIndex);
            keyBoardStatus = false;
            menuPanelInfoStatus = true;
        }else{}
    }
    hideMenu: function(){
        if(keyBoardStatus){
            UiController.setLayerProperty("MenuPanel","keyBoardStatus",true);
            UiController.setLayerProperty("MenuPanel","mainRingStatus",true);
            UiController.hideRootMenu();
            menuCurrentIndex = 0;
            keyBoardStatus = false;
        }else{}
    }
    nextMenu: function() {
        if(keyBoardStatus){
            //菜单切换下一步处理
            if((menuCurrentIndex >= 0)&&(menuCurrentIndex < 8)){
                menuCurrentIndex += 1;
            }else{
                menuCurrentIndex = 0;
            }
        }else{}
    }
    previousMenu: function() {
        if(keyBoardStatus){
            //菜单切换上一步处理
            if((menuCurrentIndex > 0)&&(menuCurrentIndex <= 8)){
                menuCurrentIndex -= 1;
            }else{
                menuCurrentIndex = 8;
            }
        }else{}
    }
    Item {
        id: menu_detail
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
            source: sourceImageUrl + "SubMenu/" + menuInfoIconArray[menuCurrentIndex]
        }
        TextFieldWeir {
            id: menu_info_title
            width: 200
            height: 20
            textWidth: 200
            textHeight: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 180
            textValue: qsTr(menuInfoTitleArray[menuCurrentIndex]) + "系统信息"
        }
    }
}

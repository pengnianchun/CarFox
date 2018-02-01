import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "../../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

MenuItem {
    width: 1440
    height: 544
    visible: false
    //menuLayerId: "MenuPanel"

    property var statusAnimation: ["1","2","3"]
    property real startXLeft: 283;
    property real startXRight: 560;
    property real endXLeft: -92;
    property real endXRight: 935;
    property real startMenuXLeft: 138;
    property real startMenuXRight: 595;
    property real endMenuXLeft: 508;
    property real endMenuXRight: 225;
    property real durationTime: 1000;
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string leftImage: sourceImageUrl + "SubMenu/swingsLeft.png";
    property string rightImage: sourceImageUrl + "SubMenu/swingsRight.png";
    property string menuMainBackGroundImage: sourceImageUrl + "SubMenu/centerBlockBg.png";
    property string mainRingImage: sourceImageUrl + "DialPanel/mainRing.png";
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png";
    property string centerBackGroundImage: sourceImageUrl + "SubMenu/centerBg.png";
    property string leftMenuImage: sourceImageUrl + "DialPanel/leftWing.png";
    property string rightMenuImage: sourceImageUrl + "DialPanel/rightWing.png";
    property string arrowUpImage: sourceImageUrl + "SubMenu/arrowUp.png";
    property string arrowDownImage: sourceImageUrl + "SubMenu/arrowDown.png";
    property var menuInfoIconArray: ["icon1.png","icon2.png","icon3.png","icon4.png","icon5.png","icon6.png","icon7.png","icon8.png","icon9.png"]
    property var menuInfoTitleArray: ["控制","发动机","辅助","TCU","电池管理","电池状态","空调","仪表","设置"]
    property int menuCurrentIndex: 0

    property var containerId: container

    property bool keyBoardStatus: true;
    property bool mainRingStatus: true;
    property bool animationAction: false;
    property string currentLayer;

    //Layer三层状态
    property var layerStatusArray: [true,false,false]
    //Menu子菜单
    property int currentMenuDetail: 0
    //遮罩信号
    //signal currentLayerStatus(var layerStatus);
    //emit: currentLayerStatus("show");

    onAnimationActionChanged: {
        if(animationAction){
            container.state = statusAnimation[2];
            container.state = statusAnimation[1];
            animationAction = false;
        }else{}
    }
    enterMenu: function(){
        //UiController.showRootMenu();
        if((keyBoardStatus)&&(mainRingStatus)){
            mainRingStatus = false;
            menuCurrentIndex = 0;
        }else if((!mainRingStatus)&&(keyBoardStatus)){
            container.state = statusAnimation[2];
            container.state = statusAnimation[0];
        }else{}
    }
    hideMenu: function(){
        if(keyBoardStatus){
            mainRingStatus = true;
            keyBoardStatus = true;
        }else{}
    }
    previousMenu: function(){
        if((menuCurrentIndex >= 0)&&(menuCurrentIndex < 8)){
            menuCurrentIndex += 1;
        }else{
            menuCurrentIndex = 0;
        }
    }
    nextMenu: function(){
        if((menuCurrentIndex > 0)&&(menuCurrentIndex <= 8)){
            menuCurrentIndex -= 1;
        }else{
            menuCurrentIndex = 8;
        }
    }

    Rectangle {
        id: container
        anchors.top: parent.top
        anchors.topMargin: -25
        state: statusAnimation[2];
        Image {
            id: left_panel
            x: startXLeft
            z: 2
            opacity: 0
            source: leftImage
        }
        Image {
            id: right_panel
            x: startXRight
            z: 2
            opacity: 0
            source: rightImage
        }
        Image {
            id: menu_main_detail_background
            opacity: 0
            x: 350
            y: 50
            source: menuMainBackGroundImage
        }
        Image {
            id: main_ring
            x: 435
            y: 25
            z: 3
            opacity: 1.0
            source: mainRingImage
        }
        Image {
            id: center_light
            opacity: 1.0
            anchors.top: main_ring.top
            anchors.topMargin: 20
            anchors.left: main_ring.left
            anchors.leftMargin: 30
            z: 4
            source: centerLightImage
        }
        Item {
            id: menu_item
            x: 435
            y: 25
            z: mainRingStatus ? 1 : 3
            visible: !mainRingStatus
            opacity: 1.0
            width: 560
            height: 540
            Image {
                id: center_background
                anchors.centerIn: parent
                source: centerBackGroundImage
            }
            Image {
                id: arrow_up
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 100
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
        Image {
            id: left_menu_panel
            x: startMenuXLeft
            y: 60
            z: 1
            opacity: 1.0
            source: leftMenuImage
        }
        Image {
            id: right_menu_panel
            x: startMenuXRight
            y: 60
            z: 1
            opacity: 1.0
            source: rightMenuImage
        }
        states: [
            State {
                name: statusAnimation[0]
            },
            State {
                name: statusAnimation[1]
            },
            State {
                name: statusAnimation[2]
            }
        ]

        transitions: [
            Transition {
                from: statusAnimation[2]
                to: statusAnimation[0]
                SequentialAnimation {
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "x"
                            to: endMenuXLeft
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "x"
                            to: endMenuXRight
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "opacity"
                            to: 0
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "opacity"
                            to: 0
                            duration: durationTime/2
                        }
                    }
                    PauseAnimation { duration: durationTime/10 }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: center_light
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: menu_item
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: left_panel
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                    }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_panel
                            property: "x"
                            to: endXLeft
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "x"
                            to: endXRight
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: menu_main_detail_background
                            property: "opacity"
                            to: 0.8
                            duration: durationTime
                        }
                    }
                    ScriptAction {
                        script: {
                            console.log("animation1 is completed !")
                            MenuMainController.showMenuDetail(menuCurrentIndex);
                            keyBoardStatus = false;
                        }
                    }
                }
            },
            Transition {
                from: statusAnimation[2]
                to: statusAnimation[1]
                SequentialAnimation {
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_panel
                            property: "x"
                            to: startXLeft
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "x"
                            to: startXRight
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: menu_main_detail_background
                            property: "opacity"
                            to: 0
                            duration: durationTime
                        }
                    }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_panel
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: center_light
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: menu_item
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                    }
                    PauseAnimation { duration: durationTime/10 }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "x"
                            to: startMenuXLeft
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "x"
                            to: startMenuXRight
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "opacity"
                            to: 1.0
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "opacity"
                            to: 1.0
                            duration: durationTime
                        }
                    }
                    ScriptAction {
                        script: {
                            console.log("animation2 is completed !")
                            mainRingStatus = false;
                            keyBoardStatus = true;
                        }
                    }
                }
            }
        ]
    }
}

import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "../../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

CommonItem {
    width: 1440
    height: 544
    visible: false

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
    property int menuCurrentIndex: 0

    property var containerId: container

    property bool keyBoardStatus: true;
    property bool mainRingStatus: true;
    property int animationAction: 0;
    property string currentLayer;

    //动画触发信号监听
    onAnimationActionChanged: {
        if(animationAction === 1){
            container.state = statusAnimation[2];
            container.state = statusAnimation[0];
            animationAction = 0;
        }else if(animationAction === 2){
            container.state = statusAnimation[2];
            container.state = statusAnimation[1];
            animationAction = 0;
        }else{}
    }
    onKeyEnter: function(){
        if(keyBoardStatus){
            UiController.showRootMenu();
            UiController.setLayerProperty("MenuMain","menuCurrentIndex",0);
            UiController.setLayerProperty("MenuMain","keyBoardStatus",true);
            mainRingStatus = false;
            keyBoardStatus = false;
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
            z: 3
            opacity: 0
            source: leftImage
        }
        Image {
            id: right_panel
            x: startXRight
            z: 3
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
            z: 2
            visible: mainRingStatus
            opacity: 1.0
            source: mainRingImage
        }
        Image {
            id: center_light
            visible: mainRingStatus
            opacity: 1.0
            anchors.top: main_ring.top
            anchors.topMargin: 18
            anchors.left: main_ring.left
            anchors.leftMargin: 30
            z: 4
            source: centerLightImage
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
                        PropertyAnimation {
                            target: center_light
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            to: 0
                            duration: durationTime/50
                        }
                        ScriptAction {
                            script: {
                                console.log("hide MenuMain is completed !")
                                UiController.hideLayer("MenuMain");
                                UiController.setLayerProperty("HomePanel","maskBackGroundStatus","show");
                            }
                        }
                    }
                    PauseAnimation { duration: durationTime/10 }
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
                    PauseAnimation { duration: durationTime/10 }
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
                            target: center_light
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            to: 1.0
                            duration: durationTime/50
                        }
                        ScriptAction {
                            script: {
                                console.log("show MenuMain is completed !")
                                UiController.showLayer("MenuMain");
                                UiController.setLayerProperty("HomePanel","maskBackGroundStatus","hide");
                            }
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
                            UiController.setLayerProperty("MenuMain","keyBoardStatus",true);
                        }
                    }
                }
            }
        ]
    }
}

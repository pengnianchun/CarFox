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
    property real startXLeft: 285;
    property real startXRight: 560;
    property real endXLeft: -88;
    property real endXRight: 937;
    property real startMenuXLeft: 110;
    property real startMenuXRight: 620;
    property real endMenuXLeft: 460;
    property real endMenuXRight: 270;
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
        console.log("animationAction::::::::::::::::" + animationAction);
        if(animationAction === 1){
            container.state = statusAnimation[2];
            container.state = statusAnimation[0];
            animationAction = 0;
        }else if(animationAction === 2){
            container.state = statusAnimation[0];
            container.state = statusAnimation[1];
            animationAction = 0;
        }else if(animationAction === 3){
            container.state = statusAnimation[2];
            animationAction = 0;
        }else{}
    }
    onKeyEnter: function(){
        if(keyBoardStatus){
            UiController.showRootMenu();
            UiController.setLayerProperty("MenuMain","keyBoardStatus",true);
            mainRingStatus = false;
            keyBoardStatus = false;
        }else{}
    }
    Rectangle {
        id: container
        anchors.top: parent.top
        anchors.topMargin: -25
        state: "";
        Image {
            id: left_panel
            x: startXLeft
            y: -2
            z: 3
            opacity: 0
            source: leftImage
        }
        Image {
            id: right_panel
            x: startXRight
            y: -2
            z: 3
            opacity: 0
            source: rightImage
        }
        Image {
            id: center_background
            x: 467
            y: 44
            z: 3
            opacity: 0
            source: centerBackGroundImage
        }
        Rectangle {
            id: menu_main_detail_background
            x: 351+375
            y: 52
            width: 0
            height: 500
            color: "transparent"
            clip: true
            Image {
                source: menuMainBackGroundImage
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Image {
            id: main_ring
            x: 435
            y: 25
            z: 2
            scale: 0.2
            visible: mainRingStatus
            opacity: 0//1.0
            source: mainRingImage
        }
        Image {
            id: center_light
            visible: mainRingStatus
            opacity: 0//1.0
            scale: 0.1
            anchors.top: main_ring.top
            anchors.topMargin: 18
            anchors.left: main_ring.left
            anchors.leftMargin: 30
            z: 4
            source: centerLightImage
        }
        Image {
            id: left_menu_panel
            x: endMenuXLeft//startMenuXLeft
            y: 95
            z: 1
            opacity: 0//1.0
            source: leftMenuImage
        }
        Image {
            id: right_menu_panel
            x: endMenuXRight//startMenuXRight
            y: 95
            z: 1
            opacity: 0//1.0
            source: rightMenuImage
        }
        states: [
            State {
                name: statusAnimation[0]
                PropertyChanges { target: left_menu_panel; x: endMenuXLeft; opacity: 0 }
                PropertyChanges { target: right_menu_panel; x: endMenuXRight; opacity: 0 }
                PropertyChanges { target: center_light; opacity: 0 }
                PropertyChanges { target: main_ring; opacity: 0 }
                PropertyChanges { target: left_panel; x: endXLeft; opacity: 1.0 }
                PropertyChanges { target: right_panel; x: endXRight; opacity: 1.0 }
                PropertyChanges { target: menu_main_detail_background; x: 351; width: 750 }
            },
            State {
                name: statusAnimation[1]
                PropertyChanges { target: left_panel; x: startXLeft; opacity: 0 }
                PropertyChanges { target: right_panel; x: startXRight; opacity: 0 }
                PropertyChanges { target: menu_main_detail_background; x: 726; width: 0 }
                PropertyChanges { target: center_light; opacity: 1.0 }
                PropertyChanges { target: main_ring; opacity: 1.0 }
                PropertyChanges { target: left_menu_panel; x: startMenuXLeft; opacity: 1.0 }
                PropertyChanges { target: right_menu_panel; x: startMenuXRight; opacity: 1.0 }
            },
            State {
                name: statusAnimation[2]
                PropertyChanges { target: center_light; opacity: 1.0 }
                PropertyChanges { target: main_ring; opacity: 1.0 }
                PropertyChanges { target: left_menu_panel; x: startMenuXLeft; opacity: 1.0 }
                PropertyChanges { target: right_menu_panel; x: startMenuXRight; opacity: 1.0 }
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
                            duration: 280
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "x"
                            duration: 280
                        }
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "opacity"
                            duration: 240
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "opacity"
                            duration: 240
                        }
                        ScriptAction {
                            script: {
                                UiController.setLayerProperty("HomePanel","maskBackGroundStatus","show");
                            }
                        }
                    }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: center_background
                            property: "opacity"
                            to: 1
                            duration: 40
                        }
                        PropertyAnimation {
                            target: center_light
                            property: "opacity"
                            duration: 80
                        }
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            duration: 80
                        }
                        PropertyAnimation {
                            target: left_panel
                            property: "opacity"
                            to: 1.0
                            duration: 200
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "opacity"
                            duration: 200
                        }
                    }
                    PauseAnimation { duration: durationTime/4 }
                    ScriptAction {
                        script: {
                            console.log("hide MenuMain is completed !")
                            UiController.hideLayer("MenuMain");
                        }
                    }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: center_background
                            property: "opacity"
                            to: 0
                            duration: 40
                        }
                        PropertyAnimation {
                            target: left_panel
                            property: "x"
                            easing.type: Easing.Linear
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "x"
                            easing.type: Easing.Linear
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: menu_main_detail_background
                            property: "x"
                            duration: durationTime/2-50
                        }
                        PropertyAnimation {
                            target: menu_main_detail_background
                            property: "width"
                            duration: durationTime/2-50
                        }
                    }
                    PauseAnimation { duration: durationTime/4 }
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
                from: statusAnimation[0]
                to: statusAnimation[1]
                SequentialAnimation {
                    PauseAnimation { duration: durationTime/4 }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_panel
                            property: "x"
                            easing.type: Easing.Linear
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "x"
                            easing.type: Easing.Linear
                            duration: durationTime/2
                        }
                        PropertyAnimation {
                            target: menu_main_detail_background
                            property: "x"
                            duration: durationTime/2+10
                        }
                        PropertyAnimation {
                            target: menu_main_detail_background
                            property: "width"
                            duration: durationTime/2+10
                        }
                    }
                    PropertyAnimation {
                        target: center_background
                        property: "opacity"
                        to: 1
                        duration: 40
                    }
                    PauseAnimation { duration: durationTime/4 }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: center_background
                            property: "opacity"
                            to: 0
                            duration: 40
                        }
                        PropertyAnimation {
                            target: left_panel
                            property: "opacity"
                            duration: 80
                        }
                        PropertyAnimation {
                            target: right_panel
                            property: "opacity"
                            duration: 80
                        }
                        PropertyAnimation {
                            target: center_light
                            property: "opacity"
                            duration: 200
                        }
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            duration: 200
                        }
                        ScriptAction {
                            script: {
                                console.log("show MenuMain is completed !")
                                UiController.showLayer("MenuMain");
                            }
                        }
                    }
                    PauseAnimation { duration: durationTime/4 }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "x"
                            duration: 200
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "x"
                            duration: 200
                        }
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "opacity"
                            duration: 400
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "opacity"
                            duration: 400
                        }
                        ScriptAction {
                            script: {
                                UiController.setLayerProperty("HomePanel","maskBackGroundStatus","hide");
                            }
                        }
                    }
                    ScriptAction {
                        script: {
                            console.log("animation2 is completed !")
                            UiController.setLayerProperty("MenuMain","keyBoardStatus",true);
                        }
                    }
                }
            },
            Transition {
                to: statusAnimation[2]
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation {
                            target: center_light
                            property: "scale";
                            to: 1.15;
                            duration: 440
                        }
                        NumberAnimation {
                            target: center_light
                            property: "opacity";
                            duration: 440
                        }
                    }
                    NumberAnimation {
                        target: center_light
                        property: "scale";
                        to: 1;
                        duration: 120
                    }
                    PauseAnimation { duration: 280 }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: main_ring
                            property: "opacity"
                            duration: 80
                        }
                        PropertyAnimation {
                            target: main_ring
                            property: "scale"
                            to: 1.1
                            duration: 280
                        }
                    }
                    PropertyAnimation {
                        target: main_ring
                        property: "scale"
                        to: 1
                        duration: 120
                    }
                    ParallelAnimation {
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "x"
                            duration: 200
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "x"
                            duration: 200
                        }
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "opacity"
                            duration: 400
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "opacity"
                            duration: 400
                        }
                    }
                }
            }
        ]
    }
}

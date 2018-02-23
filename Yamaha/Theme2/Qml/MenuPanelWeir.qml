import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "../JS/MenuMainController.js" as MenuMainController
import "../JS/MenuPanelController.js" as MenuPanelController
import "qrc:/Common/Component"

CommonItem {
    width: 1440
    height: 544
    visible: false

    property var statusAnimation: ["menuOpen","menuClose","free"]
    property real startXLeft: 283;
    property real startXRight: 561;
    property real endXLeft: -95;
    property real endXRight: 933;
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
    property string borderLightImage: sourceImageUrl + "DialPanel/speedRing.png";
    property string blueLightImage: sourceImageUrl + "DialPanel/lightBlue.png";
    property string redLightImage: sourceImageUrl + "DialPanel/lightRed.png";
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

    //车速初始值
    property real speedValue: 120;
    //档位初始值
    property real gearValue: 0;

    //监测速度档位信号变化信号（实际应监测CarMsg中值的变化）
    onVisibleChanged: {
        if(visible){
            timer.running = true;
        }else{
            timer.running = false;
        }
    }
    //自定义定时器测试使用
    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: false
        onTriggered: {
            console.log("=================menu panel timer=========================");
            if(speedValue > 120){
                speedValue = 90;
            }else{}
            if(gearValue > 4){
                gearValue = 0;
            }else{}
            MenuPanelController.setSpeedValueAction(speed_hundred,speed_ten,speed_bits,speedValue);
            MenuPanelController.setGearValueAction(gear,gearValue);
            speedValue++;
            gearValue++;
        }
    }
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
        anchors.fill: parent
        color: "transparent"
        state: "";
        Image { id: left_panel; x: startXLeft; y: -1.2; z: 3; opacity: 0; source: leftImage }
        Image { id: right_panel; x: startXRight; y: -1.2; z: 3; opacity: 0; source: rightImage }
        Image { id: center_background; x: 467; y: 44; z: 3; visible: !mainRingStatus; source: centerBackGroundImage }
        //菜单展开背景
        Rectangle {
            id: menu_main_detail_background
            anchors.horizontalCenter: parent.horizontalCenter
            y: 52
            width: 0
            height: 500
            color: "transparent"
            clip: true
            Image { source: menuMainBackGroundImage; anchors.horizontalCenter: parent.horizontalCenter }
        }
        //菜单面板模块
        Image { id: main_ring; x: 436; y: 27; z: 2; scale: 0.2; opacity: 0; source: mainRingImage }
        Image {
            id: center_light
            opacity: 0; scale: 0.1
            anchors.top: main_ring.top
            anchors.topMargin: 18
            anchors.left: main_ring.left
            anchors.leftMargin: 30
            z: 4
            source: centerLightImage
        }
        //速度值 / 挡位
        ColumnLayout {
            id: speed_gear_panel
            opacity: 0
            z: 2
            spacing: 30
            anchors.top: parent.top
            anchors.topMargin: 230
            anchors.horizontalCenter: parent.horizontalCenter
            RowLayout {
                spacing: -40
                Image { id: speed_hundred }
                Image { id: speed_ten }
                Image { id: speed_bits }
            }
            Image { id: gear;anchors.horizontalCenter: parent.horizontalCenter }
        }
        //速度灯背景
        Image {
            id: border_light
            opacity: 0; scale: 1
            anchors.top: main_ring.top
            anchors.topMargin: 66
            anchors.left: main_ring.left
            anchors.leftMargin: 79.5
            z: 4
            source: borderLightImage
        }
        //速度灯显示部分
        Item {
            id: speed_light
            x: 500
            y: 60
            z: 4
            opacity: 0
            Image { id: speed_led1; x: 37; y: 328; source: blueLightImage }
            Image { id: speed_led2; x: 6; y: 213; source: blueLightImage }
            Image { id: speed_led3; x: 46; y: 101; source: blueLightImage }
            Image { id: speed_led4; x: 145; y: 31; source: blueLightImage }
            Image { id: speed_led5; x: 262; y: 31; source: blueLightImage }
            Image { id: speed_led6; x: 360; y: 100; source: redLightImage }
            Image { id: speed_led7; x: 402; y: 213; source: redLightImage }
            Image { id: speed_led8; x: 372; y: 331; source: redLightImage }
        }
        Image { id: left_menu_panel; x: endMenuXLeft; y: 95; z: 1; opacity: 0; source: leftMenuImage }
        Image { id: right_menu_panel; x: endMenuXRight; y: 95; z: 1; opacity: 0; source: rightMenuImage }
        states: [
            State {
                name: statusAnimation[0]
                PropertyChanges { target: left_menu_panel; x: endMenuXLeft; opacity: 0 }
                PropertyChanges { target: right_menu_panel; x: endMenuXRight; opacity: 0 }
                PropertyChanges { target: left_panel; x: endXLeft; opacity: 1.0 }
                PropertyChanges { target: right_panel; x: endXRight; opacity: 1.0 }
                PropertyChanges { target: menu_main_detail_background; width: 755 }
                PropertyChanges { target: center_light; opacity: 0 }
                PropertyChanges { target: main_ring; opacity: 0 }
                PropertyChanges { target: speed_gear_panel; opacity: 0 }
                PropertyChanges { target: border_light; opacity: 0 }
                PropertyChanges { target: speed_light; opacity: 0 }
            },
            State {
                name: statusAnimation[1]
                PropertyChanges { target: left_panel; x: startXLeft; opacity: 0 }
                PropertyChanges { target: right_panel; x: startXRight; opacity: 0 }
                PropertyChanges { target: menu_main_detail_background; width: 0 }
                PropertyChanges { target: left_menu_panel; x: startMenuXLeft; opacity: 1.0 }
                PropertyChanges { target: right_menu_panel; x: startMenuXRight; opacity: 1.0 }
                PropertyChanges { target: center_light; opacity: 1.0 }
                PropertyChanges { target: main_ring; opacity: 1.0 }
                PropertyChanges { target: speed_gear_panel; opacity: 1.0 }
                PropertyChanges { target: border_light; opacity: 1.0 }
                PropertyChanges { target: speed_light; opacity: 1.0 }
            },
            State {
                name: statusAnimation[2]
                PropertyChanges { target: center_light; opacity: 1.0 }
                PropertyChanges { target: main_ring; opacity: 1.0 }
                PropertyChanges { target: speed_gear_panel; opacity: 1.0 }
                PropertyChanges { target: border_light; opacity: 1.0 }
                PropertyChanges { target: speed_light; opacity: 1.0 }
                PropertyChanges { target: left_menu_panel; x: startMenuXLeft; opacity: 1.0 }
                PropertyChanges { target: right_menu_panel; x: startMenuXRight; opacity: 1.0 }
            }
        ]
        transitions: [
            //Menu展开部分动画
            Transition {
                from: statusAnimation[2]
                to: statusAnimation[0]
                SequentialAnimation {
                    ParallelAnimation {
                        PropertyAnimation { target: left_menu_panel; property: "x"; duration: 200 }
                        PropertyAnimation { target: right_menu_panel; property: "x"; duration: 200 }
                        PropertyAnimation { target: left_menu_panel; property: "opacity"; duration: 120 }
                        PropertyAnimation { target: right_menu_panel; property: "opacity"; duration: 120 }
                        ScriptAction {
                            script: { UiController.setLayerProperty("HomePanel","maskBackGroundStatus","show"); }
                        }
                        PropertyAnimation { target: center_background; property: "opacity"; to: 1; duration: 200 }
                        PropertyAnimation { target: left_panel; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: right_panel; property: "opacity"; duration: 200 }
                    }
                    ParallelAnimation {
                        PropertyAnimation { target: center_light; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: main_ring; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: speed_gear_panel; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: border_light; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: speed_light; property: "opacity"; duration: 200 }
                        ScriptAction {
                            script: {
                                console.log("hide MenuMain is completed !")
                                UiController.hideLayer("MenuMain");
                            }
                        }
                    }
                    PauseAnimation { duration: 400 }
                    ParallelAnimation {
                        PropertyAnimation { target: center_background; property: "opacity"; to: 0; duration: 40 }
                        PropertyAnimation { target: left_panel; property: "x"; easing.type: Easing.Linear; duration: 400 }
                        PropertyAnimation { target: right_panel; property: "x"; easing.type: Easing.Linear; duration: 400 }
                        PropertyAnimation { target: menu_main_detail_background; property: "width"; duration: 350 }
                    }
                    ScriptAction {
                        script: {
                            console.log("animation1 is completed !")
                            MenuMainController.showMenuDetail(menuCurrentIndex);
                        }
                    }
                }
            },
            //Menu关闭部分动画
            Transition {
                from: statusAnimation[0]
                to: statusAnimation[1]
                SequentialAnimation {
                    ParallelAnimation {
                        PropertyAnimation { target: left_panel; property: "x"; easing.type: Easing.Linear; duration: 400 }
                        PropertyAnimation { target: right_panel; property: "x"; easing.type: Easing.Linear; duration: 400 }
                        PropertyAnimation { target: menu_main_detail_background; property: "width"; duration: 440 }
                    }
                    PropertyAnimation { target: center_background; property: "opacity"; to: 1; duration: 120 }
                    PauseAnimation { duration: 200 }
                    ParallelAnimation {
                        PropertyAnimation { target: center_light; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: main_ring; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: speed_gear_panel; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: border_light; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: speed_light; property: "opacity"; duration: 200 }
                        ScriptAction {
                            script: {
                                console.log("show MenuMain is completed !")
                                UiController.showLayer("MenuMain");
                            }
                        }
                    }
                    ParallelAnimation {
                        PropertyAnimation { target: left_panel; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: right_panel; property: "opacity"; duration: 200 }
                        PropertyAnimation { target: left_menu_panel; property: "x"; duration: 200 }
                        PropertyAnimation { target: right_menu_panel; property: "x"; duration: 200 }
                        PropertyAnimation { target: left_menu_panel; property: "opacity"; duration: durationTime }
                        PropertyAnimation { target: right_menu_panel; property: "opacity"; duration: durationTime }
                        ScriptAction {
                            script: { UiController.setLayerProperty("HomePanel","maskBackGroundStatus","hide"); }
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
            //开机动画部分
            Transition {
                to: statusAnimation[2]
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation { target: center_light; property: "scale"; to: 1.15; duration: 440 }
                        NumberAnimation { target: center_light; property: "opacity"; duration: 440 }
                    }
                    NumberAnimation { target: center_light; property: "scale"; to: 1; duration: 120 }
                    PauseAnimation { duration: durationTime/4 }
                    ScriptAction { script: UiController.setLayerProperty("HomePanel","opacity",1) }
                    ParallelAnimation {
                        PropertyAnimation { target: main_ring; property: "opacity"; duration: 80 }
                        PropertyAnimation { target: main_ring; property: "scale"; to: 1.1; duration: 280 }
                    }
                    PropertyAnimation { target: main_ring; property: "scale"; to: 1; duration: 120 }
                    ParallelAnimation {
                        PropertyAnimation { target: border_light; property: "opacity"; to: 1; duration: 200 }
                        PropertyAnimation { target: speed_light; property: "opacity"; to: 1; duration: 200 }
                        PropertyAnimation { target: left_menu_panel; property: "x"; duration: 200 }
                        PropertyAnimation { target: right_menu_panel; property: "x"; duration: 200 }
                        PropertyAnimation { target: left_menu_panel; property: "opacity"; duration: durationTime }
                        PropertyAnimation { target: right_menu_panel; property: "opacity"; duration: durationTime }
                        PropertyAnimation { target: speed_gear_panel; property: "opacity"; duration: durationTime }
                    }
                }
            }
        ]
    }
}

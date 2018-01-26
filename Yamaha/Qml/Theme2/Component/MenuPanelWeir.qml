import QtQuick 2.6
import QtQuick.Layouts 1.0
import "../JS/MenuMainController.js" as MenuMainController

Item {
    property var statusAnimation: ["1","2","3"]
    property real startXLeft: 283;
    property real startXRight: 560;
    property real endXLeft: -92;
    property real endXRight: 935;
    property real startMenuXLeft: 138;
    property real startMenuXRight: 604;
    property real endMenuXLeft: 508;
    property real endMenuXRight: 234;
    property real durationTime: 300;
    property string sourceImageUrl: "qrc:/Theme2/Qml/Theme2/Image/"
    property string leftImage: sourceImageUrl + "SubMenu/swingsLeft.png";
    property string rightImage: sourceImageUrl + "SubMenu/swingsRight.png";
    property string mainRingImage: sourceImageUrl + "DialPanel/mainRing.png";
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png";
    property string centerBackGroundImage: sourceImageUrl + "SubMenu/centerBg.png";
    property string leftMenuImage: sourceImageUrl + "DialPanel/leftWing.png";
    property string rightMenuImage: sourceImageUrl + "DialPanel/rightWing.png";
    property var containerId: container

    //Layer三层状态
    property var layerStatusArray: [true,false,false]
    signal currentLayerStatus(var layerStatus);

    Rectangle {
        id: button1
        width: 100
        height: 30
        x: 20
        y: 150
        Text {
            anchors.centerIn: parent
            text: qsTr("Home")
        }
        MouseArea {
            anchors.fill: parent;
            onReleased: {
                console.log("press home/ok !")
                if(layerStatusArray[0]){
                    main_ring_panel.mainRingStatus = false;

                    //遮罩信号
                    emit: currentLayerStatus("show");

                    for(var i=0;i<layerStatusArray.length;i++){
                        layerStatusArray[i] = false;
                    }
                    layerStatusArray[1] = true;
                }else if(layerStatusArray[1]){
                    menu_main_detail.menuCurrentIndex = main_ring_panel.menuCurrentIndex;
                    container.state = statusAnimation[2];
                    container.state = statusAnimation[0];
                }else{
                    MenuMainController.homeButtonClick(main_ring_panel,menu_main_detail,layerStatusArray);
                }
            }
        }
    }
    Rectangle {
        id: button2
        width: 100
        height: 30
        x: 20
        y: 190
        Text {
            anchors.centerIn: parent
            text: qsTr("Return")
        }
        MouseArea {
            anchors.fill: parent;
            onReleased: {
                console.log("press return !")
                if(layerStatusArray[0]){
                }else if(layerStatusArray[1]){
                    main_ring_panel.mainRingStatus = true;

                    //遮罩信号
                    emit: currentLayerStatus("hide");

                    for(var i=0;i<layerStatusArray.length;i++){
                        layerStatusArray[i] = false;
                    }
                    layerStatusArray[0] = true;
                    main_ring_panel.menuCurrentIndex = 0;
                }else if((layerStatusArray[2])&&(menu_main_detail.menuInfoId[8].settingSystemStatus[0])){
                    container.state = statusAnimation[2];
                    container.state = statusAnimation[1];
                }else{
                    MenuMainController.returnButtonClick(main_ring_panel,menu_main_detail,layerStatusArray);
                }
            }
        }
    }
    Rectangle {
        id: button3
        width: 100
        height: 30
        x: 20
        y: 230
        Text {
            anchors.centerIn: parent
            text: qsTr("Go")
        }
        MouseArea {
            anchors.fill: parent;
            onReleased: {
                console.log("press go !")
                MenuMainController.goButtonClick(main_ring_panel,menu_main_detail,layerStatusArray);
            }
        }
    }
    Rectangle {
        id: button4
        width: 100
        height: 30
        x: 20
        y: 270
        Text {
            anchors.centerIn: parent
            text: qsTr("Back")
        }
        MouseArea {
            anchors.fill: parent;
            onReleased: {
                console.log("press back !")
                MenuMainController.backButtonClick(main_ring_panel,menu_main_detail,layerStatusArray);
            }
        }
    }
    Rectangle {
        id: container
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
        MenuMainWeir {//layer1
            id: main_ring_panel
            x: 422
            y: 0
            z: 3
            opacity: 1.0
        }
        MenuMainDetailWeir {//layer2
            id: menu_main_detail
            x: 120
            y: 80
            z: 3
            opacity: 0
        }
        Image {
            id: left_menu_panel
            x: startMenuXLeft
            y: 70
            z: 1
            opacity: 1.0
            source: leftMenuImage
        }
        Image {
            id: right_menu_panel
            x: startMenuXRight
            y: 70
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
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: right_menu_panel
                            property: "x"
                            to: endMenuXRight
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: left_menu_panel
                            property: "opacity"
                            to: 0
                            duration: durationTime
                        }
                        PropertyAnimation {
                            target: right_menu_panel
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
                            target: main_ring_panel
                            property: "opacity"
                            to: 0
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
                            target: menu_main_detail
                            property: "opacity"
                            to: 1.0
                            duration: durationTime
                        }
                    }
                    ScriptAction {
                        script: {
                            console.log("animation1 is completed !")
                            MenuMainController.homeButtonClick(main_ring_panel,menu_main_detail,layerStatusArray);
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
                            target: menu_main_detail
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
                            target: main_ring_panel
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
                            MenuMainController.returnButtonClick(main_ring_panel,menu_main_detail,layerStatusArray);
                        }
                    }
                }
            }
        ]
    }
}

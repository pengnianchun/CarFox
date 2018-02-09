import QtQuick 2.0
import CustomEnum 1.0
import "../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"
//import TransformRing 1.0

CommonItem {
    id: homeIndex
    width: 1440
    height: 544
    visible: false
    state: ""

    property real rpmValue: 0
    property real speedValue: 0
    property real airPressure1: 0
    property real airPressure2: 0
    property bool bKeyEnable: true

    onVisibleChanged: {
        if(visible){
            homeIndex.state = "normal"
            CarMsg.sendEnableKeys(true);
        } else {
            CarMsg.sendEnableKeys(false);
        }
    }

    onStateChanged: {
        UiController.setLayerProperty("IndicatorPanel", "state", state);
    }

    onKeyEnter: function() {
        if(bKeyEnable) {
            UiController.showLayer("MenuPanel");
            UiController.setLayerProperty("HomePanel", "state", "menu");
            UiController.setLayerProperty("HomePanel", "bKeyEnable", false);
            UiController.setLayerProperty("MenuPanel", "state", "show");
            UiController.setLayerProperty("MenuPanel", "bKeyEnable", true);
            bKeyEnable = false;
        }
    }

    ParallelAnimation {
        id: startFlash
        running: false
        ParallelAnimation {
            NumberAnimation {
                target: topBar
                property: "y"
                duration: 800
                from: 1
                to: 28
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: baseBar
                property: "y"
                duration: 800
                from: 455
                to: 427
                easing.type: Easing.Linear
            }
        }
        ParallelAnimation {
            ParallelAnimation {
                NumberAnimation {
                    target: rpmBg
                    property: "opacity"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.Linear
                }
                NumberAnimation {
                    target: speedBg
                    property: "opacity"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.Linear
                }
            }
            ParallelAnimation {
                NumberAnimation {
                    target: rpmBg
                    property: "scale"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.InOutQuart
                }
                NumberAnimation {
                    target: speedBg
                    property: "scale"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.InOutQuart
                }
            }
            ParallelAnimation {
                SequentialAnimation {
                    NumberAnimation { target: airPressure1Bar; property: "height"; from:0; to:122; duration: 800}
                    NumberAnimation { target: airPressure1Bar; property: "height"; from:122; to:0; duration: 800}
                 }
                SequentialAnimation {
                    NumberAnimation { target: airPressure2Bar; property: "height"; from:0; to:122; duration: 800}
                    NumberAnimation { target: airPressure2Bar; property: "height"; from:122; to:0; duration: 800}
                }
            }
        }
        ScriptAction {
            script: {
                UiController.showLayer("IndicatorPanel");
            }
        }
    }

    Rectangle {
        id: backgroundImage
        anchors.fill: parent
        color: "black"
    }

    Image {
        id: topBar
        x: 324
        y: 18
        rotation: 180
        opacity: 1.0
        source: "qrc:/Theme/Theme1/Image/HomePanel/baseBar.png"
    }

    Image {
        id: baseBar
        x: 330
        y: 447
        opacity: 1.0
        source: "qrc:/Theme/Theme1/Image/HomePanel/baseBar.png"
    }

    Image {
        id: readyStatus
        x: 623
        y: 96
        visible: homeIndex.state === "normal"
        source: "qrc:/Theme/Theme1/Image/HomePanel/ready.png"
    }

    Image {
        id: leftBgImage
        x:20
        source: "qrc:/Theme/Theme1/Image/HomePanel/leftBg.png"
        Image {
            id: rpmBg
            x: -20
            y: 2
            opacity: 0.0
            scale: 0.6
            source: "qrc:/Theme/Theme1/Image/HomePanel/rpmBg.png"
            Item {
                x: 220
                y: 218
                width: 100
                height: 100
                Text {
                    id: rpmNum
                    anchors.centerIn: parent
                    text: homeIndex.rpmValue.toFixed(0)
                    color: "white"
                    font.pixelSize: 95
                    //font.family:FontName.fontCurrentFzLt
                }
            }
            Image {
                id: socImg
                x: 138
                y: 336
                source: "qrc:/Theme/Theme1/Image/HomePanel/socValue.png"
            }
            Image {
                id: socBg
                x: 138
                y: 336
                source: "qrc:/Theme/Theme1/Image/HomePanel/socBg.png"
                Text {
                    id: socValue
                    x: 135
                    y: 45
                    text: qsTr("100")
                    color: "green"
                    font.pixelSize: 20
                }
            }
        }
    }

    Image {
        id: rightBgImage
        x:876
        source: "qrc:/Theme/Theme1/Image/HomePanel/rightBg.png"
        Image {
            id: speedBg
            x: 24
            y: 2
            opacity: 0.0
            scale: 0.6
            source: "qrc:/Theme/Theme1/Image/HomePanel/speedBg.png"
            Item {
                x: 222
                y: 218
                width: 100
                height: 100
                Text {
                    id: speedNum
                    anchors.centerIn: parent
                    text: homeIndex.speedValue.toFixed(0)
                    color: "white"
                    font.pixelSize: 95
                    //font.family:FontName.fontCurrentFzLt
                }
            }
            Image {
                id: batImg
                x: 136
                y: 336
                source: "qrc:/Theme/Theme1/Image/HomePanel/batteryValue.png"
            }
            Image {
                id: batBg
                x: 136
                y: 336
                source: "qrc:/Theme/Theme1/Image/HomePanel/batteryBg.png"
                Text {
                    id: batValue
                    x: 122
                    y: 28
                    text: qsTr("32")
                    color: "white"
                    font.pixelSize: 20
                }
            }
        }
    }

    Image {
        id: leftBg
        y: 360
        opacity: 1.0
        source: "qrc:/Theme/Theme1/Image/HomePanel/leftRing.png"
        Item {
            id: airPressure1Bar
            x: 1
            width: 135
            height: (airPressure1>=0)?122*airPressure1:0
            clip: true
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
            Image {
                transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: -180 }
                source: (airPressure1Bar.height>73) ? "qrc:/Theme/Theme1/Image/HomePanel/leftUpFull.png" :"qrc:/Theme/Theme1/Image/HomePanel/leftUp.png"
            }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
        }
    }

    Image {
        id: rightBg
        x: 1272
        y: 360
        opacity: 1.0
        source: "qrc:/Theme/Theme1/Image/HomePanel/rightRing.png"
        Item {
            id: airPressure2Bar
            x: -1
            width: 155
            height: (airPressure2>=0)?122*airPressure2:0
            clip: true
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
            Image {
                transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
                source: (airPressure2Bar.height>73) ? "qrc:/Theme/Theme1/Image/HomePanel/rightUpFull.png" :"qrc:/Theme/Theme1/Image/HomePanel/rightUp.png"
            }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
        }
    }

    Item {
        id: airPressure1Dispaly
        x: 2
        y: 496
        width: 100
        height: 100
        Text {
            id: charAirPress1
            x:20
            text: qsTr("%1").arg((airPressure1Bar.height/122.0).toFixed(1))
            color: "white"
            font.italic: false
            font.pixelSize: 18
            //font.family:FontName.fontCurrentFzLt
        }
        Text {
            id: charAirPressMeasure1
            x:50
            text: "MPa"
            color: "#808080"
            font.italic: true
            font.pixelSize: 18
            //font.family:FontName.fontCurrentFzLt
        }
    }

    Item {
        id: airPressure2Dispaly
        x: 1330
        y: 496
        width: 100
        height: 100
        Text {
            id: charAirPress2
            x:20
            text: qsTr("%1").arg((airPressure2Bar.height/122.0).toFixed(1))
            color: "white"
            font.italic: false
            font.pixelSize: 18
            //font.family:FontName.fontCurrentFzLt
        }
        Text {
            id: charAirPressMeasure2
            x:50
            text: "MPa"
            color: "#808080"
            font.italic: true
            font.pixelSize: 18
            //font.family:FontName.fontCurrentFzLt
        }
    }

    Text {
        id: odoDisplay
        x: 892
        y: 480
        width: 120
        text: qsTr("总里程 %1 Km").arg(0)
        //font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 15
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: tripDisplay
        x: 440
        y: 480
        width: 120
        text: qsTr("小计里程 %1 Km").arg(0)
        //font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 15
        color: "white"
        horizontalAlignment: Text.AlignRight
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: leftBgImage;  opacity: 0.0; y: 60; scale: 0.0 }
            PropertyChanges { target: rightBgImage; opacity: 0.0; y: 60; scale: 0.0 }
        },
        State {
            name: "normal"
            PropertyChanges { target: leftBgImage;  opacity: 1.0; x:  20; y: 0; scale: 1.0 }
            PropertyChanges { target: rightBgImage; opacity: 1.0; x: 876; y: 0; scale: 1.0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: leftBgImage;  opacity: 1.0; x: -26; y: 60; scale: 0.75 }
            PropertyChanges { target: rightBgImage; opacity: 1.0; x: 922; y: 60; scale: 0.75 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "normal"
            ParallelAnimation{
                ScriptAction {
                    script: {
                        startFlash.running = true;
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"
            ParallelAnimation {
                NumberAnimation {
                    target: leftBgImage
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightBgImage
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
            }
        },
        Transition {
            from: "menu"
            to: "normal"
            ParallelAnimation {
                NumberAnimation {
                    target: leftBgImage
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightBgImage
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
            }
        }
    ]

    Component.onCompleted: {
        //homeIndex.state = "normal"
        //homeIndex.state = "menu"
    }
}

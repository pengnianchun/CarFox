import QtQuick 2.0
import TransformRing 1.0

Item {
    id: speedPanel
    x: 1440
    scale: 0.00

    property bool bActive: false
    property real speed: (bActive&&(CarStatus.speed<=140.00)&&(CarStatus.speed>=0.00))?CarStatus.speed:(bActive&&(CarStatus.speed>=140.00)?140:0)
    property bool light: false

    SequentialAnimation{
        id:speedAnimation
        running: false
        NumberAnimation {
            target: speedPanel
            property: "speed"
            duration: 1000
            from: 0
            to: 140
            easing.type: Easing.InOutQuad
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: speedPanel
            property: "speed"
            duration: 1000
            from: 140
            to: 0
            easing.type: Easing.InOutQuad
        }

        ScriptAction{
            script: {
                bActive = true
            }
        }
    }

    Image {
        id: speedBg
        x: 708
        y: 2
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/DialPanel/speedBg.png"
    }

    Item {
        x: 1105
        y: 225
        width: 100
        height: 100
        Text {
            id: speedNum
            anchors.centerIn: parent
            text: speedPanel.speed.toFixed(0)
            color: "white"
            font.pixelSize: 95
            font.family:FontName.fontCurrentFzLt
        }
    }

//    Item {
//        x: 1105
//        y: 230
//        width: 100
//        height: 100
//        Text {
//            id: speedNum2
//            anchors.centerIn: parent
//            text: speedNum.text
//            color: "darkgray"
//            font.pixelSize: 95
//            font.family:FontName.fontCurrentFzLt
//            transform: Rotation { origin.x: 0; origin.y: 100; axis { x: 1; y: 0; z: 0 } angle: 260 }
//        }
//    }

    TransformRing {
        id: rpmRing
        x: 920
        y: 38
        ro: 234
        ri: 133
        div: 60
        angle: 220 - (speedPanel.speed/140.00)*260
        startAngle: 220
        endAngle: -40
        clockwise: false
        tex: "qrc:/images/theme1/images/themeOne/DialPanel/rightHalo.png"
    }

    Item {
        id: batteryId
        x:219
        y:90
        scale: 0.8

        Image {
            id: batteryBg
            x: 1058
            y: 315
            opacity: 1.0
            scale: 0.9
            source: "qrc:/images/theme1/images/themeOne/DialPanel/dialCurrent.png"
        }

        Image {
            id: batteryPointer
            x: 1146
            y: 405
            opacity: 1.0
            source: "qrc:/images/theme1/images/themeOne/DialPanel/smallPoint.png"
            transform:Rotation{
                id: rotationbatteryR
                origin.x: 1170 - batteryPointer.x
                origin.y: 495  - batteryPointer.y
                angle: (CarStatus.battery >= 16) ? ((CarStatus.battery-24.00)/16.00)*70 : -35
                Behavior on angle { SpringAnimation { spring: 2; damping: 0.2 } }
            }
        }
    }

    Image {
        id: lamp_AC
        x: 1045
        y: 199
        width: 30
        height:25
        visible: (CarStatus.lamp_ac===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_AC.png"
    }

    Image {
        id: lamp_KT
        x: 1230
        y: 199
        width: 30
        height:25
        visible: (CarStatus.lamp_battery_main_contact===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_batContactor.png"
    }

//    Image {
//        id: lamp_WaterLow
//        x: 1026
//        y: 262
//        width: 42
//        height:32
//        visible: (CarStatus.control_IN12===0) || light
//        source: "qrc:/images/theme1/images/themeOne/Indicator/Lamp_waterLow.png"
//    }

    Image {
        id: lamp_BackCang
        x: 1243
        y: 262
        width: 40
        height:32
        visible: (CarStatus.lamp_rear_door_open===1) || light
        source: "qrc:/images/common/images/common/Indicator/backCang.png"
    }

    Image {
        id: lamp_dryere
        x: 1050
        y: 329
        width: 38
        height:30
        visible: (CarStatus.lamp_dryere===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_dryere.png"
    }

//    Image {
//        id: lamp_batteryCharge
//        x: 1223
//        y: 332
//        width: 38
//        height:25
//        visible: (CarStatus.control_IN12===0) || light
//        source: "qrc:/images/common/images/common/Indicator/batteryCharge.png"
//    }

    function enableLight(flag) {
        light = flag
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: speedPanel; opacity: 0.0; y: 80; scale: 0.00; x: 1440 }
            PropertyChanges { target: speedNum; opacity: 0.0 }
            PropertyChanges { target: speedPanel; bActive: false; state: "" }
        },
        State {
            name: "normal"
            PropertyChanges { target: speedPanel; opacity: 1.0; y: 16; scale: 0.95; x: 76 }
            PropertyChanges { target: speedNum; opacity: 1.0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: speedPanel; opacity: 1.0; y: 80; scale: 0.75; x: 360 }
            PropertyChanges { target: speedNum; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "normal"

            SequentialAnimation {
                NumberAnimation {
                    target: speedPanel
                    properties: "y, scale, x"
                    duration: 800
                    easing.type: Easing.OutExpo
                }

                ParallelAnimation{
                    ScriptAction {
                        script: {
                            speedAnimation.running = true;
                        }
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"

            NumberAnimation {
                target: speedPanel
                properties: "y, scale, x"
                duration: 800
                easing.type: Easing.OutBounce
            }
        },
        Transition {
            from: "menu"
            to: "normal"
            NumberAnimation {
                target: speedPanel
                properties: "y, scale, x"
                duration: 800
                easing.type: Easing.OutBounce
            }
        }
    ]

    Component.onCompleted: {

        console.log("=============theme1's speedpanel component complete ============")
    }
}

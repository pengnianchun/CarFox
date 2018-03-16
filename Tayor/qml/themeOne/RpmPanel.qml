import QtQuick 2.0
import TransformRing 1.0

Item {
    id: rpmPanel
    scale: 0.0

    property bool bActive: false
    property real rpmValue: (bActive&&(Math.abs(CarStatus.rpm/100.0)<=40.00)&&(Math.abs(CarStatus.rpm/100.0)>=0.00))?Math.abs(CarStatus.rpm/100.0):(bActive&&(Math.abs(CarStatus.rpm/100.0)>=40.00)?40:0)
    property bool light: false

    SequentialAnimation{
        id:rpmAnimation
        running: false
        NumberAnimation {
            target: rpmPanel
            property: "rpmValue"
            duration: 1000
            from: 0
            to: 40
            easing.type: Easing.InOutQuad
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: rpmPanel
            property: "rpmValue"
            duration: 1000
            from: 40
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
        id: rpmBg
        x: 0
        y: 2
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/DialPanel/rpmBg.png"
    }

    Item {
        x: 230
        y: 225
        width: 100
        height: 100
        Text {
            id: speedNum
            anchors.centerIn: parent
            text: rpmPanel.rpmValue.toFixed(0)
            color: "white"
            style: Text.Raised
            font.pixelSize: 95
            font.family:FontName.fontCurrentFzLt
        }
    }

//    Item {
//        x: 230
//        y: 230
//        width: 100
//        height: 100
//        Text {
//            id: speedNum2
//            anchors.centerIn: parent
//            text: speedNum.text
//            color: "darkgray"
//            style: Text.Raised;
//            font.pixelSize: 95
//            font.family:FontName.fontCurrentFzLt
//            transform: Rotation { origin.x: 0; origin.y: 100; axis { x: 1; y: 0; z: 0 } angle: 260 }
//        }
//    }

    TransformRing {
        id: rpmRing
        x: 43
        y: 38
        ro: 234
        ri: 133
        div: 60
        angle: 220 - (rpmPanel.rpmValue/40.00)*259.3
        startAngle: 220
        endAngle: -40
        clockwise: false
        tex: "qrc:/images/theme1/images/themeOne/DialPanel/leftHalo.png"
    }

    Item {
        id: socId
        x:65
        y:90
        scale: 0.8

        Image {
            id: socBg
            x: 150
            y: 315
            opacity: 1.0
            scale: 0.9
            source: "qrc:/images/theme1/images/themeOne/DialPanel/dialSoc.png"
        }

        Image {
            id: socPointer
            x: 240  //236
            y: 405
            opacity: 1.0
            source: "qrc:/images/theme1/images/themeOne/DialPanel/smallPoint.png"
            //rotation: 5
            transform:Rotation{
                id: rotationSocL
                origin.x: 268 - socPointer.x
                origin.y: 485 - socPointer.y
                angle:  -38 + (CarStatus.oil_level/100.0)*76
                Behavior on angle { SpringAnimation { spring: 2; damping: 0.2 } }
            }
        }
    }

    Image {
        id: lamp_oilPressLow
        x: 172
        y: 199
        width: 40
        height:25
        visible: (CarStatus.lamp_oil_pressure_low===1) || light
        source: "qrc:/images/common/images/common/Indicator/oilPressLow.png"
    }

//    Image {
//        id: lamp_waterTempWarn
//        x: 355
//        y: 192
//        width: 45
//        height:45
//        visible: (CarStatus.control_IN12===0) || light
//        source: "qrc:/images/common/images/common/Indicator/igOn.png"
//    }

    Image {
        id: lamp_oilLowWarn
        x: 144
        y: 258
        width: 48
        height:46
        visible: (CarStatus.lamp_oil_level_low===1) || light
        source: "qrc:/images/common/images/common/Indicator/oilLowWarn.png"
    }

//    Image {
//        id: lamp_motorFault
//        x: 332
//        y: 327
//        width: 50
//        height:50
//        visible: (CarStatus.control_IN12===0) || light
//        source: "qrc:/images/common/images/common/Indicator/motorFault.png"
//    }

    Image {
        id: lamp_highVol
        x: 180
        y: 335
        width: 32
        height:32
        visible: (CarStatus.lamp_high_voltage_maintenance===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_highVol.png"
    }

    Image {
        id: lamp_ABS
        x: 364
        y: 268
        width: 42
        height:32
        visible: (CarStatus.lamp_abs===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_ABS.png"
    }

    function enableLight(flag) {
        light = flag
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: rpmPanel; opacity: 0.0; y: 80; scale: 0.0 }
            PropertyChanges { target: speedNum; opacity: 0.0 }
            PropertyChanges { target: rpmPanel; bActive: false; state: "" }
        },
        State {
            name: "normal"
            PropertyChanges { target: rpmPanel; opacity: 1.0; y: 16; scale: 0.95 }
            PropertyChanges { target: speedNum; opacity: 1.0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: rpmPanel; opacity: 1.0; y: 80; scale: 0.75 }
            PropertyChanges { target: speedNum; opacity: 1.0 }
        }
    ]


    transitions: [
        Transition {
            from: ""
            to: "normal"

            SequentialAnimation {
                NumberAnimation {
                    target: rpmPanel
                    properties: "y, scale"
                    duration: 800
                    easing.type: Easing.OutExpo
                }

                ParallelAnimation{
                    ScriptAction {
                        script: {
                            rpmAnimation.running = true;
                        }
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"

            NumberAnimation {
                target: rpmPanel
                properties: "y, scale"
                duration: 800
                easing.type: Easing.OutBounce
            }
        },
        Transition {
            from: "menu"
            to: "normal"

            NumberAnimation {
                target: rpmPanel
                properties: "y, scale"
                duration: 800
                easing.type: Easing.OutBounce
            }
        }
    ]
    Component.onCompleted: {

        console.log("=============theme1's rpmpanel component complete ============")
    }
}

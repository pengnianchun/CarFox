import QtQuick 2.0

Item {
    id: indicatorIndex
    width: 1440
    height: 544
    state: "normal"

    property bool light: true

    Image {
        id: lamp_leftTurn
        x: 410
        y: 22
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_turnLeft.png"
    }

    Image {
        id: lamp_rightTurn
        x:  983
        y:  22
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_turnRight.png"
    }

    Image {
        id: lamp_frontFog
        x: 54
        y: 61
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_frontFog.png"
    }

    Image {
        id: lamp_rearFog
        x: 20
        y: 105
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_rearFog.png"
    }

    Image {
        id: lamp_highBeam
        x: 22
        y: 30
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_highBeam.png"
    }

    Image {
        id: lamp_headlight
        x: 103
        y: 30
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_headlight.png"
    }

    Image {
        id: lamp_door1
        x: 460
        y: 18
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_door1.png"
    }

    Image {
        id: lamp_airPress1
        x: 513
        y: 22
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_airPress1.png"
    }

    Image {
        id: lamp_leftFriction
        x: 570
        y: 22
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_leftFriction.png"
    }

    Image {
        id: lamp_backCabin
        x: 631
        y: 20
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_backCabin.png"
    }

    Image {
        id: lamp_danger
        x: 690
        y: 20
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_danger.png"
    }

    Image {
        id: lamp_waterLevel
        x: 753
        y: 20
        width: 50
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_waterLevel.png"
    }

    Image {
        id: lamp_rightFriction
        x: 811
        y: 22
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_rightFriction.png"
    }

    Image {
        id: lamp_airPress2
        x: 873
        y: 22
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_airPress2.png"
    }

    Image {
        id: lamp_door2
        x: 923
        y: 18
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_door2.png"
    }

    Image {
        id: lamp_positionLight
        x: 1305
        y: 13
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_littleLight.png"
    }

    Image {
        id: lamp_chargePlugin
        x: 1358
        y: 45
        width: 50
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_chargePlugin.png"
    }

    Image {
        id: lamp_Charging
        x: 1374
        y: 94
        height: 46
        width: 45
        visible: light
        source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_chargeIndicator.png"
    }

    Item {
        id: leftId
        width: 554
        height: 542
        scale: 0.6
        Image {
            id: lamp_test1
            x: 213
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }

        Image {
            id: lamp_test2
            x: 283
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }
    }

    Item {
        id: rightId
        width: 554
        height: 542
        scale: 0.6
        Image {
            id: lamp_test3
            x: 1118
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }

        Image {
            id: lamp_test4
            x: 1188
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: leftId;  opacity: 0.0; y: 60; scale: 0.0 }
            PropertyChanges { target: rightId; opacity: 0.0; y: 60; scale: 0.0 }
        },
        State {
            name: "normal"
            PropertyChanges { target: leftId;  opacity: 1.0; x: 0; y: 0; scale: 1.0 }
            PropertyChanges { target: rightId; opacity: 1.0; x: 0; y: 0; scale: 1.0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: leftId;  opacity: 1.0; x: -46; y: 60; scale: 0.75 }
            PropertyChanges { target: rightId; opacity: 1.0; x: 262; y: 60; scale: 0.75 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "normal"
            ParallelAnimation{
                ScriptAction {
                    script: {
                        light = true;
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"
            ParallelAnimation {
                NumberAnimation {
                    target: leftId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightId
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
                    target: leftId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
            }
        }
    ]

}

import QtQuick 2.0
import TransformRing 1.0

Item {
    id: centerPanelIndex
    width: 1440
    height: 544
    opacity: 1.0
    scale: 0.0

    property int value1: 0
    property int rpmValue: 0
    property real speedValue: 0
    property int socValue: 0
    property int batteryValue: 0
    property int currentValue: 0

    SequentialAnimation{
        id:progressAnimation
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            target: centerPanelIndex
            property: "value1"
            duration: 16000
            from: 0
            to: 120
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: centerPanelIndex
            property: "value1"
            duration: 16000
            from: 120
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    SequentialAnimation{
        id:rpmAnimation
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            target: centerPanelIndex
            property: "rpmValue"
            duration: 480000
            from: 0
            to: 3000
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: centerPanelIndex
            property: "rpmValue"
            duration: 480000
            from: 3000
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    SequentialAnimation{
        id:speedAnimation
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            target: centerPanelIndex
            property: "speedValue"
            duration: 22400
            from: 0
            to: 140
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: centerPanelIndex
            property: "speedValue"
            duration: 22400
            from: 140
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    SequentialAnimation{
        id:socAnimation
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            target: centerPanelIndex
            property: "socValue"
            duration: 16000
            from: 0
            to: 100
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: centerPanelIndex
            property: "socValue"
            duration: 16000
            from: 100
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    SequentialAnimation{
        id:batteryAnimation
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            target: centerPanelIndex
            property: "batteryValue"
            duration: 12800
            from: 0
            to: 800
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: centerPanelIndex
            property: "batteryValue"
            duration: 12800
            from: 800
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    SequentialAnimation{
        id:currentAnimation
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            target: centerPanelIndex
            property: "currentValue"
            duration: 8000
            from: 0
            to: 500
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: centerPanelIndex
            property: "currentValue"
            duration: 8000
            from: 500
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    Rectangle {
        id: leftRect
        x:  144
        y:  37
        width: 700
        height: 400
        clip: true
        color: "transparent"

        Image {
            id: wingLeft

            opacity: 1.0
            source: "qrc:/images/theme2/images/themeTwo/DialPanel/leftWing.png"

            Rectangle {
                id: displayDigit1
                x: 220
                y: 80
                width: 128
                height: 30
                color: "transparent"
                DigitValue{
                    id:digit1
                    anchors.centerIn: displayDigit1
                    icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/blue0.png"
                    icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/blue1.png"
                    icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/blue2.png"
                    icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/blue3.png"
                    icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/blue4.png"
                    icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/blue5.png"
                    icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/blue6.png"
                    icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/blue7.png"
                    icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/blue8.png"
                    icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/blue9.png"
                    value: CarStatus.rpm.toFixed(0)
                    spacing: -18
                    scale:1.0
                    visible: true
                }
            }

            Rectangle {
                id: displayDigit2
                x: 257
                y: 176
                width: 80
                height: 30
                color: "transparent"
                DigitValue{
                    id:digit2
                    anchors.centerIn: displayDigit2
                    icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/blue0.png"
                    icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/blue1.png"
                    icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/blue2.png"
                    icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/blue3.png"
                    icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/blue4.png"
                    icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/blue5.png"
                    icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/blue6.png"
                    icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/blue7.png"
                    icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/blue8.png"
                    icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/blue9.png"
                    value: CarStatus.soc.toFixed(0)
                    spacing: -18
                    scale:1.0
                    visible: true
                }
            }

            Rectangle {
                id: displayDigit3
                x: 268
                y: 276
                width: 70
                height: 30
                color: "transparent"
                DigitValue{
                    id:digit3
                    anchors.centerIn: displayDigit3
                    icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/blue0.png"
                    icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/blue1.png"
                    icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/blue2.png"
                    icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/blue3.png"
                    icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/blue4.png"
                    icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/blue5.png"
                    icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/blue6.png"
                    icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/blue7.png"
                    icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/blue8.png"
                    icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/blue9.png"
                    value: CarStatus.totalVoltage.toFixed(0)
                    spacing: -21
                    scale:0.8
                    visible: true
                }
            }

            ProgressValue {
                id: progressBar
                x: 166
                y: 122
                length: 203
                value: CarStatus.rpm.toFixed(0)
                maxValue: 3000
            }

            ProgressValue {
                id: progressBar2
                x: 225
                y: 216
                length: 128
                value: CarStatus.soc.toFixed(0)
                maxValue: 100
            }

        }
    }

    Rectangle {
        id: rightRect
        x:  590
        y:  37
        width: 700
        height: 400
        clip: true
        color: "transparent"

        Image {
            id: wingRight

            opacity: 1.0
            source: "qrc:/images/theme2/images/themeTwo/DialPanel/rightWing.png"

            Rectangle {
                id: displayDigit4
                x: 360
                y: 80
                width: 128
                height: 30
                color: "transparent"
                DigitValue{
                    id:digit4
                    anchors.centerIn: displayDigit4
                    icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/blue0.png"
                    icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/blue1.png"
                    icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/blue2.png"
                    icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/blue3.png"
                    icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/blue4.png"
                    icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/blue5.png"
                    icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/blue6.png"
                    icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/blue7.png"
                    icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/blue8.png"
                    icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/blue9.png"
                    value: CarStatus.speed.toFixed(0)
                    spacing: -18
                    scale:1.0
                    visible: true
                }
            }

            Rectangle {
                id: displayDigit5
                x: 395
                y: 174
                width: 80
                height: 30
                color: "transparent"
                DigitValue{
                    id:digit5
                    anchors.centerIn: displayDigit5
                    icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/blue0.png"
                    icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/blue1.png"
                    icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/blue2.png"
                    icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/blue3.png"
                    icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/blue4.png"
                    icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/blue5.png"
                    icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/blue6.png"
                    icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/blue7.png"
                    icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/blue8.png"
                    icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/blue9.png"
                    value: CarStatus.battery.toFixed(0)
                    spacing: -18
                    scale:1.0
                    visible: true
                }
            }

            Rectangle {
                id: displayDigit6
                x: 345
                y: 276
                width: 70
                height: 30
                color: "transparent"
                DigitValue{
                    id:digit6
                    anchors.centerIn: displayDigit6
                    icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/blue0.png"
                    icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/blue1.png"
                    icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/blue2.png"
                    icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/blue3.png"
                    icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/blue4.png"
                    icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/blue5.png"
                    icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/blue6.png"
                    icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/blue7.png"
                    icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/blue8.png"
                    icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/blue9.png"
                    value: CarStatus.totalCurrent.toFixed(0)
                    spacing: -21
                    scale:0.8
                    visible: true
                }
            }

            ProgressValue {
                id: progressBar11
                x: 322
                y: 122
                length: 202
                value: CarStatus.speed.toFixed(0)
                maxValue: 3000
            }

            ProgressValue {
                id: progressBar22
                x: 348
                y: 216
                length: 128
                value: CarStatus.battery.toFixed(0)
                maxValue: 32
            }

        }

    }



    Image {
        id: mainRing
        x:  434
        y:  0
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/DialPanel/mainRing.png"

        Rectangle {
            id: displayDigit
            x: 141
            y: 178
            width: 280
            height: 90
            color: "transparent"
            DigitValue{
                id:digit
                anchors.centerIn: displayDigit
                icon0: "qrc:/images/theme2/images/themeTwo/HomePanel/gray0.png"
                icon1: "qrc:/images/theme2/images/themeTwo/HomePanel/gray1.png"
                icon2: "qrc:/images/theme2/images/themeTwo/HomePanel/gray2.png"
                icon3: "qrc:/images/theme2/images/themeTwo/HomePanel/gray3.png"
                icon4: "qrc:/images/theme2/images/themeTwo/HomePanel/gray4.png"
                icon5: "qrc:/images/theme2/images/themeTwo/HomePanel/gray5.png"
                icon6: "qrc:/images/theme2/images/themeTwo/HomePanel/gray6.png"
                icon7: "qrc:/images/theme2/images/themeTwo/HomePanel/gray7.png"
                icon8: "qrc:/images/theme2/images/themeTwo/HomePanel/gray8.png"
                icon9: "qrc:/images/theme2/images/themeTwo/HomePanel/gray9.png"
                value: CarStatus.speed.toFixed(0)
                spacing: -38
                scale:1.0
                visible: true
            }
        }

        SwitchGear {
            id: switchGearIndex
            x: 18
            y: 92
        }
    }

    Image {
        id: lightRing
        x:  466
        y:  20
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/DialPanel/centerLight.png"
    }

    TransformRing {
        id: speedRing
        x: 516
        y: 68
        ro: 200
        ri: 196
        div: 60
        angle: 212.5 - (CarStatus.speed/140.00)*245
        startAngle: 212.5
        endAngle: -32.5
        clockwise: false
        tex: "qrc:/images/theme2/images/themeTwo/DialPanel/speedRing.png"
    }

    LightDot {
        id: lightDot
    }

//    AnimatedImage {
//        id: animation;
//        visible: false
//        source: "qrc:/images/theme2/images/themeTwo/HomePanel/flow.gif"
//    }

    states: [
        State {
            name: ""
            PropertyChanges { target: centerPanelIndex; scale: 0.0 }
        },
        State {
            name: "normal"
            PropertyChanges { target: centerPanelIndex; scale: 1.0 }
            PropertyChanges { target: wingLeft; x: 0 }
            PropertyChanges { target: wingRight; x: 0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: centerPanelIndex; scale: 1.0 }
            PropertyChanges { target: wingLeft; x: 350 }
            PropertyChanges { target: wingRight; x: -350 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "normal"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: centerPanelIndex
                        properties: "scale"
                        duration: 600
                        easing.type: Easing.Linear
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: wingLeft
                        properties: "x"
                        duration: 300
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: wingRight
                        properties: "x"
                        duration: 300
                        easing.type: Easing.Linear
                    }
                }
            }
        },
        Transition {
            from: "menu"
            to: "normal"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: wingLeft
                        properties: "x"
                        duration: 300
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: wingRight
                        properties: "x"
                        duration: 300
                        easing.type: Easing.Linear
                    }
                }
            }
        }
    ]
}

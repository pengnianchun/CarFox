import QtQuick 2.6
import CustomRing 1.0

Item {
    width: 1440
    height: 544
    visible: false

    onVisibleChanged: {
        if(visible){
            startSplash.running = true;
        }else{
            startSplash.running = false;
        }
    }

    SequentialAnimation {
        id: startSplash
        running: false
        ParallelAnimation {
            SequentialAnimation{
                id: blueRingAnimation1
                ParallelAnimation{
                    NumberAnimation {
                        target: leftTopBlue
                        property: "x"
                        duration: 80
                        from: 558
                        to: 470
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: leftTopBlue
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
                NumberAnimation {
                    target: leftBlueRing
                    property: "angle"
                    duration: 440
                    from: 23
                    to: 337
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: leftBottomBlue
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
            }
            SequentialAnimation{
                id: blueRingAnimation2
                ParallelAnimation{
                    NumberAnimation {
                        target: rightTopBlue
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
                NumberAnimation {
                    target: rightBlueRing
                    property: "angle"
                    duration: 440
                    from: 157
                    to: -157
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: rightBottomBlue
                        property: "x"
                        duration: 80
                        from: 74
                        to: -14
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: rightBottomBlue
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
            }
        }
        ParallelAnimation {
            SequentialAnimation{
                id: blueRingAnimation3
                PauseAnimation {
                    duration: 200
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: leftTopBlue
                        property: "width"
                        duration: 80
                        from: 88
                        to: 0
                        easing.type: Easing.Linear
                    }
                }
                ScriptAction{
                    script: {
                        leftBlueRing.clockwise = true
                    }
                }
                NumberAnimation {
                    target: leftBlueRing
                    property: "angle"
                    duration: 440
                    from: 23
                    to: 337
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: leftBottomBlue
                        property: "x"
                        duration: 80
                        from: 470
                        to: 558
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: leftBottomBlue
                        property: "width"
                        duration: 80
                        from: 88
                        to: 0
                        easing.type: Easing.Linear
                    }
                }
            }
            SequentialAnimation{
                id: blueRingAnimation4
                PauseAnimation {
                    duration: 200
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: rightTopBlue
                        property: "x"
                        duration: 80
                        from: 470
                        to: 558
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: rightTopBlue
                        property: "width"
                        duration: 80
                        from: 88
                        to: 0
                        easing.type: Easing.Linear
                    }
                }
                ScriptAction{
                    script: {
                        rightBlueRing.clockwise = true
                    }
                }
                NumberAnimation {
                    target: rightBlueRing
                    property: "angle"
                    duration: 440
                    from: 157
                    to: -157
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: rightBottomBlue
                        property: "width"
                        duration: 80
                        from: 88
                        to: 0
                        easing.type: Easing.Linear
                    }
                }
            }
            SequentialAnimation{
                id: whiteRingAnimation1
                ParallelAnimation{
                    NumberAnimation {
                        target: leftTopWhite
                        property: "x"
                        duration: 80
                        from: 620
                        to: 528
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: leftTopWhite
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
                NumberAnimation {
                    target: leftWhiteRing
                    property: "angle"
                    duration: 440
                    from: 23
                    to: 337
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: leftBottomWhite
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
            }
            SequentialAnimation{
                id: whiteRingAnimation2
                ParallelAnimation{
                    NumberAnimation {
                        target: rightTopWhite
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
                NumberAnimation {
                    target: rightWhiteRing
                    property: "angle"
                    duration: 440
                    from: 157
                    to: -157
                    easing.type: Easing.InOutQuad
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: rightBottomWhite
                        property: "x"
                        duration: 80
                        from: 168
                        to: 80
                        easing.type: Easing.Linear
                    }
                    NumberAnimation {
                        target: rightBottomWhite
                        property: "width"
                        duration: 80
                        from: 0
                        to: 88
                        easing.type: Easing.Linear
                    }
                }
            }
        }
        ScriptAction {
            script: {
                UiController.hideLayer("Splash");
                UiController.showLayer("HomePanel");
            }
        }
    }

    Rectangle {
        id: splashId
        anchors.fill: parent
        color: "black"
    }

    Image {
        id: bgId
        visible: false
        source: "qrc:/Theme/Theme1/Image/AutoSplash/bluelinebg.png"
    }

    Image {
        id: bgWhiteId
        visible: false
        source: "qrc:/Theme/Theme1/Image/AutoSplash/linebg.png"
    }

    Item {
        id: leftBlueId
        x:2.8
        y:2
        Item {
            id: leftTopBlue
            x: 558
            y: 160
            width: 0
            height: 30
            clip: true
            Image {
                id: leftTopBlueId
                x: 410 - leftTopBlue.x
                y: 71 - leftTopBlue.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/leftbluesharp1.png"
            }
        }
        Item {
            id: leftBottomBlue
            x: 470
            y: 350
            width: 0
            height: 30
            clip: true
            Image {
                id: leftBottomBlueId
                x: 414 - leftBottomBlue.x
                y: 266 - leftBottomBlue.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/leftbluesharp2.png"
            }
        }
        CustomRing {
            id: leftBlueRing
            ro: 271
            ri: 210
            div: 60
            angle: 23
            startAngle: 23
            endAngle: 337
            clockwise: false
            tex: "qrc:/Theme/Theme1/Image/AutoSplash/leftBlueLine.png"
        }
    }

    Item {
        id: rightBlueId
        x: 898
        y: 2
        Item {
            id: rightTopBlue
            x: -10
            y: 160
            width: 0
            height: 30
            clip: true
            Image {
                id: rightTopBlueId
                x: -69 - rightTopBlue.x
                y: 70 - rightTopBlue.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/rightbluesharp1.png"
            }
        }
        Item {
            id: rightBottomBlue
            x: 74
            y: 350
            width: 0
            height: 30
            clip: true
            Image {
                id: rightBottomBlueId
                x: -72 - rightBottomBlue.x
                y: 266 - rightBottomBlue.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/rightbluesharp2.png"
            }
        }
        CustomRing {
            id: rightBlueRing
            ro: 271
            ri: 210
            div: 60
            angle: 157
            startAngle: 157
            endAngle: -157
            clockwise: false
            tex: "qrc:/Theme/Theme1/Image/AutoSplash/rightblueline.png"
        }
    }

    Item {
        id: leftWhiteId
        x: -56
        Item {
            id: leftTopWhite
            x: 620
            y: 160
            width: 0
            height: 30
            clip: true
            Image {
                id: leftTopWhiteId
                x: 483 - leftTopWhite.x
                y: 126.5 - leftTopWhite.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/leftsharp1.png"
            }
        }
        Item {
            id: leftBottomWhite
            x: 528
            y: 350
            width: 0
            height: 30
            clip: true
            Image {
                id: leftBottomWhiteId
                x: 501 - leftBottomWhite.x
                y: 315 - leftBottomWhite.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/leftsharp2.png"
            }
        }
        CustomRing {
            id: leftWhiteRing
            x: 82
            y: 30
            ro: 244
            ri: 220//180
            div: 60
            angle: 23
            startAngle: 23
            endAngle: 33
            clockwise: false
            tex: "qrc:/Theme/Theme1/Image/AutoSplash/leftwhite.png"
        }
    }

    Item {
        id: rightWhiteId
        x: 798
        Item {
            id: rightTopWhite
            x: 80
            y: 160
            width: 0
            height: 30
            clip: true
            Image {
                id: rightTopWhiteId
                x: -22 - rightTopWhite.x
                y: 126 - rightTopWhite.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/rightsharp1.png"
            }
        }
        Item {
            id: rightBottomWhite
            x: 168
            y: 350
            width: 0
            height: 30
            clip: true
            Image {
                id: rightBottomWhiteId
                x: -40 - rightBottomWhite.x
                y: 315.3 - rightBottomWhite.y
                source: "qrc:/Theme/Theme1/Image/AutoSplash/rightsharp2.png"
            }
        }
        CustomRing {
            id: rightWhiteRing
            x: 130
            y: 30
            ro: 244
            ri: 180
            div: 60
            angle: 157
            startAngle: 157
            endAngle: -157
            clockwise: false
            tex: "qrc:/Theme/Theme1/Image/AutoSplash/rightwhite.png"
        }
    }
}

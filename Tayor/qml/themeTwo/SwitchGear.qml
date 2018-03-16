import QtQuick 2.0

Item {
    id: switchGear
    width: 1440
    height: 544
    opacity:0.0

    property int gearState: CarStatus.gear;

    SequentialAnimation{

        id:gearAnimation
        running: false

        PauseAnimation {
            duration: 2000
        }

        NumberAnimation {
            target: switchGear
            property: "gearState"
            duration: 20000
            from: 1
            to: 4
        }

        PauseAnimation {
            duration: 2000
        }

        NumberAnimation {
            target: switchGear
            property: "gearState"
            duration: 20000
            from: 4
            to: 1
        }

    }

    onGearStateChanged: {
        changeGearState(gearState);
    }

    Image {
        id: gearD
        x: 227
        y: 232
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/gearD.png"
        opacity: 0.0
        scale: 1.0
    }

    Text {
        id: numDisplay
        x: 280
        y: 243
        opacity: 0.0
        text: qsTr("1")
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 32
        color: "white"
    }

    Image {
        id: gearN
        x: 240
        y: 232
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/gearN.png"
        opacity: 0.0
        scale: 1.0
    }

    Image {
        id: gearP
        x: 240
        y: 232
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/gearP.png"
        opacity: 0.0
        scale: 1.0
    }

    Image {
        id: gearR
        x: 240
        y: 232
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/gearR.png"
        opacity: 0.0
        scale: 1.0
    }

    function changeGearState(currentGearState) {
        var gearState = parseInt(currentGearState)
        numDisplay.opacity = 0.0
        if (0 === gearState) {
            gearD.opacity = 0
            gearN.opacity = 1
            gearP.opacity = 0
            gearR.opacity = 0
            switchGear.state = "showGearN"
        } else if ((6 >= gearState) && (1 <= gearState)) {
            gearD.opacity = 1
            gearN.opacity = 0
            gearP.opacity = 0
            gearR.opacity = 0
            switchGear.state = "showGearD"
            numDisplay.opacity = 1.0
            switch(gearState) {
                case 1: numDisplay.text = "1";  break;
                case 2: numDisplay.text = "2";  break;
                case 3: numDisplay.text = "3";  break;
                case 4: numDisplay.text = "4";  break;
                case 5: numDisplay.text = "5";  break;
                case 6: numDisplay.text = "6";  break;
            }
        } else if (7 === gearState) {
            gearD.opacity = 0
            gearN.opacity = 0
            gearP.opacity = 0
            gearR.opacity = 1
            switchGear.state = "showGearR"
        } else {
            gearD.opacity = 0
            gearN.opacity = 0
            gearP.opacity = 0
            gearR.opacity = 0
            switchGear.state = ""
        }
    }

    function setTextDisplay(currentValue) {
        var value = currentValue.toString(10)
        return value
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: switchGear; opacity: 0.0 }
            PropertyChanges { target: gearR; opacity: 0.0 }
            PropertyChanges { target: gearN; opacity: 0.0 }
            PropertyChanges { target: gearD; opacity: 0.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
        },
        State {
            name: "showGearP"
            PropertyChanges { target: switchGear; opacity: 1.0 }
            PropertyChanges { target: gearR; opacity: 0.0 }
            PropertyChanges { target: gearN; opacity: 0.0 }
            PropertyChanges { target: gearD; opacity: 0.0 }
            PropertyChanges { target: gearP; opacity: 1.0 }
        },
        State {
            name: "showGearR"
            PropertyChanges { target: switchGear; opacity: 1.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
            PropertyChanges { target: gearN; opacity: 0.0 }
            PropertyChanges { target: gearD; opacity: 0.0 }
            PropertyChanges { target: gearR; opacity: 1.0 }
        },
        State {
            name: "showGearN"
            PropertyChanges { target: switchGear; opacity: 1.0 }
            PropertyChanges { target: gearR; opacity: 0.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
            PropertyChanges { target: gearD; opacity: 0.0 }
            PropertyChanges { target: gearN; opacity: 1.0 }
        },
        State {
            name: "showGearD"
            PropertyChanges { target: switchGear; opacity: 1.0 }
            PropertyChanges { target: gearR; opacity: 0.0 }
            PropertyChanges { target: gearN; opacity: 0.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
            PropertyChanges { target: gearD; opacity: 1.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: switchGear; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
        },
        Transition {
            from: "*"
            to:   "showGearP"
            ParallelAnimation {
                NumberAnimation {
                    target: gearP
                    properties: "scale"
                    from: 0.0
                    to: 1.0
                    duration: 200
                    easing.type: Easing.InOutBounce
                }
            }
        },
        Transition {
            from: "*"
            to:   "showGearR"
            ParallelAnimation {
                NumberAnimation {
                    target: gearR
                    properties: "scale"
                    from: 0.0
                    to: 1.0
                    duration: 200
                    easing.type: Easing.InOutBounce
                }
            }
        },
        Transition {
            from: "*"
            to:   "showGearN"
            ParallelAnimation {
                NumberAnimation {
                    target: gearN
                    properties: "scale"
                    from: 0.0
                    to: 1.0
                    duration: 200
                    easing.type: Easing.InOutBounce
                }
            }
        },
        Transition {
            from: "*"
            to:   "showGearD"
            ParallelAnimation {
                NumberAnimation {
                    target: gearD
                    properties: "scale"
                    from: 0.0
                    to: 1.0
                    duration: 200
                    easing.type: Easing.InOutBounce
                }
            }
        }
    ]

    Component.onCompleted: {
        changeGearState(gearState)
    }
}

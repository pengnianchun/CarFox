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
        loops: Animation.Infinite

        PauseAnimation {
            duration: 600
        }

        NumberAnimation {
            target: switchGear
            property: "gearState"
            duration: 30000
            from: 0
            to: 4
        }

        PauseAnimation {
            duration: 600
        }

        NumberAnimation {
            target: switchGear
            property: "gearState"
            duration: 30000
            from: 4
            to: 0
        }

    }

//    onGearStateChanged: {
//        if(0 === gearState) {
//            switchGear.state = "showGearP"
//        } else if (1 === gearState) {
//            switchGear.state = "showGearD"
//        } else if (2 === gearState) {
//            switchGear.state = "showGearR"
//        } else if (3 === gearState) {
//            switchGear.state = "showGearN"
//        } else {
//            //console.log(" --- gear set error !!!")
//        }
//    }

    onGearStateChanged: {
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
            //console.log(" --- gear set error !!!")
        }
    }

    Image {
        id: gearD
        anchors.horizontalCenter: switchGear.horizontalCenter
        y: 478
        source: "qrc:/images/theme1/images/themeOne/GlobalPanel/gearD.png"
        opacity: 0.0
    }

    Text {
        id: numDisplay
        x: 744
        y: 475
        opacity: 0.0
        text: qsTr("1")
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 32
        color: "white"
    }

    Image {
        id: gearN
        anchors.horizontalCenter: switchGear.horizontalCenter
        y: 478
        source: "qrc:/images/theme1/images/themeOne/GlobalPanel/gearN.png"
        opacity: 0.0
    }

    Image {
        id: gearP
        anchors.horizontalCenter: switchGear.horizontalCenter
        y: 478
        source: "qrc:/images/theme1/images/themeOne/GlobalPanel/gearP.png"
        opacity: 0.0
    }

    Image {
        id: gearR
        anchors.horizontalCenter: switchGear.horizontalCenter
        y: 478
        source: "qrc:/images/theme1/images/themeOne/GlobalPanel/gearR.png"
        opacity: 0.0
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: switchGear; opacity: 0.0 }
        },
        State {
            name: "showGearP"
            PropertyChanges { target: switchGear; opacity: 1.0 }
        },
        State {
            name: "showGearR"
            PropertyChanges { target: switchGear; opacity: 1.0 }
        },
        State {
            name: "showGearN"
            PropertyChanges { target: switchGear; opacity: 1.0 }
        },
        State {
            name: "showGearD"
            PropertyChanges { target: switchGear; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "showGearP"
            ParallelAnimation {
                NumberAnimation {
                    target: gearP
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 10
                }
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: ""
            to:   "showGearR"
            ParallelAnimation {
                NumberAnimation {
                    target: gearR
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 10
                }
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: ""
            to:   "showGearN"
            ParallelAnimation {
                NumberAnimation {
                    target: gearN
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 10
                }
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: ""
            to:   "showGearD"
            ParallelAnimation {
                NumberAnimation {
                    target: gearD
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 10
                }
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearP"
            to:   "showGearN"
            ParallelAnimation {
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: gearP.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearN
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearR"
            to:   "showGearN"
            ParallelAnimation {
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: gearR.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearN
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearD"
            to:   "showGearN"
            ParallelAnimation {
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: gearD.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearN
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearD"
            to:   "showGearP"
            ParallelAnimation {
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: gearD.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearP
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearN"
            to:   "showGearP"
            ParallelAnimation {
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: gearN.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearP
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearR"
            to:   "showGearP"
            ParallelAnimation {
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: gearR.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearP
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearD"
            to:   "showGearR"
            ParallelAnimation {
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: gearD.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearR
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearN"
            to:   "showGearR"
            ParallelAnimation {
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: gearN.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearR
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearP"
            to:   "showGearR"
            ParallelAnimation {
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: gearP.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearR
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearP"
            to:   "showGearD"
            ParallelAnimation {
                NumberAnimation {
                    target: gearP
                    properties: "height"
                    from: gearP.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearD
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearN"
            to:   "showGearD"
            ParallelAnimation {
                NumberAnimation {
                    target: gearN
                    properties: "height"
                    from: gearN.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearD
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        },
        Transition {
            from: "showGearR"
            to:   "showGearD"
            ParallelAnimation {
                NumberAnimation {
                    target: gearR
                    properties: "height"
                    from: gearR.height
                    to: 0
                    duration: 800
                }
                NumberAnimation {
                    target: gearD
                    properties: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 800
                }
                NumberAnimation {
                    target: gearD
                    properties: "height"
                    from: 0
                    to: 60
                    duration: 10
                }
            }
        }
    ]


}

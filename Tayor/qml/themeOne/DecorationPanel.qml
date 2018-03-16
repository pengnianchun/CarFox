import QtQuick 2.0

Item {
    id: decorationPanel
    width: 1440
    height: 544
    opacity:0.0

    property bool bActive: false
    //property real airPressure1: bActive?CarStatus.airPressure1:0.0
    //property real airPressure2: bActive?CarStatus.airPressure2:0.0
    property real airPressure1: (bActive&&(CarStatus.apVol1<=1.0)&&(CarStatus.apVol1>=0.0))?CarStatus.apVol1:(bActive&&(CarStatus.apVol1>=1.0)?1:0)
    property real airPressure2: (bActive&&(CarStatus.apVol2<=1.0)&&(CarStatus.apVol2>=0.0))?CarStatus.apVol2:(bActive&&(CarStatus.apVol2>=1.0)?1:0)

    ParallelAnimation {
        id: airPressureBar
        running: false
        SequentialAnimation {
            //NumberAnimation { target: airPressure1Bar; property: "height"; from:122; to:0; duration: 800 }
            NumberAnimation { target: airPressure1Bar; property: "height"; from:0; to:122; duration: 1000 }
            NumberAnimation { target: airPressure1Bar; property: "height"; from:122; to:((CarStatus.airPressure1>=0)?(122*CarStatus.airPressure1):0); duration: 1000}//(1-CarStatus.airPressure1)>=0?(800*(1-CarStatus.airPressure1)):0}
            ScriptAction{ script: { bActive = true } }
        }
        SequentialAnimation {
            //NumberAnimation { target: airPressure2Bar; property: "height"; from:122; to:0; duration: 800 }
            NumberAnimation { target: airPressure2Bar; property: "height"; from:0; to:122; duration: 1000 }
            NumberAnimation { target: airPressure2Bar; property: "height"; from:122; to:((CarStatus.airPressure2>=0)?(122*CarStatus.airPressure2):0); duration: 1000} //(1-CarStatus.airPressure2)>=0?(800*(1-CarStatus.airPressure2)):0 }
            ScriptAction{ script: { bActive = true } }
        }
    }

    Image {
        id: leftBg
        x: -100 //10
        y: 360
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/HomePanel/leftRing.png"

        Item {
            id: airPressure1Bar
            x: 1
            y: 0
            width: 135
            height: (airPressure1>=0)?122*airPressure1:0 //(0-122)
            clip: true
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
            Image {
                transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: -180 }
                source: (airPressure1Bar.height>73) ? "qrc:/images/theme1/images/themeOne/HomePanel/leftUpFull.png" :"qrc:/images/theme1/images/themeOne/HomePanel/leftUp.png"
            }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
        }
    }

    Image {
        id: rightBg
        x:  1540 //1262
        y: 360
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/HomePanel/rightRing.png"

        Item {
            id: airPressure2Bar
            x: -1
            y: 0
            width: 155
            height: (airPressure2>=0)?122*airPressure2:0 //(0-122)
            clip: true
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
            Image {
                transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
                source: (airPressure2Bar.height>73) ? "qrc:/images/theme1/images/themeOne/HomePanel/rightUpFull.png" :"qrc:/images/theme1/images/themeOne/HomePanel/rightUp.png"
            }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
        }
    }

    Item {
        x: -35
        y: 320
        width: 100
        height: 100
        visible: false
        Text {
            id: charF
            anchors.centerIn: parent
            text: "F"
            color: "white" //"#FFDB00"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
        }
        Text {
            anchors.centerIn: parent
            text: charF.text
            color: "#7E2803"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
            transform: Rotation { origin.x: 0; origin.y: 25; axis { x: 1; y: 0; z: 0 } angle: 245 }
        }
    }

    Item {
        x: 115
        y: 375
        width: 100
        height: 100
        visible: false
        Text {
            id: charE
            anchors.centerIn: parent
            text: "E"
            color: "white" //"#FFDB00"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
        }
        Text {
            anchors.centerIn: parent
            text: charE.text
            color: "#7E2803"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
            transform: Rotation { origin.x: 0; origin.y: 25; axis { x: 1; y: 0; z: 0 } angle: 245 }
        }
    }

    Item {
        x: 1127
        y: 375
        width: 100
        height: 100
        visible: false
        Text {
            id: charC
            anchors.centerIn: parent
            text: "C"
            color: "white" //"#FFDB00"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
        }
        Text {
            anchors.centerIn: parent
            text: charC.text
            color: "#7E2803"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
            transform: Rotation { origin.x: 0; origin.y: 25; axis { x: 1; y: 0; z: 0 } angle: 245 }
        }
    }

    Item {
        x: 1299
        y: 320
        width: 100
        height: 100
        visible: false
        Text {
            id: charH
            anchors.centerIn: parent
            text: "H"
            color: "white" //"#FFDB00"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
        }
        Text {
            anchors.centerIn: parent
            text: charH.text
            color: "#7E2803"
            font.italic: true
            font.pixelSize: 25
            //font.family: CarStatus.fontHandgotl
            transform: Rotation { origin.x: 0; origin.y: 25; axis { x: 1; y: 0; z: 0 } angle: 245 }
        }
    }

    Item {
        id: airPressure1Dispaly
        x: 2
        y: 496
        width: 100
        height: 100
        visible: false
        Text {
            id: charAirPress1
            x:20
            //anchors.centerIn: parent
            text: qsTr("%1").arg((airPressure1Bar.height/122.0).toFixed(1))
            color: "white" //"#FFDB00"
            font.italic: false
            font.pixelSize: 18
            font.family:FontName.fontCurrentFzLt
        }
        Text {
            id: charAirPressMeasure1
            x:50
            //anchors.centerIn: parent
            text: "MPa"
            color: "#808080"
            font.italic: true
            font.pixelSize: 18
            font.family:FontName.fontCurrentFzLt
        }
    }

    Item {
        id: airPressure2Dispaly
        x: 1330
        y: 496
        width: 100
        height: 100
        visible: false
        Text {
            id: charAirPress2
            x:20
            //anchors.centerIn: parent
            text: qsTr("%1").arg((airPressure2Bar.height/122.0).toFixed(1))
            color: "white" //"#FFDB00"
            font.italic: false
            font.pixelSize: 18
            font.family:FontName.fontCurrentFzLt
        }
        Text {
            id: charAirPressMeasure2
            x:50
            //anchors.centerIn: parent
            text: "MPa"
            color: "#808080"
            font.italic: true
            font.pixelSize: 18
            font.family:FontName.fontCurrentFzLt
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: decorationPanel;  opacity: 0.0 }
            PropertyChanges { target: leftBg;  opacity: 0.0; x: -100 }
            PropertyChanges { target: rightBg; opacity: 0.0; x: 1540 }
        },
        State {
            name: "show"
            PropertyChanges { target: decorationPanel;  opacity: 1.0 }
            PropertyChanges { target: leftBg;  opacity: 1.0; x: 10 }
            PropertyChanges { target: rightBg; opacity: 1.0; x: 1262 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation {
//                ParallelAnimation {
//                    NumberAnimation {
//                        target: leftBg
//                        properties: "x"
//                        duration: 500
//                        //easing.type: Easing.OutQuad
//                    }
//                    NumberAnimation {
//                        target: rightBg
//                        properties: "x"
//                        duration: 500
//                        //easing.type: Easing.OutQuad
//                    }
//                }
                PauseAnimation {
                    duration: 600
                }
                ParallelAnimation {
                    SequentialAnimation {
                        ScriptAction {
                            script: {
                                airPressure1Dispaly.visible = true
                            }
                        }
                    }
                    SequentialAnimation {
                        ScriptAction {
                            script: {
                                airPressure2Dispaly.visible = true
                            }
                        }
                    }
                }
                ScriptAction {
                    script: {
                        airPressureBar.running = true
                    }
                }
            }
        },
        Transition {
            from: "show"
            to: ""
        }
    ]
}

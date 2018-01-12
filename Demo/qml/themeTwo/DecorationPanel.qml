import QtQuick 2.0

Item {
    id: decorationPanelIndex
    width: 1440
    height: 544
    opacity: 1.0
    state: ""

    property bool bActive: false
    property real airPressure1: (bActive&&(CarStatus.apVol1<=1.0)&&(CarStatus.apVol1>=0.0))?CarStatus.apVol1:(bActive&&(CarStatus.apVol1>=1.0)?1:0)
    property real airPressure2: (bActive&&(CarStatus.apVol2<=1.0)&&(CarStatus.apVol2>=0.0))?CarStatus.apVol2:(bActive&&(CarStatus.apVol2>=1.0)?1:0)

    ParallelAnimation {
        id: airPressureBar
        running: true

        SequentialAnimation{
            NumberAnimation {
                target: decorationPanelIndex
                property: "airPressure1"
                duration: 1800
                from: 0
                to: 1
            }

            PauseAnimation {
                duration: 200
            }

            NumberAnimation {
                target: decorationPanelIndex
                property: "airPressure1"
                duration: 1800
                from: 1
                to: 0
            }

        }

        SequentialAnimation{
            NumberAnimation {
                target: decorationPanelIndex
                property: "airPressure2"
                duration: 1800
                from: 0
                to: 1
            }

            PauseAnimation {
                duration: 200
            }

            NumberAnimation {
                target: decorationPanelIndex
                property: "airPressure2"
                duration: 1800
                from: 1
                to: 0
            }
            PauseAnimation {
                duration: 100
            }
            ScriptAction{ script: { bActive = true } }
        }
    }

    Image {
        id: mpaLeft
        x:  -200 //4
        y:  125
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/mpaLeft.png"
    }

    Image {
        id: mpaRight
        x:  1491 //1287
        y:  125
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/mpaRight.png"
    }

    GridValue {
        id: airpressValue1
        x: mpaLeft.x + 40
        y: 176
        opacity: 1.0
        value: airPressure1
    }

    GridValue {
        id: airpressValue2
        x: mpaRight.x + 51
        y: 176
        opacity: 1.0
        value: airPressure2
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: mpaLeft;  x: -160 }
            PropertyChanges { target: mpaRight; x: 1451 }
        },
        State {
            name: "show"
            PropertyChanges { target: mpaLeft;  x: 4}
            PropertyChanges { target: mpaRight; x: 1287 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            ParallelAnimation {
                NumberAnimation {
                    target: mpaLeft
                    properties: "x"
                    duration: 500
                    //easing.type: Easing.OutQuad
                }
                NumberAnimation {
                    target: mpaRight
                    properties: "x"
                    duration: 500
                    //easing.type: Easing.OutQuad
                }
            }
        },
        Transition {
            from: "show"
            to: ""
        }
    ]
}

import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    property real  timeCountDown: 8.0

    Rectangle {
        width: 600
        height: 60
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#111111"

        NQText {
            id: countDown
            anchors.centerIn: parent
            textValue: timeCountDown.toFixed(1)
            textColor: "red"
            pixelSize: 32
        }

        Image {
            id: anti_offset
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 100
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/anti_offset.png"
        }

        Image {
            id: anti_collision
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 100
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/anti_collision.png"
        }
    }

    Image {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Modules/adas/road.png"
        sourceSize.width: 554
        sourceSize.height: 187
        asynchronous: true
        cache: true
    }

    Item {
        id: people
        x: 100
        y: 100

        Image {
            id: warningPeople
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/warining.png"
        }
        Image {
            anchors.bottom: warningPeople.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: warningPeople.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/pepole.png"
        }
    }

    Item {
        id: bus
        x: 155
        y: 150

        Image {
            id: warningBus
            x: 164
            y: 42
            width: 156
            height: 167
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/warining.png"
        }
        Image {
            id: image
            x: 190
            y: 143
            width: 115
            height: 75
            anchors.horizontalCenterOffset: 0
            anchors.bottom: warningBus.bottom
            anchors.bottomMargin: 7
            anchors.horizontalCenter: warningBus.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/bus.png"
            sourceSize.width: 40
            sourceSize.height: 40
        }
    }

    PathAnimation {
        id: pathAnim_people
        target: people
        duration: 3000

        path: Path {
            PathCurve { x: 100;  y: 100; }
            PathCurve { x: 200;  y: 100; }
            PathCurve { x: 350;  y: 150; }
        }

        onStarted: {
            console.log("pathAnim_people started");
        }

        onStopped: {
            console.log("pathAnim_people stopped");
        }
    }

    states: [
        State {
            name: "Run"

            PropertyChanges {
                target: warningBus
                x: 209
                y: -22
                width: 70
                height: 89
            }

            PropertyChanges {
                target: image
                y: 17
                width: 45
                height: 34
            }
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { properties: "x,y,width,height"; easing.type: Easing.InOutQuad; duration: 5000 }
        }
    ]

    onVisibleChanged: {
        if (visible) {
            demo_adas.start()
            pathAnim_people.start()
            state = "Run"
        } else {
            demo_adas.stop()
            pathAnim_people.stop()
            state =  ""
        }
    }

    // Demo
    Timer {
        id: demo_adas
        interval: 100
        repeat: true
        running: false
        onTriggered: {
            timeCountDown -= 0.1
            if (timeCountDown < 1) {
                running = false
            }
        }
    }
}

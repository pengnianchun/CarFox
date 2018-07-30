import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property real  timeCountDown: 6.0

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
        visible: true

        Image {
            id: warningPeople
            x: 90
            y: 75
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/warining.png"
        }
        Image {
            anchors.bottom: warningPeople.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: warningPeople.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/pepole.png"
        }
        Timer {
            interval: 800
            repeat: true
            running: parent.visible
            onTriggered: {
                warningPeople.visible = !warningPeople.visible
            }
        }
    }

    Item {
        id: bus
        x: 155
        y: 150

        Image {
            id: warningBus
            x: 238
            y: -16
            width: 79
            height: 99
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/warining.png"
        }
        Image {
            id: warningImage2
            x: 190
            y: 87
            width: 55
            height: 55
            anchors.horizontalCenterOffset: 1
            anchors.bottom: warningBus.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: warningBus.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Modules/adas/bus.png"
        }
        Timer {
            interval: 800
            repeat: true
            running: parent.visible
            onTriggered: {
                warningBus.visible = !warningBus.visible
            }
        }
    }

    Image {
        x: 688
        y: 185
        source: "qrc:/theme2/symbol/Theme2/Modules/adas/speedLimit.png"
    }

    onVisibleChanged: {

    }
}

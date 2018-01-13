import QtQuick 2.5

Item {
    id: root
    width: 1440
    height: 544
    property int fps: 0
    property int frameCounter: 0

    Item {
        id: spinnerImage
        NumberAnimation on rotation {
            from:0
            to: 360
            duration: 1000
            loops: Animation.Infinite
        }
        onRotationChanged: {
            ++frameCounter
        }
    }

    Text {
        x:25
        y:500
        text: root.fps + " fps"
        color: "white"
        font.pixelSize: 20
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            fps = frameCounter
            frameCounter = 0
        }
    }
}

import QtQuick 2.6

Item {
    id: root
    width: 300
    height: 48
    property int fps: 60
    property int frameCounter: 0
    z: 100

    Item {
        id: spinnerImage
        NumberAnimation on x {
            from:0
            to: 1000
            duration: 1000
            loops: Animation.Infinite
        }
        onXChanged: ++frameCounter
    }

    Text {
        objectName: "fpsText"
        text: root.fps + " fps"
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        font.pixelSize: 24
        anchors.centerIn: parent
        font.family: "WenQuanYi Micro Hei"
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

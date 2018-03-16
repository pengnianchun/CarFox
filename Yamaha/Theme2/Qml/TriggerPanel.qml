import QtQuick 2.6

Item {
    id: triggerPanel
    width: 1440
    height: 540
    visible: false
    z: 1

    onVisibleChanged: {
        if(!visible) {
            UiController.hideLayer("ConciseTriggerPanel");
        }
    }

    Connections {
        target: CarMsg

        onKeyShortPressed: {
            if (key === 2) {
                UiController.hideLayer("Theme2TriggerPanel");
            }
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 200
        height: 200
        radius: 200
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        Text {
            anchors.centerIn: parent
            text: "Theme2Trigger"
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            font.pixelSize: 22
        }
    }
}

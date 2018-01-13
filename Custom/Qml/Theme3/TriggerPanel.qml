import QtQuick 2.6

Item {
    id: triggerPanel
    width: 1440
    height: 540
    visible: false
    z: 1

    onVisibleChanged: {
        if(!visible) {
            UiController.hideLayer("Theme3TriggerPanel")
        }
    }

    Connections {
        target: CarUpdates

        onKeyShortPressed: {
            if (key === 2) {
                UiController.hideLayer("Theme3TriggerPanel");
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
            text: "Theme3Trigger"
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            font.pixelSize: 22
        }
    }
}

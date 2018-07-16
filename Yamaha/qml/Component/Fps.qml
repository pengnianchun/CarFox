import QtQuick 2.6
import QtQuick.Layouts 1.0

Item {
    id: root
    z: 100
    width: 1440
    height: 100

    property int fps: 60
    property int frameCounter: 0
    property bool hidden: false

    Item {
        NumberAnimation on x {
            from:0
            to: 1000
            duration: 1000
            loops: Animation.Infinite
        }
        onXChanged: ++frameCounter
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 10
        objectName: "fpsText"
        text: "FPS: " + root.fps
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        font.pixelSize: 24
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

    RowLayout {
        id: debugKey
        z: 50
        width: 200
        height: 80
        spacing: 20
        anchors.top: parent.top
        anchors.left: parent.left
        visible: root.hidden

        Rectangle {
            id: button1
            width: 50
            height: 30
            opacity: 0.8
            color: "red"
            radius: 10
            Text {
                anchors.centerIn: parent
                text: qsTr("Enter")
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent;
                onReleased: {
                    console.log("press Enter !")
                    CarMsg.sendEnableKeys(true);
                    CarMsg.keyShortPressed(0);
                }
            }
        }
        Rectangle {
            id: button2
            width: 50
            height: 30
            opacity: 0.8
            color: "red"
            radius: 10
            Text {
                anchors.centerIn: parent
                text: qsTr("Back")
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent;
                onReleased: {
                    console.log("press Back !")
                    CarMsg.sendEnableKeys(true);
                    CarMsg.keyShortPressed(1);
                }
            }
        }
        Rectangle {
            id: button3
            width: 50
            height: 30
            opacity: 0.8
            color: "red"
            radius: 10
            Text {
                anchors.centerIn: parent
                text: qsTr("Prev")
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent;
                onReleased: {
                    console.log("press Prev !")
                    CarMsg.sendEnableKeys(true);
                    CarMsg.keyShortPressed(2);
                }
            }
        }
        Rectangle {
            id: button4
            width: 50
            height: 30
            opacity: 0.8
            color: "red"
            radius: 10
            Text {
                anchors.centerIn: parent
                text: qsTr("Next")
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent;
                onReleased: {
                    console.log("press Next !")
                    CarMsg.sendEnableKeys(true);
                    CarMsg.keyShortPressed(3);
                }
            }
        }
        Rectangle {
            id: button5
            width: 50
            height: 30
            opacity: 0.8
            color: "red"
            radius: 10
            Text {
                anchors.centerIn: parent
                text: qsTr("igOn")
                font.bold: true
            }
            MouseArea {
                anchors.fill: parent;
                onReleased: {
                    console.log("press igOn !")
                    CarMsg.carMode = 1;
                    CarMsg.carModeChanged(1);
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.hidden = !root.hidden
        }
    }
}

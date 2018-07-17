import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property bool homepanel_visible: true
    property int carSpeedRotation: -120

    layer.enabled: true

    FontLoader {
        id: msyh
        source: "qrc:/Fonts/font/msyh.ttc"
    }

    Rectangle {
        id: blackbg
        anchors.fill: parent
        color: "black"
    }

    Rectangle {
        anchors.centerIn: parent
        width: 500
        height: 300
        visible: homepanel_visible
        color: "#111111"
        radius: 10

        ColumnLayout{
            anchors.fill: parent

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Image {
                    source: "qrc:/theme2/symbol/Theme2/Symbol/Countdown.png"
                    asynchronous: true
                    cache: true
                }

                Text {
                    text: qsTr("发车倒计时")
                    color: "#0088ff"
                    font.family: msyh.name
                    font.pixelSize: 30
                }
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("00:00")
                color: "white"
                font.family: msyh.name
                font.pixelSize: 50
            }
        }
    }

    Image {
        id: line_up
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 61
        source: "qrc:/theme2/symbol/Theme2/Symbol/line_up.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_left
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_left.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_right
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_right.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_down
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_down.png"
        asynchronous: true
        cache: true
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 550
        visible: homepanel_visible

        Image {
            id: speed_left
            source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
            asynchronous: true
            cache: true

            Image {
                id: circle_lineLeft
                anchors.horizontalCenter: speed_left.horizontalCenter
                source: "qrc:/theme2/symbol/Theme2/Symbol/circle_line.png"
                asynchronous: true
                cache: true
                rotation: carSpeedRotation
            }
        }

        Image {
            id: speed_right
            source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
            asynchronous: true
            cache: true

            Image {
                id: circle_lineRight
                anchors.horizontalCenter: speed_right.horizontalCenter
                source: "qrc:/theme2/symbol/Theme2/Symbol/circle_line.png"
                asynchronous: true
                cache: true
                //rotation: carSpeedRotation

                PathArc {
                        x: 0; y: 100
                        radiusX: 100; radiusY: 100
                        useLargeArc: true
                    }
            }
        }
    }

}

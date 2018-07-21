import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    Rectangle {
        x: 20
        y: 10
        width: 760
        height: 50
        radius: 10
        color: "#383838"

        NQText {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            textValue: "FM 广播"
            pixelSize: 18
        }
    }

    Image {
        x: 48
        y: 106
        source: "qrc:/theme2/symbol/Theme2/Modules/radio/bg_left.png"
    }

    Rectangle {
        x: 327
        y: 80
        width: 437
        height: 277
        radius: 10
        color: "#383838"

        Text {
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "中国之声"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "101.7"
            font.pixelSize: 80
            color: "white"
        }

        RowLayout {
            anchors.top: parent.top
            anchors.topMargin: 150
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50

            Text {
                text: "Mhz"
                font.pixelSize: 18
                color: textBlue
            }
            Text {
                text: "FM"
                font.pixelSize: 18
                color: textBlue
            }
        }

        Image {
            id: image
            x: 84
            y: 190
            width: 269
            height: 44
            source: "qrc:/theme2/symbol/Theme2/Modules/radio/radio_line.png"
        }
    }
}

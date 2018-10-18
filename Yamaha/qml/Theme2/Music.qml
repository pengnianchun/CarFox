import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property string textBlue: "#0088ff"

    Image {
        x: 50
        y: 50
        source: "qrc:/theme2/symbol/Theme2/Modules/music/album_big.png"
    }

    Image {
        x: 360
        y: 85
        source: "qrc:/theme2/symbol/Theme2/Modules/music/soundWaves.png"
    }

    Rectangle {
        width: parent.width
        height: 55
        color: "#242424"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 77

        Image {
            x: 101
            y: 19
            source: "qrc:/theme2/symbol/Theme2/Modules/music/previous.png"
        }

        Image {
            x: 164
            y: 15
            source: "qrc:/theme2/symbol/Theme2/Modules/music/pause.png"
        }

        Image {
            x: 232
            y: 19
            source: "qrc:/theme2/symbol/Theme2/Modules/music/next.png"
        }

        Image {
            x: 275
            y: 6
            source: "qrc:/theme2/symbol/Theme2/Modules/music/album_small.png"
        }

        Text {
            x: 370
            y: 8
            text: "鹿回头"
            color: textBlue
        }

        Text {
            x: 370
            y: 30
            text: "曹寅"
            color: textBlue
        }

        Text {
            x: 433
            y: 22
            text: "02:11"
            color: "white"
        }

        Rectangle {
            x: 485
            y: 29
            width: 133
            height: 3
            color: "white"

            Rectangle {
                width: 22
                height: 3
                color: textBlue
            }
        }

        Text {
            x: 627
            y: 22
            text: "04:11"
            color: "white"
        }

        Image {
            x: 685
            y: 18
            source: "qrc:/theme2/symbol/Theme2/Modules/music/singleCycle.png"
        }

        Image {
            x: 738
            y: 18
            source: "qrc:/theme2/symbol/Theme2/Modules/music/loop.png"
        }
    }
}

import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    ColumnLayout {
        spacing: 15
        anchors.centerIn: parent
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "位置信息"
                color: "white"
                font.pixelSize: 20
            }
            Text {
                text: "北纬31°23′3.68″ 东经121°25′29.42″"
                color: "white"
                font.pixelSize: 20
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "位置信息"
                color: "white"
                font.pixelSize: 20
            }
            Text {
                text: "北纬31°23′3.68″ 东经121°25′29.42″"
                color: "white"
                font.pixelSize: 20
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "位置信息"
                color: "white"
                font.pixelSize: 20
            }
            Text {
                text: "北纬31°23′3.68″ 东经121°25′29.42″"
                color: "white"
                font.pixelSize: 20
            }
        }
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                anchors.centerIn: parent
                width: 100
                height: 20
            }

            Text {
                anchors.centerIn: parent
                text: "OK"
                color: "white"
                font.pixelSize: 20
            }
        }
    }

}

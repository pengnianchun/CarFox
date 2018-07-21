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
                text: "异常信息"
                color: "white"
                font.pixelSize: 20
            }
            Text {
                text: "汽车外观异常"
                color: "white"
                font.pixelSize: 20
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "车辆信息"
                color: "white"
                font.pixelSize: 20
            }
            Text {
                text: "沪A 99999"
                color: "white"
                font.pixelSize: 20
            }
        }

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                anchors.centerIn: parent
                width: 180
                height: 40
                radius: 10
                color: "lightblue"
            }

            Text {
                anchors.centerIn: parent
                text: "一键求助"
                color: "white"
                font.pixelSize: 30
            }
        }
    }

}

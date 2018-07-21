import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: radar
    width: 800
    height: 410

    Image {
        anchors.centerIn: car
        source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_road.png"
    }

    Image {
        id: car
        anchors.centerIn: parent
        source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_car.png"
    }

    ColumnLayout {
        anchors.right: car.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: -50

        Image {
            source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
            rotation: 90
        }
        Image {
            source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
            rotation: 90
        }
        Image {
            source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
            rotation: 90
        }
    }

    ColumnLayout {
        anchors.left: car.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: -50

        Image {
            source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
            rotation: -90
        }
        Image {
            source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
            rotation: -90
        }
        Image {
            source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
            rotation: -90
        }
    }

    Image {
        anchors.top: car.bottom
        anchors.left: car.left
        anchors.leftMargin: 50
        source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
    }
    Image {
        anchors.top: car.bottom
        anchors.right: car.right
        anchors.rightMargin: 50
        source: "qrc:/theme2/symbol/Theme2/Modules/radar/radar_d1.png"
    }
}

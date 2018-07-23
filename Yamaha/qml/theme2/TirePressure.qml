import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/tirePressure/"

    Image {
        id: car
        anchors.centerIn: parent
        source: sourceImageUrl + "tire_car.png"
    }

    Rectangle {
        x: 262
        y: 87
        width: 90
        height: 90
        radius: 180
        color: "#00284b"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: sourceImageUrl + "right.png"
        }
        Text {
            id: tireValue1
            anchors.centerIn: parent
            text: "2.5 Bar"
            color: "white"
        }
        Text {
            id: tireTemperature1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "40 ℃"
            color: "white"
        }
    }


    Rectangle {
        x: 447
        y: 87
        width: 90
        height: 90
        radius: 180
        color: "#00284b"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: sourceImageUrl + "right.png"
        }
        Text {
            id: tireValue2
            anchors.centerIn: parent
            text: "2.4 Bar"
            color: "white"
        }
        Text {
            id: tireTemperature2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "40 ℃"
            color: "white"
        }
    }

    Rectangle {
        x: 262
        y: 232
        width: 90
        height: 90
        radius: 180
        color: "#00284b"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: sourceImageUrl + "wrong.png"
        }
        Text {
            id: tireValue3
            anchors.centerIn: parent
            text: "2.2 Bar"
            color: "white"
        }
        Text {
            id: tireTemperature3
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "50 ℃"
            color: "red"
        }
    }

    Rectangle {
        x: 166
        y: 232
        width: 90
        height: 90
        radius: 180
        color: "#00284b"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: sourceImageUrl + "wrong.png"
        }
        Text {
            id: tireValue4
            anchors.centerIn: parent
            text:"1.9 Bar"
            color: "red"
        }
        Text {
            id: tireTemperature4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "40 ℃"
            color: "white"
        }
    }

    Rectangle {
        x: 447
        y: 232
        width: 90
        height: 90
        radius: 180
        color: "#00284b"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: sourceImageUrl + "right.png"
        }
        Text {
            id: tireValue5
            anchors.centerIn: parent
            text: "2.5 Bar"
            color: "white"
        }
        Text {
            id: tireTemperature5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "40 ℃"
            color: "white"
        }
    }

    Rectangle {
        x: 543
        y: 232
        width: 90
        height: 90
        radius: 180
        color: "#00284b"

        Image {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            source: sourceImageUrl + "right.png"
        }
        Text {
            id: tireValue6
            anchors.centerIn: parent
            text: "2.1 Bar"
            color: "white"
        }
        Text {
            id: tireTemperature6
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "40 ℃"
            color: "white"
        }
    }
}

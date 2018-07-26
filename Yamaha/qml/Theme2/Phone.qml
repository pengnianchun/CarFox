import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/phone/"
    property string textBlue: "#0088ff"

    Image {
        x: 114
        y: 82
        source: sourceImageUrl + "people.png"
    }

    Image {
        id: btLogo
        x: 123
        y: 283
        source: sourceImageUrl + "Bluetooth.png"
    }

    NQText {
        x: 205
        y: 295
        textValue: "Victor's Mobile"
        pixelSize: 16
    }

    Image {
        x: 373
        y: 50
        source: sourceImageUrl + "music_line.png"
    }

    Image {
        id: call_in
        x: 562
        y: 81
        source: sourceImageUrl + "call_in.png"
    }

    Rectangle {
        width: 22
        height: 22
        radius: 180
        anchors.top: call_in.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: call_in.horizontalCenter
    }

    Rectangle {
        width: 12
        height: 12
        radius: 180
        anchors.top: call_in.bottom
        anchors.topMargin: 60
        anchors.horizontalCenter: call_in.horizontalCenter
    }

    NQText {
        anchors.top: call_in.bottom
        anchors.topMargin: 100
        anchors.horizontalCenter: call_in.horizontalCenter
        textValue: "正在来电"
        textColor: textBlue
        pixelSize: 18
    }

    NQText {
        anchors.top: call_in.bottom
        anchors.topMargin: 130
        anchors.horizontalCenter: call_in.horizontalCenter
        textValue: "Scott"
        pixelSize: 18
    }

    NQText {
        anchors.top: call_in.bottom
        anchors.topMargin: 160
        anchors.horizontalCenter: call_in.horizontalCenter
        textValue: "13816325965"
        pixelSize: 18
    }

}

import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    Image {
        x: 93
        y: 61
        source: "qrc:/theme2/symbol/Theme2/Modules/calendarTemp/coludy.png"
    }

    Text {
        x: 122
        y: 188
        text: "34 ℃"
        font.pixelSize: 32
        color: "white"
    }

    Image {
        x: 80
        y: 312
        source: "qrc:/theme2/symbol/Theme2/Modules/calendarTemp/airPressure.png"
    }

    Text {
        x: 121
        y: 269
        text: "3 级"
        font.pixelSize: 16
        color: "white"
    }

    Image {
        x: 79
        y: 272
        source: "qrc:/theme2/symbol/Theme2/Modules/calendarTemp/wind.png"
    }

    Text {
        x: 121
        y: 235
        text: "63 %"
        font.pixelSize: 16
        color: "white"
    }

    Image {
        x: 83
        y: 235
        source: "qrc:/theme2/symbol/Theme2/Modules/calendarTemp/humidity.png"
    }

    Text {
        x: 121
        y: 312
        text: "1008 Mph"
        font.pixelSize: 16
        color: "white"
    }

    Calendar {
        x: 300
        y: 20
        width: 480
        height: 320
    }

}

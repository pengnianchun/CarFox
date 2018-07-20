import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property string textValue: ""
    property string textColor: "white"
    property int pixelSize: 12

    FontLoader {
        id: msyh
        source: "qrc:/Fonts/Font/msyh.ttc"
    }

    FontLoader {
        id: msyhl
        source: "qrc:/Fonts/Font/msyhl.ttc"
    }

    Text {
        id: text
        anchors.centerIn: parent
        text: qsTr(textValue)
        font.family: msyh.name
        color: textColor
        font.pixelSize: pixelSize
    }
}

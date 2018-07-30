import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property string textValue: ""
    property string textColor: "white"
    property int pixelSize: 12

    FontLoader {
        id: msyh
        name: "Microsoft "
    }

    FontLoader {
        id: msyhl
        name: "Microsoft "
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

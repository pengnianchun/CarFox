import QtQuick 2.0

Item {


    property string textValue: ""

    FontLoader {
        id: fixedFont
        source: "qrc:/Fonts/font/msyh.ttc"
    }

    Text {
        id: name
        anchors.horizontalCenter: engineSpeed.horizontalCenter
        anchors.verticalCenter: engineSpeed.verticalCenter
        text: qsTr(textValue)
        font.family: fixedFont.name
        color: "white"
        font.pixelSize: 135
    }
}

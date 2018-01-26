import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    id: oilPressValue
    width: 180
    height: 20
    property string textIconValue: "未命名";
    property string iconSource: "";
    property real imageTopMargin: 10
    property real spaceWidth: -5

    Image {
        id: oilPress
        opacity: 1.0
        source: iconSource
        anchors.top: parent.top
        anchors.topMargin: imageTopMargin
    }
    TextFieldWeir {
        anchors.left: oilPress.right
        anchors.leftMargin: spaceWidth
        anchors.verticalCenter: parent.verticalCenter
        textWidth: 100
        textHeight: 20
        textValue: textIconValue
        fontItalic: false
        fontSize: 18
        fontColor: "white"
    }
}

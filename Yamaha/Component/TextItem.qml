import QtQuick 2.6

Item {
    id: textLayer
//    width: layerArea ? textW : 0
//    height: layerArea ? textH : 0
    Behavior on scale { NumberAnimation { duration: conceptRpm ? 200 : 0 } }
    Component.onCompleted: {
        textLayer.width = Qt.binding(
                    function() {
                        if(layerArea) return textW;
                        else if(textPrivate) return textW;
                        else if (textSimple) return textSimpleLayer.width;
                    });
        textLayer.height = Qt.binding(
                    function() {
                        if(layerArea) return textH;
                        else if(textPrivate) return textH;
                        else if (textSimple) return textSimpleLayer.height;
                    });
    }

    // textLayer width && height, the default value is false
    property bool layerArea: false

    //for normal text, the default value is true
    property bool textNormal: (!textPrivate && !conceptRpm && !conceptSpeed) ? true : false

    // for normal text dont't have anchors, the default value is false
    property bool textSimple: false

    // for text include horizontalAlignment && verticalAlignment (width && height)
    property bool textPrivate: false
    property real textW
    property real textH

    // text color, the default value is "white"
    property string textColor: "white"

    // text font italic, the default value is false
    property bool textItalic: false

    //text font bold, the default value is false
    property bool textBold: false

    // text font pixelSize, the default value is 22
    property int textSize: 22

    //text font family, the default value is "WenQuanYi Micro Hei"
    property string textFamily: "WenQuanYi Micro Hei"

    // text information, the default is ""
    property string textML: ""

    // text letterSpacing, the default value is 0
    property int textSpacing: 0

    // for normal text
    Text {
        anchors.centerIn: parent
        visible: textNormal && !textSimple
        color: textColor
        text: qsTr(textML)
        font.pixelSize: textSize
        font.family: textFamily
        font.italic: textItalic
        font.bold: textBold
        font.letterSpacing: textSpacing
    }

    // for text include  horizontalAlignment && verticalAlignment
    Text {
        anchors.centerIn: parent
        width: textW
        height: textH
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: textPrivate
        color: textColor
        text: qsTr(textML)
        font.pixelSize: textSize
        font.family: textFamily
        font.italic: textItalic
        font.bold: textBold
        font.letterSpacing: textSpacing
    }

    // for text don't include anchors.center
    Column {
        id: textSimpleLayer
        width: children.width
        height: children.height
        Text {
            visible: textNormal && textSimple
            color: textColor
            text: qsTr(textML)

            font.pixelSize: textSize
            font.family: textFamily
            font.italic: textItalic
            font.bold: textBold
            font.letterSpacing: textSpacing
        }
    }

    // only for Theme4 theme rpmPanel and speedPanel,
    // -->>>>>>>>>>>>>>>>>>>>>>>>>
    property bool conceptRpm: false
    property bool conceptSpeed: false
    Text {
        visible: conceptRpm
        text: qsTr(textML)
        color: "#dce9f3"
        font.bold: true
        font.pixelSize: 27
        font.family: "AutoIO2"
    }
    Text {
        visible: conceptSpeed
        text: qsTr(textML)
        color: "#dce9f3"
        font.pixelSize: 21
        font.family: "AutoIO2"
        font.bold: true
    }
    //--<<<<<<<<<<<<<<<<<<<<<<<<<
}

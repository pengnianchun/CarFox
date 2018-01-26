import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property real textWidth: 140;
    property real textHeight: 20;
    property real textOpacity: 1.0;
    property string textValue: "未命名";
    property bool fontItalic: false;
    property string fontFamily: "Arial" //localFont.fontCurrentFzLt  //
    property real fontSize: 18;
    property string fontColor: "#ffffff";
    property bool fontBold: false
    //FontLoader { id: localFont; source: "../fonts/FzLt.TTF" }
    Text {
        id: textfield
        opacity: textOpacity
        width: textWidth
        height: textHeight
        text: qsTr(textValue)
        horizontalAlignment: Text.AlignHCenter
        font.family: fontFamily
        font.italic: fontItalic
        font.pointSize: fontSize
        font.bold: fontBold
        color: fontColor
    }
    onTextValueChanged: {
        textfield.text = textValue;
    }
}

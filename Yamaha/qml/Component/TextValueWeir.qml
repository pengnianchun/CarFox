import QtQuick 2.6
import QtQuick.Layouts 1.1

Item {
    property real textWidth: 300;
    property real textHeight: 30;
    property real textOpacity: 1.0;
    property string textTitle: "名称"
    property string textValue: "未命名"
    property string unitValue: "单位"
    property string fontFamily: localFont.name
    property real fontSize: 18;
    property string titleColor: "#ffffff"//"#00deff"
    property string fontColor: "#ffffff"
    property string unitColor: "#ffffff"//"#00deff"
    property real unitWidth: 30
    property bool leftAlignStatus: false
    property real leftMarginValue: 0
    FontLoader { id: localFont; name: "Microsoft" }
    //Rectangle{anchors.fill: parent;color: "#000000"}
    Text {
        id: text_title
        opacity: textOpacity
        width: textWidth/3
        height: textHeight
        text: qsTr(textTitle)
        horizontalAlignment: Text.AlignLeft
        font.family: fontFamily
        font.pointSize: fontSize
        font.bold: true
        color: titleColor
    }
    Text {
        id: text_value
        opacity: textOpacity
        width: textWidth*2/3
        height: textHeight
        text: qsTr(textValue)
        anchors.left: text_title.right
        anchors.leftMargin: leftMarginValue
        horizontalAlignment: leftAlignStatus ? Text.AlignLeft : Text.AlignRight
        font.family: fontFamily
        font.pointSize: fontSize
        font.bold: true
        color: fontColor
    }
    Text {
        id: text_unit
        opacity: textOpacity
        anchors.left: text_value.right
        width: unitWidth
        height: textHeight
        text: qsTr(unitValue)
        horizontalAlignment: Text.AlignRight
        font.family: fontFamily
        font.pointSize: fontSize
        font.bold: true
        color: unitColor
    }
}

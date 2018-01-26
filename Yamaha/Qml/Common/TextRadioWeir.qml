import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Item {
    property real textWidth: 300;
    property real textHeight: 30;
    property real textOpacity: 1.0;
    property string textTitle: "名称"
    property string textValue: "未命名"
    property string unitValue: "单位"
    property string fontFamily: "Arial" //localFont.fontCurrentFzLt  //
    property real fontSize: 18;
    property string titleColor: "#ffffff"
    property string fontColor: "#ffffff"
    property string unitColor: "#ffffff"
    property string sourceImageUrl: "qrc:/Theme2/Qml/Theme2/Image/"
    property string radioRelease: sourceImageUrl + "ListView/radio_release.png";
    property string radioPress: sourceImageUrl + "ListView/radio_press.png";
    property bool checkRadioStatus: false
    property int radioType: 1;//2
    property real unitWidth: 30
    //FontLoader { id: localFont; source: "../fonts/FzLt.TTF" }
    Rectangle{anchors.fill: parent;color: "#000000"}
    Image {
        id: radio
        anchors.bottom: text_title.bottom
        anchors.bottomMargin: 3
        source: checkRadioStatus ? radioPress : radioRelease
    }
    Text {
        id: text_title
        opacity: textOpacity
        width: textWidth/3
        height: textHeight
        text: qsTr(textTitle)
        anchors.left: radio.right
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
        visible: radioType === 2 ? true : false
        anchors.left: text_title.right
        anchors.leftMargin: -110
        horizontalAlignment: Text.AlignRight
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
        visible: radioType === 2 ? true : false
        horizontalAlignment: Text.AlignRight
        font.family: fontFamily
        font.pointSize: fontSize
        font.bold: true
        color: titleColor
    }
}

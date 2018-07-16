import QtQuick 2.6
import QtQuick.Layouts 1.0

Item {
    property real textWidth: 100;
    property real textHeight: 30;
    property real textOpacity: 1.0;
    property bool fontItalic: false;
    property string fontFamily: localFont.name
    property real fontSize: 18;
    property string currentPageIndex: "1";
    property string totalPageCount: "4";
    property string currentPageColor: "#00deff";
    property string totalPageColor: "#ffffff";
    property bool fontBold: false
    FontLoader { id: localFont; source: "qrc:/Common/Fonts/WenQuanYiMicroHei.ttf" }
    RowLayout {
        spacing: 5
        Text {
            opacity: textOpacity
            width: textWidth
            height: textHeight
            text: qsTr(currentPageIndex)
            horizontalAlignment: Text.AlignHCenter
            font.family: fontFamily
            font.italic: fontItalic
            font.pointSize: fontSize
            font.bold: fontBold
            color: currentPageColor
        }
        Text {
            opacity: textOpacity
            width: textWidth
            height: textHeight
            text: qsTr("/")
            horizontalAlignment: Text.AlignHCenter
            font.family: fontFamily
            font.italic: fontItalic
            font.pointSize: fontSize
            font.bold: fontBold
            color: totalPageColor
        }
        Text {
            opacity: textOpacity
            width: textWidth
            height: textHeight
            text: qsTr(totalPageCount)
            horizontalAlignment: Text.AlignHCenter
            font.family: fontFamily
            font.italic: fontItalic
            font.pointSize: fontSize
            font.bold: fontBold
            color: totalPageColor
        }
    }
}

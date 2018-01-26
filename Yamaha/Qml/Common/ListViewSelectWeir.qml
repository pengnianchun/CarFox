import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1


Item {
    property string sourceImageUrl: "qrc:/Theme2/Qml/Theme2/Image/"
    property string menuTipsBackGroundImage: sourceImageUrl + "SubMenu/menutips.png";
    property real listViewWidth: 420
    property real listViewHeight: 200
    property var listModel;
    property string fontFamily: "Arial" //localFont.fontCurrentFzLt  //
    property var listViewSelectId: listview_select
    //FontLoader { id: localFont; source: "../fonts/FzLt.TTF" }
    ListView {
        id: listview_select
        width: listViewWidth;
        height: listViewHeight
        model: listModel
        verticalLayoutDirection: ListView.TopToBottom
        delegate: Text {
            z: 2
            width: 320
            height: 80
            text: qsTr(name)
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: fontFamily
            font.pointSize: 15
            font.bold: true
            color: "#ffffff"
        }
        highlight: Image {
            z: 1
            anchors.horizontalCenter: parent.horizontalCenter
            source: menuTipsBackGroundImage
        }
    }
}

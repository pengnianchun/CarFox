import QtQuick 2.6
import QtQuick.Layouts 1.0
//import "../Common/"
import "qrc:/Common/Qml/Common"

Item {
    property string sourceImageUrl: "qrc:/Theme2/Qml/Theme2/Image/"
    property string mainRingImage: sourceImageUrl + "DialPanel/mainRing.png";
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png";
    property string centerBackGroundImage: sourceImageUrl + "SubMenu/centerBg.png";
    property string arrowUpImage: sourceImageUrl + "SubMenu/arrowUp.png";
    property string arrowDownImage: sourceImageUrl + "SubMenu/arrowDown.png";
    property var menuInfoIconArray: ["icon1.png","icon2.png","icon3.png","icon4.png","icon5.png","icon6.png","icon7.png","icon8.png","icon9.png"]
    property var menuInfoTitleArray: ["控制","发动机","辅助","TCU","电池管理","电池状态","空调","仪表","设置"]
    property int menuCurrentIndex: 0
    property bool mainRingStatus: true

    width: 600
    height: 600

    Image {
        id: main_ring
        z: mainRingStatus ? 2 : 1
        anchors.centerIn: parent
        source: mainRingImage
    }
    Image {
        id: center_light
        z: 4
        anchors.centerIn: parent
        source: centerLightImage
    }
    Image {
        id: center_background
        z: mainRingStatus ? 1 : 2
        anchors.centerIn: parent
        source: centerBackGroundImage
    }
    Item {
        z: mainRingStatus ? 1 : 3
        width: parent.width
        height: parent.height
        //anchors.centerIn: parent
        Image {
            id: arrow_up
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 140
            source: arrowUpImage
        }
        Image {
            id: arrow_down
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 140
            source: arrowDownImage
        }
        Image {
            id: menu_info
            anchors.centerIn: parent
            source: sourceImageUrl + "SubMenu/" + menuInfoIconArray[menuCurrentIndex]
        }
        TextFieldWeir {
            id: menu_info_title
            width: 200
            height: 20
            textWidth: 200
            textHeight: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 210
            textValue: qsTr(menuInfoTitleArray[menuCurrentIndex]) + "系统信息"
        }
    }
}

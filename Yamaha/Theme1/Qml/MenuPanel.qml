import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "MenuPanel"
    parentMenuId: "HomePanel"
    state: ""
    visible: false

    property string fontFamily: localFont.name
    property int menuCurrentIndex: 0
    property bool bKeyEnable: false
    property string titleBgUrl: "qrc:/Theme/Theme1/Image/MenuPanel/title_bg.png"
    FontLoader { id: localFont; source: "qrc:/Common/Fonts/WenQuanYiMicroHei.ttf" }

    enterMenu: function(){
        if(bKeyEnable){
            UiController.setLayerProperty("MenuPanel", "visible", false);
            UiController.setLayerProperty("MenuPanel", "state", "");
            MenuMainController.showMenuDetail(menuCurrentIndex);
            bKeyEnable = false;
        }
    }
    hideMenu: function(){
        if(bKeyEnable){
            UiController.setLayerProperty("HomePanel", "state", "normal");
            UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            UiController.setLayerProperty("MenuPanel", "visible", false);
            UiController.setLayerProperty("MenuPanel", "state", "");
            UiController.hideRootMenu();
            bKeyEnable = false;
        }
    }
    previousMenu: function() {
        if(bKeyEnable){
            menuCurrentIndex--;
            if(menuCurrentIndex <= 0) {
                menuCurrentIndex = 9;
            }
        }
    }
    nextMenu: function() {
        if(bKeyEnable){
            menuCurrentIndex++;
            if(menuCurrentIndex >= 10) {
                menuCurrentIndex = 1;
            }
        }
    }
    onMenuCurrentIndexChanged: {
        pathViewMenu.menuIndex = menuCurrentIndex
    }
    Item {
        id: pathViewMenu
        x: 420
        y: 150
        opacity: 0.0
        property int menuIndex: 0
        ListModel {
            id: menuModel
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/dcdc.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/instruction.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/lightAdjust.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/motorBattery.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/other.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/timeSet.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/tireMonitor.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/vcu.png" }
            ListElement { name: ""; icon: "qrc:/Theme/Theme1/Image/MenuPanel/vedio.png" }
        }
        Component {
            id: displayDelegate
            Item {
                width:  200
                height: 200
                scale: PathView.iconScale
                Image {
                    id: myIcon
                    y: 20;
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: icon
                    smooth: true
                }
                Text {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: myIcon.bottom;
                    }
                    text: name
                    font.pointSize: 16
                    font.family: fontFamily
                    style: Text.Sunken
                    styleColor: "green"
                    smooth: true
                }
            }
        }
        Component {
            id: displayHighlight
            Rectangle {
                width:  200
                height: 200;
                border.color: "red"
                color: "transparent"//"lightsteelblue"
                radius: 20
                opacity: 0//0.1
            }
        }
        PathView {
            id: pathView
            anchors.fill: parent
            highlight: displayHighlight
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            focus: true
            model: menuModel
            delegate: displayDelegate
            path: Path {
                startX: 10
                startY: 180
                PathAttribute { name: "iconScale"; value: 0.5 }
                PathQuad { x: 300; y: 50; controlX: 50; controlY: 100 }
                PathAttribute { name: "iconScale"; value: 1.0 }
                PathQuad { x: 590; y: 180; controlX: 550; controlY: 100 }
                PathAttribute { name: "iconScale"; value: 0.5 }
            }
            pathItemCount: 7
            currentIndex:  0
        }
        onMenuIndexChanged: {
            pathView.currentIndex = menuIndex-1;
            title.text = getDisplayText(menuIndex);
        }
    }
    Item {
        id: menuBackground
        x: 755
        y: 257
        Image{ x: -155;y: 58 ;source: titleBgUrl }
        Text{
            id: title
            anchors.horizontalCenter: menuBackground.horizontalCenter
            anchors.horizontalCenterOffset: -35
            y: 62
            text: qsTr("")
            font.family: fontFamily
            font.pixelSize: 28
            color: "#d3dbe8"
        }
    }
    function getDisplayText(menuIndex) {
        var displayText = qsTr("");
        switch(menuIndex){
            case 1:
                displayText = qsTr("DCDC系统信息");
                break;
            case 2:
                displayText = qsTr("仪表系统信息");
                break;
            case 3:
                displayText = qsTr("灯光调节信息");
                break;
            case 4:
                displayText = qsTr("电机电池信息");
                break;
            case 5:
                displayText = qsTr("杂项查询信息");
                break;
            case 6:
                displayText = qsTr("时间设置信息");
                break;
            case 7:
                displayText = qsTr("胎压检测信息");
                break;
            case 8:
                displayText = qsTr("整车控制信息");
                break;
            case 9:
                displayText = qsTr("视频转换信息");
                break;
            default:
                displayText = qsTr("");
                break;
        }
        return displayText;
    }
    states:[
        State {
            name: ""
            PropertyChanges { target: pathViewMenu; opacity: 0.0 }
            PropertyChanges { target: menuBackground; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: pathViewMenu; opacity: 1.0 }
            PropertyChanges { target: menuBackground; opacity: 1.0 }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation {
                PauseAnimation {
                    duration: 300
                }
                ParallelAnimation {
                    NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 200;}
                    NumberAnimation {target: menuBackground; property: "opacity"; duration: 200;}
                }
            }
        },
        Transition {
            from: "show"
            to: ""
            ParallelAnimation{
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 100;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 100;}
            }
        }
    ]
    Component.onCompleted: {
        menuCurrentIndex = 1
    }
}

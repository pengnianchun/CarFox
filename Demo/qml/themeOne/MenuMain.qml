import QtQuick 2.0

Item {
    id: menuMain

    Image {
        id: menuBg
        x: 160
        y: -80
        opacity: 0.0
        source: "qrc:/images/theme1/images/themeOne/HomePanel/backRoad.png"
    }

    Item {
        id: pathViewMenu
        x: 420
        y: 150
        opacity: 0.0

        property int menuIndex: CarStatus.menu_L2

        ListModel {
            id: menuModel
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon1.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon2.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon3.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon4.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon5.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon6.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon7.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon8.png" }
            ListElement { name: ""; icon: "qrc:/images/theme1/images/themeOne/SubMenu/icon10.png" }
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
                color: "lightsteelblue"
                radius: 20
                opacity: 0.1
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

    Image {
        id: menuBackground
        x: 452
        y: 317
        opacity: 0.0
        source: "qrc:/images/theme1/images/themeOne/SubMenu/menutips.png"

        Text{
            id: title
            anchors.horizontalCenter: menuBackground.horizontalCenter
            anchors.horizontalCenterOffset: -35
            y: 62
            text: qsTr("")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 28
            color: "#d3dbe8"
            style: Text.Raised;
            styleColor: "black"
        }
    }

    function getDisplayText(menuIndex) {

        var displayText = qsTr("");
        switch(menuIndex){
            case 1:
                displayText = qsTr("控制系统信息");
                break;
            case 2:
                displayText = qsTr("发动机系统信息");
                break;
            case 3:
                displayText = qsTr("辅助系统信息");
                break;
            case 4:
                displayText = qsTr("TCU系统信息");
                break;
            case 5:
                displayText = qsTr("电池管理系统信息");
                break;
            case 6:
                displayText = qsTr("电池状态信息");
                break;
            case 7:
                displayText = qsTr("空调系统信息");
                break;
            case 8:
                displayText = qsTr("仪表系统信息");
                break;
            case 9:
                displayText = qsTr("系统设置信息");
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
            PropertyChanges { target: menuMain; opacity: 0.0 }
            PropertyChanges { target: menuBg; opacity: 0.0 }
            PropertyChanges { target: pathViewMenu; opacity: 0.0 }
            PropertyChanges { target: menuBackground; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: menuMain; opacity: 1.0 }
            PropertyChanges { target: menuBg; opacity: 1.0 }
            PropertyChanges { target: pathViewMenu; opacity: 1.0 }
            PropertyChanges { target: menuBackground; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            ParallelAnimation {
                NumberAnimation {target: menuMain; property: "opacity"; duration: 200;}
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 200;}
                NumberAnimation {target: menuBg; property: "opacity"; duration: 1000;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 1000;}
            }
        },
        Transition {
            from: "show"
            to: ""
            ParallelAnimation{
                NumberAnimation {target: menuMain; property: "opacity"; duration: 200;}
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 200;}
                NumberAnimation {target: menuBg; property: "opacity"; duration: 1000;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 1000;}
            }
        }
    ]

}

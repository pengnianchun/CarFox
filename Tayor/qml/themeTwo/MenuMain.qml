import QtQuick 2.0

Item {
    id: menuMain

    Image {
        id: centerBg
        x: 467
        y: 20
        opacity: 0.0
        source: "qrc:/images/theme2/images/themeTwo/SubMenu/centerBg.png"
    }

    Image {
        id: lightRing
        x:  466
        y:  20
        opacity: 0.0
        source: "qrc:/images/theme2/images/themeTwo/DialPanel/centerLight.png"

        Image {
            id: topArrow
            x: 222
            y: 100
            source: "qrc:/images/theme2/images/themeTwo/SubMenu/arrowDown.png"
        }

        Image {
            id: upArrow
            x: 222
            y: 340
            source: "qrc:/images/theme2/images/themeTwo/SubMenu/arrowUp.png"
        }
    }

    //AnimatedImage {
    //    id: animation;
    //    visible: false
    //    source: "qrc:/images/theme2/images/themeTwo/HomePanel/flow.gif"
    //}

    Item {
        id: pathViewMenu
        x: 716
        y: -18
        opacity: 0.0

        property int menuIndex: CarStatus.menu_L2

        ListModel {
            id: menuModel
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon1.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon2.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon3.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon4.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon5.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon6.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon7.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon8.png" }
            ListElement { name: ""; icon: "qrc:/images/theme2/images/themeTwo/SubMenu/icon9.png" }
        }

        Component {
            id: displayDelegate

            Item {
                width:  160
                height: 160
                scale: 1.0

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
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 28
                    color: "#d3dbe8"
                    style: Text.Raised;
                    styleColor: "black"
                    smooth: true
                }
            }
        }

        PathView {
            id: pathView
            anchors.fill: parent
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            focus: true
            model: menuModel
            delegate: displayDelegate
            path: Path {
                startX: 10
                startY: 180
                PathAttribute { name: "iconScale"; value: 1 }
                PathLine { x: pathView.width; y: 180 }
            }

            pathItemCount: 1
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
        opacity: 0.0

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
            PropertyChanges { target: pathViewMenu; opacity: 0.0 }
            PropertyChanges { target: menuBackground; opacity: 0.0 }
            PropertyChanges { target: centerBg; opacity: 0.0 }
            PropertyChanges { target: lightRing; opacity: 0.0 }
            //PropertyChanges { target: animation; visible: false }
        },
        State {
            name: "show"
            PropertyChanges { target: menuMain; opacity: 1.0 }
            PropertyChanges { target: pathViewMenu; opacity: 1.0 }
            PropertyChanges { target: menuBackground; opacity: 1.0 }
            PropertyChanges { target: centerBg; opacity: 1.0 }
            PropertyChanges { target: lightRing; opacity: 1.0 }
            //PropertyChanges { target: animation; visible: true }
        },
        State {
            name: "subshow"
            PropertyChanges { target: menuMain; opacity: 1.0 }
            PropertyChanges { target: pathViewMenu; opacity: 0.0 }
            PropertyChanges { target: menuBackground; opacity: 0.0 }
            PropertyChanges { target: centerBg; opacity: 1.0 }
            PropertyChanges { target: lightRing; opacity: 0.0 }
            //PropertyChanges { target: animation; visible: true }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            ParallelAnimation {
                NumberAnimation {target: menuMain; property: "opacity"; duration: 100;}
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 100;}
                NumberAnimation {target: centerBg; property: "opacity"; duration: 100;}
                NumberAnimation {target: lightRing; property: "opacity"; duration: 100;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 500;}
            }
        },
        Transition {
            from: "show"
            to: ""
            ParallelAnimation{
                NumberAnimation {target: menuMain; property: "opacity"; duration: 100;}
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 100;}
                NumberAnimation {target: centerBg; property: "opacity"; duration: 100;}
                NumberAnimation {target: lightRing; property: "opacity"; duration: 100;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 500;}
            }
        },
        Transition {
            from: "show"
            to: "subshow"
            ParallelAnimation{
                NumberAnimation {target: menuMain; property: "opacity"; duration: 100;}
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 100;}
                NumberAnimation {target: centerBg; property: "opacity"; duration: 100;}
                NumberAnimation {target: lightRing; property: "opacity"; duration: 100;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 500;}
            }
        },
        Transition {
            from: "subshow"
            to: "show"
            ParallelAnimation{
                NumberAnimation {target: menuMain; property: "opacity"; duration: 100;}
                NumberAnimation {target: pathViewMenu; property: "opacity"; duration: 100;}
                NumberAnimation {target: centerBg; property: "opacity"; duration: 100;}
                NumberAnimation {target: lightRing; property: "opacity"; duration: 100;}
                NumberAnimation {target: menuBackground; property: "opacity"; duration: 500;}
            }
        }
    ]

}


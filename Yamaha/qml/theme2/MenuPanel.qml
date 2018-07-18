import QtQuick 2.0
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    id: menu_item

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Menu/"

    menuLayerId: "MenuMainDetail"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        //default
        homepanel_visible = false

    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        //MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
        homepanel_visible = true
    }
    previousMenu: function() {
        // default
        listLeft.currentIndex++
    }
    nextMenu: function() {
        // default
        listLeft.currentIndex--
    }

    ListModel {
        id: modelMenu
        ListElement { src: "home.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "navigation.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "phone.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "music.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "radio.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "setting.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "adas.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "more.png"; qml:"qrc:/Theme/theme2/Navigation.qml"; }
    }

    Component {
        id: nameDelegate

        Image {
            asynchronous: true
            cache: true
            source: sourceImageUrl + model.src
        }



    }

    Item {
        width: 200
        height: 200

        Loader {
            id: mloder
            source: ""
            onSourceChanged: {
                console.debug("source"+source)
            }
        }
    }

    Item {
        width: 800
        height: 400

        Rectangle {
            color: "red"
        }
    }

    Rectangle {
        width: 550
        height: 45
        anchors.centerIn: parent
        color: "lightblue"
        radius: 10
    }

    ListView {
        id: listLeft
        width: 500
        height: 35
        anchors.centerIn: parent
        clip: true
        model: modelMenu
        delegate: nameDelegate
        spacing: 35
        orientation: ListView.Horizontal
        highlight: Rectangle { color: "lightsteelblue"; radius: 3; }
        onHighlightChanged: {
            console.debug("onHighlightChanged"+modelMenu.qml)
            mloder.setSource(modelMenu.qml)
        }
    }



//    Component {
//        id: widgetdelegate
//        Item {
//            width: grid.cellWidth; height: grid.cellHeight
//            Loader { source: element
//                id: im
//                state: "inactive"

//                anchors.centerIn: parent
//                width: grid.cellWidth; height: grid.cellHeight
//                smooth: true
//                //fillMode: Image.PreserveAspectFit
//                SequentialAnimation on rotation {
//                    NumberAnimation { to:  2; duration: 50 }
//                    NumberAnimation { to: -2; duration: 100 }
//                    NumberAnimation { to:   0; duration: 50 }
//                    running: im.state == "squiggle"
//                    loops: Animation.Infinite
//                }
//                Rectangle {
//                    id: imRect
//                    anchors.fill: parent; radius: 5
//                    anchors.centerIn: parent
//                    border.color: "#ffffff"; color: "transparent"; border.width: 6;
//                    opacity: 0
//                }
//                states: [
//                    State {
//                        name: "squiggle";
//                        when: (grid.firstIndexDrag != -1) && (grid.firstIndexDrag != index)
//                    },
//                    State {
//                        name: "inactive";
//                        when: (grid.firstIndexDrag == -1) || (grid.firstIndexDrag == index)
//                        PropertyChanges { target: im; rotation: 0}
//                    }
//                ]
//            }

//            Rectangle {
//                id: backgroundcircle
//                width: 20; height: 20; radius: 20
//                smooth: true
//                anchors.centerIn: parent
//                color: "#222222";
//                opacity: 0

//            }
//            states: [
//                State {
//                    name: "inDrag"
//                    when: index == grid.firstIndexDrag
//                    PropertyChanges { target: backgroundcircle; opacity: 1 }
//                    PropertyChanges { target: imRect; opacity: 1 }
//                    PropertyChanges { target: im; parent: container }
//                    PropertyChanges { target: im; width: (grid.cellWidth - 10) / 1 }
//                    PropertyChanges { target: im; height: (grid.cellHeight - 10) / 1 }
//                    PropertyChanges { target: im; anchors.centerIn: undefined }
//                    PropertyChanges { target: im; x: coords.mouseX - im.width / 2 }
//                    PropertyChanges { target: im; y: coords.mouseY - im.height / 2 }
//                }
//            ]
//            transitions: [
//                Transition { NumberAnimation { properties: "width, height, opacity"; duration: 300; easing.type: Easing.InOutQuad } }
//            ]
//        }
//    }





//    GridView {
//        property int firstIndexDrag: -1

//        id: grid
//        x: 0; y: 0
//        interactive: false


//        anchors.fill: parent
//        cellWidth: 186; cellHeight: 96;

//        model: modelMenu { id: widgetmodel }
//        delegate: widgetdelegate
//        Item {
//            id: container
//            anchors.fill: parent


//        }
//        MouseArea {
//            id: coords
//            anchors.fill: parent
//            onReleased: {
//                if (grid.firstIndexDrag != -1)
//                    widgetmodel.move(grid.firstIndexDrag,grid.indexAt(mouseX, mouseY),1)
//                grid.firstIndexDrag = -1
//            }
//            onPressAndHold: {
//                grid.firstIndexDrag=grid.indexAt(mouseX, mouseY)
//            }
//        }
//    }





}

import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    ListModel {
        id: appModel
        ListElement { name: "Music"; icon: "qrc:/theme2/symbol/Theme2/Modules/setting/setting.png" }
        ListElement { name: "Movies"; icon: "qrc:/theme2/symbol/Theme2/Modules/setting/setting.png" }
        ListElement { name: "Camera"; icon: "qrc:/theme2/symbol/Theme2/Modules/setting/setting.png" }
    }

    Component {
        id: appDelegate
        Item {
            width: 100; height: 100
            scale: PathView.iconScale

            Image {
                id: myIcon
                y: 20; anchors.horizontalCenter: parent.horizontalCenter
                source: icon
                smooth: true
            }
            Text {
                anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                text: name
                smooth: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: view.currentIndex = index
            }
        }
    }

    Component {
        id: appHighlight
        Rectangle { width: 80; height: 80; color: "lightsteelblue" }
    }

    PathView {
        Keys.onRightPressed: if (!moving) { incrementCurrentIndex(); console.log(moving) }
        Keys.onLeftPressed: if (!moving) decrementCurrentIndex()
        id: view
        anchors.centerIn: parent
        highlight: appHighlight
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        focus: true
        model: appModel
        delegate: appDelegate
        path: Path {
            startX: 10
            startY: 50
            PathAttribute { name: "iconScale"; value: 0.5 }
            PathQuad { x: 200; y: 150; controlX: 50; controlY: 200 }
            PathAttribute { name: "iconScale"; value: 1.0 }
            PathQuad { x: 390; y: 50; controlX: 350; controlY: 200 }
            PathAttribute { name: "iconScale"; value: 0.5 }
        }
    }

}

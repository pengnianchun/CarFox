import QtQuick 2.0
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    ListModel {
        id: appModel
        ListElement { name: ""; icon: "qrc:/theme2/symbol/Theme2/Modules/setting/setting_lang.png"; }
        ListElement { name: ""; icon: "qrc:/theme2/symbol/Theme2/Modules/setting/setting_light.png"; }
        ListElement { name: ""; icon: "qrc:/theme2/symbol/Theme2/Modules/setting/setting_vol.png"; }
    }

    Component {
        id: appDelegate
        Item {
            width: 300
            height: 200
            scale: PathView.iconScale

            Image {
                id: myIcon
                y: 125
                anchors.horizontalCenter: parent.horizontalCenter
                source: icon
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
        Rectangle {

        }
    }
        Image {
            anchors.top: parent.top
            anchors.topMargin: 175
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Modules/setting/setting_select.png"
        }


    PathView {
        id: view
        x: 200
        y: 0
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

        Keys.onRightPressed: if (!moving) { incrementCurrentIndex(); console.log(moving) }
        Keys.onLeftPressed: if (!moving) decrementCurrentIndex()
    }

    onVisibleChanged: {
        if(visible){
            //
        } else {
            //
        }
    }
}

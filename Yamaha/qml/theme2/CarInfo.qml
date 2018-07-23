import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/infoSearch/"

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo enterMenu")
        }
    }

    hideMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo hideMenu")
        }
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo previousMenu")
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo nextMenu")
        }
    }

    ListModel {
        id: modelMenu
        ListElement { src: "01.png"; }
        ListElement { src: "02.png"; }
        ListElement { src: "03.png"; }
        ListElement { src: "04.png"; }
        ListElement { src: "05.png"; }
        ListElement { src: "06.png"; }
        ListElement { src: "07.png"; }
        ListElement { src: "08.png"; }
        ListElement { src: "09.png"; }
        ListElement { src: "10.png"; }
        ListElement { src: "11.png"; }
    }

    Component {
        id: nameDelegate

        Image {
            asynchronous: true
            cache: true
            source: sourceImageUrl + model.src
        }
    }

    ListView {
        id: listMenu
        width: 600
        height: 35
        anchors.centerIn: parent
        clip: true
        model: modelMenu
        delegate: nameDelegate
        spacing: 35
        orientation: ListView.Horizontal
        highlight: Rectangle { color: "lightsteelblue"; radius: 3; }
    }

}

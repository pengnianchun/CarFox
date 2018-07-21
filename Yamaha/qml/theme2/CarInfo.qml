import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/other"

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
            sourceSize.width: 40
            sourceSize.height: 36
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

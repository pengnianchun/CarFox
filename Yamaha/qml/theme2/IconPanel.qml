import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 1440
    height: 60

    //    RowLayout {
    //        anchors.verticalCenter: parent.verticalCenter
    //        NQImage { src: "qrc:/theme2/symbol/Theme2/Symbol/driverSystemFault.png" }

    //    }

    ListModel {
        id: nameModel
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/driverSystemFault.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
    }

    Component {
        id: nameDelegate
        Row {
        Image {
            source: model.src
        }
        }
    }

    ListView {
        anchors.fill: parent
        anchors.topMargin: 10
//        anchors.verticalCenter: parent.verticalCenter
        clip: true
        model: nameModel
        delegate: nameDelegate
        spacing: 10
        orientation: ListView.Horizontal
//        header: bannercomponent
//        footer: Rectangle {
//            width: parent.width; height: 30;
//            gradient: clubcolors
//        }
//        highlight: Rectangle {
//            width: parent.width
//            color: "lightgray"
//        }
    }




}

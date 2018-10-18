import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Image {
    property string src: ""


    id: image
    source: src
    asynchronous: true
    cache: true
    sourceSize: Qt.size(parent.width, parent.height)
    visible: visible


    //    ColorOverlay {
    //        anchors.fill: image
    //        source: src
    //        color: "grey"
    //    }

    //    DropShadow {
    //        anchors.fill: image
    //        horizontalOffset: 3
    //        verticalOffset: 3
    //        radius: 8.0
    //        samples: 17
    //        color: "#666666"
    //        source: image
    //    }
}

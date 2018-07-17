import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property string src: ""

    Image {
        id: image
        source: src
        asynchronous: true
        cache: true
        sourceSize: Qt.size(parent.width, parent.height)
        visible: visible
    }

    DropShadow {
        anchors.fill: image
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "#666666"
        source: image
    }
}

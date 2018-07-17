import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    property bool homepanel_visible: true

    layer.enabled: true

    Rectangle {
        id: blackbg
        anchors.fill: parent
        color: "black"
    }

    Rectangle {
        anchors.centerIn: parent
        width: 500
        height: 300
        visible: homepanel_visible
        color: "#111111"
        radius: 10
    }

    Image {
        id: line_up
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 61
        source: "qrc:/theme2/symbol/Theme2/Symbol/line_up.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_left
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_left.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_right
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_right.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_down
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_down.png"
        asynchronous: true
        cache: true
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 550
        visible: homepanel_visible

        Image {
            id: speed_left
            source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
            asynchronous: true
            cache: true
        }
        Image {
            id: speed_right
            source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
            asynchronous: true
            cache: true
        }
    }
}

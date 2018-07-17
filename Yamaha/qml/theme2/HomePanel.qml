import QtQuick 2.0
import QtQuick.Layouts 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/theme2/JS/HomePanelCtrl.js" as HomeCtrl

Item {
    width: 1440
    height: 540

    visible: false
    layer.enabled: true

    property int carSpeedValue: CarMsg.carSpeed;
    property int engineSpeedValue: CarMsg.rpm;

    FontLoader {
        id: msyh
        source: "qrc:/Fonts/font/msyh.ttc"
    }

    NQBackground {
        id: background
        anchors.fill: parent
    }

    IconPanel {
        id: iconPanel
        width: parent.width
        height: 60
    }

    Item {
        id: carSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: 150
        width: 200
        height: 110

        Text {
            anchors.centerIn: parent
            text: carSpeedValue
            font.family: msyh.name
            color: "white"
            font.pixelSize: 135
        }
    }

    Item {
        id: engineSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.right: parent.right
        anchors.rightMargin: 150
        width: 200
        height: 110

        Text {
            anchors.centerIn: parent
            text: engineSpeedValue
            font.family: msyh.name
            color: "white"
            font.pixelSize: 135
        }
    }

    onVisibleChanged: {

    }

    Component.onCompleted: {
        carSpeedValue = 111
        engineSpeedValue = 222
    }


}

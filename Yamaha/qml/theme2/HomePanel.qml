import QtQuick 2.0
import QtQuick.Layouts 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/theme2/JS/HomePanelCtrl.js" as HomeCtrl

Item {
    width: 1440
    height: 540

    visible: false
    layer.enabled: true

    property real speedValue: CarMsg.carSpeed;
    property int engineSpeedValue: CarMsg.rpm;

    NQBackground {
        id: background
        anchors.fill: parent
    }

    IconPanel {
        id: iconPanel
        width: parent.width
        height: 60
    }

    function setSpeedValue(){
        HomeCtrl.setSpeedValueAction(speed_hundred, speed_ten, speed_bits, speedValue);
    }
    function setEngineSpeedValue(){
        HomeCtrl.setEngineValueAction(engine_thousand, engine_hundred, engine_ten, engine_bits, engineSpeedValue);
    }

    Item {
        id: carSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: 150
        width: 200
        height: 110

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image { id: speed_hundred }
            Image { id: speed_ten }
            Image { id: speed_bits }
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

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image { id: engine_thousand }
            Image { id: engine_hundred }
            Image { id: engine_ten }
            Image { id: engine_bits }
        }
    }

    onVisibleChanged: {

    }

    Component.onCompleted: {
        setSpeedValue();
        setEngineSpeedValue()
        HomeCtrl.setSpeedValueAction(speed_hundred, speed_ten, speed_bits, 11);
        HomeCtrl.setEngineValueAction(engine_thousand, engine_hundred, engine_ten, engine_bits, 222);
    }
}

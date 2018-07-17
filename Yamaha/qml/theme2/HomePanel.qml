import QtQuick 2.0
import QtQuick.Layouts 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/theme2/JS/HomePanelCtrl.js" as HomeCtrl

CommonItem {
    width: 1440
    height: 540

    visible: false
    layer.enabled: true

    property real speedValue: CarMsg.carSpeed;

    NQBackground {
        anchors.fill: parent
    }

    IconPanel {
        width: parent.width
        height: 60
    }

    function setSpeedValue(){
        HomeCtrl.setSpeedValueAction(speed_hundred,speed_ten,speed_bits,speedValue);
    }

    ColumnLayout {
        id: speed_gear_panel
        opacity: 0
        z: 2
        spacing: 30
        anchors.top: parent.top
        anchors.topMargin: 230
        anchors.horizontalCenter: parent.horizontalCenter
        RowLayout {
            spacing: -40
            Image { id: speed_hundred }
            Image { id: speed_ten }
            Image { id: speed_bits }
        }
        Image { id: gear; anchors.horizontalCenter: parent.horizontalCenter }
    }

    onVisibleChanged: {

    }

    Component.onCompleted: {
        setSpeedValue();
    }
}

import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    width: 1440
    height: 60

    ListModel {
        id: modelLeft
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/driverSystemFault.png"; enable: true}
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/HatchDoor1Alarm.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/chargingCable.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryCharging.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/motorHeat.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/lamp_AC.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/highPressureOverhaul.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_airFilter.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/HatchDoor2Alarm.png"; }
    }

    ListModel {
        id: modelMiddle
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/TurnLeftWL.png"; enable: true}
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/leftBrakeAlarm.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/BrakeLight.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Defroster.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/mainPowerIndication.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_waterLow.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/ready.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_headlight.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/backFlogLamp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_parkingBrake.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_airPress.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_ABS.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/TurnRightWL.png"; }
    }

    ListModel {
        id: modelRight
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_littleLight.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/Lamp_insulationRed.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/motor_notworking.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryCut.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryFault.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/lampBatHigtTemp.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/batteryFireAlarm.png"; }
        ListElement { src: "qrc:/theme2/symbol/Theme2/Symbol/engineFailue.png"; }
    }

    Component {
        id: nameDelegate

        Image {
            source: model.src
        }
    }

    ListView {
        id: listLeft
        width: 320
        height: 40
        anchors.right: listMiddle.left
        anchors.verticalCenter: listMiddle.verticalCenter
        clip: true
        model: modelLeft
        delegate: nameDelegate
        spacing: 5
        orientation: ListView.Horizontal
    }

    ListView {
        id: listMiddle
        y: 20
        width: 570
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true
        model: modelMiddle
        delegate: nameDelegate
        spacing: 5
        orientation: ListView.Horizontal
    }

    ListView {
        id: listRight
        width: 500
        height: 40
        anchors.left: listMiddle.right
        anchors.verticalCenter: listMiddle.verticalCenter
        clip: true
        model: modelRight
        delegate: nameDelegate
        spacing: 10
        orientation: ListView.Horizontal
    }
}

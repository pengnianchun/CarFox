import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    width: 1440
    height: 60

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Symbol/"
    property string sourceImageGreyUrl: "qrc:/theme2/symbol/Theme2/Symbol_gray/"

    ListModel {
        id: modelLeft
        ListElement { src: "driverSystemFault.png"; enable: true }
        ListElement { src: "HatchDoor1Alarm.png"; enable: true }
        ListElement { src: "chargingCable.png"; enable: false }
        ListElement { src: "batteryCharging.png"; enable: false }
        ListElement { src: "motorHeat.png"; enable: false }
        ListElement { src: "lamp_AC.png"; enable: false }
        ListElement { src: "highPressureOverhaul.png"; enable: false }
        ListElement { src: "Lamp_airFilter.png"; enable: false }
        ListElement { src: "HatchDoor2Alarm.png"; enable: false }
    }

    ListModel {
        id: modelMiddle
        ListElement { src: "TurnLeftWL.png"; enable: true}
        ListElement { src: "leftBrakeAlarm.png"; enable: false }
        ListElement { src: "BrakeLight.png"; enable: false }
        ListElement { src: "Defroster.png"; enable: false }
        ListElement { src: "mainPowerIndication.png"; enable: false }
        ListElement { src: "Lamp_waterLow.png"; enable: false }
        ListElement { src: "ready.png"; enable: false }
        ListElement { src: "Lamp_headlight.png"; enable: false }
        ListElement { src: "backFlogLamp.png"; enable: false }
        ListElement { src: "Lamp_parkingBrake.png"; enable: false }
        ListElement { src: "Lamp_airPress.png"; enable: false }
        ListElement { src: "Lamp_ABS.png"; enable: false }
        ListElement { src: "TurnRightWL.png"; enable: false }
    }

    ListModel {
        id: modelRight
        ListElement { src: "Lamp_littleLight.png"; enable: false }
        ListElement { src: "Lamp_insulationRed.png"; enable: false }
        ListElement { src: "motor_notworking.png"; enable: false }
        ListElement { src: "batteryCut.png"; enable: false }
        ListElement { src: "batteryFault.png"; enable: false }
        ListElement { src: "lampBatHigtTemp.png"; enable: false }
        ListElement { src: "batteryFireAlarm.png"; enable: false }
        ListElement { src: "engineFailue.png"; enable: false }
    }

    Component {
        id: nameDelegate

        Image {
            source: model.enable ? sourceImageUrl + model.src : sourceImageGreyUrl + model.src
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

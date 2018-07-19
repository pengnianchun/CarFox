import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    width: 1440
    height: 60

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Symbol/"
    property string sourceImageGreyUrl: "qrc:/theme2/symbol/Theme2/Symbol_gray/"

    property bool enableTest: true

    ListModel {
        id: modelLeft
//        ListElement { src: "driverSystemFault.png"; enable: true }
//        ListElement { src: "HatchDoor1Alarm.png"; enable: true }
//        ListElement { src: "chargingCable.png"; enable: true }
//        ListElement { src: "batteryCharging.png"; enable: true }
//        ListElement { src: "motorHeat.png"; enable: true }
//        ListElement { src: "lamp_AC.png"; enable: true }
//        ListElement { src: "highPressureOverhaul.png"; enable: true }
//        ListElement { src: "Lamp_airFilter.png"; enable: true }
//        ListElement { src: "HatchDoor2Alarm.png"; enable: true }
        Component.onCompleted: {
            append({"src": "driverSystemFault.png", enable: enableTest});
            append({"src": "HatchDoor1Alarm.png", enable: enableTest});
            append({"src": "chargingCable.png", enable: enableTest});
            append({"src": "batteryCharging.png", enable: enableTest});
            append({"src": "motorHeat.png", enable: enableTest});
            append({"src": "lamp_AC.png", enable: enableTest});
            append({"src": "highPressureOverhaul.png", enable: enableTest});
            append({"src": "Lamp_airFilter.png", enable: enableTest});
            append({"src": "HatchDoor2Alarm.png", enable: enableTest});
        }
    }

    ListModel {
        id: modelMiddle
        ListElement { src: "TurnLeftWL.png"; enable: true}
        ListElement { src: "leftBrakeAlarm.png"; enable: true }
        ListElement { src: "BrakeLight.png"; enable: true }
        ListElement { src: "Defroster.png"; enable: true }
        ListElement { src: "mainPowerIndication.png"; enable: true }
        ListElement { src: "Lamp_waterLow.png"; enable: true }
        ListElement { src: "ready.png"; enable: true }
        ListElement { src: "Lamp_headlight.png"; enable: true }
        ListElement { src: "backFlogLamp.png"; enable: true }
        ListElement { src: "Lamp_parkingBrake.png"; enable: true }
        ListElement { src: "Lamp_airPress.png"; enable: true }
        ListElement { src: "Lamp_ABS.png"; enable: true }
        ListElement { src: "TurnRightWL.png"; enable: true }
    }

    ListModel {
        id: modelRight
        ListElement { src: "Lamp_littleLight.png"; enable: true }
        ListElement { src: "Lamp_insulationRed.png"; enable: true }
        ListElement { src: "motor_notworking.png"; enable: true }
        ListElement { src: "batteryCut.png"; enable: true }
        ListElement { src: "batteryFault.png"; enable: true }
        ListElement { src: "lampBatHigtTemp.png"; enable: true }
        ListElement { src: "batteryFireAlarm.png"; enable: true }
        ListElement { src: "engineFailue.png"; enable: true }
    }

    Component {
        id: nameDelegate

        Image {
            asynchronous: true
            cache: true
            source: model.enable ? sourceImageUrl + model.src : sourceImageGreyUrl + model.src
            transform: Rotation { origin.x: 30; origin.y: 30; axis { x: 0; y: 0; z: 1 } angle: 0 }
        }
    }

    ListView {
        id: listLeft
        width: 360
        height: 40
        anchors.right: listMiddle.left
        anchors.verticalCenter: listMiddle.verticalCenter
        clip: true
        model: modelLeft
        delegate: nameDelegate
        spacing: 2
        orientation: ListView.Horizontal
    }

    ListView {
        id: listMiddle
        y: 20
        width: 565
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true
        model: modelMiddle
        delegate: nameDelegate
        spacing: 2
        orientation: ListView.Horizontal
    }

    ListView {
        id: listRight
        width: 320
        height: 40
        anchors.left: listMiddle.right
        anchors.verticalCenter: listMiddle.verticalCenter
        clip: true
        model: modelRight
        delegate: nameDelegate
        spacing: 2
        orientation: ListView.Horizontal
    }
}

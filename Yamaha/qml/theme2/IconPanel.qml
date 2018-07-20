import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    width: 1440
    height: 60

    property bool enableTest: false
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Symbol/"
    property string sourceImageGreyUrl: "qrc:/theme2/symbol/Theme2/Symbol_gray/"

    ListModel {
        id: modelLeft
        Component.onCompleted: {
            append({"src": "driverSystemFault.png", "enable": enableTest});
            append({"src": "HatchDoor1Alarm.png", "enable": enableTest});
            append({"src": "chargingCable.png", "enable": enableTest});
            append({"src": "batteryCharging.png", "enable": enableTest});
            append({"src": "motorHeat.png", "enable": enableTest});
            append({"src": "lamp_AC.png", "enable": enableTest});
            append({"src": "highPressureOverhaul.png", "enable": enableTest});
            append({"src": "Lamp_airFilter.png", "enable": enableTest});
            append({"src": "HatchDoor2Alarm.png", "enable": enableTest});
        }
    }

    ListModel {
        id: modelMiddle
        Component.onCompleted: {
            append({"src": "TurnLeftWL.png", "enable": enableTest});
            append({"src": "leftBrakeAlarm.png", "enable": enableTest});
            append({"src": "BrakeLight.png", "enable": enableTest});
            append({"src": "Defroster.png", "enable": enableTest});
            append({"src": "mainPowerIndication.png", "enable": enableTest});
            append({"src": "Lamp_waterLow.png", "enable": enableTest});
            append({"src": "ready.png", "enable": enableTest});
            append({"src": "Lamp_headlight.png", "enable": enableTest});
            append({"src": "backFlogLamp.png", "enable": enableTest});
            append({"src": "Lamp_parkingBrake.png", "enable": enableTest});
            append({"src": "Lamp_airPress.png", "enable": enableTest});
            append({"src": "Lamp_ABS.png", "enable": enableTest});
            append({"src": "TurnRightWL.png", "enable": enableTest});
        }
    }

    ListModel {
        id: modelRight
        Component.onCompleted: {
            append({"src": "Lamp_littleLight.png", "enable": enableTest});
            append({"src": "Lamp_insulationRed.png", "enable": enableTest});
            append({"src": "motor_notworking.png", "enable": enableTest});
            append({"src": "batteryCut.png", "enable": enableTest});
            append({"src": "batteryFault.png", "enable": enableTest});
            append({"src": "lampBatHigtTemp.png", "enable": enableTest});
            append({"src": "batteryFireAlarm.png", "enable": enableTest});
            append({"src": "engineFailue.png", "enable": enableTest});
        }
    }

    Component {
        id: nameDelegate

        Image {
            verticalAlignment: Image.AlignVCenter
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
        width: 330
        height: 40
        anchors.left: listMiddle.right
        anchors.verticalCenter: listMiddle.verticalCenter
        clip: true
        model: modelRight
        delegate: nameDelegate
        spacing: 4
        orientation: ListView.Horizontal
    }
}

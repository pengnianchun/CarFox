import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    width: 1440
    height: 60

    property bool enableTest: false
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Symbol/"
    property string sourceImageUrlGrey: "qrc:/theme2/symbol/Theme2/Symbol_gray/"

    Image { //系统故障
        x: 95
        y: 20
        source: sourceImageUrl + "driverSystemFault.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampSystemFault
    }

    Image { //左侧舱门开报警
        x: 135
        y: 20
        source: sourceImageUrl + "HatchDoor1Alarm.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.leftDoorsOpenAlarm
    }

    Image { //充电线连线
        x: 175
        y: 20
        source: sourceImageUrl + "chargingCable.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.cableConnect
    }

    Image { //动力蓄电池充电状态
        x: 215
        y: 20
        source: sourceImageUrl + "batteryCharging.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.powerAccumulatorsChargeStatus
    }

    Image { //控制器及驱动电机过热
        x: 255
        y: 20
        source: sourceImageUrl + "motorHeat.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.controlMotorOverheating
    }

    Image { //AC空调指示
        x: 295
        y: 20
        source: sourceImageUrl + "lamp_AC.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampAc
    }

    Image { //高压检修
        x: 335
        y: 20
        source: sourceImageUrl + "highPressureOverhaul.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampHighVoltageMaintenance
    }

    Image { //空滤指示
        x: 375
        y: 20
        source: sourceImageUrl + "Lamp_airFilter.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampAirFilter
    }

    Image { //右侧舱门开报警
        x: 410
        y: 20
        source: sourceImageUrl + "HatchDoor2Alarm.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.rightDoorsOpenAlarm
    }

    Image { //左转向
        id: turnLeftWL
        x: 445
        y: 20
        source: sourceImageUrl + "TurnLeftWL.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampTurnLeft
    }

    Image { //左前摩擦片(刹车蹄片)报警
        x: 490
        y: 20
        source: sourceImageUrl + "leftBrakeAlarm.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampLeftShoeWear
    }

    Image { //刹车制动
        x: 530
        y: 20
        source: sourceImageUrl + "BrakeLight.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampBrake
    }

    Image { //除霜器
        x: 570
        y: 20
        source: sourceImageUrl + "Defroster.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampDefroster
    }

    Image { //
        x: 610
        y: 20
        source: sourceImageUrl + "mainPowerIndication.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest
    }

    Image { //水位低指示
        x: 650
        y: 20
        source: sourceImageUrl + "Lamp_waterLow.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampWaterLevelLow
    }

    Image { //运行准备就绪
        x: 690
        y: 20
        source: sourceImageUrl + "ready.png"
        sourceSize.width: 83
        sourceSize.height: 36
        visible: enableTest || CarMsg.ready
    }

    Image { //近光灯
        x: 775
        y: 20
        source: sourceImageUrl + "Lamp_headlight.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampHeadLight
    }

    Image { //后雾灯
        x: 815
        y: 20
        source: sourceImageUrl + "backFlogLamp.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampRearFog
    }

    Image { //驻车制动
        x: 855
        y: 20
        source: sourceImageUrl + "Lamp_parkingBrake.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampParkingBrake
    }

    Image { //左气压低报警?右气压低报警
        x: 895
        y: 20
        source: sourceImageUrl + "Lamp_airPress.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampLeftLowAirPressure || CarMsg.lampRightLowAirPressure
    }

    Image { //ABS指示
        x: 935
        y: 20
        source: sourceImageUrl + "Lamp_ABS.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampAbs
    }

    Image { //右转向
        id: turnRightWL
        x: 975
        y: 20
        source: sourceImageUrl + "TurnRightWL.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampTurnRight
    }

    Image { //位置灯
        x: 1020
        y: 20
        source: sourceImageUrl + "Lamp_littleLight.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampPositionLight
    }

    Image { //轻微绝缘故障报警/严重绝缘故障报警
        x: 1060
        y: 20
        source: CarMsg.severityInsulationFault ? sourceImageUrl + "Lamp_insulationRed.png"
                                               : sourceImageUrl + "Lamp_insulationRed_white.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.severityInsulationFault || CarMsg.slightInsulationFault
    }

    Image { //24V发电机未工作
        x: 1100
        y: 20
        source: sourceImageUrl + "motor_notworking.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampMotorOutOfService
    }

    Image { //动力电池切断
        x: 1140
        y: 20
        source: sourceImageUrl + "batteryCut.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.powerBatteryCutOff
    }

    Image { //动力蓄电池故障
        x: 1180
        y: 20
        source: sourceImageUrl + "batteryFault.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.powerAccumulatorsFault
    }

    Image { //动力蓄电池高温
        x: 1220
        y: 20
        source: sourceImageUrl + "lampBatHigtTemp.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest || CarMsg.lampBatHigtTemp
    }

    Image { //
        x: 1260
        y: 20
        source: sourceImageUrl + "batteryFireAlarm.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: enableTest
    }

    Image { //发动机故障
        id: engineFailure
        x: 1300
        y: 20
        source: sourceImageUrl + "engineFailue.png"
        sourceSize.width: 38
        sourceSize.height: 36
        visible: (enableTest || CarMsg.lampEngineFault) && CarMsg.carSpeed < 5
    }

    Timer {
        interval: 750 // 80/min
        repeat: true
        triggeredOnStart: true
        running: CarMsg.lampTurnLeft || CarMsg.lampTurnRight
        onTriggered: {
            if (CarMsg.lampTurnLeft) {
                turnLeftWL.visible = !turnLeftWL.visible
            }
            if (CarMsg.lampTurnRight) {
                turnRightWL.visible = !turnRightWL.visible
            }
        }
    }

    Timer {
        interval: 400 // 140/min
        repeat: true
        triggeredOnStart: true
        running: CarMsg.lampDoubleFlash
        onTriggered: {
                turnLeftWL.visible = !turnLeftWL.visible
                turnRightWL.visible = !turnRightWL.visible
        }
    }

    Timer {
        interval: 180000 // 3min
        repeat: false
        running: CarMsg.lampAfterTreat
        onTriggered: {
            engineFailure.visible = false
        }
    }

    Timer {
        id: demo
        interval: 800
        repeat: true
        running: parent.visible
        onTriggered: {
            enableTest = !enableTest
        }
    }
}

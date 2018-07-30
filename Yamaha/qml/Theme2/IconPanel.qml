import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    width: 1440
    height: 60

    property bool enableTest: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Symbol/"
    property string sourceImageGreyUrl: "qrc:/theme2/symbol/Theme2/Symbol_gray/"

    Image {
        x: 80
        y: 20
        source: sourceImageUrl + "driverSystemFault.png"
        visible: enableTest || CarMsg.driverSystemFault
    }

    Image {
        x: 120
        y: 20
        source: sourceImageUrl + "HatchDoor1Alarm.png"
        visible: enableTest || CarMsg.leftDoorsOpenAlarm
    }

    Image {
        x: 160
        y: 20
        source: sourceImageUrl + "chargingCable.png"
        visible: enableTest || CarMsg.leftDoorsOpenAlarm
    }

    Image {
        x: 200
        y: 20
    }

    Image {
        x: 240
        y: 20
    }

    Image {
        x: 280
        y: 20
    }

    Image {
        x: 320
        y: 20
    }

    Image {
        x: 360
        y: 20
    }

    Image {
        x: 400
        y: 20
        source: sourceImageUrl + "HatchDoor2Alarm.png"
        visible: enableTest || CarMsg.rightDoorsOpenAlarm
    }

    Image {
        id: turnLeftWL
        x: 440
        y: 20
        source: sourceImageUrl + "TurnLeftWL.png"
        visible: enableTest || CarMsg.lampTurnLeft
    }

    Image {
        x: 480
        y: 20
        source: sourceImageUrl + "leftBrakeAlarm.png"
        visible: enableTest || CarMsg.lampLeftShoeWear
    }

    Image {
        x: 520
        y: 20
        source: sourceImageUrl + "BrakeLight.png"
        visible: enableTest || CarMsg.lampBrake
    }

    Image {
        x: 560
        y: 20
    }

    Image {
        x: 600
        y: 20
    }

    Image {
        x: 640
        y: 20
    }

    Image {
        x: 680
        y: 20
        source: sourceImageUrl + "ready.png"
        visible: enableTest
    }

    Image {
        x: 760
        y: 20
        source: sourceImageUrl + "Lamp_headlight.png"
        visible: enableTest || CarMsg.lampHeadLight
    }

    Image {
        x: 800
        y: 20
        source: sourceImageUrl + "backFlogLamp.png"
        visible: enableTest || CarMsg.lampRearFog
    }

    Image {
        x: 840
        y: 20
        source: sourceImageUrl + "Lamp_parkingBrake.png"
        visible: enableTest || CarMsg.lampParkingBrake
    }

    Image {
        x: 880
        y: 20
        source: sourceImageUrl + "Lamp_airPress.png"
        visible: enableTest
    }

    Image {
        x: 920
        y: 20
        source: sourceImageUrl + "Lamp_ABS.png"
        visible: enableTest || CarMsg.lampAbs
    }

    Image {
        id: turnRightWL
        x: 960
        y: 20
        source: sourceImageUrl + "TurnRightWL.png"
        visible: enableTest || CarMsg.lampTurnRight
    }

    Image {
        x: 1000
        y: 20
        source: sourceImageUrl + "Lamp_littleLight.png"
        visible: enableTest || CarMsg.lampPositionLight
    }


    Image {
        x: 1040
        y: 20
        source: CarMsg.severityInsulationFault ? sourceImageUrl + "Lamp_insulationRed.png"
                                               : sourceImageUrl + "Lamp_insulationRed.png"
        visible: enableTest || CarMsg.severityInsulationFault || CarMsg.slightInsulationFault
    }

    Image {
        x: 1080
        y: 20
        source: sourceImageUrl + "motor_notworking.png"
        visible: enableTest || CarMsg.lampMotorOutOfService
    }

    Image {
        x: 1120
        y: 20
        source: sourceImageUrl + "batteryCut.png"
        visible: enableTest || CarMsg.powerBatteryCutOff
    }

    Image {
        x: 1160
        y: 20
        source: sourceImageUrl + "batteryFault.png"
        visible: enableTest || CarMsg.powerAccumulatorsFault
    }

    Image {
        x: 1200
        y: 20
        source: sourceImageUrl + "lampBatHigtTemp.png"
        visible: enableTest || CarMsg.lampBatHigtTemp
    }

    Image {
        x: 1240
        y: 20
        source: sourceImageUrl + "batteryFireAlarm.png"
        visible: enableTest
    }

    Image {
        x: 1280
        y: 20
        source: sourceImageUrl + "engineFailue.png"
        visible: enableTest || CarMsg.lampAfterTreat
    }

    Image {
        x: 1320
        y: 20
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
        interval: 420 // 140/min
        repeat: true
        triggeredOnStart: true
        running: CarMsg.lampDoubleFlash
        onTriggered: {
                turnLeftWL.visible = !turnLeftWL.visible
                turnRightWL.visible = !turnRightWL.visible
        }
    }

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
            sourceSize.width: 85
            sourceSize.height: 40
            transform: Rotation { origin.x: 30; origin.y: 30; axis { x: 0; y: 0; z: 1 } angle: 0 }
        }
    }

//    ListView {
//        id: listLeft
//        width: 360
//        height: 40
//        anchors.right: listMiddle.left
//        anchors.verticalCenter: listMiddle.verticalCenter
//        clip: true
//        model: modelLeft
//        delegate: nameDelegate
//        spacing: 2
//        orientation: ListView.Horizontal
//    }

//    ListView {
//        id: listMiddle
//        y: 20
//        width: 565
//        height: 40
//        anchors.horizontalCenter: parent.horizontalCenter
//        clip: true
//        model: modelMiddle
//        delegate: nameDelegate
//        spacing: 2
//        orientation: ListView.Horizontal
//    }

//    ListView {
//        id: listRight
//        width: 330
//        height: 40
//        anchors.left: listMiddle.right
//        anchors.verticalCenter: listMiddle.verticalCenter
//        clip: true
//        model: modelRight
//        delegate: nameDelegate
//        spacing: 4
//        orientation: ListView.Horizontal
//    }

    // Demo
//    Timer {
//        interval: 800
//        repeat: true
//        running: true
//        onTriggered: {
//            listLeft.visible = !listLeft.visible
//            //listMiddle.visible = !listMiddle.visible
//            listRight.visible = !listRight.visible
//        }
//    }

//    //左气压低报警
//    Image { visible:getVisible(CarMsg.lampLeftLowAirPressure); x:40;y:90; source:sourceImageUrl+"airPressure.png"; }
//    //右气压低报警
//    Image { visible:getVisible(CarMsg.lampRightLowAirPressure); x:1340;y:90; source:sourceImageUrl+"airPressure.png"; }

//    //左一
//    ColumnLayout {
//        x: 138
//        y: 140
//        spacing: 10
//        //前雾灯
//        Image { visible:getVisible(CarMsg.lampFrontFog); source:sourceImageUrl+"frontFlogLamp.png"; }
//        //后雾灯
//        Image { visible:getVisible(CarMsg.lampRearFog); source:sourceImageUrl+"backFlogLamp.png"; }
//        //远光灯
//        Image { visible:getVisible(CarMsg.lampHighBeam); source:sourceImageUrl+"highBeamLamp.png"; }
//        //近光灯
//        Image { visible:getVisible(CarMsg.lampHeadLight); source:sourceImageUrl+"headLamp.png"; }
//        //位置灯
//        Image { visible:getVisible(CarMsg.lampPositionLight); source:sourceImageUrl+"placeLamp.png"; }
//    }

//    //左二
//    ColumnLayout {
//        x: 205
//        y: 192
//        spacing: 10
//        //机油压力低
//        Image { visible:getVisible(CarMsg.lampOilPressureLow); source:sourceImageUrl+"oilPressureLow.png"; }
//        //油量低报警
//        Image { visible:getVisible(CarMsg.lampOilLevelLow); source:sourceImageUrl+"oilLevelLow.png"; }
//        //高压检修
//        Image { visible:getVisible(CarMsg.lampHighVoltageMaintenance); source:sourceImageUrl+"highVoltageMaintenance.png"; }
//        //后舱门指示
//        Image { visible:getVisible(CarMsg.lampRearDoorOpen); source:sourceImageUrl+"backHatchDoorAlarm.png"; }
//    }

//    //左三
//    ColumnLayout {
//        x: 268
//        y: 296
//        spacing: 10
//        //左侧舱门开报警
//        Image { visible:getVisible(CarMsg.leftDoorsOpenAlarm); source:sourceImageUrl+"leftFrontShoe.png"; }
//        //前门开
//        Image { visible:getVisible(CarMsg.lampGate1); source:sourceImageUrl+"frontDoorSignal.png"; }
//    }

//    //右一
//    ColumnLayout {
//        x: 1256
//        y: 140
//        spacing: 10
//        //电池主接触器KT
//        Image { visible:getVisible(CarMsg.lampBatteryMainContact); source:sourceImageUrl+"batteryMainContact.png"; }
//    }

//    //右二
//    ColumnLayout {
//        x: 1189
//        y: 192
//        spacing: 10
//        //ABS指示
//        Image { visible:getVisible(CarMsg.lampAbs); source:sourceImageUrl+"absIndicator.png"; }
//        //刹车制动
//        Image { visible:getVisible(CarMsg.lampBrake); source:sourceImageUrl+"footBrake.png"; }
//        //驻车制动
//        Image { visible:getVisible(CarMsg.lampParkingBrake); source:sourceImageUrl+"handBrake.png"; }
//    }

//    //右三
//    ColumnLayout {
//        x: 1125;
//        y: 296
//        spacing: 10
//        //右侧舱门开报警
//        Image { visible:getVisible(CarMsg.rightDoorsOpenAlarm); source:sourceImageUrl+"rightFrontShoe.png"; }
//        //中门开
//        Image { visible:getVisible(CarMsg.lampGate2); source:sourceImageUrl+"middleDoorSignal.png"; }
//    }

//    //右四
//    ColumnLayout {
//        x: 1073
//        y: 351
//        spacing: 10
//        //水温高报警
//        Image { visible:getVisible(CarMsg.lampWaterTempHigh); source:sourceImageUrl+"waterHeat.png"; }
//    }

//    //左其他
//    RowLayout {
//        x: 120
//        y: 80
//        width: 440
//        height: 50
//        spacing: 5
//        clip: true

//        //动力蓄电池充电状态
//        Image { visible:getVisible(CarMsg.powerAccumulatorsChargeStatus); source:sourceImageUrl+"batteryCharging.png"; }
//        //危险报警
//        Image { visible:getVisible(CarMsg.lampWarningLed); source:sourceImageUrl+"dangerAlarmPrompt.png"; }
//        //安全带未系
//        Image { visible:getVisible(CarMsg.seatbeltNotFastened); source:sourceImageUrl+"seatBeltAlarm.png"; }
//        //司机座椅报警
//        Image { visible:getVisible(CarMsg.driverSeatAlarm); source:sourceImageUrl+"driverSeatAlarm.png"; }
//        //水位低指示
//        Image { visible:getVisible(CarMsg.lampWaterLevelLow);  source:sourceImageUrl+"lowWaterAlarm.png"; }


//        //充电线连线
//        Image { visible:getVisible(CarMsg.cableConnect); source:sourceImageUrl+"chargingCable.png"; }
//        //动力电池切断
//        Image { visible:getVisible(CarMsg.powerBatteryCutOff); source:sourceImageUrl+"batteryCut.png"; }
//        //充电确认
//        Image { visible:getVisible(CarMsg.lampChargeConfirm); source:sourceImageUrl+"batteryFault.png"; }
//        //左前蹄片磨损报警
//        Image { visible:getVisible(CarMsg.lampLeftShoeWear); source:sourceImageUrl+"leftHatchDoorAlarm.png"; }
//        //右前蹄片磨损报警
//        Image { visible:getVisible(CarMsg.lampRightShoeWear); source:sourceImageUrl+"rightHatchDoorAlarm.png"; }
//        //气压1报警
//        Image { visible:getVisible(CarMsg.airPress1Lamp); source:sourceImageUrl+"airPressure1.png"; }
//        //气压2报警
//        Image { visible:getVisible(CarMsg.airPress2Lamp); source:sourceImageUrl+"airPressure2.png"; }
//        //气压3报警
//        Image { visible:getVisible(CarMsg.airPress3Lamp); source:sourceImageUrl+"airPressure3.png"; }
//        //气压4报警
//        Image { visible:getVisible(CarMsg.airPress4Lamp); source:sourceImageUrl+"airPressure4.png"; }
//        //气压5报警
//        Image { visible:getVisible(CarMsg.airPress5Lamp); source:sourceImageUrl+"airPressure5.png"; }
//        //电源门开启
//        Image { visible:getVisible(CarMsg.powerDoorsOpen); source:sourceImageUrl+"powerDoorAlarm.png"; }
//        //除霜器
//        Image { visible:getVisible(CarMsg.lampDefroster); source:sourceImageUrl+"defroster.png"; }
//        //除霜器1档位工作指示
//        Image { visible:getVisible(CarMsg.lampDefroster1); source:sourceImageUrl+"defroster.png"; }
//        //除霜器2档位工作指示
//        Image { visible:getVisible(CarMsg.lampDefroster2); source:sourceImageUrl+"defroster.png"; }
//        //电子驻坡
//        Image { visible:getVisible(CarMsg.electronicInSlope); source:sourceImageUrl+"electronicInSlope.png"; }
//    }

//    //右其他
//    RowLayout {
//        x: 890
//        y: 80
//        width: 435
//        height: 50
//        spacing: 5
//        clip: true

//        //左后蹄片磨损报警
//        Image { visible:getVisible(CarMsg.lampLeftBackWear); source:sourceImageUrl+"leftBackShoe.png"; }
//        //右后蹄片磨损报警
//        Image { visible:getVisible(CarMsg.lampRightBackWear); source:sourceImageUrl+"rightBackShoe.png"; }
//        //后视镜加热工作指示
//        Image { visible:getVisible(CarMsg.lampMirrorHeating); source:sourceImageUrl+"lampMirrorHeating.png"; }
//        //定速巡航开启
//        Image { visible:getVisible(CarMsg.ascd); source:sourceImageUrl+"cruiseControl.png"; }
//        //控制器及驱动电机过热
//        Image { visible:getVisible(CarMsg.controlMotorOverheating); source:sourceImageUrl+"motorHeat.png"; }
//        //动力蓄电池故障
//        Image { visible:getVisible(CarMsg.powerAccumulatorsFault); source:sourceImageUrl+"batteryFault.png"; }
//        //驱动系统故障指示
//        Image { visible:getVisible(CarMsg.driverSystemFault); source:sourceImageUrl+"driverSystemFault.png"; }
//        //严重绝缘故障报警
//        Image { visible:getVisible(CarMsg.severityInsulationFault); source:sourceImageUrl+"seriousInsulationFault.png"; }

//        //轻微绝缘故障报警
//        Image { visible:getVisible(CarMsg.slightInsulationFault); source:sourceImageUrl+"slightInsulationFault.png"; }
//        //电机功率受限指示
//        Image { visible:getVisible(CarMsg.motorPowerLimitation); source:sourceImageUrl+"motorLimitation.png"; }
//        //BMS报警
//        Image { visible:getVisible(CarMsg.bmsAlarm); source:sourceImageUrl+"bmsAlarm.png"; }
//        //SOC过低报警
//        Image { visible:getVisible(CarMsg.socLowAram); source:sourceImageUrl+"socLowAlarm.png"; }
//        //安全系统报警
//        Image { visible:getVisible(CarMsg.safetySystemAlarm); source:sourceImageUrl+"safetyDoorAlarm.png"; }
//        //无障碍踏步伸出报警
//        Image { visible:getVisible(CarMsg.barrierFreeMarchReach); source:sourceImageUrl+"barrierFreeAlarm.png"; }
//        //充电门开报警
//        Image { visible:getVisible(CarMsg.gateChargeOpen); source:sourceImageUrl+"gateChargeOpen.png"; }

//        //ECAS系统故障指示灯
//        Image { visible:getVisible(CarMsg.ecasSystemFaultLed); source:sourceImageUrl+"ecasSystemFault.png"; }
//        //ECAS报警指示灯
//        Image { visible:getVisible(CarMsg.ecasAlarmLed); source:sourceImageUrl+"ecasIndicator.png"; }
//        //ECAS侧跪状态指示灯
//        Image { visible:getVisible(CarMsg.ecasKneelingStatusLed); source:sourceImageUrl+"ecasSide.png"; }
//        //ECAS特殊高度指示灯
//        Image { visible:getVisible(CarMsg.ecasSpecialHeightLed); source:sourceImageUrl+"ecasHeight.png"; }
//        //下客门铃
//        Image { visible:getVisible(CarMsg.dropOffDoorbell); source:sourceImageUrl+"doorBell.png"; }
//        //前门应急控制器报警
//        Image { visible:getVisible(CarMsg.frontDoorExigencyAlarm); source:sourceImageUrl+"frontControlAlarm.png"; }
//        //中门应急控制器报警
//        Image { visible:getVisible(CarMsg.middleDoorExigencyAlarm); source:sourceImageUrl+"middleControlAlarm.png"; }
//        //运行准备就绪
//        Image { visible:getVisible(CarMsg.ready); source:sourceImageUrl+"readyRunning.png"; }
//        //运行等待
//        Image { visible:getVisible(CarMsg.wait); source:sourceImageUrl+"waitRunning.png"; }
//        //禁止运行
//        Image { visible:getVisible(CarMsg.stop); source:sourceImageUrl+"forbidRunning.png"; }
//        //车辆低速警示音关闭
//        Image { visible:getVisible(CarMsg.lampLowSpeedClose); source:sourceImageUrl+"lampLowSpeedClose.png"; }
//        //灯光总开关
//        Image { visible:getVisible(CarMsg.lampMainSwitch); source:sourceImageUrl+"lampMainSwitch.png"; }
//        //胎压异常报警
//        //Image { visible:getVisible(CarMsg.lampTirePreFault); source:sourceImageUrl+"tirePressure.png"; }
//        //动力蓄电池高温
//        Image { visible:getVisible(CarMsg.lampBatHigtTemp); source:sourceImageUrl+"lampBatHigtTemp.png"; }
//        //蓄驶里程指示器
//        Image { visible:getVisible(CarMsg.lampBatLegend); source:sourceImageUrl+"lampBatLegend.png"; }
//        //定时充电信号
//        Image { visible:getVisible(CarMsg.lampRton); source:sourceImageUrl+"lampRton.png"; }
//    }

//    RowLayout {
//        x: 900
//        y: 410
//        width: 82
//        height: 20
//        clip: true

//        //爬坡模式符号片
//        Image { visible:getVisible(CarMsg.climbingMode); source:sourceImageUrl+"climbingMode.png"; }
//        //诊断模式符号片
//        Image { visible:getVisible(CarMsg.diagnosticMode); source:sourceImageUrl+"diagnosticMode.png"; }
//    }

//    //Power模式符号片(纯电动模式 or 混动模式 or 插电模式)
//    RowLayout {
//        x: 1050
//        y: 410
//        width: 106
//        height: 24
//        clip: true

//        //power纯电动模式
//        Image { visible:getVisible(CarMsg.powerSupply); source:sourceImageUrl+"powerSupply.png"; }
//        //power插电模式
//        Image { visible:getVisible(CarMsg.powerPlugInMode); source:sourceImageUrl+"powerPlugInMode.png"; }
//        //power混动模式
//        Image { visible:getVisible(CarMsg.powerByvridMode); source:sourceImageUrl+"powerByvridMode.png"; }
//    }
}

import QtQuick 2.6

Item {
    id: indicatorIndex
    width: 1440
    height: 544
    state: "normal"

    property string sourceImageUrl: "qrc:/Theme/Theme1/Image/IndicatorPanel/"
    property bool light: true
    property bool indicatorStatus: true;

    //左转
    Image { id: lamp_leftTurn; x: 410; y: 22; source: sourceImageUrl + "Lamp_turnLeft.png"; opacity: (CarMsg.lampTurnLeft || CarMsg.lampDoubleFlash) ? 1.0 : 0 }
    //右转
    Image { id: lamp_rightTurn; x: 983; y: 22; source: sourceImageUrl + "Lamp_turnRight.png"; opacity: (CarMsg.lampTurnRight || CarMsg.lampDoubleFlash) ? 1.0 : 0 }
    //前雾灯
    Image { id: lamp_frontFog; x: 54; y: 61; source: sourceImageUrl + "Lamp_frontFog.png"; opacity: CarMsg.lampFrontFog ? 1.0 : 0 }
    //后雾灯
    Image { id: lamp_rearFog; x: 20; y: 105; source: sourceImageUrl + "Lamp_rearFog.png"; opacity: CarMsg.lampRearFog ? 1.0 : 0 }
    //远光灯
    Image { id: lamp_highBeam; x: 22; y: 30; source: sourceImageUrl + "Lamp_highBeam.png"; opacity: CarMsg.lampHighBeam ? 1.0 : 0 }
    //近光灯
    Image { id: lamp_headlight; x: 103; y: 30; source: sourceImageUrl + "Lamp_headlight.png"; opacity: CarMsg.lampHeadLight ? 1.0 : 0 }
    //前门开到位信号
    Image { id: lamp_door1; x: 460; y: 18; source: sourceImageUrl + "Lamp_door1.png"; opacity: CarMsg.lampGate1 ? 1.0 : 0 }
    //气压1报警
    Image { id: lamp_airPress1; x: 513; y: 22; source: sourceImageUrl + "Lamp_airPress1.png"; opacity: CarMsg.airPress1Lamp ? 1.0 : 0 }
    //左前蹄片磨损报警
    Image { id: lamp_leftFriction; x: 570; y: 22; source: sourceImageUrl + "Lamp_leftFriction.png"; opacity: CarMsg.lampLeftShoeWear ? 1.0 : 0 }
    //后仓门
    Image { id: lamp_backCabin; x: 631; y: 20; source: sourceImageUrl + "Lamp_backCabin.png"; opacity: CarMsg.lampRearDoorOpen ? 1.0 : 0 }
    //危险报警指示
    Image { id: lamp_danger; x: 690; y: 20; source: sourceImageUrl + "Lamp_danger.png"; opacity: CarMsg.lampWarningLed ? 1.0 : 0 }
    //低水位报警
    Image { id: lamp_waterLevel; x: 753; y: 20; source: sourceImageUrl + "Lamp_waterLevel.png"; opacity: CarMsg.lampWaterLevelLow ? 1.0 : 0 }
    //右前蹄片磨损报警
    Image { id: lamp_rightFriction; x: 811; y: 22; source: sourceImageUrl + "Lamp_rightFriction.png"; opacity: CarMsg.lampRightShoeWear ? 1.0 : 0 }
    //气压2报警
    Image { id: lamp_airPress2; x: 873; y: 22; source: sourceImageUrl + "Lamp_airPress2.png"; opacity: CarMsg.airPress2Lamp ? 1.0 : 0 }
    //中门开到位信号
    Image { id: lamp_door2; x: 923; y: 18; source: sourceImageUrl + "Lamp_door2.png"; opacity: CarMsg.lampGate2 ? 1.0 : 0 }
    //位置灯
    Image { id: lamp_positionLight; x: 1305; y: 13; source: sourceImageUrl + "Lamp_littleLight.png"; opacity: CarMsg.lampPositionLight ? 1.0 : 0 }
    //充电连接线
    Image { id: lamp_chargePlugin; x: 1358; y: 45; source: sourceImageUrl + "Lamp_chargePlugin.png"; opacity: CarMsg.cableConnect ? 1.0 : 0 }
    //动力蓄电池充电状态
    Image { id: lamp_Charging; x: 1374; y: 94; source: sourceImageUrl + "Lamp_chargeIndicator.png"; opacity: CarMsg.powerAccumulatorsChargeStatus ? 1.0 : 0 }
    //充电指示
    Image { id: lamp_battery_Charg; x: 1210; y: 313; source: sourceImageUrl + "batteryCharg.png"; visible: indicatorStatus; opacity: CarMsg.lampChargeConfirm ? 1.0 : 0 }
    //动力蓄电池切断
    Image { id: lamp_battery_Cut; x: 1145; y: 313; source: sourceImageUrl + "batteryCut.png"; visible: indicatorStatus; opacity: CarMsg.powerBatteryCutOff ? 1.0 : 0 }
    //动力蓄电池故障
    Image { id: lamp_battery_Fault; x: 1080; y: 313; source: sourceImageUrl + "batteryFault.png"; visible: indicatorStatus; opacity: CarMsg.powerAccumulatorsFault ? 1.0 : 0 }
    //控制器及驱动电机过热
    Image { id: lamp_motor_Heat; x: 270; y: 306; source: sourceImageUrl + "motorHeat.png"; visible: indicatorStatus; opacity: CarMsg.controlMotorOverheating ? 1.0 : 0 }
    //电机功率受限指示
    Image { id: lamp_motor_Limitation; x: 205; y: 313; source: sourceImageUrl + "motorLimitation.png"; visible: indicatorStatus; opacity: CarMsg.motorPowerLimitation ? 1.0 : 0 }
    /*
    Item {
        id: leftId
        width: 554
        height: 542
        scale: 0.6
        Image {
            id: lamp_test1
            x: 213
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }

        Image {
            id: lamp_test2
            x: 283
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }
    }
    Item {
        id: rightId
        width: 554
        height: 542
        scale: 0.6
        Image {
            id: lamp_test3
            x: 1118
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }

        Image {
            id: lamp_test4
            x: 1188
            y: 336
            visible: light
            //source: "qrc:/Theme/Theme1/Image/IndicatorPanel/Lamp_brake.png"
        }
    }
    states: [
        State {
            name: ""
            PropertyChanges { target: leftId;  opacity: 0.0; y: 60; scale: 0.0 }
            PropertyChanges { target: rightId; opacity: 0.0; y: 60; scale: 0.0 }
        },
        State {
            name: "normal"
            PropertyChanges { target: leftId;  opacity: 1.0; x: 0; y: 0; scale: 1.0 }
            PropertyChanges { target: rightId; opacity: 1.0; x: 0; y: 0; scale: 1.0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: leftId;  opacity: 1.0; x: -46; y: 60; scale: 0.75 }
            PropertyChanges { target: rightId; opacity: 1.0; x: 262; y: 60; scale: 0.75 }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "normal"
            ParallelAnimation{
                ScriptAction {
                    script: {
                        light = true;
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"
            ParallelAnimation {
                NumberAnimation {
                    target: leftId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
            }
        },
        Transition {
            from: "menu"
            to: "normal"
            ParallelAnimation {
                NumberAnimation {
                    target: leftId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightId
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
            }
        }
    ]
    */
}

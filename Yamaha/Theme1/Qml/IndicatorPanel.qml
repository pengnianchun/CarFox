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
    Image { id: lamp_leftTurn; x: 410; y: 22; source: sourceImageUrl + "Lamp_turnLeft.png" }
    //右转
    Image { id: lamp_rightTurn; x: 983; y: 22; source: sourceImageUrl + "Lamp_turnRight.png" }
    //前雾灯
    Image { id: lamp_frontFog; x: 54; y: 61; source: sourceImageUrl + "Lamp_frontFog.png" }
    //后雾灯
    Image { id: lamp_rearFog; x: 20; y: 105; source: sourceImageUrl + "Lamp_rearFog.png" }
    //远光灯
    Image { id: lamp_highBeam; x: 22; y: 30; source: sourceImageUrl + "Lamp_highBeam.png" }
    //近光灯
    Image { id: lamp_headlight; x: 103; y: 30; source: sourceImageUrl + "Lamp_headlight.png" }
    //前门开到位信号
    Image { id: lamp_door1; x: 460; y: 18; source: sourceImageUrl + "Lamp_door1.png" }
    //气压1报警
    Image { id: lamp_airPress1; x: 513; y: 22; source: sourceImageUrl + "Lamp_airPress1.png" }
    //左前蹄片磨损报警
    Image { id: lamp_leftFriction; x: 570; y: 22; source: sourceImageUrl + "Lamp_leftFriction.png" }
    //制动脚刹
    Image { id: lamp_backCabin; x: 631; y: 20; source: sourceImageUrl + "Lamp_backCabin.png" }
    //危险报警指示
    Image { id: lamp_danger; x: 690; y: 20; source: sourceImageUrl + "Lamp_danger.png" }
    //低水位报警
    Image { id: lamp_waterLevel; x: 753; y: 20; source: sourceImageUrl + "Lamp_waterLevel.png" }
    //右前蹄片磨损报警
    Image { id: lamp_rightFriction; x: 811; y: 22; source: sourceImageUrl + "Lamp_rightFriction.png" }
    //气压2报警
    Image { id: lamp_airPress2; x: 873; y: 22; source: sourceImageUrl + "Lamp_airPress2.png" }
    //中门开到位信号
    Image { id: lamp_door2; x: 923; y: 18; source: sourceImageUrl + "Lamp_door2.png" }
    //位置灯
    Image { id: lamp_positionLight; x: 1305; y: 13; source: sourceImageUrl + "Lamp_littleLight.png" }
    //充电连接线
    Image { id: lamp_chargePlugin; x: 1358; y: 45; source: sourceImageUrl + "Lamp_chargePlugin.png" }
    //动力蓄电池充电状态
    Image { id: lamp_Charging; x: 1374; y: 94; source: sourceImageUrl + "Lamp_chargeIndicator.png" }
    //充电指示
    Image { id: lamp_battery_Charg; x: 1210; y: 313; source: sourceImageUrl + "batteryCharg.png"; visible: indicatorStatus }
    //动力蓄电池故障
    Image { id: lamp_battery_Cut; x: 1145; y: 313; source: sourceImageUrl + "batteryCut.png"; visible: indicatorStatus }
    //动力蓄电池故障
    Image { id: lamp_battery_Fault; x: 1080; y: 313; source: sourceImageUrl + "batteryFault.png"; visible: indicatorStatus }
    //控制器及驱动电机过热
    Image { id: lamp_motor_Heat; x: 270; y: 306; source: sourceImageUrl + "motorHeat.png"; visible: indicatorStatus }
    //电机功率受限指示
    Image { id: lamp_motor_Limitation; x: 205; y: 313; source: sourceImageUrl + "motorLimitation.png"; visible: indicatorStatus }
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

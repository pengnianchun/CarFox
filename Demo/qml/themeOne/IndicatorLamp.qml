import QtQuick 2.0

Item {
    id: indicatorLamp
    opacity: 0.0

    property bool light: false
    property bool display: true
    property bool displayLeft:  (CarStatus.lamp_turn_left===1) || light
    property bool displayRight: (CarStatus.lamp_turn_right===1) || light
    property bool doubleFlash:  (CarStatus.lamp_double_flash===1)

    signal enableLight(bool flag)

    onDoubleFlashChanged: {
        if(true === doubleFlash) {
            indicatorLamp.displayLeft = true;
            indicatorLamp.displayRight = true;
        } else {
            indicatorLamp.displayLeft = false;
            indicatorLamp.displayRight = false;
        }
    }

    Image {
        id: lamp_leftTurn
        x: 410
        y: 30
        visible: (CarStatus.lamp_turn_left===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_leftTurn.png"
    }

    Image {
        id: lamp_rightTurn
        x:  983
        y:  30
        visible: (CarStatus.lamp_turn_right===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_rightTurn.png"
    }

    onDisplayLeftChanged: {
        if(true == displayLeft) {
            display = true;
            splashTimer.restart();
        }
    }

    onDisplayRightChanged: {
        if(true == displayRight) {
            display = true;
            splashTimer.restart();
        }
    }

    Timer{
        id:splashTimer;
        interval: 400;
        repeat: true;
        triggeredOnStart: true;

        onTriggered: {

            if(true == display) {
                if(displayLeft) {
                    lamp_leftTurn.visible = true;
                } else {
                    lamp_leftTurn.visible = false;
                }

                if(displayRight) {
                    lamp_rightTurn.visible = true;
                } else {
                    lamp_rightTurn.visible = false;
                }

                display = false;

            } else {

                if(displayLeft) {
                    lamp_leftTurn.visible = false;
                } else {
                    lamp_leftTurn.visible = false;
                }

                if(displayRight) {
                    lamp_rightTurn.visible = false;
                } else {
                    lamp_rightTurn.visible = false;
                }

                display = true;
            }
        }
    }

    Image {
        id: lamp_gate1
        x: 468
        y: 31
        width: 50
        height:42
        scale: 1.0
        visible: (CarStatus.lamp_gate1===1) || light
        source: "qrc:/images/common/images/common/Indicator/gate1.png"
    }

    Image {
        id: lamp_gate2
        x: 928
        y: 31
        width: 50
        height:42
        scale: 1.0
        visible: (CarStatus.lamp_gate2===1) || light
        source: "qrc:/images/common/images/common/Indicator/gate2.png"
    }

    Image {
        id: lamp_lowAirPressure1
        x: 521
        y: 36
        visible: (CarStatus.lamp_left_low_air_pressure===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_lowAirPressure.png"
    }

    Image {
        id: leftShoeWear
        x: 576
        y: 36
        visible: (CarStatus.lamp_left_shoe_wear===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_leftShoeWear.png"
    }

    Image {
        id: lampBrake
        x: 631
        y: 36
        visible: (CarStatus.lamp_brake===1) || light
        source: "qrc:/images/common/images/common/Indicator/LampBrake.png"
    }

    Image {
        id: lamp_main_power
        x: 676
        y: 22
        width: 57
        height:57
        visible: (CarStatus.lamp_key_on===1) || light
        source: "qrc:/images/common/images/common/Indicator/keyOn.png"
    }

    Image {
        id: lamp_parkingBrake
        x: 731
        y: 36
        visible: (CarStatus.lamp_parking_brake===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_parkingBrake.png"
    }

    Image {
        id: lamp_waterTempHighWarn
        x: 785
        y: 37
        width: 36
        height:33
        visible: (CarStatus.lamp_water_temp_high===1) || light
        source: "qrc:/images/common/images/common/Indicator/waterTempWarn.png"
    }

    Image {
        id: rightShoeWear
        x: 831
        y: 36
        visible: (CarStatus.lamp_right_shoe_wear===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_rightShoeWear.png"
    }

    Image {
        id: lamp_lowAirPressure2
        x: 882
        y: 37
        visible: (CarStatus.lamp_right_low_air_pressure===1)|| light
        source: "qrc:/images/common/images/common/Indicator/Lamp_lowAirPressure.png"
    }

    Image {
        id: lamp_frontFog
        x: 54
        y: 61
        visible: (CarStatus.lamp_front_fog===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_frontFog.png"
    }

    Image {
        id: lamp_rearFog
        x: 20
        y: 105
        visible: (CarStatus.lamp_rear_fog===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_rearFog.png"
    }

    Image {
        id: lamp_highBeam
        x: 22
        y: 30
        visible: (CarStatus.lamp_high_beam===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_highBeam.png"
    }

    Image {
        id: lamp_headlight
        x: 103
        y: 30
        visible: (CarStatus.lamp_head_light===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_headlight.png"
    }

    Image {
        id: lamp_positionLight
        x: 1305
        y: 29
        width: 55
        height:35
        visible: (CarStatus.lamp_position_light===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_positionLight.png"
    }

    Image {
        id: lamp_chargePlugin
        x: 1375
        y: 26
        width: 40
        height:40
        visible: (CarStatus.lamp_air_filter===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_airFilter.png"
    }

    Image {
        id: lamp_STOP_Yellow
        x: 1342
        y: 58
        height:65
        visible: (CarStatus.lamp_low_service_wl===1) || light
        source: "qrc:/images/common/images/common/Indicator/stopY.png"
    }

    Image {
        id: lamp_STOP_Red
        x: 1342
        y: 58
        height:65
        visible: (CarStatus.lamp_heavy_stop_wl===1)
        source: "qrc:/images/common/images/common/Indicator/stopR.png"
    }

    Image {
        id: lamp_Charging
        x: 1383
        y: 115
        visible: (CarStatus.lamp_charge_confirm===1) || light
        source: "qrc:/images/common/images/common/Indicator/chargeLight.png"
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: indicatorLamp; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: indicatorLamp; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation{
                SequentialAnimation {
                    PauseAnimation {duration: 500}
                    ScriptAction{script: {indicatorLamp.light = true; emit: enableLight(true)}}
                    PauseAnimation {duration: 3000}
                    ScriptAction{script: {indicatorLamp.light = false; emit: enableLight(false)}}
                }
            }
        },
        Transition {
            from: "show"
            to: ""
            SequentialAnimation{
                NumberAnimation {target: indicatorLamp;property: "opacity";duration: 1000;}
            }
        }
    ]

    Component.onCompleted: {
        splashTimer.start();
        console.log("=============theme1's menupanel component complete ============")
    }

}

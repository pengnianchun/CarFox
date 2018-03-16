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
        x: 560
        y: 12
        visible: (CarStatus.lamp_turn_left===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_leftTurn.png"
    }

    Image {
        id: lamp_rightTurn
        x:  833
        y:  12
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
        x: 280
        y: 304
        width: 50
        height:42
        scale: 1.0
        visible: (CarStatus.lamp_gate1===1) || light
        source: "qrc:/images/common/images/common/Indicator/gate1.png"
    }

    Image {
        id: lamp_gate2
        x: 1120
        y: 304
        width: 50
        height:42
        scale: 1.0
        visible: (CarStatus.lamp_gate2===1) || light
        source: "qrc:/images/common/images/common/Indicator/gate2.png"
    }

    Image {
        id: lamp_lowAirPressure1
        x: 56
        y: 100
        visible: (CarStatus.lamp_left_low_air_pressure===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_lowAirPressure.png"
    }

    Image {
        id: leftShoeWear
        x: 278
        y: 254
        visible: (CarStatus.lamp_left_shoe_wear===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_leftShoeWear.png"
    }

    Image {
        id: rightShoeWear
        x: 1120
        y: 252
        visible: (CarStatus.lamp_right_shoe_wear===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_rightShoeWear.png"
    }

    Image {
        id: lamp_lowAirPressure2
        x: 1345
        y: 100
        visible: (CarStatus.lamp_right_low_air_pressure===1)|| light
        source: "qrc:/images/common/images/common/Indicator/Lamp_lowAirPressure.png"
    }

    Image {
        id: lamp_frontFog
        x: 150
        y: 108
        visible: (CarStatus.lamp_front_fog===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_frontFog.png"
    }

    Image {
        id: lamp_rearFog
        x: 150
        y: 158
        visible: (CarStatus.lamp_rear_fog===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_rearFog.png"
    }

    Image {
        id: lamp_highBeam
        x: 150
        y: 208
        visible: (CarStatus.lamp_high_beam===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_highBeam.png"
    }

    Image {
        id: lamp_headlight
        x: 150
        y: 258
        visible: (CarStatus.lamp_head_light===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_headlight.png"
    }

    Image {
        id: lamp_positionLight
        x: 150
        y: 308
        width: 55
        height:35
        visible: (CarStatus.lamp_position_light===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_positionLight.png"
    }

    Image {
        id: lamp_oilPressLow
        x: 222
        y: 162
        width: 40
        height:25
        visible: (CarStatus.lamp_oil_pressure_low===1) || light
        source: "qrc:/images/common/images/common/Indicator/oilPressLow.png"
    }

    Image {
        id: lamp_oilLowWarn
        x: 218
        y: 202
        width: 48
        height:46
        visible: (CarStatus.lamp_oil_level_low===1) || light
        source: "qrc:/images/common/images/common/Indicator/oilLowWarn.png"
    }

    Image {
        id: lamp_highVol
        x: 228
        y: 262
        width: 32
        height:32
        visible: (CarStatus.lamp_high_voltage_maintenance===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_highVol.png"
    }

    Image {
        id: lamp_BackCang
        x: 224
        y: 312
        width: 40
        height:32
        visible: (CarStatus.lamp_rear_door_open===1) || light
        source: "qrc:/images/common/images/common/Indicator/backCang.png"
    }

    Image {
        id: lamp_airFilter
        x: 1245
        y: 108
        width: 40
        height:40
        visible: (CarStatus.lamp_air_filter===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_airFilter.png"
    }

    Image {
        id: lamp_KT
        x: 1249
        y: 162
        width: 30
        height:25
        visible: (CarStatus.lamp_battery_main_contact===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_batContactor.png"
    }

    Image {
        id: lamp_AC
        x: 1249
        y: 204
        width: 30
        height:25
        visible: (CarStatus.lamp_ac===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_AC.png"
    }

    Image {
        id: lamp_dryere
        x: 1249
        y: 244
        width: 38
        height:30
        visible: (CarStatus.lamp_dryere===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_dryere.png"
    }

    Image {
        id: lamp_Charging
        x: 1249
        y: 290
        visible: (CarStatus.lamp_charge_confirm===1) || light
        source: "qrc:/images/common/images/common/Indicator/chargeLight.png"
    }

    Image {
        id: lamp_STOP_Yellow
        x: 1218
        y: 321
        height:65
        visible: (CarStatus.lamp_low_service_wl===1) || light
        source: "qrc:/images/common/images/common/Indicator/stopY.png"
    }

    Image {
        id: lamp_STOP_Red
        x: lamp_STOP_Yellow.x
        y: lamp_STOP_Yellow.y
        height:65
        visible: (CarStatus.lamp_heavy_stop_wl===1)
        source: "qrc:/images/common/images/common/Indicator/stopR.png"
    }

    Image {
        id: lamp_ABS
        x: 1178
        y: 158
        width: 42
        height:32
        visible: (CarStatus.lamp_abs===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_ABS.png"
    }

    Image {
        id: lampBrake
        x: 1178
        y: 205
        visible: (CarStatus.lamp_brake===1) || light
        source: "qrc:/images/common/images/common/Indicator/LampBrake.png"
    }

    Image {
        id: lamp_parkingBrake
        x: 1178
        y: 250
        visible: (CarStatus.lamp_parking_brake===1) || light
        source: "qrc:/images/common/images/common/Indicator/Lamp_parkingBrake.png"
    }

    Image {
        id: lamp_main_power
        x: 1173
        y: 288
        width: 57
        height:57
        visible: (CarStatus.lamp_key_on===1) || light
        source: "qrc:/images/common/images/common/Indicator/keyOn.png"
    }

    Image {
        id: lamp_waterTemp
        x: 1068
        y: 314
        width: 36
        height:33
        visible: (CarStatus.lamp_water_temp_high===1) || light
        source: "qrc:/images/common/images/common/Indicator/waterTempWarn.png"
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
                    ScriptAction{script: {indicatorLamp.light = true; }}
                    PauseAnimation {duration: 3000}
                    ScriptAction{script: {indicatorLamp.light = false;}}
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
    }
}

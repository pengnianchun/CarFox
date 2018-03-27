import QtQuick 2.6

Item {
    id: indicatorIndex
    width: 1440
    height: 544
    visible: false
    state: "normal"

    property string sourceImageUrl: "qrc:/Theme/Theme1/Image/IndicatorPanel/"
    property bool light: true
    property bool indicatorStatus: true;

    onVisibleChanged: {
        if(visible){
            animation_indicator.running = true;
            carousel_timer.running = true;
        }else{
            carousel_timer.running = false;
        }
    }
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
    //后仓门
    Image { id: lamp_backCabin; x: 631; y: 20; source: sourceImageUrl + "Lamp_backCabin.png"; opacity: CarMsg.lampRearDoorOpen ? 1.0 : 0 }
    //危险报警指示
    Image { id: lamp_danger; x: 690; y: 20; source: sourceImageUrl + "Lamp_danger.png"; opacity: CarMsg.lampWarningLed ? 1.0 : 0 }
    //低水位报警
    Image { id: lamp_waterLevel; x: 753; y: 20; source: sourceImageUrl + "Lamp_waterLevel.png"; opacity: CarMsg.lampWaterLevelLow ? 1.0 : 0 }
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

    Timer {
        id: carousel_timer
        property var lamp1CarouselId: [lamp_airPress1,lamp_airPress5,powewr_door,cruise_control,water_heat,front_control]
        property var lamp2CarouselId: [lamp_leftFriction,seat_belt,abs_indicator,left_hatch]
        property var lamp3CarouselId: [lamp_rightFriction,lamp_airPress3,hands_brake,bms_alarm,soc_low,
            safety_system,right_hatch,ecas_fault,door_bell]
        property var lamp4CarouselId: [lamp_airPress2,lamp_airPress4,foot_brake,driver_systemfault,serious_insulation,light_serious_insulation,
            barrier_free,ecas_alarm,ecas_side,ecas_height,middle_control]
        property var lamp1CarouselArray: new Array();
        property var lamp2CarouselArray: new Array();
        property var lamp3CarouselArray: new Array();
        property var lamp4CarouselArray: new Array();
        property int j: 0;
        property int l: 0;
        property int m: 0;
        property int n: 0;
        interval: 1000
        repeat: true
        running: false
        onTriggered: {
            lamp1CarouselArray.splice(0,lamp1CarouselArray.length);
            lamp2CarouselArray.splice(0,lamp1CarouselArray.length);
            lamp3CarouselArray.splice(0,lamp1CarouselArray.length);
            lamp4CarouselArray.splice(0,lamp1CarouselArray.length);
            for(var i=0;i<lamp1CarouselId.length;i++){
                lamp1CarouselId[i].visible === false;
                if(lamp1CarouselId[i].opacity === 1.0){
                    lamp1CarouselArray.push(i);
                }else{}
            }
            for(j;j<lamp1CarouselArray.length;j++){
                for(var k=0;k<lamp1CarouselArray.length;k++){
                    lamp1CarouselId[lamp1CarouselArray[k]].visible = false;
                }
                lamp1CarouselId[lamp1CarouselArray[j]].visible = true;
                if(j === lamp1CarouselArray.length-1){
                    j=0;
                }else{
                    j++;
                }
                break;
            }
            for(var i=0;i<lamp2CarouselId.length;i++){
                lamp2CarouselId[i].visible === false;
                if(lamp2CarouselId[i].opacity === 1.0){
                    lamp2CarouselArray.push(i);
                }else{}
            }
            for(l;l<lamp2CarouselArray.length;l++){
                for(var k=0;k<lamp2CarouselArray.length;k++){
                    lamp2CarouselId[lamp2CarouselArray[k]].visible = false;
                }
                lamp2CarouselId[lamp2CarouselArray[l]].visible = true;
                if(l === lamp2CarouselArray.length-1){
                    l=0;
                }else{
                    l++;
                }
                break;
            }
            for(var i=0;i<lamp3CarouselId.length;i++){
                lamp3CarouselId[i].visible === false;
                if(lamp3CarouselId[i].opacity === 1.0){
                    lamp3CarouselArray.push(i);
                }else{}
            }
            for(m;m<lamp3CarouselArray.length;m++){
                for(var k=0;k<lamp3CarouselArray.length;k++){
                    lamp3CarouselId[lamp3CarouselArray[k]].visible = false;
                }
                lamp3CarouselId[lamp3CarouselArray[m]].visible = true;
                if(m === lamp3CarouselArray.length-1){
                    m=0;
                }else{
                    m++;
                }
                break;
            }
            for(var i=0;i<lamp4CarouselId.length;i++){
                lamp4CarouselId[i].visible === false;
                if(lamp4CarouselId[i].opacity === 1.0){
                    lamp4CarouselArray.push(i);
                }else{}
            }
            for(n;n<lamp4CarouselArray.length;n++){
                for(var k=0;k<lamp4CarouselArray.length;k++){
                    lamp4CarouselId[lamp4CarouselArray[k]].visible = false;
                }
                lamp4CarouselId[lamp4CarouselArray[n]].visible = true;
                if(n === lamp4CarouselArray.length-1){
                    n=0;
                }else{
                    n++;
                }
                break;
            }
        }
    }
    //气压1报警
    Image { id: lamp_airPress1; x: 513; y: 22; source: sourceImageUrl + "Lamp_airPress1.png"; opacity: CarMsg.airPress1Lamp ? 1.0 : 0;visible: true }
    //气压5报警
    Image { id: lamp_airPress5; x: 513; y: 22; source: sourceImageUrl + "airPressure5.png"; opacity: CarMsg.airPress5Lamp ? 1.0 : 0;visible: false }
    //电源门
    Image { id: powewr_door; x: 513; y: 22; source: sourceImageUrl + "powerDoorAlarm.png"; opacity: CarMsg.powerDoorsOpen ? 1.0 : 0;visible: false }
    //电子驻陂（零速锁定）
    //Image { id: electronic_park; x: 513; y: 22; source: sourceImageUrl + "absIndicator.png"; opacity: CarMsg.electronicInSlope ? 1.0 : 0;visible: false }
    //定速巡航开启
    Image { id: cruise_control; x: 513; y: 22; source: sourceImageUrl + "cruiseControl.png"; opacity: CarMsg.ascd ? 1.0 : 0;visible: false }
    //水温过高
    Image { id: water_heat; x: 513; y: 22; source: sourceImageUrl + "waterHeat.png"; opacity: CarMsg.lampWaterTempHigh ? 1.0 : 0;visible: false }
    //前门应急控制器
    Image { id: front_control; x: 513; y: 22; source: sourceImageUrl + "frontControlAlarm.png"; opacity: CarMsg.frontDoorExigencyAlarm ? 1.0 : 0;visible: false }
    //左前蹄片磨损报警
    Image { id: lamp_leftFriction; x: 570; y: 22; source: sourceImageUrl + "Lamp_leftFriction.png"; opacity: CarMsg.lampLeftShoeWear ? 1.0 : 0;visible: true }
    //安全带系指示
    Image { id: seat_belt; x: 570; y: 22; source: sourceImageUrl + "seatBeltAlarm.png"; opacity: CarMsg.seatbeltAlarm ? 1.0 : 0;visible: false }
    //ABS指示
    Image { id: abs_indicator; x: 570; y: 22; source: sourceImageUrl + "absIndicator.png"; opacity: CarMsg.lampAbs ? 1.0 : 0;visible: false }
    //左后蹄片磨损报警
    //Image { id: lamp_leftBack; x: 570; y: 22; source: sourceImageUrl + "leftBackShoe.png"; opacity: CarMsg.lamp_left_back_wear ? 1.0 : 0;visible: false }
    //左舱门开报警
    Image { id: left_hatch; x: 570; y: 22; source: sourceImageUrl + "leftHatchDoorAlarm.png"; opacity: CarMsg.leftDoorsOpenAlarm ? 1.0 : 0;visible: false }
    //右前蹄片磨损报警
    Image { id: lamp_rightFriction; x: 811; y: 22; source: sourceImageUrl + "Lamp_rightFriction.png"; opacity: CarMsg.lampRightShoeWear ? 1.0 : 0;visible: true }
    //气压3报警
    Image { id: lamp_airPress3; x: 811; y: 22; source: sourceImageUrl + "airPressure3.png"; opacity: CarMsg.airPress3Lamp ? 1.0 : 0;visible: false }
    //手刹指示
    Image { id: hands_brake; x: 811; y: 22; source: sourceImageUrl + "handBrake.png"; opacity: CarMsg.lampBrake ? 1.0 : 0;visible: false }
    //右后蹄片磨损报警
    //Image { id: lamp_rightBack; x: 811; y: 22; source: sourceImageUrl + "rightBackShoe.png"; opacity: CarMsg.lamp_right_back_wear ? 1.0 : 0;visible: false }
    //BMS报警
    Image { id: bms_alarm; x: 811; y: 22; source: sourceImageUrl + "bmsAlarm.png"; opacity: CarMsg.bmsAlarm ? 1.0 : 0;visible: false }
    //SOC过低报警
    Image { id: soc_low; x: 811; y: 22; source: sourceImageUrl + "socLowAlarm.png"; opacity: CarMsg.socLowAram ? 1.0 : 0;visible: false }
    //安全系统报警
    Image { id: safety_system; x: 811; y: 22; source: sourceImageUrl + "safetyDoorAlarm.png"; opacity: CarMsg.safetySystemAlarm ? 1.0 : 0;visible: false }
    //右舱门开报警
    Image { id: right_hatch; x: 811; y: 22; source: sourceImageUrl + "rightHatchDoorAlarm.png"; opacity: CarMsg.rightDoorsOpenAlarm ? 1.0 : 0;visible: false }
    //ECAS系统故障指示灯
    Image { id: ecas_fault; x: 811; y: 22; source: sourceImageUrl + "ecasSystemFault.png"; opacity: CarMsg.ecasSystemFaultLed ? 1.0 : 0;visible: false }
    //下课门铃
    Image { id: door_bell; x: 811; y: 22; source: sourceImageUrl + "doorBell.png"; opacity: CarMsg.dropOffDoorbell ? 1.0 : 0;visible: false }
    //气压2报警
    Image { id: lamp_airPress2; x: 873; y: 22; source: sourceImageUrl + "Lamp_airPress2.png"; opacity: CarMsg.airPress2Lamp ? 1.0 : 0;visible: true }
    //气压4报警
    Image { id: lamp_airPress4; x: 873; y: 22; source: sourceImageUrl + "airPressure4.png"; opacity: CarMsg.airPress4Lamp ? 1.0 : 0;visible: false }
    //制动脚刹指示
    Image { id: foot_brake; x: 873; y: 22; source: sourceImageUrl + "footBrake.png"; opacity: CarMsg.lampParkingBrake ? 1.0 : 0;visible: false }
    //驱动系统故障
    Image { id: driver_systemfault; x: 873; y: 22; source: sourceImageUrl + "driverSystemFault.png"; opacity: CarMsg.driverSystemFault ? 1.0 : 0;visible: false }
    //绝缘故障
    Image { id: serious_insulation; x: 873; y: 22; source: sourceImageUrl + "seriousInsulationFault.png"; opacity: CarMsg.severityInsulationFault ? 1.0 : 0;visible: false }
    //轻微绝缘故障
    Image { id: light_serious_insulation; x: 873; y: 22; source: sourceImageUrl + "slightInsulationFault.png"; opacity: CarMsg.slightInsulationFault ? 1.0 : 0;visible: false }
    //无障碍踏步伸出报警
    Image { id: barrier_free; x: 873; y: 22; source: sourceImageUrl + "barrierFreeAlarm.png"; opacity: CarMsg.barrierFreeMarchReach ? 1.0 : 0;visible: false }
    //充电门开报警
    //Image { id: charge_door; x: 873; y: 22; source: sourceImageUrl + "Lamp_airPress2.png"; opacity: CarMsg.gate_charge_open ? 1.0 : 0;visible: false }
    //ECAS报警指示灯
    Image { id: ecas_alarm; x: 873; y: 22; source: sourceImageUrl + "ecasIndicator.png"; opacity: CarMsg.ecasAlarmLed ? 1.0 : 0;visible: false }
    //侧跪状态指示灯
    Image { id: ecas_side; x: 873; y: 22; source: sourceImageUrl + "ecasSide.png"; opacity: CarMsg.ecasKneelingStatusLed ? 1.0 : 0;visible: false }
    //特殊高度指示灯
    Image { id: ecas_height; x: 873; y: 22; source: sourceImageUrl + "ecasHeight.png"; opacity: CarMsg.ecasSpecialHeightLed ? 1.0 : 0;visible: false }
    //中门应急控制器
    Image { id: middle_control; x: 873; y: 22; source: sourceImageUrl + "middleControlAlarm.png"; opacity: CarMsg.middleDoorExigencyAlarm ? 1.0 : 0;visible: false }
    SequentialAnimation {
        id: animation_indicator
        ParallelAnimation {
            NumberAnimation { target: lamp_leftTurn; property: "visible"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_rightTurn; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_frontFog; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_rearFog; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_highBeam; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_headlight; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_door1; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_airPress1; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_leftFriction; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_backCabin; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_danger; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_waterLevel; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_rightFriction; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_airPress2; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_door2; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_positionLight; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_chargePlugin; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_Charging; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_battery_Charg; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_battery_Cut; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_battery_Fault; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_motor_Heat; property: "opacity"; duration: 1000;to:1 }
            NumberAnimation { target: lamp_motor_Limitation; property: "opacity"; duration: 1000;to:1 }
        }
        ParallelAnimation {
            NumberAnimation { target: lamp_leftTurn; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_rightTurn; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_frontFog; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_rearFog; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_highBeam; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_headlight; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_door1; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_airPress1; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_leftFriction; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_backCabin; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_danger; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_waterLevel; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_rightFriction; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_airPress2; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_door2; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_positionLight; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_chargePlugin; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_Charging; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_battery_Charg; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_battery_Cut; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_battery_Fault; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_motor_Heat; property: "opacity"; duration: 1000;to:0 }
            NumberAnimation { target: lamp_motor_Limitation; property: "opacity"; duration: 1000;to:0 }
        }
    }
}

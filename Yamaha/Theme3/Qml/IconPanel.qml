import QtQuick 2.0
import "qrc:/Common/Component"
import "./"

Item {
    property alias lampTimerRunning:lampTimer.running

    property bool initialized: false
    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string arrowReadyLeftImage:sourceImageUrl+"Image/MiddlePanel/wait.png";
    property string arrowReadyRightImage:sourceImageUrl+"Image/MiddlePanel/ready_arrow_right.png";

    id:root
    width:1440
    height:540
    z:100
    visible: true
    Timer{
        property int count: 0
        id:lampTimer
        interval: 300
        running: true
        repeat: true
        onTriggered: {
            count++;
            if(count == 1 ||(count == 3)||(count == 5))
            {
                initialized = false;
                root.visible = true;
            }
            else if(count == 2||(count == 4))
            {
                initialized = false;
                root.visible = false;
            }
            if(count == 6)
            {
                count = 0;
                lampTimer.running = false;
                root.visible = true;
                initialized = true;
            }
        }
    }
//水温高报警
    IconItem{objectName:"lamp_waterTemp";        visible:initialized?(CarMsg?CarMsg.lampWaterTempHigh:false):true;  x:25;y:144;     source:sourceImageUrl+"Image/IndicatorPanel/waterHeat.png";}
//动力蓄电池充电状态
    IconItem{objectName:"lamp_chargeIndicator";  visible:initialized?(CarMsg?CarMsg.powerAccumulatorsChargeStatus:false):true;  x:14;y:304;     source:sourceImageUrl+"Image/IndicatorPanel/batteryCharging.png";}
//危险报警
    IconItem{objectName:"lamp_danger";           visible:initialized?(CarMsg?CarMsg.lampWarningLed:false):true;  x:30;y:363;     source:sourceImageUrl+"Image/IndicatorPanel/dangerAlarmPrompt.png";}
//档位D
    IconItem{objectName:"forwardGear";           visible:initialized?(CarMsg?CarMsg.forwardGear:false):true;  x:54;y:445;     source:sourceImageUrl+"Image/IndicatorPanel/forwardGear.png";}
//档位N
    IconItem{objectName:"gapGear";           visible:initialized?(CarMsg?CarMsg.neutralGear:false):true;  x:54;y:445;     source:sourceImageUrl+"Image/IndicatorPanel/gapGear.png";}
//档位R
    IconItem{objectName:"asternGear";           visible:initialized?(CarMsg?CarMsg.reverseGear:false):true;  x:54;y:445;     source:sourceImageUrl+"Image/IndicatorPanel/asternGear.png";}
//位置灯
    IconItem{objectName:"lamp_positionLight";    visible:initialized?(CarMsg?CarMsg.lampPositionLight:false):true;  x:387;y:14;     source:sourceImageUrl+"Image/IndicatorPanel/placeLamp.png";}
//左转向灯
    IconItem{objectName:"turnLeftLamp";    visible:initialized?(CarMsg?CarMsg.lampTurnLeft:false):true;  x:464;y:18;     source:sourceImageUrl+"Image/IndicatorPanel/turnLeftLamp.png";}
//近光灯
    IconItem{objectName:"lamp_headlight";        visible:initialized?(CarMsg?CarMsg.lampHeadLight:false):true;  x:550;y:15;     source:sourceImageUrl+"Image/IndicatorPanel/headLamp.png";}
//安全带未系
    IconItem{objectName:"seatBeltLight";         visible:initialized?(CarMsg?CarMsg.seatbeltNotFastened:false):true;  x:630;y:15;     source:sourceImageUrl+"Image/IndicatorPanel/seatBeltLight.png";}
//司机座椅报警
    IconItem{objectName:"driverSeatAlarm";       visible:initialized?(CarMsg?CarMsg.driverSeatAlarm:false):true;  x:761;y:12;     source:sourceImageUrl+"Image/IndicatorPanel/driverSeatAlarm.png";}
//远光灯
    IconItem{objectName:"lamp_highBeam";         visible:initialized?(CarMsg?CarMsg.lampHighBeam:false):true;  x:821;y:10;     source:sourceImageUrl+"Image/IndicatorPanel/highBeamLamp.png";}
//右转向灯
    IconItem{objectName:"turnRightLamp";         visible:initialized?(CarMsg?CarMsg.lampTurnRight:false):true;  x:913;y:18;     source:sourceImageUrl+"Image/IndicatorPanel/turnRightLamp.png";}
//水位低指示
    IconItem{objectName:"lamp_waterLevel";       visible:initialized?(CarMsg?CarMsg.lampWaterLevelLow:false):true;  x:970;y:9;      source:sourceImageUrl+"Image/IndicatorPanel/lowWaterAlarm.png";}
//前门开
    IconItem{objectName:"lamp_door1";            visible:initialized?(CarMsg?CarMsg.lampGate1:false):true;  x:500;y:75;     source:sourceImageUrl+"Image/IndicatorPanel/frontDoorSignal.png";}
//前雾灯
    IconItem{objectName:"lamp_frontFog";         visible:initialized?(CarMsg?CarMsg.lampFrontFog:false):true;  x:560;y:77;     source:sourceImageUrl+"Image/IndicatorPanel/frontFlogLamp.png";}
//后雾灯
    IconItem{objectName:"lamp_rearFog";          visible:initialized?(CarMsg?CarMsg.lampRearFog:false):true;  x:821;y:77;     source:sourceImageUrl+"Image/IndicatorPanel/rearFogLamp.png";}
//中门开
    IconItem{objectName:"lamp_door2";            visible:initialized?(CarMsg?CarMsg.lampGate2:false):true;  x:875;y:75;     source:sourceImageUrl+"Image/IndicatorPanel/middleDoorSignal.png";}
//左侧舱门开报警
    IconItem{objectName:"lamp_leftFriction";     visible:initialized?(CarMsg?CarMsg.leftDoorsOpenAlarm:false):true;  x:283;y:140;    source:sourceImageUrl+"Image/IndicatorPanel/leftFrontShoe.png";}
//右侧舱门开报警
    IconItem{objectName:"lamp_rightFriction";    visible:initialized?(CarMsg?CarMsg.rightDoorsOpenAlarm:false):true;  x:1097;y:140;   source:sourceImageUrl+"Image/IndicatorPanel/rightFrontShoe.png";}
//充电线连线
    IconItem{objectName:"lamp_chargePlugin";     visible:initialized?(CarMsg?CarMsg.cableConnect:false):true;  x:1380;y:146;   source:sourceImageUrl+"Image/IndicatorPanel/chargingCable.png";}
//动力电池切断
    IconItem{objectName:"batteryCut";            visible:initialized?(CarMsg?CarMsg.powerBatteryCutOff:false):true;  x:1384;y:303;   source:sourceImageUrl+"Image/IndicatorPanel/batteryCut.png";}
//充电确认
    IconItem{objectName:"batteryFault";          visible:initialized?(CarMsg?CarMsg.lampChargeConfirm:false):true;  x:1355;y:370;   source:sourceImageUrl+"Image/IndicatorPanel/batteryFault.png";}
//左前蹄片磨损报警
    IconItem{objectName:"leftHatchDoorAlarm";    visible:initialized?(CarMsg?CarMsg.lampLeftShoeWear:false):true;  x:439;y:113;    source:sourceImageUrl+"Image/IndicatorPanel/leftHatchDoorAlarm.png";}
//右前蹄片磨损报警
    IconItem{objectName:"rightHatchDoorAlarm";   visible:initialized?(CarMsg?CarMsg.lampRightShoeWear:false):true;  x:931;y:113;    source:sourceImageUrl+"Image/IndicatorPanel/rightHatchDoorAlarm.png";}
//气压1报警
    IconItem{objectName:"airPressure1";   visible:initialized?(CarMsg?CarMsg.airPress1Lamp:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/airPressure1.png";}
//气压2报警
    IconItem{objectName:"airPressure2";   visible:initialized?(CarMsg?CarMsg.airPress2Lamp:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/airPressure2.png";}
//气压3报警
    IconItem{objectName:"airPressure3";   visible:initialized?(CarMsg?CarMsg.airPress3Lamp:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/airPressure3.png";}
//气压4报警
    IconItem{objectName:"airPressure4";   visible:initialized?(CarMsg?CarMsg.airPress4Lamp:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/airPressure4.png";}
//气压5报警
    IconItem{objectName:"airPressure5";   visible:initialized?(CarMsg?CarMsg.airPress5Lamp:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/airPressure5.png";}
//电源门开启
    IconItem{objectName:"powerDoorAlarm";   visible:initialized?(CarMsg?CarMsg.powerDoorsOpen:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/powerDoorAlarm.png";}
//后舱门指示
    IconItem{objectName:"backHatchDoorAlarm";   visible:initialized?(CarMsg?CarMsg.lampRearDoorOpen:false):false;  x:630;y:15;    source:sourceImageUrl+"Image/IndicatorPanel/backHatchDoorAlarm.png";}

//左后蹄片磨损报警
    IconItem{objectName:"leftBackShoe";   visible:initialized?(CarMsg?CarMsg.lampLeftBackWear:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/leftBackShoe.png";}
//右后蹄片磨损报警
    IconItem{objectName:"rightBackShoe";   visible:initialized?(CarMsg?CarMsg.lampRightBackWear:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/rightBackShoe.png";}
//后视镜加热工作指示
    IconItem{objectName:"lampMirrorHeating";   visible:initialized?(CarMsg?CarMsg.lampMirrorHeating:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/lampMirrorHeating.png";}
//定速巡航开启
    IconItem{objectName:"cruiseControl";   visible:initialized?(CarMsg?CarMsg.ascd:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/cruiseControl.png";}
//控制器及驱动电机过热
    IconItem{objectName:"motorHeat";   visible:initialized?(CarMsg?CarMsg.controlMotorOverheating:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/motorHeat.png";}
//动力蓄电池故障
    IconItem{objectName:"batteryFault";   visible:initialized?(CarMsg?CarMsg.powerAccumulatorsFault:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/batteryFault.png";}
//驱动系统故障指示
    IconItem{objectName:"driverSystemFault";   visible:initialized?(CarMsg?CarMsg.driverSystemFault:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/driverSystemFault.png";}
//严重绝缘故障报警
    IconItem{objectName:"seriousInsulationFault";   visible:initialized?(CarMsg?CarMsg.severityInsulationFault:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/seriousInsulationFault.png";}

//轻微绝缘故障报警
    IconItem{objectName:"slightInsulationFault";   visible:initialized?(CarMsg?CarMsg.slightInsulationFault:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/slightInsulationFault.png";}
//电机功率受限指示
    IconItem{objectName:"motorLimitation";   visible:initialized?(CarMsg?CarMsg.motorPowerLimitation:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/motorLimitation.png";}
//BMS报警
    IconItem{objectName:"bmsAlarm";   visible:initialized?(CarMsg?CarMsg.bmsAlarm:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/bmsAlarm.png";}
//SOC过低报警
    IconItem{objectName:"socLowAlarm";   visible:initialized?(CarMsg?CarMsg.socLowAram:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/socLowAlarm.png";}
//安全系统报警
    IconItem{objectName:"safetyDoorAlarm";   visible:initialized?(CarMsg?CarMsg.safetySystemAlarm:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/safetyDoorAlarm.png";}
//无障碍踏步伸出报警
    IconItem{objectName:"barrierFreeAlarm";   visible:initialized?(CarMsg?CarMsg.barrierFreeMarchReach:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/barrierFreeAlarm.png";}
//充电门开报警
    IconItem{objectName:"gateChargeOpen";   visible:initialized?(CarMsg?CarMsg.gateChargeOpen:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/gateChargeOpen.png";}

//ECAS系统故障指示灯
    IconItem{objectName:"ecasSystemFault";   visible:initialized?(CarMsg?CarMsg.ecasSystemFaultLed:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/ecasSystemFault.png";}
//ECAS报警指示灯
    IconItem{objectName:"ecasIndicator";   visible:initialized?(CarMsg?CarMsg.ecasAlarmLed:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/ecasIndicator.png";}
//ECAS侧跪状态指示灯
    IconItem{objectName:"ecasSide";   visible:initialized?(CarMsg?CarMsg.ecasKneelingStatusLed:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/ecasSide.png";}
//ECAS特殊高度指示灯
    IconItem{objectName:"ecasHeight";   visible:initialized?(CarMsg?CarMsg.ecasSpecialHeightLed:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/ecasHeight.png";}
//下客门铃
    IconItem{objectName:"doorBell";   visible:initialized?(CarMsg?CarMsg.dropOffDoorbell:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/doorBell.png";}
//前门应急控制器报警
    IconItem{objectName:"frontControlAlarm";   visible:initialized?(CarMsg?CarMsg.frontDoorExigencyAlarm:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/frontControlAlarm.png";}
//中门应急控制器报警
    IconItem{objectName:"middleControlAlarm";   visible:initialized?(CarMsg?CarMsg.middleDoorExigencyAlarm:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/middleControlAlarm.png";}

//除霜器1档位工作指示
    IconItem{objectName:"defroster";   visible:initialized?(CarMsg?CarMsg.lampDefroster1:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/defroster.png";}
//车辆低速警示音关闭
    IconItem{objectName:"lampLowSpeedClose";   visible:initialized?(CarMsg?CarMsg.lampLowSpeedClose:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/lampLowSpeedClose.png";}
//灯光总开关
    IconItem{objectName:"lampMainSwitch";   visible:initialized?(CarMsg?CarMsg.lampMainSwitch:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/lampMainSwitch.png";}
//胎压异常报警
    IconItem{objectName:"tirePressure";   visible:initialized?(CarMsg?CarMsg.lampTirePreFault:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/tirePressure.png";}
//动力蓄电池高温
    IconItem{objectName:"lampBatHigtTemp";   visible:initialized?(CarMsg?CarMsg.lampBatHigtTemp:false):false;  x:761;y:12;    source:sourceImageUrl+"Image/IndicatorPanel/lampBatHigtTemp.png";}

}

import QtQuick 2.0
import "qrc:/Common/Component"

CommonItem {
    id:root
    width:1440
    height:540
    z:100

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string lampWaterTempImage:sourceImageUrl+"Image/IndicatorPanel/waterTempWarn.png";
    property string lampChargeIndicator:sourceImageUrl+"Image/IndicatorPanel/lamp_chargeIndicator.png";
    property string lampDangerImage:sourceImageUrl+"Image/IndicatorPanel/lamp_danger.png";
    property string lampPositionLightImage:sourceImageUrl+"Image/IndicatorPanel/lamp_positionLight.png";
    property string lampHeadlightImage:sourceImageUrl+"Image/IndicatorPanel/lamp_headlight.png";
    property string seatBeltLightImage:sourceImageUrl+"Image/IndicatorPanel/seatBeltLight.png";
    property string driverSeatAlarmImage:sourceImageUrl+"Image/IndicatorPanel/driverSeatAlarm.png";
    property string lampHighBeamImage:sourceImageUrl+"Image/IndicatorPanel/lamp_highBeam.png";
    property string lampWaterLevelImage:sourceImageUrl+"Image/IndicatorPanel/lamp_waterLevel.png";
    property string lampDoor1Image:sourceImageUrl+"Image/IndicatorPanel/lamp_door1.png";
    property string arrowReadyLeftImage:sourceImageUrl+"Image/MiddlePanel/wait.png";
    property string arrowReadyRightImage:sourceImageUrl+"Image/MiddlePanel/ready_arrow_right.png";
    property string lampFrontFogImage:sourceImageUrl+"Image/IndicatorPanel/lamp_frontFog.png";
    property string lampRearFogImage:sourceImageUrl+"Image/IndicatorPanel/lamp_rearFog.png";
    property string lampDoor2Image:sourceImageUrl+"Image/IndicatorPanel/lamp_door2.png";
    property string lampLeftFrictionImage:sourceImageUrl+"Image/IndicatorPanel/lamp_leftFriction.png";
    property string lampRightFrictionImage:sourceImageUrl+"Image/IndicatorPanel/lamp_rightFriction.png";
    property string lampChargePluginImage:sourceImageUrl+"Image/IndicatorPanel/lamp_chargePlugin.png";
    property string batteryCutImage:sourceImageUrl+"Image/IndicatorPanel/batteryCut.png";
    property string batteryFaultImage:sourceImageUrl+"Image/IndicatorPanel/batteryFault.png";
    property string leftHatchDoorAlarmImage:sourceImageUrl+"Image/IndicatorPanel/leftHatchDoorAlarm.png";
    property string rightHatchDoorAlarmImage:sourceImageUrl+"Image/IndicatorPanel/rightHatchDoorAlarm.png";

    Repeater{
        id:repaaterlist
        Image{
            objectName: name
            x:xAxis
            y:yAxis
            source:imgsource
            visible: true
        }
        model:ListModel{
            ListElement{name:"lamp_waterTemp";xAxis:"25";yAxis:"144";imgsource:lampWaterTempImage}
            ListElement{name:"lamp_chargeIndicator";xAxis:"14";yAxis:"304";imgsource:lampChargeIndicator}
            ListElement{name:"lamp_danger";xAxis:"30";yAxis:"363";imgsource:lampDangerImage}
            ListElement{name:"lamp_positionLight";xAxis:"387";yAxis:"14";imgsource:lampPositionLightImage}
            ListElement{name:"lamp_headlight";xAxis:"550";yAxis:"15";imgsource:lampHeadlightImage}
            ListElement{name:"seatBeltLight";xAxis:"630";yAxis:"15";imgsource:seatBeltLightImage}
            ListElement{name:"driverSeatAlarm";xAxis:"761";yAxis:"12";imgsource:driverSeatAlarmImage}
            ListElement{name:"lamp_highBeam";xAxis:"821";yAxis:"10";imgsource:lampHighBeamImage}
            ListElement{name:"lamp_waterLevel";xAxis:"970";yAxis:"9";imgsource:lampWaterLevelImage}
            ListElement{name:"lamp_door1";xAxis:"500";yAxis:"75";imgsource:lampDoor1Image}
            ListElement{name:"lamp_frontFog";xAxis:"560";yAxis:"77";imgsource:lampFrontFogImage}
            ListElement{name:"lamp_rearFog";xAxis:"821";yAxis:"77";imgsource:lampRearFogImage}
            ListElement{name:"lamp_door2";xAxis:"875";yAxis:"75";imgsource:lampDoor2Image}
            ListElement{name:"lamp_leftFriction";xAxis:"283";yAxis:"140";imgsource:lampLeftFrictionImage}
            ListElement{name:"lamp_rightFriction";xAxis:"1097";yAxis:"140";imgsource:lampRightFrictionImage}
            ListElement{name:"lamp_chargePlugin";xAxis:"1380";yAxis:"146";imgsource:lampChargePluginImage}
            ListElement{name:"batteryCut";xAxis:"1384";yAxis:"303";imgsource:batteryCutImage}
            ListElement{name:"batteryFault";xAxis:"1355";yAxis:"370";imgsource:batteryFaultImage}
            ListElement{name:"leftHatchDoorAlarm";xAxis:"439";yAxis:"113";imgsource:leftHatchDoorAlarmImage}
            ListElement{name:"rightHatchDoorAlarm";xAxis:"931";yAxis:"113";imgsource:rightHatchDoorAlarmImage}
        }
    }

}

import QtQuick 2.0
import "qrc:/Common/Component"

CommonItem {
    id:root
    width:1440
    height:540
    z:100

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string arrowReadyLeftImage:sourceImageUrl+"Image/MiddlePanel/wait.png";
    property string arrowReadyRightImage:sourceImageUrl+"Image/MiddlePanel/ready_arrow_right.png";

    Repeater{
        id:repaaterlist
        Image{
            objectName: name
            x:xAxis
            y:yAxis
            source:sourceImageUrl + imgsource
            visible: true
        }
        model:ListModel{
            ListElement{name:"lamp_waterTemp";xAxis:"25";yAxis:"144";imgsource:"Image/IndicatorPanel/waterTempWarn.png";}
            ListElement{name:"lamp_chargeIndicator";xAxis:"14";yAxis:"304";imgsource:"Image/IndicatorPanel/lamp_chargeIndicator.png"}
            ListElement{name:"lamp_danger";xAxis:"30";yAxis:"363";imgsource:"Image/IndicatorPanel/lamp_danger.png"}
            ListElement{name:"lamp_positionLight";xAxis:"387";yAxis:"14";imgsource:"Image/IndicatorPanel/lamp_positionLight.png"}
            ListElement{name:"lamp_headlight";xAxis:"550";yAxis:"15";imgsource:"Image/IndicatorPanel/lamp_headlight.png"}
            ListElement{name:"seatBeltLight";xAxis:"630";yAxis:"15";imgsource:"Image/IndicatorPanel/seatBeltLight.png"}
            ListElement{name:"driverSeatAlarm";xAxis:"761";yAxis:"12";imgsource:"Image/IndicatorPanel/driverSeatAlarm.png"}
            ListElement{name:"lamp_highBeam";xAxis:"821";yAxis:"10";imgsource:"Image/IndicatorPanel/lamp_highBeam.png"}
            ListElement{name:"lamp_waterLevel";xAxis:"970";yAxis:"9";imgsource:"Image/IndicatorPanel/lamp_waterLevel.png"}
            ListElement{name:"lamp_door1";xAxis:"500";yAxis:"75";imgsource:"Image/IndicatorPanel/lamp_door1.png"}
            ListElement{name:"lamp_frontFog";xAxis:"560";yAxis:"77";imgsource:"Image/IndicatorPanel/lamp_frontFog.png"}
            ListElement{name:"lamp_rearFog";xAxis:"821";yAxis:"77";imgsource:"Image/IndicatorPanel/lamp_rearFog.png"}
            ListElement{name:"lamp_door2";xAxis:"875";yAxis:"75";imgsource:"Image/IndicatorPanel/lamp_door2.png"}
            ListElement{name:"lamp_leftFriction";xAxis:"283";yAxis:"140";imgsource:"Image/IndicatorPanel/lamp_leftFriction.png"}
            ListElement{name:"lamp_rightFriction";xAxis:"1097";yAxis:"140";imgsource:"Image/IndicatorPanel/lamp_rightFriction.png"}
            ListElement{name:"lamp_chargePlugin";xAxis:"1380";yAxis:"146";imgsource:"Image/IndicatorPanel/lamp_chargePlugin.png"}
            ListElement{name:"batteryCut";xAxis:"1384";yAxis:"303";imgsource:"Image/IndicatorPanel/batteryCut.png"}
            ListElement{name:"batteryFault";xAxis:"1355";yAxis:"370";imgsource:"Image/IndicatorPanel/batteryFault.png"}
            ListElement{name:"leftHatchDoorAlarm";xAxis:"439";yAxis:"113";imgsource:"Image/IndicatorPanel/leftHatchDoorAlarm.png"}
            ListElement{name:"rightHatchDoorAlarm";xAxis:"931";yAxis:"113";imgsource:"Image/IndicatorPanel/rightHatchDoorAlarm.png"}
        }
    }

}

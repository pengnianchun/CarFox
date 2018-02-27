import QtQuick 2.0

Item {
    id:root
    width:1440
    height:540
    z:100

    Repeater{
        id:repaaterlist
        Image{
            objectName: name
            x:xAxis
            y:yAxis
            source:imgsource
            visible: false
        }
        model:ListModel{
            ListElement{name:"lamp_waterTemp";xAxis:"25";yAxis:"144";imgsource:"qrc:/Theme/Theme3/Image/IndicatorPanel/waterTempWarn.png"}
            ListElement{name:"lamp_chargeIndicator";xAxis:"19";yAxis:"304";imgsource:"qrc:/Theme/Theme3/Image/IndicatorPanel/lamp_chargeIndicator.png"}
            ListElement{name:"lamp_danger";xAxis:"30";yAxis:"368";imgsource:"qrc:/Theme/Theme3/Image/IndicatorPanel/lamp_danger.png"}
            ListElement{name:"lamp_positionLight";xAxis:"387";yAxis:"18";imgsource:"qrc:/Theme/Theme3/Image/IndicatorPanel/lamp_positionLight.png"}
            ListElement{name:"lamp_positionLight";xAxis:"557";yAxis:"20";imgsource:"qrc:/Theme/Theme3/Image/IndicatorPanel/lamp_headlight.png"}
        }
    }

}

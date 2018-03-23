import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"
import "qrc:/Common/JS/AlarmCode.js" as AlarmInfoCode
//import TransformRing 1.0

CommonItem {
    id: homeIndex
    width: 1440
    height: 544
    visible: false
    state: ""

    property real airPressure1: CarMsg.apVol1
    property real airPressure2: CarMsg.apVol2
    property real airPressure1Total: 1.2
    property real airPressure2Total: 1.2
    property bool bKeyEnable: true

    property string sourceImageUrl: "qrc:/Theme/Theme1/Image/HomePanel/"
    property string gearImageUrl: sourceImageUrl + "P.png"
    //车速初始值/蓄电池电压
    property int speedTotal: 180;
    property int carSpeedValue: CarMsg.carSpeed;
    property int carSpeedValueStart: 0;
    property int batteryTotalValue: 32;
    property int batteryValue: CarMsg.battery
    property int batteryValueStart: 16
    //档位初始值
    property real gearValue: CarMsg.gear
    //发动机转速/soc充电状态
    property int engineTotalSpeed: 100;
    property int engineSpeedValue: CarMsg.rpm;
    property int engineSpeedValueStart: 0;
    property int socTotalValue: 100;
    property int socValue: CarMsg.soc;
    property int socValueStart: 0
    //报警计数
    property int alarmCode: CarMsg.warningId;//0
    //动画过度时间
    property int excessiveDurationTime: 1000;//1000;
    property bool timerStatus: true;
    property bool bDisplay: true

    onGearValueChanged: {
        if(gearValue === 0){
            gear_control.source = sourceImageUrl + "D.png";
        }else if(gearValue === 1){
            gear_control.source = sourceImageUrl + "N.png";
        }else if(gearValue === 2){
            gear_control.source = sourceImageUrl + "P.png";
        }else if(gearValue === 3){
            gear_control.source = sourceImageUrl + "R.png";
        }else if(gearValue === 4){
            gear_control.source = sourceImageUrl + "S.png";
        }else{}
    }
    onAlarmCodeChanged: {
        var alarmCodeInfo = AlarmInfoCode.getAlarmCodeInfo()[alarmCode];
        alarm_info.textValue = alarmCodeInfo;
    }
    onVisibleChanged: {
        if(visible){
            homeIndex.state = "normal"
            CarMsg.sendEnableKeys(true);
        } else {
            CarMsg.sendEnableKeys(false);
        }
    }
    onStateChanged: {
        UiController.setLayerProperty("IndicatorPanel", "state", state);
    }
    onKeyEnter: function() {
        if(bKeyEnable) {
            UiController.showLayer("MenuPanel");
            UiController.setLayerProperty("HomePanel", "state", "menu");
            UiController.setLayerProperty("HomePanel", "bKeyEnable", false);
            UiController.setLayerProperty("MenuPanel", "state", "show");
            UiController.setLayerProperty("MenuPanel", "bKeyEnable", true);
            UiController.setLayerProperty("IndicatorPanel", "indicatorStatus", false);
            bKeyEnable = false;
        }
    }
    onBKeyEnableChanged: {
        if(bKeyEnable){
            main_panel.visible = true;
        }else{
            main_panel.visible = false;
        }
    }
    //报警码显示动画
    SequentialAnimation {
        loops: Animation.Infinite
        running: true
        PauseAnimation { duration: 2000 }
        PropertyAnimation{ target: alarm_info; property: "anchors.topMargin"; to: 245 ;duration: 100; easing.type: Easing.Linear; }
        PropertyAnimation{ target: alarm_info; property: "anchors.topMargin"; to: 255 ;duration: 100; easing.type: Easing.Linear; }
        PropertyAnimation{ target: alarm_info; property: "anchors.topMargin"; to: 250 ;duration: 50; easing.type: Easing.Linear; }
    }
    //车速/蓄电池电量
    NumberAnimation { id: speed_animation; target: homeIndex; property: "carSpeedValue"; duration: excessiveDurationTime; easing.type: Easing.Linear }
    NumberAnimation { id: battery_animation; target: homeIndex; property: "batteryValue"; duration: excessiveDurationTime; easing.type: Easing.Linear }
    onCarSpeedValueChanged: {
        if(typeof carSpeedValue === 'number' && carSpeedValue%1 === 0 && carSpeedValue <= speedTotal){
            setSpeedValue();
            canvas4.angleValue = 95 + (carSpeedValue/speedTotal)*260;
            canvas5.angleValue = 185 + (carSpeedValue/speedTotal)*180;
            canvas6.angleValue = 275 + (carSpeedValue/speedTotal)*80;
        }else{}
    }
    function setSpeedValue(){
        speed_animation.from = carSpeedValueStart;
        speed_animation.to = carSpeedValue;
        carSpeedValueStart = carSpeedValue;
        speed_animation.running = true;
    }
    onBatteryValueChanged: {
        if(typeof batteryValue === 'number' && batteryValue%1 === 0 && batteryTotalValue<= 32 && batteryTotalValue>=16){
            setBatteryValue();
            battery_panel.width = (batteryValue-16)/(batteryTotalValue-16)*260;
        }else{}
    }
    function setBatteryValue(){
        battery_animation.from = batteryValueStart;
        battery_animation.to = batteryValue;
        batteryValueStart = batteryValue;
        battery_animation.running = true;
    }
    //发动机转速/soc充电状态
    NumberAnimation { id: engine_animation; target: homeIndex; property: "engineSpeedValue"; duration: excessiveDurationTime; easing.type: Easing.Linear }
    NumberAnimation { id: soc_animation; target: homeIndex; property: "socValue"; duration: excessiveDurationTime; easing.type: Easing.Linear }
    onEngineSpeedValueChanged: {
        if(typeof engineSpeedValue === 'number' && engineSpeedValue%1 === 0 && engineSpeedValue <= engineTotalSpeed){
            setEngineSpeedValue();
            canvas1.angleValue = 95 + (engineSpeedValue/engineTotalSpeed)*260;
            canvas2.angleValue = 185 + (engineSpeedValue/engineTotalSpeed)*180;
            canvas3.angleValue = 275 + (engineSpeedValue/engineTotalSpeed)*80;
        }else{}
    }
    function setEngineSpeedValue(){
        engine_animation.from = engineSpeedValueStart;
        engine_animation.to = engineSpeedValue;
        engineSpeedValueStart = engineSpeedValue;
        engine_animation.running = true;
    }
    onSocValueChanged: {
        if(typeof socValue === 'number' && socValue%1 === 0 && socValue <= socTotalValue){
            setSocValue();
            soc_panel.width = (socValue/socTotalValue)*260;
        }else{}
    }
    function setSocValue(){
        soc_animation.from = socValueStart;
        soc_animation.to = socValue;
        socValueStart = socValue;
        soc_animation.running = true;
    }
    ParallelAnimation {
        id: startFlash
        running: false
        ParallelAnimation {
            NumberAnimation {
                target: topBar
                property: "y"
                duration: 800
                from: 1
                to: 28
                easing.type: Easing.Linear
            }
            NumberAnimation {
                target: baseBar
                property: "y"
                duration: 800
                from: 455
                to: 427
                easing.type: Easing.Linear
            }
        }
        ParallelAnimation {
            ParallelAnimation {
                NumberAnimation {
                    target: rpmBg
                    property: "opacity"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.Linear
                }
                NumberAnimation {
                    target: speedBg
                    property: "opacity"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.Linear
                }
            }
            ParallelAnimation {
                NumberAnimation {
                    target: rpmBg
                    property: "scale"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.InOutQuart
                }
                NumberAnimation {
                    target: speedBg
                    property: "scale"
                    duration: 800
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.InOutQuart
                }
            }
            ParallelAnimation {
                SequentialAnimation {
                    NumberAnimation { target: homeIndex; property: "carSpeedValue"; to:speedTotal; duration: 0 }
                    PauseAnimation { duration: 1500 }
                    NumberAnimation { target: homeIndex; property: "carSpeedValue"; to:0; duration: 0 }
                }
                SequentialAnimation {
                    NumberAnimation { target: homeIndex; property: "engineSpeedValue"; to:engineTotalSpeed; duration: 0 }
                    PauseAnimation { duration: 1500 }
                    NumberAnimation { target: homeIndex; property: "engineSpeedValue"; to:0; duration: 0 }
                }
                SequentialAnimation {
                    NumberAnimation { target: homeIndex; property: "batteryValue"; to:batteryTotalValue; duration: 0 }
                    PauseAnimation { duration: 1500 }
                    NumberAnimation { target: homeIndex; property: "batteryValue"; to:16; duration: 0 }
                }
                SequentialAnimation {
                    NumberAnimation { target: homeIndex; property: "socValue"; to:socTotalValue; duration: 0 }
                    PauseAnimation { duration: 1500 }
                    NumberAnimation { target: homeIndex; property: "socValue"; to:0; duration: 0 }
                }
                SequentialAnimation {
                    NumberAnimation { target: airPressure1Bar; property: "height"; from:0; to:122; duration: 800 }
                    NumberAnimation { target: airPressure1Bar; property: "height"; from:122; to:0; duration: 800 }
                }
                SequentialAnimation {
                    NumberAnimation { target: airPressure2Bar; property: "height"; from:0; to:122; duration: 800 }
                    NumberAnimation { target: airPressure2Bar; property: "height"; from:122; to:0; duration: 800 }
                }
            }
        }
        ScriptAction {
            script: {
                //carSpeedValue = 0;
                //engineSpeedValue = 0;
                //batteryValue = 0;
                //socValue = 0
                UiController.showLayer("IndicatorPanel");
            }
        }
    }
    Rectangle { id: backgroundImage; anchors.fill: parent; color: "black" }
    Image {
        id: topBar
        x: 324; y: 18
        rotation: 180
        opacity: 1.0
        source: sourceImageUrl + "baseBar.png"
    }
    Image {
        id: baseBar
        x: 330; y: 447
        opacity: 1.0
        source: sourceImageUrl + "baseBar.png"
    }
    Image {
        id: readyStatus
        x: 623; y: 96
        visible: homeIndex.state === "normal" ? CarMsg.ready : false
        source: sourceImageUrl + "ready.png"
    }
    Image {
        id: stopStatus
        x: 623; y: 96
        visible: homeIndex.state === "normal" ? CarMsg.wait : false
        source: sourceImageUrl + "wait.png"
    }
    Image {
        id: waitStatus
        x: 623; y: 96
        visible: homeIndex.state === "normal" ? CarMsg.stop : false
        source: sourceImageUrl + "stop.png"
    }
    Image {
        id: leftBgImage
        x: 20; z: 2
        source: sourceImageUrl + "leftBg.png"
        Image {
            id: rpmBg
            x: -20; y: 2; z: 3
            opacity: 0.0
            scale: 0.6
            source: sourceImageUrl + "rpmBg.png"
            Item {
                x: 100
                y: 130
                width: 200
                height: 100
                TextFieldWeir {
                    id: rpmNum
                    anchors.centerIn: parent
                    textValue: engineSpeedValue > engineTotalSpeed ? engineTotalSpeed.toFixed(0) : engineSpeedValue.toFixed(0)
                    fontSize: 90
                }
            }
        }
        //soc充电状态
        Item {
            id: soc_panel
            width: 0//260
            height: 200
            clip: true
            x: 116; y: 336; z: 3
            Image {
                id: socImg
                source: sourceImageUrl + "socValue.png"
            }
        }
        Image {
            id: socBg
            x: 116; y: 336; z: 4
            source: sourceImageUrl + "socBg.png"
            TextFieldWeir {
                id: soValue
                x: 82
                y: 47
                textValue: socValue > socTotalValue ? socTotalValue.toFixed(0) : socValue.toFixed(0)
                fontColor: "#18fd00"
            }
        }
        //发动机转速表盘动画
        CanvasViewWeir { id: canvas1; z: 2; width: 500; height: 500; angleValue: 95 }
        CanvasViewWeir { id: canvas2; z: 2; width: 500; height: 500; angleValue: 185 }
        CanvasViewWeir { id: canvas3; z: 2; width: 500; height: 500; angleValue: 275 }
        Item {
            id: rpmProgressBar
            z: 1
            clip: true
            width: 500
            height: 500//(carSpeedValue>=0) ? 122*carSpeedValue : 0
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 0 }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
            Image {
                x: 14; y: 38;
                source: (canvas2.angleValue>305) ? sourceImageUrl + "leftHalo_red.png" : sourceImageUrl + "leftHalo.png"
            }
        }
    }
    Image {
        id: rightBgImage
        x: 876; z: 2
        source: sourceImageUrl + "rightBg.png"
        Image {
            id: speedBg
            x: 24; y: 2; z: 3
            opacity: 0.0
            scale: 0.6
            source: sourceImageUrl + "speedBg.png"
            Item {
                x: 100
                y: 130
                width: 200
                height: 100
                TextFieldWeir {
                    id: speedNum
                    anchors.centerIn: parent
                    textValue: carSpeedValue > speedTotal ? speedTotal.toFixed(0) : carSpeedValue.toFixed(0)
                    fontSize: 90
                }
            }
        }
        //蓄电池电量
        Item {
            id: battery_panel
            width: 0//260
            height: 200
            clip: true
            x: 160; y: 336; z: 3
            Image {
                id: batImg
                source: sourceImageUrl + "batteryValue.png"
            }
        }
        Image {
            id: batBg
            x: 160; y: 336; z: 4
            source: sourceImageUrl + "batteryBg.png"
            TextFieldWeir {
                id: batValue
                x: 62; y: 25
                textValue: batteryValue > batteryTotalValue ? batteryTotalValue.toFixed(0) : batteryValue.toFixed(0)
                fontSize: 24
            }
        }
        //速度值表盘动画
        CanvasViewWeir { id: canvas4; x: 46.5; z: 2; width: 500; height: 500; angleValue: 95 }
        CanvasViewWeir { id: canvas5; x: 46.5; z: 2; width: 500; height: 500; angleValue: 185 }
        CanvasViewWeir { id: canvas6; x: 46.5; z: 2; width: 500; height: 500; angleValue: 275 }
        Item {
            id: speedProgressBar
            z: 1
            clip: true
            width: 500
            height: 500
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 0 }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
            Image {
                x: 62; y: 40;
                source:(canvas5.angleValue>305) ? sourceImageUrl + "rightHalo_red.png" : sourceImageUrl + "rightHalo.png"
            }
        }
    }
    //空气压力进度条
    Image {
        id: leftBg
        y: 360
        opacity: 1.0
        source: sourceImageUrl + "leftRing.png"
        Item {
            id: airPressure1Bar
            x: 1
            width: 135
            height: (airPressure1>=0) ? 122*airPressure1/airPressure1Total : 0
            clip: true
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
            Image {
                transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: -180 }
                source: (airPressure1Bar.height>73) ? sourceImageUrl + "leftUpFull.png" : sourceImageUrl + "leftUp.png"
            }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
        }
    }
    Image {
        id: rightBg
        x: 1272; y: 360
        opacity: 1.0
        source: sourceImageUrl + "rightRing.png"
        Item {
            id: airPressure2Bar
            x: -1
            width: 155
            height: (airPressure2>=0) ? 122*airPressure2/airPressure2Total : 0
            clip: true
            transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
            Image {
                transform: Rotation { origin.x: 42; origin.y: 78.5; axis { x: 1; y: 0; z: 0 } angle: 180 }
                source: (airPressure2Bar.height>73) ? sourceImageUrl + "rightUpFull.png" : sourceImageUrl + "rightUp.png"
            }
            Behavior on height { SpringAnimation { spring: 2; damping: 0.3; duration: 500 } }
        }
    }
    //空气压力
    Item {
        id: airPressure1Dispaly
        x: -20; y: 496
        width: 100
        height: 100
        TextFieldWeir {
            id: charAirPress1
            fontSize: 15
            textValue: qsTr("%1 Mpa").arg((airPressure1).toFixed(1))
        }
    }
    Item {
        id: airPressure2Dispaly
        x: 1320; y: 496
        width: 100
        height: 100
        TextFieldWeir {
            id: charAirPress2
            fontSize: 15
            textValue: qsTr("%1 Mpa").arg((airPressure2).toFixed(1))
        }
    }
    //主页面信息
    ColumnLayout {
        id: main_panel
        z: 1
        anchors.top: parent.top
        anchors.topMargin: 160
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        property string totlaAmpere: CarMsg.totalCurrent.toFixed(1)
        property string totlaVolt: CarMsg.totalVoltage.toFixed(1)
        property string singleVoltMax: CarMsg.aloneBatteryHighVoltage.toFixed(1)
        property string singleVoltMin: CarMsg.aloneBatteryLowVoltage.toFixed(1)
        property string singleTemperatureMax: CarMsg.batteryHighTemperature
        property string singleTemperatureMin: CarMsg.batteryLowTemperature
        property string batteryPackValue: CarMsg.batteryPackEnergy.toFixed(1)
        property string motorTemperature: CarMsg.moterTemp
        property string controlTemperature: CarMsg.moterControlTemp
        property string coolingTemperature: CarMsg.engineWaterTemp
        TextValueWeir {
            width: 420
            height: 30
            textTitle: "电池总电流与总电压"
            textValue: main_panel.totlaAmpere + " A / "
                       + main_panel.totlaVolt + " V"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 420
            fontSize: 18
            leftAlignStatus: true
            leftMarginValue: 90
        }
        TextValueWeir {
            width: 420
            height: 30
            textTitle: "单体电压最高最低"
            textValue: main_panel.singleVoltMax + " V / "
                       + main_panel.singleVoltMin + " V"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 420
            fontSize: 18
            leftAlignStatus: true
            leftMarginValue: 90
        }
        TextValueWeir {
            width: 420
            height: 30
            textTitle: "单体温度最高最低"
            textValue: main_panel.singleTemperatureMax + " ℃ / "
                       + main_panel.singleTemperatureMin + " ℃"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 420
            fontSize: 18
            leftAlignStatus: true
            leftMarginValue: 90
        }
        TextValueWeir {
            width: 420
            height: 30
            textTitle: "电池组当前电量值"
            textValue: main_panel.batteryPackValue + " Kw.h"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 420
            fontSize: 18
            leftAlignStatus: true
            leftMarginValue: 90
        }
        TextValueWeir {
            width: 420
            height: 30
            textTitle: "电机与控制器温度"
            textValue: main_panel.motorTemperature + " ℃ / "
                       + main_panel.controlTemperature + " ℃"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 420
            fontSize: 18
            leftAlignStatus: true
            leftMarginValue: 90
        }
        TextValueWeir {
            width: 420
            height: 30
            textTitle: "冷却液温度"
            textValue: main_panel.coolingTemperature + " ℃"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 420
            fontSize: 18
            leftAlignStatus: true
            leftMarginValue: 90
        }
        //档位
        Image{
            id: gear_control
            source: gearImageUrl
            anchors.right: parent.right
            anchors.rightMargin: -50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 150
        }
        //报警
        TextFieldWeir {
            id: alarm_info
            textOpacity: 1
            textWidth: 300
            anchors.left: parent.left
            anchors.leftMargin: 60
            anchors.top: parent.top
            anchors.topMargin: -10
            fontColor: "#fb4a52"
            fontBold: true
            fontSize: 18
            textValue: qsTr("")
        }
    }
    //时间
    TimeHMSWeir {
        id: hmsDisplay
        x: 950; y: 428
        hourValue: "00"
        spaceValue: ":"
        minuteValue: "00"
    }
    TimeInfoWeir {
        id: timeInfo
        x: 460; y: 438
        visible: true
        onHourChanged: {
            hmsDisplay.hourValue = qsTr("%1").arg(hour)
        }
        onMinuteChanged: {
            hmsDisplay.minuteValue = qsTr("%1").arg(minute);
        }
        onSecondChanged: {
            if(bDisplay) {
                hmsDisplay.spaceValue = ":";
            } else {
                hmsDisplay.spaceValue = " ";
            }
            bDisplay = !bDisplay
        }
        onWeekChanged: {
            //weekDisplay.textValue = qsTr("%1").arg(week);
        }
    }
    //FooterPanel信息
    TextFieldWeir {
        id: tripDisplay
        x: 415; y: 480
        fontSize: 15
        textValue: qsTr("小计里程 %1 Km").arg(CarMsg.trip)
    }
    TextFieldWeir {
        id: device_code
        x: 660; y: 480
        fontSize: 15
        textValue: qsTr("设备代码 %1").arg(CarMsg.faultCode)
    }
    TextFieldWeir {
        id: odoDisplay
        x: 892; y: 480
        fontSize: 15
        textValue: qsTr("总里程 %1 Km").arg(CarMsg.odo)
    }
    states: [
        State {
            name: ""
            PropertyChanges { target: leftBgImage;  opacity: 0.0; y: 60; scale: 0.0 }
            PropertyChanges { target: rightBgImage; opacity: 0.0; y: 60; scale: 0.0 }
        },
        State {
            name: "normal"
            PropertyChanges { target: leftBgImage;  opacity: 1.0; x:  20; y: 0; scale: 1.0 }
            PropertyChanges { target: rightBgImage; opacity: 1.0; x: 876; y: 0; scale: 1.0 }
        },
        State {
            name: "menu"
            PropertyChanges { target: leftBgImage;  opacity: 1.0; x: -26; y: 60; scale: 0.75 }
            PropertyChanges { target: rightBgImage; opacity: 1.0; x: 922; y: 60; scale: 0.75 }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "normal"
            ParallelAnimation{
                ScriptAction {
                    script: { startFlash.running = true }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"
            ParallelAnimation {
                NumberAnimation {
                    target: leftBgImage
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
                NumberAnimation {
                    target: rightBgImage
                    properties: "x, y, scale"
                    duration: 800
                    easing.type: Easing.OutBounce
                }
            }
        },
        Transition {
            from: "menu"
            to: "normal"
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation {
                        target: leftBgImage
                        properties: "x, y, scale"
                        duration: 800
                        easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: rightBgImage
                        properties: "x, y, scale"
                        duration: 800
                        easing.type: Easing.OutBounce
                    }
                }
                ScriptAction {
                    script: { UiController.setLayerProperty("IndicatorPanel", "indicatorStatus", true) }
                }
            }
        }
    ]
    Component.onCompleted: {
        console.log("/--------------------------------------------/");
        console.log("/-------------Theme 1 is Active--------------/");
        console.log("/--------------------------------------------/");
        //homeIndex.state = "normal"
        //homeIndex.state = "menu"
    }
}

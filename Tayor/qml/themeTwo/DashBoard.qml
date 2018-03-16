import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: dashboard
    width:  1440
    height: 544

    Image {
        id: background
        anchors.fill: parent
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/background.png"
    }

    Image {
        id: topBar
        x:  0
        y:  30
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/topBar.png"
    }

    Image {
        id: bottomBar
        x:  0
        y:  465
        opacity: 1.0
        source: "qrc:/images/theme2/images/themeTwo/HomePanel/bottomBar.png"
    }

    CenterPanel {
        id: centerPanelControl
    }

    DecorationPanel {
        id: decorationPanelControl
    }

    Text {
        id: weekDisplay
        opacity: 1.0
        x: 360
        y: 40
        width:76
        text: "Wednesday"
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: hourDisplay
        opacity: 1.0
        x: 458
        y: 40
        width: 120
        text: "12"
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: spaceDisplay
        opacity: 1.0
        x: 495
        y: 38
        text: ":"
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: minuteDisplay
        opacity: 1.0
        x: 510
        y: 40
        width: 120
        text: "00"
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: dayWeekDisplay
        opacity: 1.0
        x: 900
        y: 38
        text: "Wednesday"
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
    }

    TimeInfo {
        id: timeInfo
        visible: false
        property bool bDisplay: true
        onDayChanged: {
            dayWeekDisplay.text = qsTr("%1 - %2 - %3").arg(year).arg(month).arg(day);
        }

        onHourChanged: {
            hourDisplay.text = qsTr("%1").arg(hour)
        }

        onMinuteChanged: {
            minuteDisplay.text = qsTr("%1").arg(minute);
        }

        onSecondChanged: {
            if(bDisplay) {
                spaceDisplay.text = ":";
            } else {
                spaceDisplay.text = "";
            }
            bDisplay = !bDisplay
        }

        onWeekChanged: {
            weekDisplay.text = qsTr("%1").arg(week);
            dayWeekDisplay.text = qsTr("%1 - %2 - %3").arg(year).arg(month).arg(day);
        }
    }

    Item {
        id: oilPressValue
        x: 202
        y: 42
        Image {
            y:2
            id: oilPress
            opacity: 1.0
            source: "qrc:/images/common/images/common/Indicator/oilPressureValue.png"
        }
        Text{
            x: 60
            text: qsTr(" %1 KPa").arg(CarStatus.engine_oil_pressure.toFixed(0))
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
        }
    }

    Item {
        id: waterTempValue
        x: 1100
        y: 37
        Image {
            id: waterTemp
            y: -10
            opacity: 1.0
            source: "qrc:/images/common/images/common/Indicator/waterTempValue.png"
        }
        Text{
            x: 60
            text: qsTr(" %1 ℃").arg(CarStatus.engine_water_temp.toFixed(0))
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
        }
    }

    Text {
        id: odoDisplay
        opacity: 1.0
        x: 32
        y: 489
        width: 140
        text: qsTr("总里程  %1 Km").arg(CarStatus.odo.toFixed(0))
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: tripDisplay
        opacity: 1.0
        x: 1268
        y: 489
        width: 140
        text: qsTr("小计里程  %1 Km").arg(CarStatus.trip.toFixed(1))
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignRight
    }

    Text {
        id: spnDisplay
        opacity: 1.0
        x: 32
        y: 37
        width: 140
        text: qsTr("SPN  %1 ").arg(setTextDisplay(CarStatus.SPN))
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: systemCode
        opacity: 1.0
        x: 1268
        y: 37
        width: 140
        text: qsTr("系统代码  %1").arg(CarStatus.fault_code)
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignRight
    }

    Text {
        id: motorCtlTemp
        opacity: 1.0
        x: 432
        y: 489
        width: 140
        text: qsTr("电机/控制器 %1℃/%2℃ ").arg(CarStatus.moter_temp.toFixed(0)).arg(CarStatus.moter_control_temp.toFixed(0))
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignRight
    }

    Text {
        id: levelDisplay
        opacity: 1.0
        x: 868
        y: 489
        width: 140
        text: qsTr("尿素液位 %1% ").arg(CarStatus.urea_level.toFixed(1))
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }

    Image {
        id: lamp_oilfuel
        x: 1066
        y: 483
        source: "qrc:/images/theme2/images/themeTwo/DialPanel/oil.png"
    }

    Text {
        id: oilfuelValue
        opacity: 1.0
        x: lamp_oilfuel.x+45
        y: 490
        width: 140
        text: qsTr("%1%").arg(CarStatus.oil_level.toFixed(0))
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 18
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: slopeDisplay
        opacity: CarStatus.climbing_mode
        x: 910
        y: 380
        width: 120
        height: 320
        text: qsTr("爬坡模式")
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.italic: true
        font.pointSize: 15
        color: "red"
    }

    Text {
        id: diagDisplay
        opacity: CarStatus.diagnostic_mode
        x: 880
        y: 420
        width: 120
        height: 320
        text: qsTr("诊断模式")
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.italic: true
        font.pointSize: 15
        color: "red"
    }

    Text {
        id: modeDisplay
        opacity: 1.0
        x: 1070
        y: 400
        width: 120
        height: 320
        text: CarStatus.power_supply
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.pointSize: 25
        color: "#00FF00"
    }

    TipsInfo{
        id: tipsInfo
        x: -400
        state: ""
        onTipsCountsChanged: {
            if(tipsCounts >= 1) {
                tipsInfo.state = "show";
            } else {
                tipsInfo.state = "";
            }
        }
    }

    IndicatorLamp {
        id: indicatorLampIndex
        state: ""
    }

    function setTextDisplay(currentValue) {
        var value = currentValue.toString(16).toLocaleUpperCase()
        return value
    }

    MenuPanel {
        id: menuPanel
        state: ""
        onStateChanged: {
            if( state == "" ) {
                dashboard.state = "normal";
            } else {
                dashboard.state = "menu";
            }
        }
        onMenuFlagChanged: {
            if(menuFlag === true) {
                topBar.opacity = 0.0
                bottomBar.opacity = 0.0
            } else {
                topBar.opacity = 1.0
                bottomBar.opacity = 1.0
            }
        }
        onSendMenuState: {
            if(menuState === "" || menuState === "show") {
                centerPanelControl.state = "normal"
            } else if(menuState === "subshow") {
                centerPanelControl.state = "menu"
            }
        }
        onSendUTCSetToTime:{
            menuPanel.utcTimeSetValue = utcTime;
        }
    }

    states: [
        State {
            name: ""
        },
        State {
            name: "normal"
        },
        State {
            name: "menu"
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "normal"
            ParallelAnimation {
                ParallelAnimation{
                    PropertyAnimation { target: indicatorLampIndex;  property: "state"; from: "";  to: "show";  duration: 10}
                    PropertyAnimation { target: centerPanelControl;  property: "state"; from: "";  to: "normal";}
                    PropertyAnimation { target: decorationPanelControl;  property: "state"; from: "";  to: "show";  duration: 500}


                }
                ScriptAction {
                    script: {
                        menuPanel.setKeyEnable(1)
                        emit: CarStatus.notifyEnableKey(true)
                    }
                }
            }
        },
        Transition {
            from: "normal"
            to: "menu"
        },
        Transition {
            from: "menu"
            to: "normal"
        }
    ]




}

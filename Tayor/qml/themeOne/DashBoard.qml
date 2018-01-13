import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: dashboard
    width:  1440
    height: 544

    property bool bDisplay: true
    property int slopeModeState: CarStatus.climbing_mode
    property int diagModeState: CarStatus.diagnostic_mode
    property string driveModeState: CarStatus.power_supply

    onSlopeModeStateChanged: {
        if(dashboard.state != "menu") {
            if(slopeModeState === 1) {
                slopeDisplay.opacity = 1.0
            }  else {
                slopeDisplay.opacity = 0.0
            }
        } else {
            slopeDisplay.opacity = 0.0
            diagDisplay.opacity = 0.0
        }
    }

    onDiagModeStateChanged: {
        if(dashboard.state != "menu") {
            if(diagModeState === 1) {
                diagDisplay.opacity = 1.0
            }  else {
                diagDisplay.opacity = 0.0
            }
        } else {
            slopeDisplay.opacity = 0.0
            diagDisplay.opacity = 0.0
        }
    }

    Rectangle {
        id: backgroundImage
        width:  1440
        height: 544
        color:  "#09061F"  //color: "black"

        Image {
            id: topBar
            x:  325
            y:  32
            rotation: 180
            opacity: 0.0
            source: "qrc:/images/theme1/images/themeOne/HomePanel/baseBar.png"
        }

        Image {
            id: farRoad
            x:  360
            y:  30
            width: 780
            opacity: 0.0
            source: "qrc:/images/theme1/images/themeOne/HomePanel/farRoad.png"
        }

        Image {
            id: baseRoad
            x:  390
            y:  280
            opacity: 0.0
            source: "qrc:/images/theme1/images/themeOne/HomePanel/baseRoad.png"
        }

        Image {
            id: baseBar
            x:  325
            y:  480
            opacity: 0.0
            source: "qrc:/images/theme1/images/themeOne/HomePanel/baseBar.png"
        }
    }

    Text {
        id: hourDisplay
        opacity: 0.0
        x: 595
        y: 152
        width: 120
        text: "12"
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: spaceDisplay
        opacity: 0.0
        x: 629
        y: 150
        text: ":"
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: minuteDisplay
        opacity: 0.0
        x: 640
        y: 152
        width: 120
        text: "00"
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 18
        color: "white"
    }

    Text {
        id: dateDisplay
        opacity: 0.0
        x: 635
        y: 152
        text: "2017-01-01"
        visible: false
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 12
        color: "white"
    }

    Text {
        id: dayWeekDisplay
        opacity: 0.0
        x: 700
        y: 157
        text: "Wednesday"
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 13
        color: "white"
    }

    TimeInfo {
        id: timeInfo
        visible: false
        utcDateTime: menuPl.utcTimeSetValue
        onDayChanged: {
            dayWeekDisplay.text = qsTr("%2/%3/%1  %4").arg(year).arg(month).arg(day).arg(week);
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
            dayWeekDisplay.text = qsTr("%2/%3/%1  %4").arg(year).arg(month).arg(day).arg(week);
        }

        onUtcDateTimeChanged: {
            menuPl.utcTimeSetValue = timeInfo.getCurrentUTCTime();
        }
    }

    Text {
        id: slopeDisplay
        opacity: 0.0
        x: 500
        y: 112
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
        opacity: 0.0
        x: 820
        y: 112
        width: 120
        height: 320
        text: qsTr("诊断模式")
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.italic: true
        font.pointSize: 15
        color: "red"
    }

    MenuPanel {
        id: menuPl
        state: ""
        onStateChanged:{
            if( state == "" ) {
                dashboard.state = "normal";
                if(slopeModeState === 1) {
                    slopeDisplay.opacity = 1.0
                }  else {
                    slopeDisplay.opacity = 0.0
                }

                if(diagModeState === 1) {
                    diagDisplay.opacity = 1.0
                }  else {
                    diagDisplay.opacity = 0.0
                }
            } else {
                dashboard.state = "menu";
            }
        }
        onSendUTCSetToTime:{
            //console.log(" --- current utcTime = ", utcTime)
            menuPl.utcTimeSetValue = utcTime;
        }
    }

    RpmPanel {
        id: rpmPanel
        state: ""
        opacity: 0.0
        scale:   0.00
    }

    SpeedPanel {
        id: speedPanel
        state: ""
        opacity: 0.0
        scale:   0.00
    }

    IndicatorLamp{
        id: indicatorLamp
        state: ""
        onEnableLight: {
            rpmPanel.enableLight(flag)
            speedPanel.enableLight(flag)
        }
    }

    SwitchGear {
        id: switchGear
        state: ""
    }

    DecorationPanel {
        id: decorationPanel
        state: ""
    }

    CenterPanel {
        id: centerPanel
        state: ""
    }

    TipsInfo{
        id: tipsInfo
        state: ""
        onTipsCountsChanged: {
            if(tipsCounts >= 1) {
                tipsInfo.state = "show";
            } else {
                tipsInfo.state = "";
            }
        }
    }

    Text {
        id: odoDisplay
        opacity: 0.0
        x: 420
        y: 480
        width: 120
        text: qsTr("总里程 %1 Km").arg(CarStatus.odo.toFixed(0))
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 15
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: modeDisplay
        opacity: 1.0
        x: 660
        y: 100
        width: 120
        height: 320
        text: CarStatus.power_supply
        horizontalAlignment: Text.AlignHCenter
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 25
        color: "green"
    }

    Text {
        id: tripDisplay
        opacity: 0.0
        x: 892
        y: 480
        width: 120
        text: qsTr("小计里程 %1 Km").arg(CarStatus.trip.toFixed(1))
        font.family:FontName.fontCurrentFzLt
        font.italic: false
        font.pointSize: 15
        color: "white"
        horizontalAlignment: Text.AlignRight
    }

    onStateChanged: {
        if(dashboard.state != "menu") {

            modeDisplay.opacity = 1.0

            if(tipsInfo.tipsCounts >= 1) {
                tipsInfo.state = "show";
            } else {
                tipsInfo.state = "";
            }

            if(slopeModeState === 1) {
                slopeDisplay.opacity = 1.0
            }  else {
                slopeDisplay.opacity = 0.0
            }

            if(diagModeState === 1) {
                diagDisplay.opacity = 1.0
            }  else {
                diagDisplay.opacity = 0.0
            }

        } else if(dashboard.state === "menu"){

            modeDisplay.opacity = 0.0
            tipsInfo.state = "";

            slopeDisplay.opacity = 0.0
            diagDisplay.opacity = 0.0
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: baseRoad; opacity: 1.0}
            PropertyChanges { target: rpmPanel; state: ""}
            PropertyChanges { target: speedPanel; state: ""}
            PropertyChanges { target: farRoad; opacity: 0.0; y: 130}
            PropertyChanges { target: baseBar; opacity: 1.0; y: 425}
            PropertyChanges { target: topBar; opacity: 0.0; y: 32}
            PropertyChanges { target: odoDisplay; opacity: 0.0; }
            PropertyChanges { target: tripDisplay; opacity: 0.0; }
            PropertyChanges { target: hourDisplay; opacity: 0.0; }
            PropertyChanges { target: minuteDisplay; opacity: 0.0; }
            PropertyChanges { target: spaceDisplay; opacity: 0.0; }
            PropertyChanges { target: dayWeekDisplay; opacity: 0.0; }
            PropertyChanges { target: menuPl; state: ""}
            PropertyChanges { target: indicatorLamp; state: ""}
            PropertyChanges { target: decorationPanel; state: ""}
        },
        State {
            name: "normal"
            PropertyChanges { target: baseRoad; opacity: 1.0}
            PropertyChanges { target: rpmPanel; state: "normal"}
            PropertyChanges { target: speedPanel; state: "normal"}
            PropertyChanges { target: farRoad; opacity: 0.0; y: 130}
            PropertyChanges { target: baseBar; opacity: 1.0; y: 425}
            PropertyChanges { target: topBar; opacity: 1.0; y: 32}
            PropertyChanges { target: odoDisplay; opacity: 1.0; }
            PropertyChanges { target: tripDisplay; opacity: 1.0; }
            PropertyChanges { target: hourDisplay; opacity: 1.0; }
            PropertyChanges { target: minuteDisplay; opacity: 1.0; }
            PropertyChanges { target: spaceDisplay; opacity: 1.0; }
            PropertyChanges { target: dayWeekDisplay; opacity: 1.0; }
            PropertyChanges { target: menuPl; state: ""}
            PropertyChanges { target: centerPanel; state: "show"}
        },
        State {
            name: "menu"
            PropertyChanges { target: baseRoad; opacity: 0.0}
            PropertyChanges { target: rpmPanel; state: "menu"}
            PropertyChanges { target: speedPanel; state: "menu"}
            PropertyChanges { target: farRoad; opacity: 0.0; y: 30}
            PropertyChanges { target: baseBar; opacity: 1.0; y: 425}
            PropertyChanges { target: topBar; opacity: 0.0; y: 32}
            PropertyChanges { target: odoDisplay; opacity: 1.0; }
            PropertyChanges { target: tripDisplay; opacity: 1.0; }
            PropertyChanges { target: hourDisplay; opacity: 0.0; }
            PropertyChanges { target: minuteDisplay; opacity: 0.0; }
            PropertyChanges { target: spaceDisplay; opacity: 0.0; }
            PropertyChanges { target: dayWeekDisplay; opacity: 0.0; }
            PropertyChanges { target: centerPanel; state: ""}
            PropertyChanges { target: menuPl; state: "show"}
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "normal"

            ParallelAnimation {
                ParallelAnimation{
                    NumberAnimation { target: hourDisplay;    property: "opacity"; from: 0.0;  to: 1.0; duration: 100}
                    NumberAnimation { target: minuteDisplay;  property: "opacity"; from: 0.0;  to: 1.0; duration: 100}
                    NumberAnimation { target: spaceDisplay;   property: "opacity"; from: 0.0;  to: 1.0; duration: 100}
                    NumberAnimation { target: dayWeekDisplay; property: "opacity"; from: 0.0;  to: 1.0; duration: 100}
                    PropertyAnimation {target: indicatorLamp;  property: "state"; from: "";  to: "show";  duration: 0}
                    PropertyAnimation { target: centerPanel;  property: "state"; from: "";  to: "show";  duration: 0}
                    PropertyAnimation { target: decorationPanel;  property: "state"; from: "";  to: "show";  duration: 0}
                }
                ScriptAction {
                    script: {
                        menuPl.setKeyEnable(1)
                        emit: CarStatus.notifyEnableKey(true)

                        console.log("=============theme1 dashboard from * to normal=====")
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
            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation { target: centerPanel;  property: "state"; from: "";  to: "show";  duration: 10}
                }
                ParallelAnimation {
                    NumberAnimation { target: farRoad;  property: "opacity";  from: 0.0;  to: 1.0; duration: 1000}
                    NumberAnimation { target: farRoad;  property: "y";        from: 30;   to: 130; duration: 1000}
                    NumberAnimation { target: baseBar;  property: "opacity";  from: 0.0;  to: 1.0; duration: 1000}
                    NumberAnimation { target: topBar;   property: "opacity";  from: 0.0;  to: 1.0; duration: 100}
                    NumberAnimation { target: topBar;   property: "y";        from: 0;    to: 32 ; duration: 100}
                }
            }
        }
    ]

//    function displayDashBoard() {
//        dashboard.state = "normal"
//        menuPl.setKeyEnable(1)
//        emit: CarStatus.notifyEnableKey(true)
//        beginAnimation.running = true
//    }



    Component.onCompleted: {
        //switchGear.state = ""
        //CarStatus.active = true;
        //dashboard.state = "normal"
        //beginAnimation.running = true
        console.log("=============theme1's dashboard component complete ============")
    }
}

import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/Common/JS/AlarmCode.js" as AlarmInfoCode
import "../JS/HomePanelController.js" as HomePanel

CommonItem {
    id: home_panel
    width: 1440
    height: 544
    visible: false
    opacity: 0

    property real screenWidth: 1440;
    property real screenHeight: 544;
    property real topPanelHeight: 80;
    property real bottomPanelHeight: 80;
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string sourceCommonImageUrl: "qrc:/Common/CommonImage/"
    property string backgroundImage: sourceImageUrl + "HomePanel/background.png";
    property string topBarImage: sourceImageUrl + "HomePanel/topBar.png";
    property string bottomBarImage: sourceImageUrl + "HomePanel/bottomBar.png";
    property string oilPressureImage: sourceCommonImageUrl + "Indicator/oilPressureValue.png";
    property string waterTempImage: sourceCommonImageUrl + "Indicator/waterTempValue.png"
    property string oilImage: sourceImageUrl + "DialPanel/oil.png"
    property string mpaLeftImage: sourceImageUrl + "HomePanel/mpaLeft.png"
    property string mpaRightImage: sourceImageUrl + "HomePanel/mpaRight.png"
    property string leftCorneringLampImage: sourceImageUrl + "StarLamp/turnLeftLamp.png"
    property string rightCorneringLampImage: sourceImageUrl + "StarLamp/turnRightLamp.png"
    property string lampHighBeamImage: sourceImageUrl + "StarLamp/highBeamLamp.png"
    property string lampHeadLightImage: sourceImageUrl + "StarLamp/headLamp.png"
    property string lampPositionLightImage: sourceImageUrl + "StarLamp/placeLamp.png"
    property string chargingImage: sourceImageUrl + "StarLamp/chargingCable.png"
    property string lampFrontFogImage: sourceImageUrl + "StarLamp/frontFlogLamp.png"
    property string lampRearFogImage: sourceImageUrl + "StarLamp/backFlogLamp.png"
    property string chargeLightImage: sourceImageUrl + "StarLamp/batteryCharging.png"
    property string lampMainERRredImage: sourceImageUrl + "StarLamp/dangerAlarmPrompt.png"
    property string backCangImage: sourceImageUrl + "StarLamp/backHatchDoorAlarm.png"
    property string lampLeftShoeWearImage: sourceImageUrl + "StarLamp/leftFrontShoe.png"
    property string lampRightShoeWearImage: sourceImageUrl + "StarLamp/rightFrontShoe.png"
    property string lampWaterLowImage: sourceImageUrl + "StarLamp/lowWaterAlarm.png"
    property string lampMotorImage: sourceImageUrl + "StarLamp/motorHeat.png"
    property string motorImage: sourceImageUrl + "StarLamp/motorLimitation.png"
    property string lampBatteryImage: sourceImageUrl + "StarLamp/batteryCharg.png"
    property string lampBatteryWarningImage: sourceImageUrl + "StarLamp/batteryCut.png"
    property string lampBatteryFaultImage: sourceImageUrl + "StarLamp/batteryFault.png"
    property bool bDisplay: true

    onVisibleChanged: {
        if(visible){
            // 按键触发
            CarMsg.sendEnableKeys(true);
        }
    }

    Connections {
        target: visible ? CarMsg : null
        ignoreUnknownSignals: true
        onKeyLongPressed: {
            onKey(key);
            switch (key)
            {
                case CustomEnum.EnterKey:
                    //onKeyEnter();
                break;
            }
        }
    }

    //初始化执行动画阶段
    property bool animationPhase1: true
    property bool animationPhase2: true
    //警告提示
    property int alarmCode: CarMsg.warningId
    //Mpa计数
    property int mpa1ValueStart: 0
    property int mpa1ValueEnd: CarMsg.apVol1
    property int mpa2ValueStart: 0
    property int mpa2ValueEnd: CarMsg.apVol2
    //动画过度时间
    property int excessiveDurationTime: 1000;
    //HomePanel遮罩效果信号监测
    property string maskBackGroundStatus: "";

    //警告提示
    onAlarmCodeChanged: {
        alarm_info.textValue = AlarmInfoCode.getAlarmCodeInfo()[alarmCode];
    }
    //监测遮罩信号变化
    onMaskBackGroundStatusChanged: {
        console.log("onMaskBackGroundStatusChanged" + maskBackGroundStatus);
        if(maskBackGroundStatus === "show"){
            mask_background.state = "";
            mask_background.state = "show";
        }else if(maskBackGroundStatus === "hide"){
            mask_background.state = "";
            mask_background.state = "hide";
        }else if(maskBackGroundStatus === "splash"){
            mask_background.state = "";
            mask_background.state = "splash";
        }else{}
        maskBackGroundStatus = "";
    }

    //Mpa过度动画
    NumberAnimation { id: mpa_animation1; target: home_panel; property: "mpa1ValueEnd"; duration: excessiveDurationTime; easing.type: Easing.Linear }
    NumberAnimation { id: mpa_animation2; target: home_panel; property: "mpa2ValueEnd"; duration: excessiveDurationTime; easing.type: Easing.Linear }

    //报警码显示动画
    SequentialAnimation {
        loops: Animation.Infinite
        running: true
        PauseAnimation { duration: 2000 }
        PropertyAnimation{ target: alarm_info; property: "anchors.bottomMargin"; to: 45 ;duration: 100; easing.type: Easing.Linear; }
        PropertyAnimation{ target: alarm_info; property: "anchors.bottomMargin"; to: 35 ;duration: 100; easing.type: Easing.Linear; }
        PropertyAnimation{ target: alarm_info; property: "anchors.bottomMargin"; to: 40 ;duration: 50; easing.type: Easing.Linear; }
    }

    onMpa1ValueEndChanged: {
        mpa_animation1.from = mpa1ValueStart;
        mpa_animation1.to = mpa1ValueEnd;
        mpa_animation1.running = true;
        if (mpa1ValueEnd > mpa1ValueStart) {
            HomePanel.upMpaLeftModel(mpaLeftModel,mpa1ValueEnd);
        } else if (mpa1ValueEnd < mpa1ValueStart) {
            HomePanel.downMpaLeftModel(mpaLeftModel,mpa1ValueEnd);
        } else {
            // default
        }
        mpa1ValueStart = mpa1ValueEnd;
    }

    onMpa2ValueEndChanged: {
        mpa_animation2.from = mpa2ValueStart;
        mpa_animation2.to = mpa2ValueEnd;
        mpa_animation2.running = true;
        if (mpa2ValueEnd > mpa2ValueStart) {
            HomePanel.upMpaRightModel(mpaRightModel,mpa2ValueEnd);
        } else if (mpa2ValueEnd < mpa2ValueStart) {
            HomePanel.downMpaRightModel(mpaRightModel,mpa2ValueEnd);
        } else {
            // default
        }
        mpa2ValueStart = mpa2ValueEnd;
    }

    Component.onCompleted: {
        console.log("/--------------------------------------------/");
        console.log("/-------------Theme 2 is Active--------------/");
        console.log("/--------------------------------------------/");
        HomePanel.initializeMpaModel(mpaLeftModel, mpaRightModel);
    }

    Item {
        id: home
        anchors.fill: parent
        Rectangle {
            id: mask_background;
            z: 2;
            state: ""
            anchors.fill: parent;
            color: "#000000";
            opacity: 0
            states: [
                State { name: "show"; PropertyChanges { target: mask_background; opacity: 0.7; }},
                State { name: "hide"; PropertyChanges { target: mask_background; opacity: 0; }},
                State { name: "splash"; PropertyChanges { target: mask_background; opacity: 1; }}
            ]
            transitions: [
                Transition {
                    from: ""
                    to: "show"
                    SequentialAnimation { PropertyAnimation { target: mask_background; property: "opacity"; duration: 500 }}
                },
                Transition {
                    from: ""
                    to: "hide"
                    SequentialAnimation { PropertyAnimation { target: mask_background; property: "opacity"; duration: 1000 }}
                },
                Transition {
                    from: ""
                    to: "splash"
                    SequentialAnimation { PropertyAnimation { target: mask_background; property: "opacity"; duration: 500 }}
                }
            ]
        }
        Image {
            id: background
            anchors.fill: parent
            fillMode: Image.TileHorizontally
            smooth: true
            opacity: 1.0
            source: backgroundImage
        }
        //符号片显示
        IconPanel {
            id: iconPanel
            z: 10
            anchors.fill: parent
        }
        //上层模块
        Row {
            id: navPanel
            z: 1
            width: screenWidth
            height: topPanelHeight
            anchors.top: parent.top
            spacing: 0
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: spnDisplay
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("SPN  %1 ").arg(CarMsg.spn)//setTextDisplay(CarStatus.SPN)
                }
                TextIconWeir {
                    id: oilPressValue
                    anchors.right: parent.right
                    anchors.rightMargin: 350
                    anchors.verticalCenter: parent.verticalCenter
                    textIconValue: qsTr(" %1 KPa").arg(10)//CarStatus.engine_oil_pressure.toFixed(0)
                    iconSource: oilPressureImage
                }
                TextFieldWeir {
                    id: weekDisplay
                    anchors.right: parent.right
                    anchors.rightMargin: 400
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: "week"
                }
                TimeHMSWeir {
                    id: hmsDisplay
                    anchors.right: parent.right
                    anchors.rightMargin: 120
                    anchors.verticalCenter: parent.verticalCenter
                    hourValue: "00"
                    spaceValue: ":"
                    minuteValue: "00"
                }
            }
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TimeInfoWeir {
                    id: timeInfo
                    anchors.left: parent.left
                    anchors.leftMargin: 200
                    anchors.verticalCenter: parent.verticalCenter
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
                        weekDisplay.textValue = qsTr("%1").arg(week);
                    }
                }
                TextIconWeir {
                    id: waterTempValue
                    anchors.left: parent.left
                    anchors.leftMargin: 390
                    anchors.verticalCenter: parent.verticalCenter
                    imageTopMargin: -5
                    spaceWidth: -20
                    textIconValue: qsTr(" %1 ℃").arg(CarMsg.engineWaterTemp)//(CarStatus.engine_water_temp.toFixed(0))
                    iconSource: waterTempImage
                }
                TextFieldWeir {
                    id: systemCode
                    anchors.right: parent.right
                    anchors.rightMargin: 160
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("系统代码  %1").arg(CarMsg.faultCode)//(CarStatus.fault_code)
                }
            }
        }
        //中层模块
        Item {
            id: centerPanel
            z: 1
            anchors.top: navPanel.bottom
            width: screenWidth
            height: screenHeight - topPanelHeight - bottomPanelHeight
            Image {
                id: mpaLeftPanel
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20
                opacity: 1.0
                source: mpaLeftImage
            }
            ListModel { id: mpaLeftModel }
            MpaListView {
                id: leftMpaListView
                width: 50
                height: 280
                mpaListModel: mpaLeftModel
                anchors.left: mpaLeftPanel.left
                anchors.leftMargin: 40
                anchors.bottom: mpaLeftPanel.bottom
                anchors.bottomMargin: 23
            }
            Image {
                id: mpaRightPanel
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20
                opacity: 1.0
                source: mpaRightImage
            }
            ListModel { id: mpaRightModel }
            MpaListView {
                id: rightMpaListView
                width: 50
                height: 280
                mpaListModel: mpaRightModel
                anchors.right: mpaRightPanel.right
                anchors.rightMargin: 49
                anchors.bottom: mpaLeftPanel.bottom
                anchors.bottomMargin: 23
            }
            TextFieldWeir {
                id: alarm_info
                textOpacity: 1
                textWidth: 300
                anchors.left: parent.left
                anchors.leftMargin: 150
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                fontColor: "#ff9000"
                fontBold: true
                textValue: qsTr("正常")
            }
            //远光灯 / 头灯 / 位置灯 / 充电
            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 70
                spacing: 1070
                RowLayout {
                    spacing: 10
                    Image { id: lamp_highBeam; source: lampHighBeamImage; opacity: 0 }
                    Image { id: lamp_headlight; source: lampHeadLightImage; opacity: 0 }
                }
                RowLayout {
                    spacing: 10
                    Image { id: lamp_positionLight; source: lampPositionLightImage; opacity: 0 }
                    Image { id: charging; source: chargingImage; opacity: 0 }
                }
            }
            //前雾灯 / 后雾灯 / 充电提示 / 错误提示
            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 110
                anchors.left: parent.left
                anchors.leftMargin: 125
                spacing: 930
                RowLayout {
                    spacing: 10
                    Image { id: lamp_frontFog; source: lampFrontFogImage; opacity: 0 }
                    Image { id: lamp_rearFog; source: lampRearFogImage; opacity: 0 }
                }
                RowLayout {
                    spacing: 10
                    Image { id: charge_light; source: chargeLightImage; opacity: 0 }
                    Image { id: lamp_mainERRred; source: lampMainERRredImage; opacity: 0 }
                }
            }
            //backCang / leftShoeWear / rightShoeWear / waterLow
            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 200
                anchors.left: parent.left
                anchors.leftMargin: 165
                spacing: 840
                RowLayout {
                    spacing: 10
                    Image { id: backCang; source: backCangImage; opacity: 0 }
                    Image { id: lamp_leftShoeWear; source: lampLeftShoeWearImage; opacity: 0 }
                }
                RowLayout {
                    spacing: 10
                    Image { id: lamp_rightShoeWear; source: lampRightShoeWearImage; opacity: 0 }
                    Image { id: lamp_waterLow; source: lampWaterLowImage; opacity: 0 }
                }
            }
            //发动机 / 发动机警告 / 电池 / 电池警告
            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 270
                anchors.left: parent.left
                anchors.leftMargin: 225
                spacing: 740
                RowLayout {
                    spacing: 10
                    Image { id: lamp_motor; source: lampMotorImage; opacity: 0 }
                    Image { id: motorFault; source: motorImage; opacity: 0 }
                }
                RowLayout {
                    spacing: 10
                    Image { id: lamp_battery; source: lampBatteryImage; opacity: 0 }
                    Image { id: lamp_battery_warning; source: lampBatteryWarningImage; opacity: 0 }
                    Image { id: lamp_battery_fault; source: lampBatteryFaultImage; opacity: 0 }
                }
            }
        }
        //下层模块
        Row {
            id: booterPanel
            z: 1
            anchors.top: centerPanel.bottom
            anchors.topMargin: -10
            width: screenWidth
            height: bottomPanelHeight
            spacing: 0
            Row {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: odoDisplay
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("总里程  %1 Km").arg(CarMsg.odo)//(CarStatus.odo.toFixed(0))
                }
                TextFieldWeir {
                    id: motorCtlTemp
                    anchors.right: parent.right
                    anchors.rightMargin: 330
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("电机/控制器 %1℃/%2℃ ").arg(CarMsg.moterTemp).arg(CarMsg.moterControlTemp)//(CarStatus.moter_temp.toFixed(0)).arg(CarStatus.moter_control_temp.toFixed(0))
                }
            }
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: levelDisplay
                    anchors.left: parent.left
                    anchors.leftMargin: 180
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("尿素液位 %1 % ").arg(CarMsg.ureaLevel)//(CarStatus.urea_level.toFixed(1))
                }
                TextIconWeir {
                    id: oilfuelValue
                    anchors.right: parent.right
                    anchors.rightMargin: 160
                    anchors.verticalCenter: parent.verticalCenter
                    imageTopMargin: 0
                    spaceWidth: -30
                    textIconValue: qsTr("%1 %").arg(CarMsg.oilLevel - 50)//(CarStatus.oil_level.toFixed(0))
                    iconSource: oilImage
                }
                TextFieldWeir {
                    id: tripDisplay
                    anchors.right: parent.right
                    anchors.rightMargin: 180
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("小计里程  %1 Km").arg(CarMsg.trip)//(CarStatus.trip.toFixed(1))
                }
            }
        }
        Image { id: topBar; z: 1; anchors.bottom: centerPanel.top; opacity: 1.0; source: topBarImage }
        Image { id: bottomBar; z: 1; anchors.top: centerPanel.bottom; opacity: 1.0; source: bottomBarImage }
    }
}

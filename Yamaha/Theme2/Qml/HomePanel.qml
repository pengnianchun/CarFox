import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Common/JS/AlarmCode.js" as AlarmInfoCode
import "qrc:/Common/Component"
import "../JS/HomePanelController.js" as HomePanel

CommonItem {
    visible: false
    opacity: 0
    width: 1440
    height: 544
    property real screenWidth: 1440;
    property real screenHeight: 544;
    property real topPanelHeight: 80;
    property real bottomPanelHeight: 80;
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string sourceCommonImageUrl: "qrc:/Common/CommonImage/"
    property string backgroundImage: sourceImageUrl + "HomePanel/background.png";
    property string topBarImage: sourceImageUrl + "HomePanel/topBar.png";
    property string bottomBarImage: sourceImageUrl + "HomePanel/bottomBar.png";
    property string oilPressureImage: sourceCommonImageUrl + "Indicator/oilPressureValue.png";//oilPressLow
    property string waterTempImage: sourceCommonImageUrl + "Indicator/waterTempValue.png"
    property string oilImage: sourceImageUrl + "DialPanel/oil.png"
    property string mpaLeftImage: sourceImageUrl + "HomePanel/mpaLeft.png"
    property string mpaRightImage: sourceImageUrl + "HomePanel/mpaRight.png"
    property string leftCorneringLampImage: sourceCommonImageUrl + "Indicator/Lamp_leftTurn.png"
    property string rightCorneringLampImage: sourceCommonImageUrl + "Indicator/Lamp_rightTurn.png"
    property string lampHighBeamImage: sourceCommonImageUrl + "Indicator/Lamp_highBeam.png"
    property string lampHeadLightImage: sourceCommonImageUrl + "Indicator/Lamp_headlight.png"
    property string lampPositionLightImage: sourceCommonImageUrl + "Indicator/Lamp_positionLight.png"
    property string chargingImage: sourceCommonImageUrl + "Indicator/Charging.png"
    property string lampFrontFogImage: sourceCommonImageUrl + "Indicator/Lamp_frontFog.png"
    property string lampRearFogImage: sourceCommonImageUrl + "Indicator/Lamp_rearFog.png"
    property string chargeLightImage: sourceCommonImageUrl + "Indicator/chargeLight.png"
    property string lampMainERRredImage: sourceCommonImageUrl + "Indicator/Lamp_mainERRred.png"
    property string backCangImage: sourceCommonImageUrl + "Indicator/backCang.png"
    property string lampLeftShoeWearImage: sourceCommonImageUrl + "Indicator/Lamp_leftShoeWear.png"
    property string lampRightShoeWearImage: sourceCommonImageUrl + "Indicator/Lamp_rightShoeWear.png"
    property string lampWaterLowImage: sourceCommonImageUrl + "Indicator/Lamp_waterLow.png"
    property string lampMotorImage: sourceCommonImageUrl + "Indicator/Lamp_motor.png"
    property string motorImage: sourceCommonImageUrl + "Indicator/motor.png"
    property string lampBatteryImage: sourceCommonImageUrl + "Indicator/Lamp_battery.png"
    property string lampBatteryWarningImage: sourceCommonImageUrl + "Indicator/Lamp_batteryWarning.png"
    property bool bDisplay: true
    //报警计数
    property int alarmCode: 0
    //Mpa计数
    property int mpaCount: 0
    property bool mpaStatus: true

    //HomePanel遮罩效果信号监测
    property string maskBackGroundStatus: "";
    //监测遮罩信号变化
    onMaskBackGroundStatusChanged: {
        console.log("maskBackGroundStatus:::::::::::::::::::::::::::" + maskBackGroundStatus);
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
    onVisibleChanged: {
        if(visible){
            // 按键触发
            CarMsg.sendEnableKeys(true);
            timer.running = true;
        }else{
            timer.running = false;
        }
    }
    //自定义定时器测试使用
    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: false
        onTriggered: {
            console.log("=================home panel timer=========================");
            if(bDisplay){
                oilPressureImage = sourceCommonImageUrl + "Indicator/oilPressureValue.png";
                left_cornering_lamp.opacity = 0;
                right_cornering_lamp.opacity = 0;
                lamp_headlight.opacity = 0;
                lamp_highBeam.opacity = 0;
                lamp_positionLight.opacity = 0;
                charging.opacity = 0;
                lamp_frontFog.opacity = 0;
                lamp_rearFog.opacity = 0;
                charge_light.opacity = 0;
                lamp_mainERRred.opacity = 0;
                backCang.opacity = 0;
                lamp_leftShoeWear.opacity = 0;
                lamp_rightShoeWear.opacity = 0;
                lamp_waterLow.opacity = 0;
                lamp_motor.opacity = 0;
                motorFault.opacity = 0;
                lamp_battery.opacity = 0;
                lamp_battery_warning.opacity = 0;
            }else{
                oilPressureImage = sourceCommonImageUrl + "Indicator/oilPressLow.png";
                left_cornering_lamp.opacity = 1.0;
                right_cornering_lamp.opacity = 1.0;
                lamp_headlight.opacity = 1.0;
                lamp_highBeam.opacity = 1.0;
                lamp_positionLight.opacity = 1.0;
                charging.opacity = 1.0;
                lamp_frontFog.opacity = 1.0;
                lamp_rearFog.opacity = 1.0;
                charge_light.opacity = 1.0;
                lamp_mainERRred.opacity = 1.0;
                backCang.opacity = 1.0;
                lamp_leftShoeWear.opacity = 1.0;
                lamp_rightShoeWear.opacity = 1.0;
                lamp_waterLow.opacity = 1.0;
                lamp_motor.opacity = 1.0;
                motorFault.opacity = 1.0;
                lamp_battery.opacity = 1.0;
                lamp_battery_warning.opacity = 1.0;
            }
            if(mpaStatus){
                if(mpaCount === 10){
                    mpaStatus = false;
                }else{}
                HomePanel.upMpaModel(mpaLeftModel,mpaRightModel,mpaCount);
                mpaCount = HomePanel.upMpaModel(mpaLeftModel,mpaRightModel,mpaCount);
            }else{
                if(mpaCount === 0){
                    mpaStatus = true;
                }else{}
                HomePanel.downMpaModel(mpaLeftModel,mpaRightModel,mpaCount);
                mpaCount = HomePanel.downMpaModel(mpaLeftModel,mpaRightModel,mpaCount);
            }
            for(var i=0;i<38;i++){
                if(alarmCode === i){
                    var alarmCodeInfo = AlarmInfoCode.getAlarmCodeInfo()[i];
                    alarm_info.textValue = alarmCodeInfo;
                    break;
                }else{}
            }
            if(alarmCode === 37){
                alarmCode = 0;
            }else{
                alarmCode++;
            }
        }
    }
    Component.onCompleted: {
        console.log("/--------------------------------------------/");
        console.log("/-------------"+ AlarmInfoCode.getInfo() +"---------------/");
        console.log("/--------------------------------------------/");
        HomePanel.initializeMpaModel(mpaLeftModel,mpaRightModel);
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
        //转向灯显示模块
        RowLayout {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 200
            Image { id: left_cornering_lamp; source: leftCorneringLampImage; opacity: 0 }
            Image { id: right_cornering_lamp; source: rightCorneringLampImage; opacity: 0 }
        }
        //nav层模块
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
                    //textOpacity: 0.0
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("SPN  %1 ").arg(0)//setTextDisplay(CarStatus.SPN)
                }
                TextIconWeir {
                    id: oilPressValue
                    anchors.right: parent.right
                    anchors.rightMargin: 350
                    anchors.verticalCenter: parent.verticalCenter
                    textIconValue: qsTr(" %1 KPa").arg(0)//CarStatus.engine_oil_pressure.toFixed(0)
                    iconSource: oilPressureImage
                }
                TextFieldWeir {
                    id: weekDisplay
                    //textOpacity: 0.0
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
                    textIconValue: qsTr(" %1 ℃").arg(0)//(CarStatus.engine_water_temp.toFixed(0))
                    iconSource: waterTempImage
                }
                TextFieldWeir {
                    id: systemCode
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 160
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("系统代码  %1").arg(0)//(CarStatus.fault_code)
                }
            }
        }
        //center层模块
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
                anchors.bottomMargin: 50
                fontColor: "#ff9000"
                fontBold: true
                textValue: qsTr("正常")
            }
            //远光灯 / 头灯 / 位置灯 / 充电
            RowLayout {
                anchors.top: parent.top
                anchors.topMargin: 20
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
                spacing: 960
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
                spacing: 870
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
                spacing: 770
                RowLayout {
                    spacing: 10
                    Image { id: lamp_motor; source: lampMotorImage; opacity: 0 }
                    Image { id: motorFault; source: motorImage; opacity: 0 }
                }
                RowLayout {
                    spacing: 10
                    Image { id: lamp_battery; source: lampBatteryImage; opacity: 0 }
                    Image { id: lamp_battery_warning; source: lampBatteryWarningImage; opacity: 0 }
                }
            }
        }
        //botter层模块
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
                    //textOpacity: 0.0
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("总里程  %1 Km").arg(0)//(CarStatus.odo.toFixed(0))
                }
                TextFieldWeir {
                    id: motorCtlTemp
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 330
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("电机/控制器 %1℃/%2℃ ").arg(0).arg(0)//(CarStatus.moter_temp.toFixed(0)).arg(CarStatus.moter_control_temp.toFixed(0))
                }
            }
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: levelDisplay
                    //textOpacity: 0.0
                    anchors.left: parent.left
                    anchors.leftMargin: 180
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("尿素液位 %1 % ").arg(0)//(CarStatus.urea_level.toFixed(1))
                }
                TextIconWeir {
                    id: oilfuelValue
                    anchors.right: parent.right
                    anchors.rightMargin: 160
                    anchors.verticalCenter: parent.verticalCenter
                    imageTopMargin: 0
                    spaceWidth: -30
                    textIconValue: qsTr("%1 %").arg(0)//(CarStatus.oil_level.toFixed(0))
                    iconSource: oilImage
                }
                TextFieldWeir {
                    id: tripDisplay
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 180
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("小计里程  %1 Km").arg(0)//(CarStatus.trip.toFixed(1))
                }
            }
        }
        Image { id: topBar; z: 1; anchors.bottom: centerPanel.top; opacity: 1.0; source: topBarImage }
        Image { id: bottomBar; z: 1; anchors.top: centerPanel.bottom; opacity: 1.0; source: bottomBarImage }
    }
}

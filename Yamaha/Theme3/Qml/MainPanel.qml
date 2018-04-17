import QtQuick 2.6
import CustomEnum 1.0
import "./"
import "qrc:/Common/Component"

CommonItem {
    id: mainPanel
    width: 1440
    height: 540
    opacity: 0.0
    z: 0

    property string externState: ""
    property bool busPanelVisible:true
    property bool nPanelVisible:true
    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string gifImage:sourceImageUrl+"Image/Gif/splash.gif";
    property string bgImage:sourceImageUrl+"Image/HomePane/bg.png";
    property string staBgImage:sourceImageUrl+"Image/MenuPanel/bg.png";

    property var warningArray: new Array

    Component.onCompleted: {
        warningArray.push("正常");
        warningArray.push("可充电储能系统不匹配报警");
        warningArray.push("车载储能装置类型过压报警");
        warningArray.push("车载储能装置类型欠压报警");
        warningArray.push("车载储能装置类型过充");
        warningArray.push("峰值放电电流过大截止报警");
        warningArray.push("电池充电温度过高报警");
        warningArray.push("电池充电温度过高截止报警");
        warningArray.push("电池充电温度过低截止报警");
        warningArray.push("动力电池SOC过高报警");
        warningArray.push("制动能量回收单体电压过高报警");
        warningArray.push("制动能量回收单体电压过高截止报警");
        warningArray.push("取消制动能量回收功能");
        warningArray.push("BMS模块通讯失效");
        warningArray.push("BMS系统故障");
        warningArray.push("动力蓄电池故障");
        warningArray.push("制动能量回收电流过大报警");
        warningArray.push("单体电压过高报警");
        warningArray.push("单体电压过高截止报警");
        warningArray.push("单体电压过低报警");
        warningArray.push("单体电压过低截止报警");
        warningArray.push("峰值放电电流过大");
        warningArray.push("峰值充电电流过大");
        warningArray.push("电池温度过高报警");
        warningArray.push("电池放电温度过低报警");
        warningArray.push("电池温度过高截止报警");
        warningArray.push("电池放电温度过低截止报警");
        warningArray.push("单体电池压差过大报警");
        warningArray.push("单体电池压差过大截止报警");
        warningArray.push("电池充电电压过高");
        warningArray.push("动力电池温度差异报警");
        warningArray.push("动力电池充电温度过低报警");
        warningArray.push("动力电池SOC过低报警");
        warningArray.push("一级绝缘报警");
        warningArray.push("二级绝缘报警");
        warningArray.push("高压断线故障");
        warningArray.push("绝缘模块故障");
        warningArray.push("驱动系统故障报警");
        warningArray.push("驱动控制器过压报警");
        warningArray.push("驱动控制器欠压报警");
        warningArray.push("驱动控制器编码器故障");
        warningArray.push("驱动控制器高温报警");
        warningArray.push("驱动控制器高温截止报警");
        warningArray.push("驱动控制器主接触器故障");
        warningArray.push("驱动控制器过流报警");
        warningArray.push("驱动电机高温报警");
        warningArray.push("驱动电机高温截止报警");
        warningArray.push("驱动电机旋变故障报警");
        warningArray.push("驱动电机功率受限报警");
        warningArray.push("驱动电机转矩受限报警");
        warningArray.push("驱动电机水温过高报警");
        warningArray.push("加速踏板信号值异常报警");
        warningArray.push("刹车踏板信号值异常报警");
        warningArray.push("安全带报警");
        warningArray.push("座椅开关报警");
        warningArray.push("右侧舱门开启报警");
        warningArray.push("左侧舱门开启报警");
        warningArray.push("司机门未关报警");
        warningArray.push("高压开关门开启报警");
        warningArray.push("充电门开启报警");
        warningArray.push("安全门开启报警");
        warningArray.push("低压开关门开启报警");
        warningArray.push("ABS系统故障");
        warningArray.push("空压机控制器高温报警");
        warningArray.push("空压机电机高温报警");
        warningArray.push("助力泵控制器高温报警");
        warningArray.push("助力泵电机高温报警");
        warningArray.push("DC输入欠压");
        warningArray.push("DC输入过压");
        warningArray.push("DC过热");
        warningArray.push("DC短路");
    }

    onExternStateChanged: {  //判断是否进入Menu
        warningDate();
    }

    function warningDate()
    {
        var tmpwarningid = CarMsg?CarMsg.warningId:0
        busPanelVisible = false;
        nPanelVisible = false;
        if(tmpwarningid === 0 )
        {
            if(externState == "MainView")
            {
                busPanelVisible = true;
            }
            textwarning.visible = false;
        }
        else if(tmpwarningid === 1 ||(tmpwarningid === 2)||(tmpwarningid === 3)||(tmpwarningid === 3)
                ||(tmpwarningid === 4)||(tmpwarningid === 5)||(tmpwarningid === 6)||(tmpwarningid === 7)
                ||(tmpwarningid === 8)||(tmpwarningid === 9)||(tmpwarningid === 10)||(tmpwarningid === 11)
                ||(tmpwarningid === 12)||(tmpwarningid === 13)||(tmpwarningid === 14)||(tmpwarningid === 15)
                ||(tmpwarningid === 16)||(tmpwarningid === 17)||(tmpwarningid === 18)||(tmpwarningid === 19)
                ||(tmpwarningid === 20)||(tmpwarningid === 21)||(tmpwarningid === 22)||(tmpwarningid === 23)
                ||(tmpwarningid === 24)||(tmpwarningid === 25)||(tmpwarningid === 26)||(tmpwarningid === 27)
                ||(tmpwarningid === 28)||(tmpwarningid === 29)||(tmpwarningid === 30)||(tmpwarningid === 31)
                ||(tmpwarningid === 32)||(tmpwarningid === 33)||(tmpwarningid === 34)||(tmpwarningid === 35)
                ||(tmpwarningid === 36))
        {
            if(externState == "MainView")
            {
                nPanelVisible = true;
                warningBattery.visible = true;    //电池包故障
                warningDriveSystem.visible = false;
                warningSeatBelts.visible = false;
                warningVehicle.visible = false;
                warningDcDc.visible = false;

                //必须有warningBattery才可以使用其属性warningBatteryText
                warningBattery.warningBatteryText = warningArray[tmpwarningid];
                textwarning.visible = false;
            }
            else
            {
                textwarning.visible = true;
                textwarning.text = warningArray[tmpwarningid];
            }
        }
        else if(tmpwarningid === 37||(tmpwarningid === 38)||(tmpwarningid === 39)||(tmpwarningid === 40)
                ||(tmpwarningid === 41)||(tmpwarningid === 42)||(tmpwarningid === 43)||(tmpwarningid === 44)
                ||(tmpwarningid === 45)||(tmpwarningid === 46)||(tmpwarningid === 47)||(tmpwarningid === 48)
                ||(tmpwarningid === 49)||(tmpwarningid === 50)||(tmpwarningid === 51)||(tmpwarningid === 52)
                ||(tmpwarningid === 62)||(tmpwarningid === 63)||(tmpwarningid === 64)||(tmpwarningid === 65)
                ||(tmpwarningid === 66))
        {
            if(externState == "MainView")
            {
                nPanelVisible = true;
                warningDriveSystem.visible = true;    //驱动系统报警
                warningBattery.visible = false;    //电池包故障
                warningSeatBelts.visible = false;
                warningVehicle.visible = false;
                warningDcDc.visible = false;
                warningDriveSystem.driveSystemText = warningArray[tmpwarningid];
                textwarning.visible = false;
            }
            else
            {
                textwarning.visible = true;
                textwarning.text = warningArray[tmpwarningid];
            }
        }
        else if(tmpwarningid === 53)        //安全带未系
        {
            if(externState == "MainView")
            {
                nPanelVisible = true;
                warningSeatBelts.visible = true;
                warningDriveSystem.visible = false;    //驱动系统报警
                warningBattery.visible = false;    //电池包故障
                warningVehicle.visible = false;
                warningDcDc.visible = false;
                warningSeatBelts.seatBelts = warningArray[tmpwarningid];
                textwarning.visible = false;
            }
            else
            {
                textwarning.visible = true;
                textwarning.text = warningArray[tmpwarningid];
            }
        }
        else if((tmpwarningid === 54)||(tmpwarningid === 55)||(tmpwarningid === 56)||(tmpwarningid === 57)
                ||(tmpwarningid === 58)||(tmpwarningid === 59)||(tmpwarningid === 60)||(tmpwarningid === 61))
        {
            if(externState == "MainView")
            {
                nPanelVisible = true;
                warningVehicle.visible = true;     //整车报警
                warningSeatBelts.visible = false;
                warningDriveSystem.visible = false;    //驱动系统报警
                warningBattery.visible = false;    //电池包故障
                warningDcDc.visible = false;
                warningVehicle.vehicle = warningArray[tmpwarningid];

                textwarning.visible = false;
            }
            else
            {
                textwarning.visible = true;
                textwarning.text = warningArray[tmpwarningid];
            }
        }
        else if((tmpwarningid === 67)||(tmpwarningid === 68)||(tmpwarningid === 69)||(tmpwarningid === 70))
        {
            if(externState == "MainView")
            {
                nPanelVisible = true;
                warningDcDc.visible = true;     //dcdc报警
                warningVehicle.visible = false;     //整车报警
                warningSeatBelts.visible = false;
                warningDriveSystem.visible = false;    //驱动系统报警
                warningBattery.visible = false;    //电池包故障
                warningDcDc.dcDcText = warningArray[tmpwarningid];

                textwarning.visible = false;
            }
            else
            {
                textwarning.visible = true;
                textwarning.text = warningArray[tmpwarningid];
            }
        }
    }


    Connections {
        // 链接CarMsg信号
        target: CarMsg

        onWarningIdChanged:{
            console.log(CarMsg.warningId)  //必须写在函数里面
                warningDate();
        }
        onMiddleOutputFault01Changed:{
            console.log(CarMsg.middleOutputFault01)  //必须写在函数里面
        }
        onBackOutputFault01Changed:{
            console.log(CarMsg.backOutputFault01)  //必须写在函数里面
        }
//        onBatteryPackEnergyChanged:{
//            console.log(CarMsg.batteryPackEnergy)
//        }
        onSocChanged:{
            console.log(CarMsg.soc)
        }

    }

    onKeyEnter: function(){
        if(externState == "MainView")
        {
            externState = "MenuList";
            UiController.showLayer("MenuPanel");
            busPanelVisible = false;
            nPanelVisible = false;
//            CarMsg.warningId = 0;
        }

        else if(externState == "MenuList") //list
        {
            externState = "MenuParameter"
        }
        textwarning.text = warningArray[CarMsg.warningId];
    }

    onKeyBack: function(){
        if(externState == "MainView")
        {

        }
        else if(externState == "MenuList") //list
        {
            externState = "MainView";
        }
        else if(externState == "MenuParameter")
        {
            externState = "MenuList";
        }
    }

    onVisibleChanged: {
        if(visible) {
            mainPanel.opacity = 1.0
            gmlGifImage.playing = true
        }
        else {
            externState = "";
        }
    }

    QmlGifImage {
        id: gmlGifImage
        gifSource: gifImage
        playing: false
        anchors.fill: parent
        onFinished: {
            gmlGifImage.visible = false;
            autoTestTimer.running = true;
            mainView.visible = true;

            // 按键触发
            CarMsg.sendEnableKeys(true);
        }
    }

    Timer {
        property int count: 0
        id: autoTestTimer;
        interval: 100;
        running: false;
        repeat: true
        onTriggered: {
            count++;
            if(count > 100)
                count = 0;
//            dashboardLeft.text_content = count
        }
    }

    Rectangle {   //主界面
        id: mainView
        state: externState
        anchors.fill: parent
        color: "transparent"
        visible: false
        onVisibleChanged:{      //主界面一显示出来
            if(visible)
            {
                externState = "MainView";
            }
            iconpanel.lampTimerRunning = true;
            busPanel.bus_ready_running = true;
//            dashboardLeft.dot_timer_running = true;
        }
        Image {     //主界面背景
            id: bg
            anchors.fill: parent
            source: bgImage

            StaticControls{
                id: staticControls
                x:0
                y:0
            }

            LeftDashBoard {
                id: dashboardLeft
                x:0     //68
                y:0   //26
            }

            RightDashBoard {
                id: dashboardRight
                x:0
                y:0
            }

            IconPanel{
                id:iconpanel
                x:0
                y:0
            }

            BusPanel {
                id: busPanel
                visible:busPanelVisible
                x:369
                y:74
            }

            Item{
                id:nPanel
                visible: nPanelVisible

                WarningBatteryPanel {    //电池包故障
                    id: warningBattery
                    x:369
                    y:74
                    visible: false
                }

                WarningChargeAbnormalPanel {     //充电异常
                    id: warningChargeAbnormal
                    x:369
                    y:74
                    visible: false
                }

                WarningChargeOkPanel {      //充电正常
                    id: warningChargeOk
                    x:369
                    y:74
                    visible: false
                }

                WarningChargingPanel{       //正在充电中
                    id:warningCharging
                    x:369
                    y:74
                    visible: false
                }
                WarningDcDcPanel {     //DCDC报警
                    id: warningDcDc
                    x:369
                    y:74
                    visible: false
                }

                WarningDriveSystemPanel {   //驱动系统报警
                    id: warningDriveSystem
                    x:369
                    y:74
                    visible: false
                }

                WarningFrontDoorOpenPanel {     //前门未关
                    id: warningFrontDoorOpen
                    x:369
                    y:74
                    visible: false
                }

                WarningMiddleDoorOpenPanel{     //中门未关
                    id:warningMiddleDoorOpen
                    x:369
                    y:74
                    visible:false
                }
                WarningSeatBeltsPanel {     //安全带未系
                    id: warningSeatBelts
                    x:369
                    y:74
                    visible:false
                }

                WarningVehiclePanel{        //整车报警
                    id:warningVehicle
                    x:369
                    y:74
                    visible:false
                }
                WarningVehicleCtrlPanel{    //整车控制器报警
                    id:warningVehicleCtrl
                    x:369
                    y:74
                    visible:false
                }
            }

            Text{
                id:textwarning
                x:536
                y:435
                width:345
                height: 65
                visible: false
                text:""
                color:"red"
                font.pixelSize:24
                font.family: "PingFang SC Regular"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        states: [
            State {
                name: "MainView"
            },
            State {
                name: "MenuList"
            },
            State {
                name: "MenuParameter"
            }
        ]

        transitions: [
            Transition {
                from: "MainView"
                to: "MenuList"
                ScriptAction {
                    script: {
                        bg.source = staBgImage   //星空图
                        dashboardLeft.state = "Menu_1_style"
                        dashboardRight.state = "Menu_1_style"
                    }
                }
            },
            Transition {
                from: "MenuList"
                to: "MainView"
                ScriptAction {
                    script: {
                        bg.source = bgImage     //蓝图
                        dashboardLeft.state = "Main_style"
                        dashboardRight.state = "Main_style"
                    }
                }
            },
            Transition {
                from: "MenuList"
                to: "MenuParameter"
                ScriptAction {
                    script: {
                        dashboardLeft.state = "Menu_2_style"
                        dashboardRight.state = "Menu_2_style"
                    }
                }
            },
            Transition {
                from: "MenuParameter"
                to: "MenuList"
                ScriptAction {
                    script: {
                        dashboardLeft.state = "Menu_1_style"
                        dashboardRight.state = "Menu_1_style"
                    }
                }
            },
            Transition {
                from: "MenuParameter"
                to: "MainView"
                ScriptAction {
                    script: {
                        bg.source = bgImage     //蓝图
                        dashboardLeft.state = "Main_style"
                        dashboardRight.state = "Main_style"
                    }
                }
            }
        ]
    }



//    Text {
//        id: theme1Name
//        anchors.centerIn: parent
//        text: "Theme1"
//        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
//        font.pixelSize: 80
//    }

    states: [
        State {
            name: ""
        },
        State {
            name: "show"
        },
        State {
            name: "shutdown"
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation {
                NumberAnimation { target: mainPanel; property: "opacity"; from: 0.0; to: 1.0; duration: 3000 }
                ScriptAction {
                    script: {

                        // 按键触发
                        CarMsg.sendEnableKeys(true);
                    }
                }
            }
        },
        Transition {
            from: "show"
            to: ""
            SequentialAnimation {
                NumberAnimation { target: mainPanel; property: "opacity"; from: 0.0; to: 1.0; duration: 0 }
            }
        },
        Transition {
            from: "show"
            to: "shutdown"
            SequentialAnimation {
                ScriptAction {
                    script: {
                        // 按键触发
                        CarMsg.enableKeys(false);
                    }
                }
                NumberAnimation { target: mainPanel; property: "opacity"; from: 1.0; to: 0.0; duration: 3000 }
                ScriptAction {
                    script: {
                        // 进入休眠界面
                        UiController.showLayer("DormancyPanel");
                        // 隐藏主题
                        UiController.hideCurrentTheme();
                    }
                }
            }
        }

    ]
}

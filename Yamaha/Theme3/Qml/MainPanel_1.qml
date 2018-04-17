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

    function warningDate()
    {
        var tmpArray = new Array();
        tmpArray.push("正常");
        tmpArray.push("可充电储能系统不匹配报警");
        tmpArray.push("车载储能装置类型过压报警");
        tmpArray.push("车载储能装置类型欠压报警");
        tmpArray.push("车载储能装置类型过充");
        tmpArray.push("峰值放电电流过大截止报警");
        tmpArray.push("电池充电温度过高报警");
        tmpArray.push("电池充电温度过高截止报警");
        tmpArray.push("电池充电温度过低截止报警");
        tmpArray.push("动力电池SOC过高报警");
        tmpArray.push("制动能量回收单体电压过高报警");
        tmpArray.push("制动能量回收单体电压过高截止报警");
        tmpArray.push("取消制动能量回收功能");
        tmpArray.push("BMS模块通讯失效");
        tmpArray.push("BMS系统故障");
        tmpArray.push("动力蓄电池故障");
        tmpArray.push("制动能量回收电流过大报警");
        tmpArray.push("单体电压过高报警");
        tmpArray.push("单体电压过高截止报警");
        tmpArray.push("单体电压过低报警");
        tmpArray.push("单体电压过低截止报警");
        tmpArray.push("峰值放电电流过大");
        tmpArray.push("峰值充电电流过大");
        tmpArray.push("电池温度过高报警");
        tmpArray.push("电池放电温度过低报警");
        tmpArray.push("电池温度过高截止报警");
        tmpArray.push("电池放电温度过低截止报警");
        tmpArray.push("单体电池压差过大报警");
        tmpArray.push("单体电池压差过大截止报警");
        tmpArray.push("电池充电电压过高");
        tmpArray.push("动力电池温度差异报警");
        tmpArray.push("动力电池充电温度过低报警");
        tmpArray.push("动力电池SOC过低报警");
        tmpArray.push("一级绝缘报警");
        tmpArray.push("二级绝缘报警");
        tmpArray.push("高压断线故障");
        tmpArray.push("绝缘模块故障");
        tmpArray.push("驱动系统故障报警");
        tmpArray.push("驱动控制器过压报警");
        tmpArray.push("驱动控制器欠压报警");
        tmpArray.push("驱动控制器编码器故障");
        tmpArray.push("驱动控制器高温报警");
        tmpArray.push("驱动控制器高温截止报警");
        tmpArray.push("驱动控制器主接触器故障");
        tmpArray.push("驱动控制器过流报警");
        tmpArray.push("驱动电机高温报警");
        tmpArray.push("驱动电机高温截止报警");
        tmpArray.push("驱动电机旋变故障报警");
        tmpArray.push("驱动电机功率受限报警");
        tmpArray.push("驱动电机转矩受限报警");
        tmpArray.push("驱动电机水温过高报警");
        tmpArray.push("加速踏板信号值异常报警");
        tmpArray.push("刹车踏板信号值异常报警");
        tmpArray.push("安全带报警");
        tmpArray.push("座椅开关报警");
        tmpArray.push("右侧舱门开启报警");
        tmpArray.push("左侧舱门开启报警");
        tmpArray.push("司机门未关报警");
        tmpArray.push("高压开关门开启报警");
        tmpArray.push("充电门开启报警");
        tmpArray.push("安全门开启报警");
        tmpArray.push("低压开关门开启报警");
        tmpArray.push("ABS系统故障");
        tmpArray.push("空压机控制器高温报警");
        tmpArray.push("空压机电机高温报警");
        tmpArray.push("助力泵控制器高温报警");
        tmpArray.push("助力泵电机高温报警");
        tmpArray.push("DC输入欠压");
        tmpArray.push("DC输入过压");
        tmpArray.push("DC过热");
        tmpArray.push("DC短路");

        if(CarMsg.warningid === 0 )
        {
            busPanelVisible = true;
        }
        else if(CarMsg.warningid === 1 ||(CarMsg.warningid === 2)||(CarMsg.warningid === 3)||(CarMsg.warningid === 3)
                ||(CarMsg.warningid === 4)||(CarMsg.warningid === 5)||(CarMsg.warningid === 6)||(CarMsg.warningid === 7)
                ||(CarMsg.warningid === 8)||(CarMsg.warningid === 9)||(CarMsg.warningid === 10)||(CarMsg.warningid === 11)
                ||(CarMsg.warningid === 12)||(CarMsg.warningid === 13)||(CarMsg.warningid === 14)||(CarMsg.warningid === 15)
                ||(CarMsg.warningid === 16)||(CarMsg.warningid === 17)||(CarMsg.warningid === 18)||(CarMsg.warningid === 19)
                ||(CarMsg.warningid === 20)||(CarMsg.warningid === 21)||(CarMsg.warningid === 22)||(CarMsg.warningid === 23)
                ||(CarMsg.warningid === 24)||(CarMsg.warningid === 25)||(CarMsg.warningid === 26)||(CarMsg.warningid === 27)
                ||(CarMsg.warningid === 28)||(CarMsg.warningid === 29)||(CarMsg.warningid === 30)||(CarMsg.warningid === 31)
                ||(CarMsg.warningid === 32)||(CarMsg.warningid === 33)||(CarMsg.warningid === 34)||(CarMsg.warningid === 35)
                ||(CarMsg.warningid === 36))
        {
            nPanelVisible = true;
            warningBattery.visible = true;    //电池包故障
            warningDriveSystem.visible = false;
            warningSeatBelts.visible = false;
            warningVehicle.visible = false;
            warningDcDc.visible = false;

            warningBatteryText = tmpArray[CarMsg.warningid];
        }
        else if(CarMsg.warningid === 37||(CarMsg.warningid === 38)||(CarMsg.warningid === 39)||(CarMsg.warningid === 40)
                ||(CarMsg.warningid === 41)||(CarMsg.warningid === 42)||(CarMsg.warningid === 43)||(CarMsg.warningid === 44)
                ||(CarMsg.warningid === 45)||(CarMsg.warningid === 46)||(CarMsg.warningid === 47)||(CarMsg.warningid === 48)
                ||(CarMsg.warningid === 49)||(CarMsg.warningid === 50)||(CarMsg.warningid === 51)||(CarMsg.warningid === 52)
                ||(CarMsg.warningid === 62)||(CarMsg.warningid === 63)||(CarMsg.warningid === 64)||(CarMsg.warningid === 65)
                ||(CarMsg.warningid === 66))
        {
            nPanelVisible = true;
            warningDriveSystem.visible = true;    //驱动系统报警
            warningBattery.visible = false;    //电池包故障
            warningSeatBelts.visible = false;
            warningVehicle.visible = false;
            warningDcDc.visible = false;
        }
        else if(CarMsg.warningid === 53)        //安全带未系
        {
             nPanelVisible = true;
            warningSeatBelts.visible = true;
            warningDriveSystem.visible = false;    //驱动系统报警
            warningBattery.visible = false;    //电池包故障
            warningVehicle.visible = false;
            warningDcDc.visible = false;
        }
        else if((CarMsg.warningid === 54)||(CarMsg.warningid === 55)||(CarMsg.warningid === 56)||(CarMsg.warningid === 57)
                ||(CarMsg.warningid === 58)||(CarMsg.warningid === 59)||(CarMsg.warningid === 60)||(CarMsg.warningid === 61))
        {
             nPanelVisible = true;
            warningVehicle.visible = true;     //整车报警
            warningSeatBelts.visible = false;
            warningDriveSystem.visible = false;    //驱动系统报警
            warningBattery.visible = false;    //电池包故障
            warningDcDc.visible = false;
        }
        else if((CarMsg.warningid === 67)||(CarMsg.warningid === 68)||(CarMsg.warningid === 69)||(CarMsg.warningid === 70))
        {
             nPanelVisible = true;
            warningDcDc.visible = true;     //dcdc报警
            warningVehicle.visible = false;     //整车报警
            warningSeatBelts.visible = false;
            warningDriveSystem.visible = false;    //驱动系统报警
            warningBattery.visible = false;    //电池包故障

            warningDcDcText = tmpArray[CarMsg.warningid];
        }
    }

       Connections {
        // 链接CarMsg信号
        target: CarMsg

        onWarningidChanged:{
            console.log(CarMsg.warningid)  //必须写在函数里面
            if(externState == "MainView")
            {
                busPanelVisible = false;
                nPanelVisible = false;
                warningDate();
            }
        }
    }

    onKeyEnter: function(){
        if(externState == "MainView")
        {
            externState = "MenuList";
            UiController.showLayer("MenuPanel");
            busPanelVisible = false;
            nPanelVisible = false;
            CarMsg.warningid = 0;
        }

        else if(externState == "MenuList") //list
        {
            externState = "MenuParameter"
        }
    }

    onKeyBack: function(){
        if(externState == "MainView")
        {

        }
        else if(externState == "MenuList") //list
        {
            externState = "MainView";

            if(externState == "MainView")
            {
                busPanelVisible = false;
                nPanelVisible = false;
                warningDate();
            }

//            busPanelVisible = true;
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

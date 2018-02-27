import QtQuick 2.6
import CustomEnum 1.0
import "./"
import "qrc:/Common/Component"

CommonItem {
    id: mainPanel
    width: 1440
    height: 540
    opacity: 0.0
    visible: false
    z: 0

    onVisibleChanged: {
        if(visible) {
            mainPanel.opacity = 1.0
            gmlGifImage.playing = true
        }
        else {
            state = "";
        }
    }

    QmlGifImage {
        id: gmlGifImage
        gifSource: "qrc:/Theme/Theme3/Image/Gif/splash.gif"
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
            dashboardLeft.text_content = count
            dashboardRight.text_content = count
        }
    }

    Rectangle {   //主界面
        id: mainView
        anchors.fill: parent
        color: "transparent"
        visible: false
        onVisibleChanged:{      //主界面一显示出来
            if(visible)
            {
                state = "MainView";
            }

            busPanel.bus_ready_running = true;
            dashboardLeft.dot_timer_running = true;
            dashboardRight.dot_timer_runing = true;
        }
        Image {     //主界面背景
            id: bg
            anchors.fill: parent
            source: "qrc:/Theme/Theme3/Image/HomePane/bg.png"

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

            BusPanel {
                id: busPanel
                x:369
                y:74
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
                        bg.source = "qrc:/Theme/Theme3/Image/MenuPanel/bg.png"   //星空图
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
                        bg.source = "qrc:/Theme/Theme3/Image/HomePane/bg.png"     //蓝图
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
//                        bg.source = "qrc:/Theme/Theme3/Image/2ed/bg/2ed.png"
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
//                        bg.source = "qrc:/Theme/Theme3/Image/2ed/bg/bg.png"
                        dashboardLeft.state = "Menu_1_style"
                        dashboardRight.state = "Menu_1_style"
                    }
                }
            }
        ]
    }

    Connections {
        // 链接CarMsg信号
        target: CarMsg

        onCarSpeedChanged: {
            console.log(value);
        }

        onKeyShortPressed: {
            if(key === 0) //enter键
            {
                if(mainView.state == "MainView")
                {
                    mainView.state = "MenuList";
                    UiController.showLayer("MenuPanel");
                    busPanel.visible = false;
                }

                else if(mainView.state == "MenuList") //list
                {
                    mainView.state = "MenuParameter"
//                    UiController.hideLayer("MenuPanel");
                }
            }
            else if(key === 1) //back返回
            {
                if(mainView.state == "MainView")
                {
//                    UiController.hideLayer("MenuPanel");
//                    busPanel.visible = true;
                }

                else if(mainView.state == "MenuList") //list
                {
                    mainView.state = "MainView";
                    UiController.hideLayer("MenuPanel");
                    busPanel.visible = true;
                }
                else if(mainView.state == "MenuParameter")
                {
                    mainView.state = "MenuList";
                    UiController.showLayer("MenuPanel");
                }
            }
            else if(key === 2) //pre
            {
                if(mainView.state == "MenuList")
                {
//                    middleMenu.menuListExteral.decrementCurrentIndex();
                }
            }
            else if(key === 3)  //next
            {
                if(mainView.state == "MenuList")
                {
//                    middleMenu.menuListExteral.incrementCurrentIndex();
                }
            }
        }

        onKeyLongPressed: {
            if (key === 3) {
                // 切换主题
                //CarMsg.themeSetChanged(CustomEnum.Theme3Mode);
            }
            else if (key === 4){
                //CarMsg.themeSetChanged(CustomEnum.Theme4Mode);
            }
        }

        onCarModeChanged: {
            console.log("---------: mode:", CarMsg.carMode);
            if (CarMsg.carMode === CustomEnum.IgOffMode) state = "shutdown";
        }
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

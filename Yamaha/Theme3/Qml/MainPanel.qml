import QtQuick 2.6
import CustomEnum 1.0
import "./"

Rectangle {
    id: mainPanel
    width: 1440
    height: 540
    opacity: 0.0
    color: "red"
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

            middleMenu.ready_timer_running = true;
            dashboardLeft.dot_timer_running = true;
            dashboardRight.dot_timer_runing = true;
        }
        Image {     //主界面背景
            id: bg
            anchors.fill: parent
            source: "qrc:/Theme/Theme3/Image/1st/bg/bg.png"

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

            MiddleMenu {
                id: middleMenu
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
                        bg.source = "qrc:/Theme/Theme3/Image/2ed/bg/bg.png"
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
                        bg.source = "qrc:/Theme/Theme3/Image/1st/bg/bg.png"
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
                        bg.source = "qrc:/Theme/Theme3/Image/2ed/bg/2ed.png"
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
                        bg.source = "qrc:/Theme/Theme3/Image/2ed/bg/bg.png"
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
            if(middleMenu.isRunning())
            {
                return;
            }
            if(key === 0) //enter键
            {
                if(mainView.state == "MainView")
                {
                    mainView.state = "MenuList";
                    middleMenu.gotoPage(1);
                }

                else if(mainView.state == "MenuList") //list
                {
                    mainView.state = "MenuParameter"
//                    middleMenu.menuListVisible = false;
                    if(middleMenu.menuListExteral.currentIndex == 0)
                    {
                         middleMenu.gotoPage(2);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 1)
                    {
                         middleMenu.gotoPage(3);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 2)
                    {
                         middleMenu.gotoPage(4);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 3)
                    {
                         middleMenu.gotoPage(5);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 4)
                    {
                         middleMenu.gotoPage(6);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 5)
                    {
                         middleMenu.gotoPage(7);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 6)
                    {
                         middleMenu.gotoPage(8);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 7)
                    {
                         middleMenu.gotoPage(9);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 8)
                    {
                         middleMenu.gotoPage(10);   //1~10
                    }
                    else if(middleMenu.menuListExteral.currentIndex == 9)
                    {
                         middleMenu.gotoPage(11);   //1~10
                    }
                }
            }
            else if(key === 1) //back返回
            {
                if(mainView.state == "MainView")
                {

                }

                else if(mainView.state == "MenuList") //list
                {
                    mainView.state = "MainView";
                    middleMenu.backPage();
//                    middleMenu.menuListVisible = false;
//                    middleMenu.busVisible = true;
                }
                else if(mainView.state == "MenuParameter")
                {
                    mainView.state = "MenuList";
//                    middleMenu.menuListVisible = true;
                    middleMenu.backPage();
                }
            }
            else if(key === 2) //pre
            {
                if(mainView.state == "MenuList")
                {
                    middleMenu.menuListExteral.decrementCurrentIndex();
                }
            }
            else if(key === 3)  //next
            {
                if(mainView.state == "MenuList")
                {
                    middleMenu.menuListExteral.incrementCurrentIndex();
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

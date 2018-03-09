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
    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string gifImage:sourceImageUrl+"Image/Gif/splash.gif";
    property string bgImage:sourceImageUrl+"Image/HomePane/bg.png";
    property string staBgImage:sourceImageUrl+"Image/MenuPanel/bg.png";

    onKeyEnter: function(){
        if(externState == "MainView")
        {
            externState = "MenuList";
            UiController.showLayer("MenuPanel");
            busPanelVisible = false;
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
            busPanelVisible = true;
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
            dashboardLeft.text_content = count
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

            busPanel.bus_ready_running = true;
            dashboardLeft.dot_timer_running = true;
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

            BusPanel {
                id: busPanel
                visible:busPanelVisible
                x:369
                y:74
            }

            IconPanel{
                id:iconpanel
                x:0
                y:0
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

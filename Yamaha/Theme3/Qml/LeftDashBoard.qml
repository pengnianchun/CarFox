import QtQuick 2.0

Item {
    id: mainView

    property alias dot_timer_running: dash_left_dot_timer.running;
    property alias text_content: dashboardLeftText.text;

    state: "Main_style"

    function setDashboardLeftValue(pValue)  //0~8
    {
        var tmpAngelValue = pValue * ((128+124) / 8) - 124;
        dash_left_dot_timer.dstValue = tmpAngelValue;
        dash_left_dot_timer.running = true;
    }

    Text {    //左边仪表盘的数字
        id: dashboardLeftText
        text: qsTr("4")
        x:259
        y:170
        width:67
        height:91
        font.family: "PingFang SC Regular"
        font.pixelSize: 110
        color: "white"
        horizontalAlignment:Text.AlignHCenter
    }

    Image {     //左边仪表盘
        id: dashBoardBackground
        x:68     //68
        y:26  //26
        source: "qrc:/Theme/Theme3/Image/DashBoard/l_dashboard.png"

        Image {     //左边仪表盘上的mpa
            id: mpa_left
            source: "qrc:/Theme/Theme3/Image/DashBoard/left_mpa_line.png"
            x:103
            y:111
            width:185
            height:256
        }
        Timer{      //左边仪表盘的指示点定时器
            id:dash_left_dot_timer
            property int dstValue: 128
            interval: 4
            running: false
            repeat: true
            onTriggered: {
                if(dash_left_dot_rotate.angle > dstValue)
                {
                    dash_left_dot_rotate.angle -= 1;
                    dash_left_line_rotate.angle -= 1;
                }
                else if(dash_left_dot_rotate.angle < dstValue)
                {
                    dash_left_dot_rotate.angle += 1;
                    dash_left_line_rotate.angle += 1;
                }
                else if(dash_left_dot_rotate.angle == dstValue)
                {
//                                running = false;
                    if(dstValue == -124)
                    {
                        dstValue = 128;
                    }
                    else if(dstValue == 128)
                    {
                        dstValue = -124;
                    }
                }
            }
        }
        Item{     //左边仪表盘指示点所在区域（用于旋转dot）
            id:dash_left_dot_area
            x:0
            y:0
            width:456
            height:468
            transform: Rotation{   //指示点旋转角度，沿着此item的中心点旋转，指示点会跟着旋转
                id: dash_left_dot_rotate
                origin.x: dash_left_dot_area.height/2; origin.y: dash_left_dot_area.height/2;
                axis { x: 0; y: 0; z: 1 } angle: -124; //-124~128
            }
            Image {     //左边仪表盘指示点
                id: dashboard_left_dot
                source: "qrc:/Theme/Theme3/Image/DashBoard/left_dot.png"
                x:-7
                y:208
                width:73
                height:66
            }
        }
        Item{     //左边仪表盘指示点clip显示区域
            id: dash_left_dot_area_show
            clip: true
            x:0
            y:0
            width:351
            height:468
            Item{   //左边仪表盘线区域
                id:dash_left_line_area
                x:0
                y:0
                width:456
                height:468
                transform: Rotation{
                    id: dash_left_line_rotate
                    origin.x: dash_left_line_area.height/2; origin.y: dash_left_line_area.height/2;
                    axis { x: 0; y: 0; z: 1 } angle: -124; //-124~128
                    onAngleChanged: {   //当角度值变化时
                        if(angle < (-124+90))
                        {
                            dashboard_left_line_1.visible = true;
                            dashboard_left_line_2.visible = false;
                            dashboard_left_line_3.visible = false;
                        }
                        else if(angle < (-124+180))
                        {
                            dashboard_left_line_1.visible = true;
                            dashboard_left_line_2.visible = true;
                            dashboard_left_line_3.visible = false;
                        }
                        else if(angle < (-124+270))
                        {
                            dashboard_left_line_1.visible = true;
                            dashboard_left_line_2.visible = true;
                            dashboard_left_line_3.visible = true;
                        }
                    }
                }
                Image {
                    id: dashboard_left_line_1
                    source: "qrc:/Theme/Theme3/Image/DashBoard/1.png"
                    x:35
                    y:234
                    width:199
                    height:199
                    visible: false
                }
                Image {
                    id: dashboard_left_line_2
                    source: "qrc:/Theme/Theme3/Image/DashBoard/1.png"
                    x:35
                    y:234
                    width:199
                    height:199
                    transformOrigin: Item.TopRight
                    rotation: -90
                    visible: false
                }
                Image {
                    id: dashboard_left_line_3
                    source: "qrc:/Theme/Theme3/Image/DashBoard/1.png"
                    x:35
                    y:234
                    width:199
                    height:199
                    transformOrigin: Item.TopRight
                    rotation: -180
                    visible: false
                }
            }
        }
    }

    states: [
        State {
            name: "Main_style"
        },
        State {
            name: "Menu_1_style"
        },
        State {
            name: "Menu_2_style"
        }
    ]

    transitions: [
        Transition {   //左边设置菜单界面
            from: "Main_style"
            to: "Menu_1_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Left
                        //dashBoardBackground.x = 66
                        //dashBoardBackground.y = 68
                        //dashboardLeftText.x = 226
                        //dashboardLeftText.y = 192
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "rotation"; from: 0; to: -10; duration: 100 }
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 1.0; to: 0.9; duration: 100 }
                    NumberAnimation { target: dashboardLeftText; property: "scale"; from: 1; to: 0.8; duration: 100 }

                    NumberAnimation { target: dashBoardBackground; property: "x"; to: 66; duration: 100 }
                    NumberAnimation { target: dashBoardBackground; property: "y"; to: 68; duration: 100 }

                    NumberAnimation { target: dashboardLeftText; property: "x"; to: 226; duration: 100 }
                    NumberAnimation { target: dashboardLeftText; property: "y"; to: 192; duration: 100 }
                }
            }
        },
        Transition {
            from: "Menu_1_style"
            to: "Main_style"
            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Left
                        //dashBoardBackground.x = 66
                        //dashBoardBackground.y = 26
                        //dashboardLeftText.x = 259
                        //dashboardLeftText.y = 170
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "rotation"; from: -10; to: 0; duration: 100 }
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 0.9; to: 1; duration: 100 }
                    NumberAnimation { target: dashboardLeftText; property: "scale"; from: 0.8; to: 1; duration: 100 }

                    NumberAnimation { target: dashBoardBackground; property: "x"; to: 66; duration: 100 }
                    NumberAnimation { target: dashBoardBackground; property: "y"; to: 26; duration: 100 }

                    NumberAnimation { target: dashboardLeftText; property: "x"; to: 259; duration: 100 }
                    NumberAnimation { target: dashboardLeftText; property: "y"; to: 170; duration: 100 }
                }
            }
        },
        Transition {
            from: "Menu_1_style"
            to: "Menu_2_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Left
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 0.9; to: 0.8; duration: 100 }
                    NumberAnimation { target: dashboardLeftText; property: "scale"; from: 0.8; to: 0.7; duration: 100 }
                }
            }
        },
        Transition {
            from: "Menu_2_style"
            to: "Menu_1_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Left
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 0.8; to: 0.9; duration: 100 }
                    NumberAnimation { target: dashboardLeftText; property: "scale"; from: 0.7; to: 0.8; duration: 100 }
                }
            }
        }
    ]
}

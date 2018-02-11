import QtQuick 2.0

Item {
    id: mainView

    property alias dot_timer_runing: dash_right_dot_timer.running;
    property alias text_content: dashboardRightText.text;

    state: "Main_style"

    Text {    //右仪表文字
        id: dashboardRightText
        x:1012
        y:170
        width:211
        height:151
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("80")
        font.family: "PingFang SC Regular"
        font.pixelSize:110
        color: "white"
    }
    Image {     //右边仪表盘
        id: dashBoardBackground
        x:910
        y:26
        source: "qrc:/Theme/Theme1/Image/1st/dashboard/right/r_dashboard.png"
        Image {
            id: mpa_right
            source: "qrc:/Theme/Theme1/Image/1st/mpa/right/mpa_line_bg.png"
            x:163
            y:113
            width:188
            height:256
        }
        Timer{    //右仪表dot定时器
            id:dash_right_dot_timer
            property int dstValue: -124
            interval: 4
            running: false
            repeat: true
            onTriggered: {
                if(dash_right_dot_rotate.angle > dstValue)
                {
                    dash_right_dot_rotate.angle -= 1;
                    dash_right_line_rotate.angle -= 1;
                }
                else if(dash_right_dot_rotate.angle < dstValue)
                {
                    dash_right_dot_rotate.angle += 1;
                    dash_right_line_rotate.angle += 1;
                }
                if(dash_right_dot_rotate.angle == dstValue)
                {
//                            running = false;
                    if(dstValue == -124)
                    {
                        dstValue = 123;
                    }
                    else if(dstValue == 123)
                    {
                        dstValue = -124;
                    }
                }
            }
        }

        Item{
            id:dash_right_dot_area
            x:0
            y:0
            width:456
            height:472
            transform: Rotation{
                id:dash_right_dot_rotate
                origin.x: dash_right_dot_area.width-dash_right_dot_area.height/2; origin.y:dash_right_dot_area.height/2;
                axis{x:0; y:0; z:1} angle:123 //(123~-124)
            }
            Image{
                id:dashboard_right_dot
                source: "qrc:/Theme/Theme1/Image/1st/dashboard/right/r_biaoge.png"
                x:383
                y:196
                width:82
                height:83
            }
        }
        Item{
            id: dash_right_line_area_show
            clip: true
            x:108
            y:0
            width:351
            height:472
            Item{
                id:dash_right_line_area
                x:0
                y:0
                width:456
                height:472
                transform: Rotation{
                    id:dash_right_line_rotate
                    origin.x: dashBoardBackground.width-dashBoardBackground.height/2-108; origin.y:dashBoardBackground.height/2;
                    axis{x:0; y:0; z:1} angle:123 //(123~-124)
                    onAngleChanged: {
                        if(angle > (123-90))
                        {
                            dashboard_right_line1.visible = true;
                            dashboard_right_line2.visible = false;
                            dashboard_right_line3.visible = false;
                        }
                        else if(angle > (123-180))
                        {
                            dashboard_right_line1.visible = true;
                            dashboard_right_line2.visible = true;
                            dashboard_right_line3.visible = false;
                        }
                        else if(angle > (123-270))
                        {
                            dashboard_right_line1.visible = true;
                            dashboard_right_line2.visible = true;
                            dashboard_right_line3.visible = true;
                        }
                    }
                }
                Image{
                    id:dashboard_right_line1
                    source: "qrc:/Theme/Theme1/Image/1st/dashboard/right/2.png"
                    x:110
                    y:233
                    width:204
                    height:204
                    visible: false
                }
                Image{
                    id:dashboard_right_line2
                    source: "qrc:/Theme/Theme1/Image/1st/dashboard/right/2.png"
                    x:110
                    y:233
                    width:204
                    height:204
                    transformOrigin: Item.TopLeft
                    rotation: 90
                    visible: false
                }
                Image{
                    id:dashboard_right_line3
                    source: "qrc:/Theme/Theme1/Image/1st/dashboard/right/2.png"
                    x:110
                    y:233
                    width:204
                    height:204
                    transformOrigin: Item.TopLeft
                    rotation: 180
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
        Transition {
            from: "Main_style"
            to: "Menu_1_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Right
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "rotation"; from: 0; to: 10; duration: 100 }
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 1.0; to: 0.9; duration: 100 }
                    NumberAnimation { target: dashboardRightText; property: "scale"; from: 1; to: 0.8; duration: 100 }

                    NumberAnimation { target: dashBoardBackground; property: "x"; to:910; duration: 100}
                    NumberAnimation { target: dashBoardBackground; property: "y"; to:68; duration:100}
                    NumberAnimation { target: dashboardRightText; property: "x"; to:1050; duration: 100}
                    NumberAnimation { target: dashboardRightText; property: "y"; to:191; duration:100}
                }
            }
        },
        Transition {
            from: "Menu_1_style"
            to: "Main_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Right
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "rotation"; from: 10; to: 0; duration: 100 }
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 0.9; to: 1; duration: 100 }
                    NumberAnimation { target: dashboardRightText; property: "scale"; from: 0.8; to: 1; duration: 100 }

                    NumberAnimation { target: dashBoardBackground; property: "x"; to:910; duration: 100}
                    NumberAnimation { target: dashBoardBackground; property: "y"; to:26; duration:100}
                    NumberAnimation { target: dashboardRightText; property: "x"; to:1012; duration: 100}
                    NumberAnimation { target: dashboardRightText; property: "y"; to:170; duration:100}
                }
            }
        },
        Transition {
            from: "Menu_1_style"
            to: "Menu_2_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Right
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 0.9; to: 0.8; duration: 100 }
                    NumberAnimation { target: dashboardRightText; property: "scale"; from: 0.8; to: 0.7; duration: 100 }
                }
            }
        },
        Transition {
            from: "Menu_2_style"
            to: "Menu_1_style"

            SequentialAnimation {
                ScriptAction {
                    script: {
                        dashBoardBackground.transformOrigin = Item.Right
                    }
                }
                ParallelAnimation {
                    NumberAnimation { target: dashBoardBackground; property: "scale"; from: 0.8; to: 0.9; duration: 100 }
                    NumberAnimation { target: dashboardRightText; property: "scale"; from: 0.7; to: 0.8; duration: 100 }
                }
            }
        }
    ]

}

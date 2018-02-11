import QtQuick 2.0
import QtQml 2.0
import "./Menu/"

Item {
    property alias ready_timer_running: readyTimer.running;
    property int curIndex: 0
    property alias menuListExteral: menu_1.menuListExteral
//    property alias menuListVisible : menu_1.menuListVisible
//    property alias busVisible : menu_0.visible
    width : 693
    height : 457

    function isRunning(){
        if(pushAnimation.running == true || (popAnimation.running == true)){
            return true;
        }
        else{
            return false;
        }
    }

    function gotoPage(pIndex){
        if(pIndex === 1)   //进入list页面
        {
            curIndex = 1;
            menu_0.opacity = 1;
            menu_0.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPushAnimation.target = menu_1  //list
            exitItemPushAnimation.target = menu_0
            pushAnimation.start();
        }
        else if(pIndex === 2)  //从list到第一个子页面
        {
            curIndex = 2;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_2.opacity = 0;
            menu_2.visible = true;
            enterItemPushAnimation.target = menu_2
            exitItemPushAnimation.target = menu_1  //list
            pushAnimation.start();
        }
        else if(pIndex === 3) //从list到第二个子页面
        {
            curIndex = 3;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_3.opacity = 0;
            menu_3.visible = true;
            enterItemPushAnimation.target = menu_3
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 4)
        {
            curIndex = 4;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_4.opacity = 0;
            menu_4.visible = true;
            enterItemPushAnimation.target = menu_4
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 5)
        {
            curIndex = 5;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_5.opacity = 0;
            menu_5.visible = true;
            enterItemPushAnimation.target = menu_5
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 6)
        {
            curIndex = 6;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_6.opacity = 0;
            menu_6.visible = true;
            enterItemPushAnimation.target = menu_6
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 7)
        {
            curIndex = 7;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_7.opacity = 0;
            menu_7.visible = true;
            enterItemPushAnimation.target = menu_7
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 8)
        {
            curIndex = 8;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_8.opacity = 0;
            menu_8.visible = true;
            enterItemPushAnimation.target = menu_8
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 9)
        {
            curIndex = 9;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_9.opacity = 0;
            menu_9.visible = true;
            enterItemPushAnimation.target = menu_9
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 10)
        {
            curIndex = 10;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_10.opacity = 0;
            menu_10.visible = true;
            enterItemPushAnimation.target = menu_10
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 11)
        {
            curIndex = 11;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_11.opacity = 0;
            menu_11.visible = true;
            enterItemPushAnimation.target = menu_11
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
    }
    function backPage(){
        if(curIndex == 1)
        {
            curIndex = 0;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_0.opacity = 0;
            menu_0.visible = true;
            enterItemPopAnimation.target = menu_0  //主界面
            exitItemPopAnimation.target = menu_1  //list
            popAnimation.start();
        }
        else if(curIndex == 2)
        {
            curIndex = 1;
            menu_2.opacity = 1;
            menu_2.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1  //list
            exitItemPopAnimation.target = menu_2
            popAnimation.start();
        }
        else if(curIndex == 3)
        {
            curIndex = 1;
            menu_3.opacity = 1;
            menu_3.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_3
            popAnimation.start();
        }
        else if(curIndex == 4)
        {
            curIndex = 1;
            menu_4.opacity = 1;
            menu_4.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_4
            popAnimation.start();
        }
        else if(curIndex == 5)
        {
            curIndex = 1;
            menu_5.opacity = 1;
            menu_5.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_5
            popAnimation.start();
        }
        else if(curIndex == 6)
        {
            curIndex = 1;
            menu_6.opacity = 1;
            menu_6.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_6
            popAnimation.start();
        }
        else if(curIndex == 7)
        {
            curIndex = 1;
            menu_7.opacity = 1;
            menu_7.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_7
            popAnimation.start();
        }
        else if(curIndex == 8)
        {
            curIndex = 1;
            menu_8.opacity = 1;
            menu_8.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_8
            popAnimation.start();
        }
        else if(curIndex == 9)
        {
            curIndex = 1;
            menu_9.opacity = 1;
            menu_9.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_9
            popAnimation.start();
        }
        else if(curIndex == 10)
        {
            curIndex = 1;
            menu_10.opacity = 1;
            menu_10.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_10
            popAnimation.start();
        }
        else if(curIndex == 11)
        {
            curIndex = 1;
            menu_11.opacity = 1;
            menu_11.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_11
            popAnimation.start();
        }
        else if(curIndex == 12)
        {
            curIndex = 1;
            menu_12.opacity = 1;
            menu_12.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_12
            popAnimation.start();
        }
    }

    ParallelAnimation {
        id: pushAnimation

        PropertyAnimation {
            id: enterItemPushAnimation
            target: null
            property: "opacity"
            from: 0
            to: 1
            duration: 100
        }
        PropertyAnimation {
            id: exitItemPushAnimation
            target: null
            property: "opacity"
            from: 1
            to: 0
            duration: 100
        }
    }
    ParallelAnimation {
        id: popAnimation

        PropertyAnimation {
            id: enterItemPopAnimation
            target: null
            property: "opacity"
            from: 0
            to: 1
            duration: 100
        }
        PropertyAnimation {
            id: exitItemPopAnimation
            target: null
            property: "opacity"
            from: 1
            to: 0
            duration: 100
        }
    }

    Item {
        id: menu_0
        anchors.fill: parent
        visible: true;

        Image {     //汽车
            id: bus
            source: "qrc:/Theme/Theme3/Image/1st/bus/bus.png"
            x:190
            y:110
            width:336
            height:214
            Image {   //车灯
                id: bus_light
                source: "qrc:/Theme/Theme3/Image/1st/ready/light.png"
                x:180
                y:140
                width:181
                height:46
                visible: false

                Timer{
                    id: bus_light_timer
                    interval: 200;
                    running: false;
                    repeat: true
                    onTriggered: {
                        if(bus_light.visible == true)
                        {
                            bus_light.visible = false;
                        }
                        else
                        {
                            bus_light.visible = true;
                        }
                        if(bus_ready.opacity == 0)
                        {
                            running = false;
                            bus_light.visible = true;
                        }
                    }
                }
            }
        }
        Item {    //ready
            x:267
            y:51
            width:181
            height:51
            Timer {
                id: readyTimer
                interval: 1000;
                running: false;
                repeat: false
                onTriggered: {
                    bus_ready.visible = true
                    bus_wait.visible = false
                    arrow_ready_left.visible = true
                    arrow_ready_right.visible = true
                    bus_light_timer.running = true
                }
            }
            Image {     //ready动画
                id: bus_ready
                source: "qrc:/Theme/Theme3/Image/1st/ready/READY.png"
                x:27
                y:0
                width:121
                height:51
                visible: false

                Timer{
                    id: bus_ready_timer
                    interval: 1
                    running: false
                    repeat: true
                    onTriggered: {
                        bus_ready.scale *= 1.08
                        bus_ready.opacity -= 0.05
                        arrow_ready_left.opacity -= 0.05;
                        arrow_ready_right.opacity -= 0.05;
                        if(bus_ready.opacity == 0)
                        {
                            running = false;
                        }
                    }
                }
            }
            Image {     //wait
                id: bus_wait
                source: "qrc:/Theme/Theme3/Image/1st/ready/wait.png"
                x:27
                y:0
                width:95
                height:40
                visible:true
            }
            Image {     //ready左箭头
                id: arrow_ready_left
                source: "qrc:/Theme/Theme3/Image/1st/ready/ready_arrow_l.png"
                x:0
                y:16
                width:13
                height:15
                visible: false

                transform: Rotation {    //左箭头旋转初始化定义
                    id: arrow_ready_left_rotate
                    origin.x: 0; origin.y: 7.5;
                    axis { x: 1; y: 0; z: 0 } angle: 0;
                }
                onVisibleChanged: {
                    if(visible)
                        arrow_ready_left_rotate_timer.running = true
                }
                Timer {     //左箭头旋转特效
                    id: arrow_ready_left_rotate_timer
                    property int rotateAngle: 0
                    interval: 1;
                    running: false;
                    repeat: true
                    onTriggered: {
                        rotateAngle+=6;
                        if(rotateAngle >= 720)
                        {
                            arrow_ready_left_rotate_timer.running = false;
                            bus_ready_timer.running = true;
                        }
                        arrow_ready_left_rotate.angle = rotateAngle;
                    }
                }
            }
            Image {      //ready右边箭头初始化
                id: arrow_ready_right
                source: "qrc:/Theme/Theme3/Image/1st/ready/ready_arrow_r.png"
                x:158
                y:16
                width:13
                height:15
                visible:false

                transform:Rotation{   //右边箭头初始化旋转
                    id:arrow_ready_right_rotate
                    origin.x: 0; origin.y:7.5
                    axis{x:1;y:0;z:0}
                    angle: 0
                }
                onVisibleChanged: {     //刚出现时，启动旋转定时器
                    if(visible)
                    {
                        arrow_ready_right_rotate_timer.running = true;
                    }
                }
                Timer{       //右边箭头旋转定时器
                    id: arrow_ready_right_rotate_timer
                    interval: 1
                    running:false
                    repeat:true
                    onTriggered:{
                        if(arrow_ready_right_rotate.angle >= 720)
                        {
                            running = false;
                        }

                        arrow_ready_right_rotate.angle +=6;
                    }
                }
            }
        }
    }

    MenuPanel {
        id: menu_1   //list
    }
    VCU{
        id: menu_2
    }
    VehicleCtrlSysDiagInterface{
        id: menu_3
    }
    PowerBattery1{
        id: menu_4
    }
    PowerBattery2{
        id: menu_5
    }
    SBatteryTempInfo{
        id: menu_6
    }
    DCDC {
        id: menu_7
    }
    TPMS{
        id: menu_8
    }

    TimeSetting{
        id: menu_9
    }
    BringhtnessControl{
        id: menu_10
    }

    MiscellaneousInforQuery{
        id: menu_11
    }

}

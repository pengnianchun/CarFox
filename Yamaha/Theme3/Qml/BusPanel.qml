import QtQuick 2.0
import "qrc:/Common/Component"


CommonItem {
    property alias bus_ready_running: readyTimer.running

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string busImage:sourceImageUrl+"Image/MiddlePanel/bus.png";
    property string busLightImage:sourceImageUrl+"Image/MiddlePanel/bus_light.png";
    property string busReadyImage:sourceImageUrl+"Image/MiddlePanel/ready.png";
    property string busWaitImage:sourceImageUrl+"Image/MiddlePanel/wait.png";
    property string arrowReadyLeftImage:sourceImageUrl+"Image/MiddlePanel/wait.png";
    property string arrowReadyRightImage:sourceImageUrl+"Image/MiddlePanel/ready_arrow_right.png";

    id: root
    width: 693
    height: 457
    visible: true;

    Image {     //汽车
        id: bus
        source: busImage
        x:190
        y:110
        width:336
        height:214
        Image {   //车灯
            id: bus_light
            source: busLightImage
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
            source: busReadyImage
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
            source: busWaitImage
            x:27
            y:0
            width:95
            height:40
            visible:true
        }
        Image {     //ready左箭头
            id: arrow_ready_left
            source: arrowReadyLeftImage
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
            source: arrowReadyRightImage
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

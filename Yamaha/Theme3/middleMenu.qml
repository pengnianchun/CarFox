import QtQuick 2.0
import QtQml 2.0

Item {
    property alias ready_timer_running: readyTimer.running;
    property int curIndex: 0
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
        if(pIndex === 1)
        {
            curIndex = 1;
            menu_0.opacity = 1;
            menu_0.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPushAnimation.target = menu_1
            exitItemPushAnimation.target = menu_0
            pushAnimation.start();
        }
        else if(pIndex === 2)
        {
            curIndex = 2;
            menu_1.opacity = 1;
            menu_1.visible = true;
            menu_2.opacity = 0;
            menu_2.visible = true;
            enterItemPushAnimation.target = menu_2
            exitItemPushAnimation.target = menu_1
            pushAnimation.start();
        }
        else if(pIndex === 3)
        {
            curIndex = 3;
            menu_2.opacity = 1;
            menu_2.visible = true;
            menu_3.opacity = 0;
            menu_3.visible = true;
            enterItemPushAnimation.target = menu_3
            exitItemPushAnimation.target = menu_2
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
            enterItemPopAnimation.target = menu_0
            exitItemPopAnimation.target = menu_1
            popAnimation.start();
        }
        else if(curIndex == 2)
        {
            curIndex = 1;
            menu_2.opacity = 1;
            menu_2.visible = true;
            menu_1.opacity = 0;
            menu_1.visible = true;
            enterItemPopAnimation.target = menu_1
            exitItemPopAnimation.target = menu_2
            popAnimation.start();
        }
        else if(curIndex == 3)
        {
            curIndex = 2;
            menu_3.opacity = 1;
            menu_3.visible = true;
            menu_2.opacity = 0;
            menu_2.visible = true;
            enterItemPopAnimation.target = menu_2
            exitItemPopAnimation.target = menu_3
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
            duration: 200
        }
        PropertyAnimation {
            id: exitItemPushAnimation
            target: null
            property: "opacity"
            from: 1
            to: 0
            duration: 200
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
            duration: 200
        }
        PropertyAnimation {
            id: exitItemPopAnimation
            target: null
            property: "opacity"
            from: 1
            to: 0
            duration: 200
        }
    }

    Item {
        id: menu_0
        anchors.fill: parent
        visible: true;

        Image {     //汽车
            id: bus
            source: "qrc:/Theme/Theme1/Image/1st/bus/bus.png"
            x:190
            y:110
            width:336
            height:214
            Image {   //车灯
                id: bus_light
                source: "qrc:/Theme/Theme1/Image/1st/ready/light.png"
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
                source: "qrc:/Theme/Theme1/Image/1st/ready/READY.png"
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
                source: "qrc:/Theme/Theme1/Image/1st/ready/wait.png"
                x:27
                y:0
                width:95
                height:40
                visible:true
            }
            Image {     //ready左箭头
                id: arrow_ready_left
                source: "qrc:/Theme/Theme1/Image/1st/ready/ready_arrow_l.png"
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
                source: "qrc:/Theme/Theme1/Image/1st/ready/ready_arrow_r.png"
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
    Item {
        id: menu_1
        anchors.fill: parent
        visible: false;

        Image {
            id: menuIcon
            x:57
            y:43
            width: 300
            height: 300
            source: "qrc:/Theme/Theme1/Image/2ed/icon/batterySystem.png"
        }
        Image {
            id: menuListBg
            x:320
            y:180
            width: 332
            height: 43
            source: "qrc:/Theme/Theme1/Image/2ed/icon/rect.png"
        }
        PathView {
            id: menuList
            x:320
            y:0
            width: 332
            height: 400
            delegate: name_card
            model: model
            //preferredHighlightBegin: 0.5;
            //preferredHighlightEnd: 0.5;
            path: Path {
                startX: 150;  startY: parent.height*0.175
                PathAttribute { name: "itemZ"; value: 0 }
                PathAttribute { name: "itemScale"; value: 0.6; }
                PathAttribute { name: "itemOpacity"; value: 0.4; }
                PathLine { x: 150; y: parent.height*0.475; }
                PathPercent { value: 0.485; }
                PathLine { x: 150; y: parent.height*0.5; }
                PathAttribute { name: "itemZ"; value: 100 }
                PathAttribute { name: "itemScale"; value: 1.0; }
                PathAttribute { name: "itemOpacity"; value: 1.0; }
                PathLine { x: 150; y: parent.height*0.525; }
                PathPercent { value: 0.515; }
                PathLine { x: 150; y: parent.height*0.825; }
                PathAttribute { name: "itemZ"; value: 0 }
                PathAttribute { name: "itemScale"; value: 0.6; }
                PathAttribute { name: "itemOpacity"; value: 0.4; }
            }
            pathItemCount: 7
        }
        ListModel {
            id: model
            ListElement { textContent: "D C - D C 信 息"; }
            ListElement { textContent: "胎 压 监 测 系 统"; }
            ListElement { textContent: "模 块 信 息 查 询"; }
            ListElement { textContent: "动 力 电 池 信 息"; }
            ListElement { textContent: "视 频 信 号 切 换"; }
            ListElement { textContent: "时 间 设 置"; }
            ListElement { textContent: "整 车 系 统 状 态"; }
            ListElement { textContent: "网 络 设 置"; }
            ListElement { textContent: "屏 幕 设 置"; }
            ListElement { textContent: "安 全 加 密 认 证"; }
            ListElement { textContent: "儿 童 防 护"; }
        }
        Component {
            id: name_card
            Rectangle {
                id: wrapper
                width: parent ? parent.width*0.8 : 0
                height: parent ? parent.height/11 : 0
                color: "transparent"
                opacity: PathView.itemOpacity
                visible: PathView.onPath
                scale: PathView.itemScale
                z: PathView.itemZ
                Text {
                    text: textContent
                    font.pixelSize: Math.round(parent.height)-10
                    color: "white"
                    font.family: "PingFang SC Regular"
                    font.weight: Font.Black
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    Item {
        id: menu_2
        anchors.fill: parent
        visible: false;
        Image {
            id: dcStateTitle
            x:274
            y:1
            width:359
            height:44
            source: "qrc:/Theme/Theme1/Image/1st/Text/DC_title.png"
        }
        Text {
            id: dc_dydy
            x:126
            y:60
            width:122
            height:21
            text: qsTr("DCDC低压电压")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_dydy_value
            x:298
            y:60
            width:54
            height:20
            text: qsTr("26.9v")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_wendu
            x:126
            y:89
            width:86
            height:16
            text: qsTr("DCDC温度")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_wendu_value
            x:298
            y:89
            width:54
            height:12
            text: qsTr("024℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: dc_qianya
            x:126
            y:115
            width:85
            height:16
            text: qsTr("DCDC欠压")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"    //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_qianya_value
            x:299
            y:111
            width:41
            height:20
            text: qsTr("正常")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_guore
            x:126
            y:139
            width:87
            height:21
            text: qsTr("DCDC过热")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"    //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_guore_value
            x:299
            y:137
            width:41
            height:20
            text: qsTr("正常")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: dc_state2
            x:126
            y:166
            width:101
            height:17
            text: qsTr("DCDC状态2")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_state2_value
            x:298
            y:162
            width:41
            height:20
            text: qsTr("工作")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_dydl
            x:411
            y:60
            width:122
            height:21
            text: qsTr("DCDC低压电流")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_dydl_value
            x:571
            y:60
            width:69
            height:20
            text: qsTr("004.1a")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: dc_workstate
            x:410
            y:89
            width:121
            height:16
            text: qsTr("DCDC工作状态")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"  //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_workstate_value
            x:571
            y:86
            width:76
            height:20
            text: qsTr("启动工作")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_guoya
            x:409
            y:115
            width:85
            height:16
            text: qsTr("DCDC过压")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_guoya_value
            x:571
            y:111
            width:41
            height:20
            text: qsTr("正常")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_duanlu
            x:409
            y:138
            width:87
            height:21
            text: qsTr("DCDC短路")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: dc_duanlu_value
            x:571
            y:137
            width:41
            height:20
            text: qsTr("正常")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Item {
        id: menu_3
        anchors.fill: parent
        visible: false;

        Image {
            id: bettary_Temp_Title
            x:271
            y:23
            width:210
            height:44
            source: "qrc:/Theme/Theme1/Image/1st/Text/battery_temp_title.png"
        }
        Text {
            id: bettary_box1
            x:59
            y:62
            width:71
            height:31
            text: qsTr("电池箱1")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_1
            x:34
            y:94
            width:37
            height:16
            text: qsTr("1-7")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_2
            x:34
            y:117
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_3
            x:34
            y:143
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_4
            x:34
            y:169
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_5
            x:34
            y:195
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_6
            x:34
            y:220
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_7
            x:34
            y:246
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_8
            x:34
            y:272
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_9
            x:109
            y:92
            width:47
            height:21
            text: qsTr("8-11")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_10
            x:109
            y:119
            width:21
            height:16
            text: qsTr("℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_11
            x:109
            y:145
            width:21
            height:16
            text: qsTr("℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_box2
            x:188
            y:62
            width:71
            height:31
            text: qsTr("电池箱2")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_12
            x:169
            y:93
            width:37
            height:16
            text: qsTr("1-7")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_13
            x:168
            y:117
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_14
            x:168
            y:143
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_15
            x:168
            y:170
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_16
            x:168
            y:195
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_17
            x:168
            y:220
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_18
            x:168
            y:246
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_19
            x:168
            y:272
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_20
            x:237
            y:92
            width:47
            height:21
            text: qsTr("8-11")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_21
            x:236
            y:117
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_22
            x:237
            y:145
            width:51
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_box3
            x:319
            y:62
            width:71
            height:31
            text: qsTr("电池箱3")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_23
            x:303
            y:93
            width:37
            height:16
            text: qsTr("1-7")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_24
            x:303
            y:117
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_25
            x:303
            y:143
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_26
            x:303
            y:169
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_27
            x:303
            y:195
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_28
            x:303
            y:220
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_29
            x:303
            y:246
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_30
            x:303
            y:272
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_31
            x:372
            y:92
            width:47
            height:21
            text: qsTr("8-11")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_32
            x:372
            y:120
            width:54
            height:16
            text: qsTr("℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_33
            x:372
            y:145
            width:54
            height:16
            text: qsTr("℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_box4
            x:450
            y:62
            width:71
            height:31
            text: qsTr("电池箱4")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_34
            x:440
            y:90
            width:41
            height:16
            text: qsTr("1-7")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_35
            x:440
            y:117
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_36
            x:440
            y:143
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_37
            x:440
            y:170
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_38
            x:440
            y:195
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_39
            x:440
            y:220
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_40
            x:440
            y:246
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_41
            x:440
            y:272
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_42
            x:507
            y:92
            width:47
            height:21
            text: qsTr("8-11")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_43
            x:507
            y:119
            width:54
            height:16
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_44
            x:507
            y:145
            width:54
            height:16
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_box5
            x:580
            y:62
            width:71
            height:31
            text: qsTr("电池箱5")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_45
            x:570
            y:90
            width:41
            height:20
            text: qsTr("1-7")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_46
            x:570
            y:117
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_47
            x:570
            y:143
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_48
            x:570
            y:170
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_49
            x:570
            y:195
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_50
            x:570
            y:220
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_51
            x:570
            y:246
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_52
            x:570
            y:272
            width:54
            height:21
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_53
            x:642
            y:92
            width:47
            height:21
            text: qsTr("8-11")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_54
            x:642
            y:118
            width:54
            height:16
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bettary_label_55
            x:642
            y:145
            width:54
            height:16
            text: qsTr("020℃")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color:"white"   //rgba(0,92,189,255)
            horizontalAlignment: Text.AlignHCenter
        }
    }

}

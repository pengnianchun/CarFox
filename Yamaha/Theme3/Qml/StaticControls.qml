import QtQuick 2.0
import "qrc:/Common/Component"

Item {
    property string sourceImageUrl:"qrc:/Theme/Theme3/";
//    property string lampLeftImage:sourceImageUrl+"Image/HomePane/l_arrow.png";
//    property string lampRightImage:sourceImageUrl+"Image/HomePane/r_arrow.png";
    property string thIconImage:sourceImageUrl+"Image/HomePane/th.png";
    property string tlIconImage:sourceImageUrl+"Image/HomePane/tl.png";
    property string vhIconImage:sourceImageUrl+"Image/HomePane/vh.png";
    property string vlIconImage:sourceImageUrl+"Image/HomePane/vl.png";
    property string lichengImage:sourceImageUrl+"Image/HomePane/licheng.png";

    property string licheng2Image:sourceImageUrl+"Image/HomePane/lichengTotal.png";
    property string leftTopLineImage:sourceImageUrl+"Image/HomePane/top_left_line.png";
    property string rightTopLineImage:sourceImageUrl+"Image/HomePane/top_right_line.png";
    property string leftRoadImage:sourceImageUrl+"Image/HomePane/road_left.png";
    property string rightRoadImage:sourceImageUrl+"Image/HomePane/road_right.png";
    property string bottomLineImage:sourceImageUrl+"Image/HomePane/bottom_line.png";
    property string staSocIconImage:sourceImageUrl+"Image/HomePane/soc.png";
    property string staBatteryIconImage:sourceImageUrl+"Image/HomePane/soc_right_icon.png";
    property string socImage:sourceImageUrl+"Image/HomePane/soc_left_bg.png";
    property string socRed1Image:sourceImageUrl+"Image/HomePane/soc_left_orange-.png";
    property string socRed2Image:sourceImageUrl+"Image/HomePane/soc_left_orange-.png";
    property string socNImage:sourceImageUrl+"Image/HomePane/soc_left_green.png";
    property string batteryImage:sourceImageUrl+"Image/HomePane/soc_right_bg.png";
    property string batteryRed1Image:sourceImageUrl+"Image/HomePane/soc_right_lightred.png";
    property string batteryRed2Image:sourceImageUrl+"Image/HomePane/soc_right_lightred.png";
    property string batteryNImage:sourceImageUrl+"Image/HomePane/soc_right_lightblue.png";
//    property string gearPImage: sourceImageUrl+"Image/HomePane/gear_P.png";
//    property string gearDImage: sourceImageUrl+"Image/HomePane/gear_D.png";
//    property string gearNImage: sourceImageUrl+"Image/HomePane/gear_N.png";
//    property string gearRImage: sourceImageUrl+"Image/HomePane/gear_R.png";
    property string iconTotalVoltageImage:sourceImageUrl+"Image/HomePane/total.png"

    function setTime()
    {
        var today = new Date();
        var hours = today.getHours();
        var minutes = today.getMinutes();
//        var seconds = today.getSeconds();
        var mtime = hours+":"+minutes;
        return mtime;
    }

    function setDate()
    {
        var today = new Date();
        var years = today.getFullYear();
        var month = today.getMonth()+1;
        var days = today.getDate();
        var mdate = years+"/"+month+"/"+days;
        return mdate;
    }

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onGearChanged:{
            if(CarMsg.gear === 1)
            {
                dnpr.source = gearPImage;
            }
            else if(CarMsg.gear === 2)
            {
                dnpr.source = gearRImage;
            }
            else if(CarMsg.gear === 3)
            {
                dnpr.source = gearDImage;
            }
            else if(CarMsg.gear === 4)
            {
                dnpr.source = gearNImage;
            }
        }
    }

//    Image{    //lamp_left的图标
//        id:lamp_left
//        x:456
//        y:17
//        width: 50
//        height:50
//        source: lampLeftImage
//    }
//    Image{    //lamp_right的图标
//        id:lamp_right
//        x:906
//        y:17
//        width: 50
//        height:50
//        source: lampRightImage
//    }


    Image{    //th的图标
        id:th_Icon
        x:21
        y:12
        width: 37
        height:19
        source: thIconImage
    }
    Text{     //th的图标文本
        id: th_Icon_text
        x:67
        y:11
        width:43
        height:20
        horizontalAlignment: Text.AlignHCenter
        text:CarMsg?CarMsg.batteryHighTemperature+"℃":qsTr("0℃")  //qsTr("32℃")
        font.family: "宋体"
        font.bold: true
        font.pixelSize:19
        color: "white"
    }
    Image{    //tl的图标
        id:tl_Icon
        x:22
        y:42
        width: 37
        height:19
        source: tlIconImage
    }
    Text{     //tl的图标文本
        id: tl_Icon_text
        x:67
        y:42
        width:43
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: CarMsg.batteryLowTemperature+"℃" //qsTr("32℃")
        font.family: "宋体"
        font.bold: true
        font.pixelSize:19
        color: "white"
    }

    Image{    //vh的图标
        id:vh_Icon
        x:1323
        y:13
        width: 31
        height:17
        source: vhIconImage
    }
    Text{     //vh的图标文本
        id: vh_Icon_text
        x:1365
        y:13
        width:41
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: CarMsg.aloneBatteryHighVoltage+"V" //qsTr("50V")
        font.family: "宋体"
        font.bold: true
        font.pixelSize:19
        color: "white"
    }
    Image{    //vl的图标
        id:vl_Icon
        x:1324
        y:41
        width: 31
        height:17
        source: vlIconImage
    }
    Text{     //vl的图标文本
        id: vl_Icon_text
        x:1365
        y:41
        width:39
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: CarMsg.aloneBatteryLowVoltage+"V" //qsTr("50V")
        font.family: "宋体"
        font.bold: true
        font.pixelSize:19
        color: "white"
    }
    Timer{  //时分定时器
        id:time_timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
          time.text = setTime();
        }
    }

    Text{     //时分
        id: time
        x:688
        y:26
        width:71
        height:21
        horizontalAlignment: Text.AlignHCenter
        font.family: "PingFang SC Regular"
//                text:""
        font.bold: true
        font.pixelSize:24
        color: "white"
    }
    Item{
        id:lichengarea1
        Image{
            id:licheng
            x:1073
            y:509
            width:80
            height:30
            source: lichengImage
            visible: true;
        }
        Text{    //小计里程
            id: lichengText
            x:1148
            y:515
            width:54
            height:12
            horizontalAlignment: Text.AlignHCenter
            font.family: "PingFang SC Regular"
            text:CarMsg.trip+"Km"
            font.bold: true
            font.pixelSize:16
            color: "white"
        }
    }
    Item{     //总里程
        id:lichengarea2
        Image{
            id:licheng2
            x:1212
            y:509
            width:80
            height:30
            source: licheng2Image
            visible: true;
        }
        Text{
            id: lichengText2
            x:1278
            y:515
            width:54
            height:12
            horizontalAlignment: Text.AlignHCenter
            font.family: "PingFang SC Regular"
            text:CarMsg.odo+"Km"   //"0.01Km"
            font.bold: true
            font.pixelSize:16
            color: "white"
        }
    }
    Item{   //日期
        Timer{
            id: dateTimer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
              todaydate.text = setDate();
            }
        }
        Text{
            id: todaydate
            x:282
            y:518
            width:93
            height:21
            horizontalAlignment: Text.AlignHCenter
            font.family: "PingFang SC Regular"
            text:"2018/1/29"
            font.bold: true
            font.pixelSize:16
            color: "white"
        }
    }
    Item{     //线
        Image{
            id:leftTopLine
            x:363
            y:-103
            width:300
            height:300
            source: leftTopLineImage
            visible: true;
        }
        Image{
            id:rightTopLine
            x:749
            y:-105
            width:300
            height:300
            source: rightTopLineImage
            visible: true;
        }
        Image{
            id:leftRoad
            x:323
            y:326
            width:248
            height:206
            source: leftRoadImage
            visible: true;
        }
        Image{
            id:rightRoad
            x:852
            y:323
            width:248
            height:206
            source: rightRoadImage
            visible: true;
        }
        Image{
            id:bottom_line
            x:253
            y:501
            width:943
            height:37
            source: bottomLineImage
            visible: true;
        }
    }

    Item{
        Image{   //soc图标
        id:sta_soc_icon
        x:391
        y:515
        width: 35
        height: 17
        source: staSocIconImage
        visible: true
        }

        Image{   //battery图标
        id:sta_battery_icon
        x:732
        y:502
        width: 36
        height: 28
        source: staBatteryIconImage
        visible: true
        }
        Image{   //soc底图
            id:soc
            x:431
            y:523
            width: 264
            height: 7
            source: socImage
            visible: true

            Timer{     //soc_n的定时器
                id:soc_n_timer
                property int socDstValue: CarMsg ? CarMsg.soc : 0 //范围0~264
                onSocDstValueChanged: {
                    soc_n_timer.running = true;
                }
                interval: 1
                running:false
                repeat:true
                onTriggered: {
                    if(soc_red.visible == true)
                    {
                        if(soc_red.width < socDstValue)
                        {
                            soc_red.width += 1
                        }
                        else if(soc_red.width > socDstValue)
                        {
                            soc_red.width -= 1
                        }
                        if(soc_red.width == socDstValue)
                        {
                            running = false
//                            if(socDstValue == 0)
//                                socDstValue = 264
//                            else if(socDstValue == 264)
//                                socDstValue = 0
                        }
                        else if(soc_red.width > 100)
                        {
                            soc_red.visible = false
                            soc_n.visible = true;
                            soc_n.width = soc_red.width
                        }
                    }
                    else if(soc_n.visible == true)
                    {
                        if(soc_n.width < socDstValue)
                        {
                            soc_n.width += 1
                        }
                        else if(soc_n.width > socDstValue)
                        {
                            soc_n.width -= 1
                        }
                        if(soc_n.width == socDstValue)
                        {
                            running = false
//                            if(socDstValue == 0)
//                                socDstValue = 264
//                            else if(socDstValue == 264)
//                                socDstValue = 0
                        }
                        else if(soc_n.width < 100)
                        {
                            soc_red.visible = true
                            soc_n.visible = false;
                            soc_red.width = soc_n.width
                        }
                    }
                }
            }
            Item{      //soc红色部分
                id:soc_red
                x:0
                y:0
                width:0
                height:7
                visible: true
                clip:true
                Image{
                    id:soc_red_1
                    x:0
                    y:0
                    width: 62
                    height: 6
                    source: socRed1Image
                    visible: true
                }
                Image{
                    id:soc_red_2
                    x:68
                    y:0
                    width: 62
                    height: 6
                    source: socRed2Image
                    visible: true
                }
            }
            Item{      //soc全部线段
                id:soc_n
                x:0
                y:0
                width:264
                height:7
                visible:false
                clip:true
                Image{
                    id:soc_1
                    x:0
                    y:0
                    width: 63
                    height: 7
                    source: socNImage
                    visible: true
                }
                Image{
                    id:soc_2
                    x:67
                    y:0
                    width: 63
                    height: 7
                    source: socNImage
                    visible: true
                }
                Image{
                    id:soc_3
                    x:135
                    y:0
                    width: 63
                    height: 7
                    source: socNImage
                    visible: true
                }
                Image{
                    id:soc_4
                    x:202
                    y:0
                    width: 63
                    height: 7
                    source: socNImage
                    visible: true
                }
            }
        }

        Image{
            id:battery
            x:776
            y:523
            width: 264
            height: 6
            source: batteryImage
            visible: true
            Timer{
                id:battery_timer
                property int battDstValue: CarMsg ? CarMsg.battery : 0
                onBattDstValueChanged: {
                    battery_timer.running = true;
                }
                interval: 3
                running: false
                repeat: true
                onTriggered: {
                    if(battery_red.visible == true)
                    {
                        if(battery_red.width > battDstValue)
                        {
                            battery_red.width -= 1;
                        }
                        else if(battery_red.width < battDstValue)
                        {
                            battery_red.width += 1;
                        }
                        else if(battery_red.width == battDstValue)
                        {
                            battery_timer.running = false;
//                            if(battDstValue == 0)
//                            {
//                                battDstValue = 264;
//                            }
//                            else if(battDstValue == 264)
//                            {
//                                battDstValue = 0;
//                            }
                        }
                        if(battery_red.width > 100)
                        {
                            battery_red.visible = false;
                            battery_n.visible = true;
                            battery_n.width = 101;
                        }
                    }
                    else if(battery_n.visible == true)
                    {
                        if(battery_n.width > battDstValue)
                        {
                            battery_n.width -= 1;
                        }
                        else if(battery_n.width < battDstValue)
                        {
                            battery_n.width += 1;
                        }
                        else if(battery_n.width == battDstValue)
                        {
                              battery_timer.running = false;
//                            if(battDstValue == 0)
//                            {
//                                battDstValue = 264;
//                            }
//                            else if(battDstValue == 264)
//                            {
//                                battDstValue = 0;
//                            }
                        }
                        if(battery_n.width < 100)
                        {
                            battery_red.visible = true;
                            battery_n.visible = false;
                            battery_red.width = 99;
                        }
                    }
                }
            }

            Item{
                id:battery_red
                x:0
                y:0
                width:0
                height:6
                clip:true
                visible: true
                Image{
                    id:battery_red_1
                    x:0
                    y:0
                    width:61
                    height: 6
                    source: batteryRed1Image
                    visible:true
                }
                Image{
                    id:battery_red_2
                    x:68
                    y:0
                    width:61
                    height: 6
                    source: batteryRed2Image
                    visible:true
                }
            }

            Item{
                id:battery_n
                x:0
                y:0
                width:264
                height:6
                clip:true
                visible: false
                Image{
                    id:battery_1
                    x:0
                    y:0
                    width: 62
                    height: 6
                    source: batteryNImage
                    visible: true
                }
                Image{
                    id:battery_2
                    x:68
                    y:0
                    width: 62
                    height: 6
                    source: batteryNImage
                    visible: true
                }
                Image{
                    id:battery_3
                    x:136
                    y:0
                    width: 62
                    height: 6
                    source: batteryNImage
                    visible: true
                }
                Image{
                    id:battery_4
                    x:203
                    y:0
                    width: 62
                    height: 6
                    source: batteryNImage
                    visible: true
                }
            }
        }
    }
//    Image{
//        id:dnpr   //档位
//        x:25
//        y:425
//        width:100
//        height:100
//        source:gearPImage
//    }

    Item{    //总电压
        Image{
            id:icon_totalVoltage
            x:135
            y:492
            width:39
            height:21
            source:iconTotalVoltageImage
        }
        Text{
            id:value_totalVoltage   //总电压值
            x:180
            y:490
            width:53
            height:16
            text: CarMsg.totalVoltage + "V"   //"500V"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:19
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Item{
        Text{
            id:text_coolantTemp //冷却液温度
            x:1318
            y:83
            width:99
            height:19
            text:"冷却液温度"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:19
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text{
            id:value_coolantTemp   //冷却液温度值
            x:1348
            y:108
            width:44
            height:17
            text:CarMsg.engineWaterTemp+"℃"    //"56℃"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:19
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Item{
        Text{
            id:text_currentPower //当前电量
            x:1316
            y:431
            width:82
            height:18
            text:"当前电量"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:19
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
        Text{
            id:value_currentPower   //当前电量值
            x:1301
            y:455
            width:109
            height:17
            text: CarMsg?CarMsg.batteryPackEnergy +"Kw.h":"3Kw.h" //"245.6Kw.h"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:19
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
    }
}

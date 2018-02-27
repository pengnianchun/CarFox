import QtQuick 2.0

Item {
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

    Image{    //lamp_left的图标
        id:lamp_left
        x:456
        y:17
        width: 50
        height:50
        source: "qrc:/Theme/Theme3/Image/HomePane/l_arrow.png"
    }
    Image{    //lamp_right的图标
        id:lamp_right
        x:906
        y:17
        width: 50
        height:50
        source: "qrc:/Theme/Theme3/Image/HomePane/r_arrow.png"
    }


    Image{    //th的图标
        id:th_Icon
        x:21
        y:12
        width: 37
        height:19
        source: "qrc:/Theme/Theme3/Image/HomePane/th.png"
    }
    Text{     //th的图标文本
        id: th_Icon_text
        x:67
        y:11
        width:43
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("32℃")
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
        source: "qrc:/Theme/Theme3/Image/HomePane/tl.png"
    }
    Text{     //tl的图标文本
        id: tl_Icon_text
        x:67
        y:42
        width:43
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("32℃")
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
        source: "qrc:/Theme/Theme3/Image/HomePane/vh.png"
    }
    Text{     //vh的图标文本
        id: vh_Icon_text
        x:1365
        y:13
        width:41
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("50V")
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
        source: "qrc:/Theme/Theme3/Image/HomePane/vl.png"
    }
    Text{     //vl的图标文本
        id: vl_Icon_text
        x:1365
        y:41
        width:39
        height:20
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("50V")
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
            source: "qrc:/Theme/Theme3/Image/HomePane/licheng.png"
            visible: true;
        }
        Text{
            id: lichengText
            x:1148
            y:515
            width:54
            height:12
            horizontalAlignment: Text.AlignHCenter
            font.family: "PingFang SC Regular"
            text:"0.01Km"
            font.bold: true
            font.pixelSize:16
            color: "white"
        }
    }
    Item{
        id:lichengarea2
        Image{
            id:licheng2
            x:1212
            y:509
            width:80
            height:30
            source: "qrc:/Theme/Theme3/Image/HomePane/lichengTotal.png"
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
            text:"0.01Km"
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
            source: "qrc:/Theme/Theme3/Image/HomePane/top_left_line.png"
            visible: true;
        }
        Image{
            id:rightTopLine
            x:749
            y:-105
            width:300
            height:300
            source: "qrc:/Theme/Theme3/Image/HomePane/top_right_line.png"
            visible: true;
        }
        Image{
            id:leftRoad
            x:323
            y:326
            width:248
            height:206
            source: "qrc:/Theme/Theme3/Image/HomePane/road_left.png"
            visible: true;
        }
        Image{
            id:rightRoad
            x:852
            y:323
            width:248
            height:206
            source: "qrc:/Theme/Theme3/Image/HomePane/road_right.png"
            visible: true;
        }
        Image{
            id:bottom_line
            x:253
            y:501
            width:943
            height:37
            source: "qrc:/Theme/Theme3/Image/HomePane/bottom_line.png"
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
        source: "qrc:/Theme/Theme3/Image/HomePane/soc.png"
        visible: true
        }

        Image{   //battery图标
        id:sta_battery_icon
        x:732
        y:502
        width: 36
        height: 28
        source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_icon.png"
        visible: true
        }
        Image{   //soc底图
            id:soc
            x:431
            y:523
            width: 264
            height: 7
            source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_bg.png"
            visible: true

            Timer{     //soc_n的定时器
                id:soc_n_timer
                property int socDstValue: 0 //范围0~264
                interval: 1
                running:true
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
                            //running = false
                            if(socDstValue == 0)
                                socDstValue = 264
                            else if(socDstValue == 264)
                                socDstValue = 0
                        }

                        if(soc_red.width > 100)
                        {
                            soc_red.visible = false
                            soc_n.visible = true;
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
                            //running = false
                            if(socDstValue == 0)
                                socDstValue = 264
                            else if(socDstValue == 264)
                                socDstValue = 0
                        }

                        if(soc_n.width < 100)
                        {
                            soc_red.visible = true
                            soc_n.visible = false;
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
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_orange-.png"
                    visible: true
                }
                Image{
                    id:soc_red_2
                    x:68
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_orange-.png"
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
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_green.png"
                    visible: true
                }
                Image{
                    id:soc_2
                    x:68
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_green.png"
                    visible: true
                }
                Image{
                    id:soc_3
                    x:136
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_green.png"
                    visible: true
                }
                Image{
                    id:soc_4
                    x:200
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_left_green.png"
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
            source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_bg.png"
            visible: true
            Timer{
                id:battery_timer
                property int battDstValue: 0
                interval: 3
                running: true
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
//                                battery_timer.running = false;
                            if(battDstValue == 0)
                            {
                                battDstValue = 264;
                            }
                            else if(battDstValue == 264)
                            {
                                battDstValue = 0;
                            }
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
//                                battery_timer.running = false;
                            if(battDstValue == 0)
                            {
                                battDstValue = 264;
                            }
                            else if(battDstValue == 264)
                            {
                                battDstValue = 0;
                            }
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
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_lightred.png"
                    visible:true
                }
                Image{
                    id:battery_red_2
                    x:68
                    y:0
                    width:61
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_lightred.png"
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
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_lightblue.png"
                    visible: true
                }
                Image{
                    id:battery_2
                    x:68
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_lightblue.png"
                    visible: true
                }
                Image{
                    id:battery_3
                    x:136
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_lightblue.png"
                    visible: true
                }
                Image{
                    id:battery_4
                    x:200
                    y:0
                    width: 62
                    height: 6
                    source: "qrc:/Theme/Theme3/Image/HomePane/soc_right_lightblue.png"
                    visible: true
                }
            }
        }

    }
}

import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
Item{
    id:root
    x:368
    y:100
    visible: false

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onKeyShortPressed: {
            if(key === 1) //back键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("TimeSetting");
                UiController.showLayer("MenuPanel");
            }
        }
    }

    Image{
        id:clock_title
        x:304
        y:0
        width:114
        height:44
        source:"qrc:/Theme/Theme3/Image/MenuPanel/timeSetting.png"
    }
    Image{
        id:clock_icon
        x:312
        y:60
        width:72
        height:72
        source:"qrc:/Theme/Theme3/Image/MenuPanel/clock.png"

//        Image{
//            id:clock_long
//            x:312
//            y:60
//            width:25
//            height:10
//            source:"qrc:/Theme/Theme3/Image/MenuPanel/clock_long.png"
//        }
//        Image{
//            id:clock_short
//            x:312
//            y:60
//            width:3
//            height:18
//            source:"qrc:/Theme/Theme3/Image/MenuPanel/clock_short.png"
//        }
    }
    Item{
        id:clock_time
        Image{
            id:year
            x:44
            y:180
            width: 207
            height:136
            source: "qrc:/Theme/Theme3/Image/MenuPanel/year.png"
            Text{
                id:year_text
                anchors.fill: parent.Center
                font.family: "PingFang SC Regular"
                font.pixelSize: 25; font.weight: Font.Black
                color:"white"
                onTextChanged: {
                    year.source = "qrc:/Theme/Theme3/Image/MenuPanel/year_light.png"
                    year_text.color = "#3d5378"
                }
            }
        }
        Image{
            id:month
            x:214
            y:180
            width: 143
            height:136
            source: "qrc:/Theme/Theme3/Image/MenuPanel/month.png"
            Text{
                id:month_text
                anchors.fill: parent.Center
                font.family: "PingFang SC Regular"
                font.pixelSize: 25; font.weight: Font.Black
                color:"white"
                onTextChanged: {
                    year.source = "qrc:/Theme/Theme3/Image/MenuPanel/month_light.png"
                    year_text.color = "#3d5378"
                }
            }
        }
        Image{
            id:day
            x:317
            y:180
            width: 143
            height:136
            source: "qrc:/Theme/Theme3/Image/MenuPanel/month.png"
            Text{
                id:day_text
                anchors.fill: parent.Center
                font.family: "PingFang SC Regular"
                font.pixelSize: 25; font.weight: Font.Black
                color:"white"
                onTextChanged: {
                    year.source = "qrc:/Theme/Theme3/Image/MenuPanel/month_light.png"
                    year_text.color = "#3d5378"
                }
            }
        }
        Image{
            id:hour
            x:422
            y:180
            width: 143
            height:136
            source: "qrc:/Theme/Theme3/Image/MenuPanel/month.png"
            Text{
                id:hour_text
                anchors.fill: parent.Center
                font.family: "PingFang SC Regular"
                font.pixelSize: 25; font.weight: Font.Black
                color:"white"
                onTextChanged: {
                    year.source = "qrc:/Theme/Theme3/Image/MenuPanel/month_light.png"
                    year_text.color = "#3d5378"
                }
            }
        }
        Image{
            id:minute
            x:524
            y:180
            width: 143
            height:136
            source: "qrc:/Theme/Theme3/Image/MenuPanel/month.png"
            Text{
                id:minute_text
                anchors.fill: parent.Center
                font.family: "PingFang SC Regular"
                font.pixelSize: 25; font.weight: Font.Black
                color:"white"
                onTextChanged: {
                    year.source = "qrc:/Theme/Theme3/Image/MenuPanel/month_light.png"
                    year_text.color = "#3d5378"
                }
            }
        }
    }
}

import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
MenuItem{
    id:root
    x:368
    y:100
    visible: false
    menuLayerId: "TimeSetting"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string yearBgImage:sourceImageUrl+"Image/MenuPanel/year.png";
    property string monthBgImage:sourceImageUrl+"Image/MenuPanel/month.png";
    property string monthLightBgImage:sourceImageUrl+"Image/MenuPanel/month_light.png";
    property string clockTitleImage:sourceImageUrl+"Image/MenuPanel/timeSetting.png";
    property string yearLightBgImage:sourceImageUrl+"Image/MenuPanel/year_light.png";

    property int flag: 1;
    property int monthValue: 6;
    property int yearValue: 2018;
    property int dayValue: 10;
    property int hourValue: 11;
    property int minuteValue: 50;

    function monthTextShow(pValue)
    {
        if(pValue < 10)
        {
            month_text.text = "0" + pValue;
        }
        else
        {
            month_text.text = pValue;
        }
    }
    function dayTextShow(pValue)
    {
        if(pValue < 10)
        {
            day_text.text = "0" + pValue;
        }
        else
        {
            day_text.text = pValue;
        }
    }
    function hourTextShow(pValue)
    {
        if(pValue < 10)
        {
            hour_text.text = "0" + pValue;
        }
        else
        {
            hour_text.text = pValue;
        }
    }

    function minuteTextShow(pValue)
    {
        if(pValue < 10)
        {
            minute_text.text = "0" + pValue;
        }
        else
        {
            minute_text.text = pValue;
        }
    }

    enterMenu: function(){
        if(flag == 1)  //将要定位在月
        {
            flag = 2;
            year.source = yearBgImage
            year_text.color = "white"
            month.source = monthLightBgImage
            month_text.color = "#3d5378"
        }
        else if(flag == 2)  //将要定位在日
        {
            flag = 3;
            year.source = yearBgImage
            year_text.color = "white"
            month.source = monthBgImage
            month_text.color = "white"
            day.source = monthLightBgImage
            day_text.color = "#3d5378"
        }
        else if(flag == 3)   //将要定位在时
        {
            flag = 4;
            year.source = yearBgImage
            year_text.color = "white"
            month.source = monthBgImage
            month_text.color = "white"
            day.source = monthBgImage
            day_text.color = "white"
            hour.source = monthLightBgImage
            hour_text.color = "#3d5378"
        }
        else if(flag == 4)   //将要定位在分
        {
            flag = 5;
            year.source = yearBgImage
            year_text.color = "white"
            month.source = monthBgImage
            month_text.color = "white"
            day.source = monthBgImage
            day_text.color = "white"
            hour.source = monthBgImage
            hour_text.color = "white"
            minute.source = monthLightBgImage
            minute_text.color = "#3d5378"
        }
    }
    hideMenu: function(){
        UiController.hideLayer("TimeSetting");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        if(flag == 1)  //年
        {
            if(yearValue == 1970)
            {
                yearValue = 2255;
                year_text.text = yearValue;
                return;
            }
            yearValue -= 1;
            year_text.text = yearValue;
        }
        else if(flag == 2)   //月
        {
            if(monthValue == 3)
            {
                if((yearValue % 4 == 0) || ((yearValue % 100 == 0) && (yearValue % 400 == 0))) //闰年29
                {
                    if(dayValue > 29)
                    {
                        dayValue = 29
                        day_text.text = dayValue;
                    }
                }
                else
                {
                    if(dayValue > 28)
                    {
                        dayValue = 28;
                        day_text.text = dayValue;
                    }
                }
            }
            else if(monthValue == 1)
            {
                monthValue = 12;
                month_text.text = monthValue;
                return;
            }
            monthValue -= 1;
            monthTextShow(monthValue);
        }
        else if(flag == 3)    //日
        {
            if(monthValue == 2)
            {
                if((yearValue % 4 == 0) || ((yearValue % 100 == 0) && (yearValue % 400 == 0))) //闰年29
                {
                    if(dayValue == 1)
                    {
                        dayValue = 29;
                        day_text.text = dayValue;
                        return;
                    }
                    dayValue -= 1;
                    dayTextShow(dayValue);
                }
                else
                {
                    if(dayValue == 1)
                    {
                        dayValue = 28;
                        day_text.text = dayValue;
                        return;
                    }
                    dayValue -= 1;
                    dayTextShow(dayValue);
                }
            }
            else if((monthValue == 1)||(monthValue == 3)||(monthValue == 5)||(monthValue == 7)||(monthValue == 8)||(monthValue == 10)||(monthValue == 12))
            {
                if(dayValue == 1)
                {
                    dayValue = 31;
                    day_text.text = dayValue;
                    return;
                }
                dayValue -= 1;
                dayTextShow(dayValue);
            }
            else if((monthValue == 4)||(monthValue == 6)||(monthValue == 9)||(monthValue == 11))
            {
                if(dayValue == 1)
                {
                    dayValue = 30;
                    day_text.text = dayValue;
                    return;
                }
                dayValue -= 1;
                dayTextShow(dayValue);
            }
        }
        else if(flag == 4)    //时
        {
            if(hourValue == 0)
            {
                hourValue = 23;
                hour_text.text = hourValue;
                return;
            }
            hourValue -= 1;
            hourTextShow(hourValue);
        }
        else if(flag == 5)    //分
        {
            if(minuteValue == 0)
            {
                minuteValue = 59;
                minute_text.text = minuteValue;
                return;
            }
            minuteValue -= 1;
            minuteTextShow(minuteValue);
        }
    }
    nextMenu: function(){
        if(flag == 1)  //年
        {
            if(yearValue == 2255)
            {
                yearValue = 1970;
                year_text.text = yearValue;
                return;
            }
            yearValue += 1;
            year_text.text = yearValue;
        }
        else if(flag == 2)  //月
        {
            if(monthValue == 12)
            {
                monthValue = 1;
                monthTextShow(monthValue);
                return;
            }
            monthValue += 1;
            monthTextShow(monthValue);
        }
        else if(flag == 3)  //日
        {
            if(monthValue == 2)
            {
                if((yearValue % 4 == 0) || ((yearValue % 100 == 0) && (yearValue % 400 == 0))) //闰年29
                {
                    if(dayValue == 29)
                    {
                        dayValue = 1;
                        dayTextShow(dayValue);
                        return;
                    }
                    dayValue += 1;
                    dayTextShow(dayValue);
                }
                else
                {
                    if(dayValue == 28)
                    {
                        dayValue = 1;
                        dayTextShow(dayValue);
                        return;
                    }
                    dayValue += 1;
                    dayTextShow(dayValue);
                }
            }
            else if((monthValue == 1)||(monthValue == 3)||(monthValue == 5)||(monthValue == 7)||(monthValue == 8)||(monthValue == 10)||(monthValue == 12))
            {
                if(dayValue == 31)
                {
                    dayValue = 1;
                    dayTextShow(dayValue);
                    return;
                }
                dayValue += 1;
                dayTextShow(dayValue);
            }
            else if((monthValue == 4)||(monthValue == 6)||(monthValue == 9)||(monthValue == 11))
            {
                if(dayValue == 30)
                {
                    dayValue = 1;
                    dayTextShow(dayValue);
                    return;
                }
                dayValue += 1;
                dayTextShow(dayValue);
            }
        }
        else if(flag == 4)    //时
        {
            if(hourValue == 23)
            {
                hourValue = 0;
                hourTextShow(hourValue);
                return;
            }
            hourValue += 1;
            hourTextShow(hourValue);
        }
        else if(flag == 5)    //分
        {
            if(minuteValue == 59)
            {
                minuteValue = 0;
                minuteTextShow(minuteValue);
                return;
            }
            minuteValue += 1;
            minuteTextShow(minuteValue);
        }
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("TimeSetting");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
        UiController.setLayerProperty("MainPanel","busPanelVisible",true);
    }

    Image{
        id:clock_title
        x:304
        y:0
        width:114
        height:44
        source:clockTitleImage
    }
//    Image{
//        id:clock_icon
//        x:312
//        y:60
//        width:72
//        height:72
//        source:"qrc:/Theme/Theme3/Image/MenuPanel/clock.png"

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
//    }
    Item{
        id:clock_time
        Image{
            id:year
            x:44
            y:130
            width: 207
            height:136
            source: yearBgImage
            Text{
                id:year_text
                anchors.centerIn:parent
                font.family: "PingFang SC Regular"
                font.pixelSize: 27; font.weight: Font.Black
                color:"white"
                text:"2018"
                onVisibleChanged:{
                    if(visible)
                    {
                        year.source = yearLightBgImage
                        year_text.color = "#3d5378"
                        month.source = monthBgImage
                        month_text.color = "white"
                        day.source = monthBgImage
                        day_text.color = "white"
                        hour.source = monthBgImage
                        hour_text.color = "white"
                        minute.source = monthBgImage
                        minute_text.color = "white"
                        flag = 1;
                    }
                }
            }
        }
        Image{
            id:month
            x:214
            y:130
            width: 143
            height:136
            source: monthBgImage
            Text{
                id:month_text
                anchors.centerIn: parent
                font.family: "PingFang SC Regular"
                font.pixelSize: 27; font.weight: Font.Black
                color:"white"
                text:"06"
            }
        }
        Image{
            id:day
            x:317
            y:130
            width: 143
            height:136
            source: monthBgImage
            Text{
                id:day_text
                anchors.centerIn: parent
                font.family: "PingFang SC Regular"
                font.pixelSize: 27; font.weight: Font.Black
                color:"white"
                text:"10"
            }
        }
        Image{
            id:hour
            x:422
            y:130
            width: 143
            height:136
            source: monthBgImage
            Text{
                id:hour_text
                anchors.centerIn: parent
                font.family: "PingFang SC Regular"
                font.pixelSize: 27; font.weight: Font.Black
                color:"white"
                text:"11"
            }
        }
        Image{
            id:minute
            x:524
            y:130
            width: 143
            height:136
            source: monthBgImage
            Text{
                id:minute_text
                anchors.centerIn: parent
                font.family: "PingFang SC Regular"
                font.pixelSize: 27; font.weight: Font.Black
                color:"white"
                text:"50"
            }
        }
    }
}

import QtQuick 2.6
import QtQuick.Layouts 1.0

Item {
    id: dateTime

    property string year   : "2018"
    property string month  : "01"
    property string day    : "01"
    property string hour   : "12"
    property string minute : "00"
    property string second : "00"
    property string week   : "Mon"
    property string textDateTime : ""
    property string tempValue : ""
    property real utcDateTime : 1514736000;
    property real utcLocalDateTime : 1514736000;
    property int utcMcuDateTime: CarMsg.dateTime;
    property real dateFontSize: 18
    property string dateValue: ""

    TextFieldWeir {
        id: dayWeekDisplay
        //textOpacity: 0.0
        fontSize: dateFontSize
        textValue: dateValue
    }
    function currentDateTime(){
        return "2018-03-20-00-00-00-Mon";//Qt.formatDateTime(new Date(), "yyyy-MM-dd-hh-mm-ss-ddd");
    }
    function currentDateTimeByUTC(milisecond) {
        return Qt.formatDateTime(new Date((milisecond-8*3600)*1000), "yyyy-MM-dd-hh-mm-ss-ddd");
    }
    function getCurrentUTCTime() {
        return utcLocalDateTime;
    }
    function transformWeekFormat(value){
        var weekValue;
        if(("Mon" === value)||("周一" === value)) {
            weekValue = qsTr("星期一");
        } else if(("Tue" === value)||("周二" === value)){
            weekValue = qsTr("星期二");
        } else if(("Wed" === value)||("周三" === value)){
            weekValue = qsTr("星期三");
        } else if(("Thu" === value)||("周四" === value)){
            weekValue = qsTr("星期四");
        } else if(("Fri" === value)||("周五" === value)){
            weekValue = qsTr("星期五");
        } else if(("Sat" === value)||("周六" === value)){
            weekValue = qsTr("星期六");
        } else if(("Sun" === value)||("周日" === value)){
            weekValue = qsTr("星期日");
        } else {
            weekValue = value;
        }
        return weekValue;
    }
    Timer{
        id: timer
        interval: 200
        repeat: true
        onTriggered:{
            textDateTime = (utcMcuDateTime>0) ? currentDateTimeByUTC(utcMcuDateTime) : currentDateTime();
            var textDateTimeArray = textDateTime.split("-");
            year = textDateTimeArray[0];
            month = textDateTimeArray[1];
            day = textDateTimeArray[2];
            hour = textDateTimeArray[3];
            minute = textDateTimeArray[4];
            second = textDateTimeArray[5];
            tempValue = textDateTimeArray[6];
            week = transformWeekFormat(tempValue);
            dateValue = qsTr("%1 - %2 - %3").arg(year).arg(month).arg(day);
        }
    }
    onDayChanged: {
        dayWeekDisplay.textValue = qsTr("%1 - %2 - %3").arg(year).arg(month).arg(day);
    }
    Component.onCompleted: {
        timer.start();
    }
}

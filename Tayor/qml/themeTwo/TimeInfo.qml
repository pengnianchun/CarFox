import QtQuick 2.0

Item {
    id: dateTime

    property string year   : "2017"
    property string month  : "01"
    property string day    : "01"
    property string hour   : "12"
    property string minute : "00"
    property string second : "00"
    property string week   : "Mon"
    property string textDateTime : ""
    property string tempValue : ""
    property real utcDateTime : 1483200000;
    property real utcLocalDateTime : 1483200000;
    property int utcMcuDateTime: CarStatus.dateTime
    property int textLength : 0

    function currentDateTime(){
        utcDateTime = utcDateTime + 0.2;
        return Qt.formatDateTime(new Date(utcDateTime*1000), "yyyy-MM-dd-hh-mm-ss-ddd");
    }

    function currentDateTimeByUTC(milisecond) {
        return Qt.formatDateTime(new Date(milisecond*1000), "yyyy-MM-dd-hh-mm-ss-ddd");
    }

    onUtcDateTimeChanged: {
        utcLocalDateTime = utcDateTime;
        //console.log(" --- onUtcDateTimeChanged = ", utcLocalDateTime)
    }

    Timer{
        id: autotimer
        interval: 200
        repeat: true
        onTriggered:{
            utcLocalDateTime = utcLocalDateTime + 0.2;
            //console.log(" --- utcLocalDateTime = ", utcLocalDateTime)
        }
    }

    Timer{
        id: timer
        interval: 200
        repeat: true
        onTriggered:{
            textDateTime = (utcMcuDateTime>0)? currentDateTimeByUTC(utcMcuDateTime):currentDateTime();
            //textDateTime = currentDateTimeByUTC(utcLocalDateTime);
            textLength = textDateTime.split("-").toString().length
            year = textDateTime.split("-").toString().substring(0,4)
            month = textDateTime.split("-").toString().substring(5,7)
            day = textDateTime.split("-").toString().substring(8,10)
            hour = textDateTime.split("-").toString().substring(11,13)
            minute = textDateTime.split("-").toString().substring(14,16)
            second = textDateTime.split("-").toString().substring(17,19)
            tempValue = textDateTime.split("-").toString().substring(20,textLength)
            week = transformWeekFormat(tempValue)
        }
    }

    function getCurrentUTCTime() {
        return utcLocalDateTime;
    }

    function transformWeekFormat(value){
        var weekValue;
        if("Mon" === value) {
            weekValue = qsTr("星期一");
        } else if("Tue" === value){
            weekValue = qsTr("星期二");
        } else if("Wed" === value){
            weekValue = qsTr("星期三");
        } else if("Thu" === value){
            weekValue = qsTr("星期四");
        } else if("Fri" === value){
            weekValue = qsTr("星期五");
        } else if("Sat" === value){
            weekValue = qsTr("星期六");
        } else if("Sun" === value){
            weekValue = qsTr("星期日");
        } else {
            weekValue = value;
        }

        return weekValue;
    }

    Component.onCompleted: {
        timer.start();
        autotimer.start();
    }

}

import QtQuick 2.0

Item {
    id: timeSetMenu
    x: 295
    y: 30
    opacity: 0.0

    property int currentYear:   2017
    property int currentMonth:  7
    property int currentDay:    1
    property int currentHour:   18
    property int currentMinute: 00
    property int currentPosition:  (timeSetMenu.opacity === 0) ? -1 : CarStatus.menu_TimePos
    property int currentDirection: CarStatus.menu_Direction
    property int defaultUTCTime: 0
    property bool setTimeResult: true

    signal sendUTCSetTime(real utcTime)

    onCurrentPositionChanged: {

        yearDisplay.color = "white";
        monthDisplay.color = "white";
        dayDisplay.color = "white";
        hourDisplay.color = "white";
        minuteDisplay.color = "white";
        confirmSetTimeTips.color = "white";

        if (1 == currentPosition) {
            hourDisplay.color = "yellow";
            confirmSetAreaRound.opacity = 1.0
            confirmSetTimeTips.opacity = 1.0
            setTimeOKTips.opacity = 0.0
        } else if (2 == currentPosition) {
            minuteDisplay.color = "yellow";
        } else if (3 == currentPosition) {
            yearDisplay.color = "yellow";
        } else if (4 == currentPosition) {
            monthDisplay.color = "yellow";
        } else if (5 == currentPosition) {
            dayDisplay.color = "yellow";
        } else if (6 == currentPosition) {
            confirmSetTimeTips.color = "yellow";
        }
        //console.log(" --- current date time cursor pos = ", currentPosition)
    }

    onCurrentDirectionChanged: {
        //console.log(" --- current date time value up / down =  ", currentDirection)
        if(1 === currentDirection) {
            switch(currentPosition){
                case 1:
                    currentHour--;
                    currentHourDisplay();
                    break;
                case 2:
                    currentMinute--;
                    currentMinuteDisplay();
                    break;
                case 3:
                    currentYear--;
                    currentYearDisplay();
                    break;
                case 4:
                    currentMonth--;
                    currentMonthDisplay();
                    currentDayDisplay();
                    break;
                case 5:
                    currentDay--;
                    currentDayDisplay();
                    break;
                default:
                    break;
            }
        } else if (2 === currentDirection) {
            switch(currentPosition){
                case 1:
                    currentHour++;
                    currentHourDisplay();
                    break;
                case 2:
                    currentMinute++;
                    currentMinuteDisplay();
                    break;
                case 3:
                    currentYear++;
                    currentYearDisplay();
                    break;
                case 4:
                    currentMonth++;
                    currentMonthDisplay();
                    currentDayDisplay();
                    break;
                case 5:
                    currentDay++;
                    currentDayDisplay();
                    break;

                default:
                    break;
            }
        }
        //console.log(" --- current date time direction = ", currentDirection)
    }

    function currentYearDisplay(){
        if(currentYear>2255) {
            currentYear = 1970
        }
        if(currentYear<1970) {
            currentYear = 2255
        }
        yearDisplay.text = currentYear
    }

    function currentMonthDisplay(){
        if(currentMonth>12) {
            currentMonth = 1
        }
        if(currentMonth<1) {
            currentMonth = 12
        }
        monthDisplay.text = formatPrefixZero2(currentMonth)
    }

    function currentDayDisplay(){
        var days = getDaysOfMonth(currentMonth)
        if(currentDay>days) {
            currentDay = 1
        }
        if(currentDay<1) {
            currentDay = days
        }
        dayDisplay.text = formatPrefixZero2(currentDay)
    }

    function currentHourDisplay(){
        if(currentHour>23) {
            currentHour = 0
        }
        if(currentHour<0) {
            currentHour = 23
        }
        hourDisplay.text = formatPrefixZero2(currentHour)
    }

    function currentMinuteDisplay(){
        if(currentMinute>59) {
            currentMinute = 0
        }
        if(currentMinute<0) {
            currentMinute = 59
        }
        minuteDisplay.text = formatPrefixZero2(currentMinute)
    }

    function dateTimeDisplay(){
        currentYearDisplay();
        currentMonthDisplay();
        currentDayDisplay();
        currentHourDisplay();
        currentMinuteDisplay();
    }

    function getDaysOfMonth(month) {

        if((1 === month)||(3 === month)||(5 === month)||(7 === month)||(8 === month)||(10 === month)||(12 === month)) {
            return 31;
        }

        if((4 === month)||(6 === month)||(9 === month)||(11 === month)) {
            return 30;
        }

        if(2 === month) {
            if(isLeapYear(currentYear)) {
                return 29;
            } else {
                return 28;
            }
        }

        return 30;
    }

    function isLeapYear(year) {

        if((0 == year%400) || ((0 == year%4)&&(0 != year%100))) {
            return true;
        }else {
            return false;
        }
    }

    function formatPrefixZero2(num){
        if(num<10){
            return '0'+num;
        }else{
            return num;
        }
    }

    function setDefaultUTCTime(){
        return utcTimeSetValue;
    }

    function sendTime() {
        var dateTime = new Date();
        dateTime.setFullYear(currentYear, currentMonth-1, currentDay);
        dateTime.setHours(currentHour);
        dateTime.setMinutes(currentMinute);
        dateTime.setSeconds(0);
        //console.log(" --- get current date: ", dateTime.toDateString());
        //console.log(" --- get current time: ", dateTime.toTimeString());
        //console.log(" --- get current mili: ", dateTime.getTime() / 1000);
        CarStatus.dateTime = dateTime.getTime() / 1000;
        var newTime = new Date(dateTime.getTime());
        //console.log(" --- get current date: ", newTime.toDateString());
        //console.log(" --- get current time: ", newTime.toTimeString());
        //showTime(dateTime.getTime());
        emit: sendUTCSetTime(dateTime.getTime()/1000);
        //console.log(" --- current send utcTime = ", dateTime.getTime()/1000)
    }

    function showTime(milisecond){
        var today = new Date(milisecond*1000);
        currentYear = today.getFullYear();
        currentMonth = today.getMonth() + 1;
        currentDay = today.getDate();
        currentHour = today.getHours();
        currentMinute = today.getMinutes();
        dateTimeDisplay();
        //console.log(" --- Now date time is ：" + year + "-" + month + "-" + nowday + " " +hours + ":" + minutes )
    }

    Image {
        id: menuBg
        x: 0
        y: 15
        width:  880
        height: 410
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/SubMenu/submenutips.png"

        Rectangle {
            id: displayBox
            x: 93
            y: 40
            width:  660
            height: 0
            color: "MidnightBlue"
            radius: 10
            opacity: 0.3
        }
    }

    Item {
        id: detailContent
        x: 300
        y: 81
        opacity: 0.0

        Text {
            id: timeSetTitle
            x: 8
            y: 8
            width: 220
            text:qsTr("时间设置")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: timeSetArea
            y: 40
            width:  240
            height: 50
            color: "#09061F"
            radius: 10

            Text {
                id: hourDisplay
                x: 75
                y: 15
                opacity: 1.0
                text:qsTr("10")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 18
                color: "white"
                style: Text.Raised;
                styleColor: "black"
            }

            Text {
                id: timeSetDot
                x: 115
                y: 14
                opacity: 1.0
                text:qsTr(":")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 18
                color: "white"
                style: Text.Raised;
                styleColor: "black"
            }

            Text {
                id: minuteDisplay
                x: 135
                y: 15
                opacity: 1.0
                text:qsTr("56")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 18
                color: "white"
                style: Text.Raised;
                styleColor: "black"
            }
        }

        Text {
            id: dateSetTitle
            x: 8
            y: 115
            width: 220
            text:qsTr("日期设置")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: yearSetAreaRound
            y: 150
            width:  240
            height: 40
            color: "#09061F"
            radius: 15
        }

        Rectangle {
            id: yearSetArea
            y: 170
            width:  240
            height: 50
            color: "#09061F"
        }

        Rectangle {
            id: dateSetArea
            y: 194
            width:  240
            height: 30
            color: "#09061F"
        }

        Rectangle {
            id: dateSetAreaRound
            y: 200
            width:  240
            height: 40
            color: "#09061F"
            radius: 15
        }

        Text {
            id: yearDisplay
            x: 98
            y: 162
            opacity: 1.0
            text:qsTr("2017")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: monthDisplay
            x: 58
            y: 208
            opacity: 1.0
            text:qsTr("12")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: timeSetMonthTips
            x: 92
            y: 208
            opacity: 1.0
            text:qsTr("月")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: dayDisplay
            x: 138
            y: 208
            opacity: 1.0
            text:qsTr("30")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: timeSetDayTips
            x: 172
            y: 208
            opacity: 1.0
            text:qsTr("日")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Rectangle {
            id: confirmSetAreaRound
            x: 72
            y: 254
            width:  100
            height: 40
            opacity: 1.0
            color: "#09061F"
            radius: 15
        }

        Text {
            id: confirmSetTimeTips
            x: 105
            y: 264
            opacity: 1.0
            text:qsTr("确定")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: setTimeOKTips
            x: 62
            y: 264
            opacity: 0.0
            text:qsTr("时间已设置成功")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "green"
        }
    }

    Text {
        x: 270
        y: 398
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("时间信息设置")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "gold"
        style: Text.Raised;
        //styleColor: "white"
    }

    Connections {
        target:CarStatus
        onMenu_increase: {
            switch(currentPosition){
                case 1:
                    currentHour++;
                    currentHourDisplay();
                    break;
                case 2:
                    currentMinute++;
                    currentMinuteDisplay();
                    break;
                case 3:
                    currentYear++;
                    currentYearDisplay();
                    break;
                case 4:
                    currentMonth++;
                    currentMonthDisplay();
                    currentDayDisplay();
                    break;
                case 5:
                    currentDay++;
                    currentDayDisplay();
                    break;

                default:
                    break;
            }
        }
    }

    Connections {
        target:CarStatus
        onMenu_decrease: {
            switch(currentPosition){
                case 1:
                    currentHour--;
                    currentHourDisplay();
                    break;
                case 2:
                    currentMinute--;
                    currentMinuteDisplay();
                    break;
                case 3:
                    currentYear--;
                    currentYearDisplay();
                    break;
                case 4:
                    currentMonth--;
                    currentMonthDisplay();
                    currentDayDisplay();
                    break;
                case 5:
                    currentDay--;
                    currentDayDisplay();
                    break;
                default:
                    break;
            }
        }
    }

    Timer {
        id: flashDisplay
        interval: 850;
        running: false;
        repeat: false
        onTriggered: {
            setTimeOKTips.opacity = 0.0
        }
    }

    Connections {
        target:CarStatus
        onMenu_time_tips: {
            sendTime();
            confirmSetAreaRound.opacity = 0.0
            confirmSetTimeTips.opacity = 0.0
            setTimeOKTips.opacity = 1.0
            if(setTimeResult) {
                setTimeOKTips.text = "时间已设置成功"
                setTimeOKTips.color = "green"
            } else {
                setTimeOKTips.text = "时间设置失败"
                setTimeOKTips.color = "red"
            }
            flashDisplay.running = true
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: timeSetMenu; opacity: 0.0 }
            PropertyChanges { target: menuBg; visible: false }
            PropertyChanges { target: displayBox; height: 0 }
            PropertyChanges { target: detailContent; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: timeSetMenu; opacity: 1.0 }
            PropertyChanges { target: menuBg; visible: true }
            PropertyChanges { target: displayBox; height: 335 }
            PropertyChanges { target: detailContent; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: confirmSetAreaRound; property: "opacity"; to:1.0; duration: 10;}
                    NumberAnimation {target: confirmSetTimeTips; property: "opacity"; to:1.0; duration: 10;}
                    NumberAnimation {target: setTimeOKTips; property: "opacity"; to:0.0; duration: 10;}
                    ScriptAction {
                        script: {
                            var timeMile = CarStatus.dateTime; //defaultUTCTime;
                            //if(timeMile===0) { timeMile = 1483200000; setTimeResult = false; } else { setTimeResult = true; }
                            showTime(timeMile);
                        }
                    }
                }
                ParallelAnimation{
                    NumberAnimation {target: timeSetMenu; property: "opacity"; duration: 200;}
                    NumberAnimation {target: displayBox; property: "height"; duration: 200; easing.type: Easing.OutBounce}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 200;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 200;}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: timeSetMenu; property: "opacity"; duration: 100;}
                    NumberAnimation {target: displayBox; property: "height"; duration: 100; easing.type: Easing.OutBounce}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 100;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 100;}
                }
            }
        }
    ]
}

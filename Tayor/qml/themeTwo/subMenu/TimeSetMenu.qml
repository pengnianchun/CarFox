import QtQuick 2.0

Item {
    id: timeSetMenu
    width: 1440
    height: 544

    property int currentYear:   2017
    property int currentMonth:  7
    property int currentDay:    1
    property int currentHour:   18
    property int currentMinute: 00
    property int currentPosition:  (menuBg.visible === false) ? -1 : CarStatus.menu_TimePos
    property int currentDirection: CarStatus.menu_Direction
    property int defaultUTCTime: 0
    property bool setTimeResult: true

    signal sendUTCSetTime(real utcTime)

    onCurrentPositionChanged: {

        yearDisplayArea.color = "transparent"
        monthDisplayArea.color = "transparent"
        dayDisplayArea.color = "transparent"
        hourDisplayArea.color = "transparent"
        minuteDisplayArea.color = "transparent"
        confirmDisplayArea.color = "transparent"

        if (1 == currentPosition) {
            setTimeOKTips.opacity = 0.0
            hourDisplayArea.color = "#FF5D00"
            confirmSetTimeTips.opacity = 1.0
        } else if (2 == currentPosition) {
            minuteDisplayArea.color = "#FF5D00"
        } else if (3 == currentPosition) {
            yearDisplayArea.color = "#FF5D00"
        } else if (4 == currentPosition) {
            monthDisplayArea.color = "#FF5D00"
        } else if (5 == currentPosition) {
            dayDisplayArea.color = "#FF5D00"
        } else if (6 == currentPosition) {
            confirmDisplayArea.color = "#FF5D00"
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

    Rectangle {
        id: menuBg
        x: 490
        y: 42
        width: 460
        height: 460
        radius: 230
        color: "black"
        visible: false
    }

    Item {
        id: detailContent
        x: 600
        y: 170
        opacity: 0.0

        Item {
            id: realtimeDisplay
            Rectangle {
                id: hourDisplayArea
                x: -20
                y: 50
                width:  100
                height: 50
                color:  "transparent"   //"transparent"
                radius: 10

                Text {
                    id: hourDisplay
                    anchors.centerIn: parent
                    text:qsTr("10")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Rectangle {
                id: dotDisplayArea
                x: 100
                y: 50
                width:  20
                height: 40
                color: "transparent"
                radius: 10

                Text {
                    id: timeSetDot
                    anchors.centerIn: parent
                    text:qsTr(":")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Rectangle {
                id: minuteDisplayArea
                x: 140
                y: 50
                width:  100
                height: 50
                color:  "transparent"
                radius: 10

                Text {
                    id: minuteDisplay
                    anchors.centerIn: parent
                    text:qsTr("56")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
        }

        Item {
            id: realDateDisplay
            Rectangle {
                id: yearDisplayArea
                x: -60
                y: 120
                width:  120
                height: 50
                color:  "transparent"   //"transparent"
                radius: 10

                Text {
                    id: yearDisplay
                    anchors.centerIn: parent
                    text:qsTr("10")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Rectangle {
                id: tag1DisplayArea
                x: 70
                y: 120
                width:  10
                height: 40
                color: "transparent"
                radius: 10

                Text {
                    id: tag1SetDot
                    anchors.centerIn: parent
                    text:qsTr("-")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Rectangle {
                id: monthDisplayArea
                x: 90
                y: 120
                width:  80
                height: 50
                color:  "transparent"
                radius: 10

                Text {
                    id: monthDisplay
                    anchors.centerIn: parent
                    text:qsTr("56")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Rectangle {
                id: tag2DisplayArea
                x: 180
                y: 120
                width:  10
                height: 40
                color: "transparent"
                radius: 10

                Text {
                    id: tag2SetDot
                    anchors.centerIn: parent
                    text:qsTr("-")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Rectangle {
                id: dayDisplayArea
                x: 200
                y: 120
                width:  80
                height: 50
                color:  "transparent"
                radius: 10

                Text {
                    id: dayDisplay
                    anchors.centerIn: parent
                    text:qsTr("56")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 48
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
        }

        Rectangle {
            id: confirmDisplayArea
            x: 60
            y: 220
            width:  120
            height: 40
            color:  "transparent"
            radius: 10

            Text {
                id: confirmSetTimeTips
                anchors.centerIn: parent
                opacity: 1.0
                text:qsTr("确定")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 22
                color: "white"
                style: Text.Raised;
                styleColor: "black"
            }
        }

        Text {
            id: setTimeOKTips
            x: 70
            y: 260
            opacity: 0.0
            text:qsTr("时间已设置成功")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "green"
        }
    }

    Text {
        id: infoTitle
        x: 570
        y: 75
        width: 300
        height: 45
        visible: false
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("时间信息设置")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "#00D1FF"
        //style: Text.Raised;
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
            confirmDisplayArea.color = "transparent"
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
            PropertyChanges { target: menuBg; visible: false }
            PropertyChanges { target: infoTitle; visible: false }
            PropertyChanges { target: detailContent; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: menuBg; visible: true }
            PropertyChanges { target: infoTitle; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: confirmSetTimeTips; property: "opacity"; to:1.0; duration: 10;}
                    NumberAnimation {target: setTimeOKTips; property: "opacity"; to:0.0; duration: 10;}
                    ScriptAction {
                        script: {
                            var timeMile = CarStatus.dateTime; //defaultUTCTime;
                            if(timeMile===0) { timeMile = 1483272000; setTimeResult = false; } else { setTimeResult = true; }
                            showTime(timeMile);
                        }
                    }
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
        }
    ]
}

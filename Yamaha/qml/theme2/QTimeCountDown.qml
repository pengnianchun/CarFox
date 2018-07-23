import QtQuick 2.0

Item {
    property int countDownTime: 0
    property bool countDownTimer: false
    property string textColor: "white"
    property int pixelSize: 16

    Text {
        id: minute
        text: ""
        color: textColor
        font.pixelSize: pixelSize
    }
    Text {
        id: colon
        anchors.left: minute.right
        text: ":"
        color: textColor
        font.pixelSize: pixelSize
    }
    Text {
        id: second
        anchors.left: colon.right
        text: ""
        color: textColor
        font.pixelSize: pixelSize
    }

    Timer {
        id: countdown
        interval: 1000
        repeat: true
        running: countDownTimer
        triggeredOnStart: true
        onTriggered: {
            var min = Math.floor(countDownTime / 60)
            if (min < 10) {
                minute.text = "0" + min
            } else {
                minute.text = min
            }
            var sec =  countDownTime % 60;
            if (sec < 10) {
                second.text = "0" + sec
            } else {
                second.text = sec
            }
            countDownTime--;
        }
    }
}

/****************************************************************
 *
 *  定时切换的多行文字
 *
 ****************************************************************/
import QtQuick 2.6

Text {
    property int interval: 5000
    property var texts: []

    property bool displaying: false
    property int currentIndex: 0
    property int textsLength: texts.length

    onTextsLengthChanged: {
        if (texts.length === 0) return;

        if (currentIndex > texts.length - 1) {
            currentIndex = textsLength -1
        }
    }

    onDisplayingChanged: {
        if (displaying) {
            currentIndex = 0;
            textTimer.start();
        } else {
            textTimer.stop();
        }
    }
    text: texts.length === 0 || currentIndex > texts.length - 1 ? "" : ML.lan[texts[currentIndex]]

    Timer {
        id: textTimer
        interval: parent.interval
        repeat: true

        onTriggered: {
            if (parent.currentIndex < parent.texts.length - 1) {
                ++parent.currentIndex;
            } else {
                parent.currentIndex = 0;
            }
        }
    }
}

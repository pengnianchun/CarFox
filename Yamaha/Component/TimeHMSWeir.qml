import QtQuick 2.6
import QtQuick.Layouts 1.0

Item {
    property string hourValue: "00"
    property string minuteValue: "00"
    property string spaceValue: ":"
    property real timeFontSize: 18
    width: 100
    height: 20
    TextFieldWeir {
        id: hourDisplay
        //textOpacity: 0.0
        textWidth: width/3
        textHeight: height
        anchors.verticalCenter: parent.verticalCenter
        textValue: qsTr(hourValue + " %1 " + minuteValue).arg(spaceValue);
        fontItalic: false
        fontSize: timeFontSize
        fontColor: "white"
    }
}

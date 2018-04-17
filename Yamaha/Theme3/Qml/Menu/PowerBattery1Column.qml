import QtQuick 2.6

import "./"

Row{
    id : root
    property bool pSwitch: false
    property int pID: 0
    property string pText: ""

    spacing: 20   //序号和文字的距离
    Text{
        width: 20
        height: 15
        text:pID
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }
    Text {
        width:20
        height:15
        text: pText
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: pSwitch?"#ffcc00":"#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignLeft
    }
}

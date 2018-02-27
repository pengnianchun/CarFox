import QtQuick 2.6
import CustomEnum 1.0

import "./"

Column {
    id: root
    property alias title: bettary_box.text
    property alias model: repeaterList.model
    spacing: 2

    Text {
        id: bettary_box
        width:150
        height:28
        text: qsTr("")
        font.family: "PingFang SC Regular"
        font.pixelSize: 19; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Repeater {
        id: repeaterList
        Row {
            Text {
                width:75
                height:21
                text: name
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "#00ccff"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                width:75
                height:21
                text: value
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "white"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}

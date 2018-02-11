import QtQuick 2.6

import "./"

Column{
    id:root
    spacing:11    //行距
    property alias model:repeaterlist.model

    Repeater{
        id:repeaterlist
        Row{
            spacing: 22   //序号和文字的距离
            Text{
                width: 20
                height: 15
                text:name
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "white"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                width:20
                height:15
                text: value
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "#00ccff"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}

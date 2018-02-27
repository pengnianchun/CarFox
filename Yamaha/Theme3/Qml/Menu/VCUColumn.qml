import QtQuick 2.6
import CustomEnum 1.0

import "./"

Column{
    id:root
    property alias model:repeaterlist.model
    spacing: 5

    Repeater{
        id:repeaterlist
        Row{
            spacing:30
            Text {
                text:name
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "#00ccff"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                text: value
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "white"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}



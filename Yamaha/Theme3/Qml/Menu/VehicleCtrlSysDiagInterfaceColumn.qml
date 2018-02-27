import QtQuick 2.6
import CustomEnum 1.0

import "./"

Column{
    id:root
    spacing: 5
    property alias model:repeaterlist.model
    Repeater{
        id:repeaterlist
        Row{
            spacing: 4
            Text{
               text:name
               font.family: "PingFang SC Regular"
               font.pixelSize: 16; font.weight: Font.Black
               color: "#00ccff"
               horizontalAlignment: Text.AlignLeft
            }
            Text{
               text:value
               font.family: "PingFang SC Regular"
               font.pixelSize: 16; font.weight: Font.Black
               color: "white"
               horizontalAlignment: Text.AlignLeft
            }
        }
    }
}

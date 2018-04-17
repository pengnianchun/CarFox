import QtQuick 2.6
import CustomEnum 1.0

import "./"

Row{
    id:root
    property bool pSwitch: false
    property string pID:""
    property string pText:""

    spacing: 4
    Text{
       text:pID
       font.family: "PingFang SC Regular"
       font.pixelSize: 15; font.weight: Font.Black
       color: "#00ccff"
       horizontalAlignment: Text.AlignLeft
    }
    Text{
       text:pText
       font.family: "PingFang SC Regular"
       font.pixelSize: 15; font.weight: Font.Black
       color: pSwitch? "#ffcc00":"white"
       horizontalAlignment: Text.AlignLeft
    }
}


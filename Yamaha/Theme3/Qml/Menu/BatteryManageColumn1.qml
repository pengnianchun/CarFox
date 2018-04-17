import QtQuick 2.6
import CustomEnum 1.0

import "./"
Row{
    id:root
    property string pName:""
    property string pValue: ""

    spacing: 130

    Text{
        width: 142
        height: 15
        text:pName
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"
        horizontalAlignment: Text.AlignLeft
    }
    Text{
        width: 142
        height: 15
        text:pValue
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }
}

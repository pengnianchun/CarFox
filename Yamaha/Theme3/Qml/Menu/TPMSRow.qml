import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item{
    id:root

    property alias model:repeaterList.model
    Repeater{
        id:repeaterList
        Column{
            spacing:2
            Text{
                id:tpmsMpa
                width:74
                height:14
                text:mpa
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "#00ccff"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
            Text{
                id:tpmsTemp
                width:48
                height:15
                text:temp
                font.family: "PingFang SC Regular"
                font.pixelSize: 17; font.weight: Font.Black
                color: "#00ccff"   //rgba(0,92,189,255)
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}

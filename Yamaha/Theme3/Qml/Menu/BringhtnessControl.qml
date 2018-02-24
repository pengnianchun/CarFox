import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item{
    visible:false
    Image{
        id:brightTitle
        x:320
        y:83
        width:114
        height:44
        source: "qrc:/Theme/Theme3/Image/MenuPanel/bringhtnessControl.png"
    }

    Rectangle{
        id:brightBorderRect
        x:211
        y:153
        width:341
        height:96
        color:"transparent"
        border.color: "white"
        border.width: 2
        radius:11
        Rectangle{
            id:brightinsideRect
            x:5
            y:5
            width:331
            height:86
            color:"#00ccff"
            radius: 10
            Text{
                id:brightValue
                anchors.fill: parent
                width:105
                height:26
                text:"100 %"
                font.family: "PingFang SC Regular"
                font.bold: true
                font.pixelSize: 30;font.weight: Font.Black
                color:"white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}

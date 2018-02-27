import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

Item{
    id:root
    x:552
    y:144
    visible:false

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onKeyShortPressed: {
            if(key === 1) //back键
            {
                if(root.visible === false)
                {
                    return;
                }
                UiController.hideLayer("BringhtnessControl");
                UiController.showLayer("MenuPanel");
            }
        }
    }

    Image{
        id:brightTitle
        x:123
        y:0
        width:114
        height:44
        source: "qrc:/Theme/Theme3/Image/MenuPanel/bringhtnessControl.png"
    }

    Rectangle{
        id:brightBorderRect
        x:0
        y:62
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

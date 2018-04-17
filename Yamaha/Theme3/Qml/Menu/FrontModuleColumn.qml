import QtQuick 2.0

import "./"

Row{
    id:root
    property string pName:"";
    property real pValue:0;
    property int pStatus:0

    spacing: 10   //序号和文字的距离

    function changeImage()
    {
        if(pStatus == 0)    //空
        {
            image.source = "qrc:/Common/CommonImage/Other/ring_0.png";
        }
        else if(pStatus == 1)    //绿色圈
        {
            image.source = "qrc:/Common/CommonImage/Other/ring_1.png";
        }
        else if(pStatus == 2)   //黄色圈
        {
            image.source ="qrc:/Common/CommonImage/Other/ring_3.png";
        }
        else if(pStatus == 3)   //红色圈
        {
            image.source ="qrc:/Common/CommonImage/Other/ring_2.png";
        }
    }

    onPStatusChanged: {
        changeImage();
    }

    Image{
        id:image
        width: 13
        height: 13
        fillMode: Image.Stretch
        source:"qrc:/Common/CommonImage/Other/ring_0.png";
    }

    Text{
        width: 168
        height: 15
        text:pName
        font.family: "PingFang SC Regular"
        font.pixelSize: 12; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
    Text {
        width:20
        height:15
        text: pValue
        font.family: "PingFang SC Regular"
        font.pixelSize: 12; font.weight: Font.Black
        color: "white"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}


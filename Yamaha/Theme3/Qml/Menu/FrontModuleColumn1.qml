import QtQuick 2.0

import "./"

Row{
    id:root
    property string pName:"";
    property int pValue:0;
    property bool pStatus:false

    spacing: 10   //序号和文字的距离

    function changeImage()
    {
        if(pStatus == false)
        {
            image.source = "qrc:/Common/CommonImage/Other/ring_0.png";
        }
        else if(pStatus == true)
        {
            image.source = "qrc:/Common/CommonImage/Other/ring_1.png";
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
        width: 128
        height: 15
        text:pName
        font.family: "PingFang SC Regular"
        font.pixelSize: 12; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}


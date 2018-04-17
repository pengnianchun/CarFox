import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningDcDcImage: sourceImageUrl+"Image/MiddlePanel/dc.png"
    property alias dcDcText:valueWarningDcDc.text;

    Image{
        id:imageWarningDcDc
        x:171
        y:77
        width:360
        height:196
        source:warningDcDcImage
        Text{
            id:valueWarningDcDc
//            x:114
//            y:21
            x:0
            y:20
            width:342
            height:62
//            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:""
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}

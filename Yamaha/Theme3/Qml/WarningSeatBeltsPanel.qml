import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningSeatBeltsImage: sourceImageUrl+"Image/MiddlePanel/warningSeatBelts.png"
    property string seatBelts:""
    Image{
        id:imageWarningSeatBelts
        x:227
        y:59
        width:254
        height:277
        source:warningSeatBeltsImage
        Text{
            id:valueWarningSeatBelts
//            x:57
//            y:31
            x:5
            y:30
            width:218
            height:54
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:seatBelts
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}


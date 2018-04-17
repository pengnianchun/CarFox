import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningChargingImage: sourceImageUrl+"Image/MiddlePanel/warningCharging.png"

    Image{
        id:imageWarningCharging
        x:172
        y:77
        width:386
        height:252
        source:warningChargingImage
        Text{
            id:valueWarningCharging
//            x:115
//            y:19
            x:0
            y:20
            width:343
            height:63
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:"正在充电!"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}

import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningChargeAbnormalImage: sourceImageUrl+"Image/MiddlePanel/warningChargingAbnormal.png"
    property alias chargeAbnormalText:valueWarningChargeAbnormal.text;

    Image{
        id:imageWarningChargeAbnormal
        x:172
        y:77
        width:386
        height:252
        source:warningChargeAbnormalImage
        Text{
            id:valueWarningChargeAbnormal
//            x:115
//            y:19
            x:0
            y:20
            width:343
            height:63
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

import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningChargeOkImage: sourceImageUrl+"Image/MiddlePanel/warningChargedOk.png"

    Image{
        id:imageWarningChargeOk
        x:172
        y:77
        width:386
        height:252
        source:warningChargeOkImage
        Text{
            id:valueWarningChargeOk
//            x:115
//            y:19
            x:0
            y:20
            width:343
            height:63
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:"充电完成!"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"

        }
    }
}

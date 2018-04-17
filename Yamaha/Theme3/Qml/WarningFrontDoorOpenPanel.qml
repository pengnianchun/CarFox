import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningFrontDoorOpenImage: sourceImageUrl+"Image/MiddlePanel/warningFontDoorOpen.png"

    Image{
        id:imageWarningFrontDoorOpen
        x:200
        y:66
        width:338
        height:258
        source:warningFrontDoorOpenImage
        Text{
            id:valueWarningFrontDoorOpen
//            x:87
//            y:21
            x:0
            y:20
            width:343
            height:63
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:"前门未关!"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}

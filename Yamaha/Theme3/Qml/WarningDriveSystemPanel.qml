import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningDriveSystemImage: sourceImageUrl+"Image/MiddlePanel/warningDriveSystem.png"
    property string driveSystemText:""
    Image{
        id:imageWarningDriveSystem
        x:171
        y:77
        width:360
        height:245
        source:warningDriveSystemImage
        Text{
            id:valueWarningDriveSystem
//            x:71
//            y:19
            x:0
            y:20
            width:343
            height:63
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:driveSystemText
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}

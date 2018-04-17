import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string warningBatteryText:""
    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningBatteryImage: sourceImageUrl+"Image/MiddlePanel/warningBatteryFailure.png"

    Image{
        id:imageWarningBattery
        x:172
        y:77
        width:363
        height:268
        source:warningBatteryImage
        Text{
            id:valueWarningBattery
            x:0
            y:20
            width:348
            height:64
//            anchors.centerIn: parent   //anchors是对父控件进行居中，不是对text
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:warningBatteryText
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}

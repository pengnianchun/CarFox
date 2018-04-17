import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningVehicleImage: sourceImageUrl+"Image/MiddlePanel/warningVehicleFailure.png"
    property string vehicle:""
    Image{
        id:imageWarningVehicle
        x:170
        y:77
        width:360
        height:235
        source:warningVehicleImage
        Text{
            id:valueWarningVehicle
//            x:122
//            y:19
            x:0
            y:20
            width:348
            height:64
//            anchors.centerIn: parent   //anchors是对父控件进行居中，不是对text
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:vehicle
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}


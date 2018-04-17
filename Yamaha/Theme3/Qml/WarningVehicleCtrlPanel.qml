import QtQuick 2.0

Item {
    id: root
    width: 693
    height: 457

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string warningVehicleCtrlImage: sourceImageUrl+"Image/MiddlePanel/warningVehicleCtrlFailure.png"
    property string vehicleCtrl:""
    Image{
        id:imageWarningVehicleCtrl
        x:170
        y:77
        width:548
        height:300
        source:warningVehicleCtrlImage
        Text{
            id:valueWarningVehicleCtrl
            x:0
            y:20
            width:348
            height:64
//            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignHCenter;
            text:vehicleCtrl;  //整车控制器故障!
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize:24
            color: "white"
        }
    }
}


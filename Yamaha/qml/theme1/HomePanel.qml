import QtQuick 2.0

Item {
    id: root_item;
    z: 0
    width: 1440
    height: 540

    Image {
        id: background;
        x: 0;
        y: 0;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/background.png";

        // ------------------------- car speed dial -------------------------
        Item {
            id: car_speed_dial
            x: 0;
            y: 0;

            // dial center number
            Text {
                id: car_speed_dial_center_number;
                x: 196;
                y: 281;
                visible: true;
                text: "84";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 135;
                smooth:true;
            }
            // Measurement unit
            Text {
                id: car_speed_dial_measurement_unit;
                x: 279;
                y: 349;
                visible: true;
                text: "km/h";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            // trip
            Text {
                id: car_speed_dial_strip;
                x: 213;
                y: 389;
                visible: true;
                text: "trip: 500.2 km";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            // dial scale
            Text {
                id: car_speed_dial_scale_0;
                x: 134;
                y: 454;
                visible: true;
                text: "0";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            Text {
                id: car_speed_dial_scale_40;
                x: 92;
                y: 377;
                visible: true;
                text: "40";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            Text {
                id: car_speed_dial_scale_80;
                x: 81;
                y: 304;
                visible: true;
                text: "80";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            Text {
                id: car_speed_dial_scale_120;
                x: 77;
                y: 213;
                visible: true;
                text: "120";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            Text {
                id: car_speed_dial_scale_160;
                x: 122;
                y: 127;
                visible: true;
                text: "160";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            Text {
                id: car_speed_dial_scale_200;
                x: 221;
                y: 67;
                visible: true;
                text: "200";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            Text {
                id: car_speed_dial_scale_240;
                x: 339;
                y: 48;
                visible: true;
                text: "240";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
        }
//        // ------------------------- re dial -------------------------
//        Item {
//            id: rotation_speed_dial
//            x: 0;
//            y: 0;

//            // dial speed number
//            Text {
//                id: speed_dial_center_number;
//                x: 196;
//                y: 219;
//                visible: true;
//                text: "84";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 135;
//                smooth:true;
//            }
//            // Measurement unit
//            Text {
//                id: speed_ddial_measurement_unit;
//                x: 279;
//                y: 349;
//                visible: true;
//                text: "km/h";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            // trip
//            Text {
//                id: speed_dial_strip;
//                x: 213;
//                y: 389;
//                visible: true;
//                text: "trip: 500.2 km";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            // dial scale
//            Text {
//                id: speed_dial_scale_0;
//                x: 134;
//                y: 454;
//                visible: true;
//                text: "0";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            Text {
//                id: speed_dial_scale_40;
//                x: 92;
//                y: 377;
//                visible: true;
//                text: "40";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            Text {
//                id: speed_dial_scale_80;
//                x: 81;
//                y: 304;
//                visible: true;
//                text: "80";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            Text {
//                id: speed_dial_scale_120;
//                x: 77;
//                y: 213;
//                visible: true;
//                text: "120";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            Text {
//                id: speed_dial_scale_160;
//                x: 122;
//                y: 127;
//                visible: true;
//                text: "160";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            Text {
//                id: speed_dial_scale_200;
//                x: 221;
//                y: 67;
//                visible: true;
//                text: "200";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//            Text {
//                id: speed_dial_scale_240;
//                x: 339;
//                y: 48;
//                visible: true;
//                text: "240";
//                color: "white";
//                font.family: "Europe_Ext";
//                font.pixelSize: 24;
//                smooth:true;
//            }
//        }
    }
    Image {
        id: pointer;
        x: 120;
        y: 100;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/Pointer.png";
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        onClicked: pathAnim.start()
    }

    PathAnimation {
        id: pathAnim
        target: pointer
        duration: 3000
        anchorPoint: "20, 20"
        orientationEntryDuration: 100
        orientationExitDuration: 100
        easing.type: Easing.Linear
        orientation: PathAnimation.TopFirst

        path: Path {
            startX: 130;
            startY: 537;
            PathCurve { x: 127-30; y: 536 }  // position 0
            PathCurve { x: 103-30; y: 514 }
            PathCurve { x: 95-30;  y: 500 }
            PathCurve { x: 87-30;  y: 478 }
            PathCurve { x: 78-30;  y: 447 }  // position 40
            PathCurve { x: 74-30;  y: 424 }
            PathCurve { x: 73-30;  y: 410 }
            PathCurve { x: 71-30;  y: 397 }
            PathCurve { x: 69-30;  y: 374 }  // position 80
            PathCurve { x: 67-30;  y: 346 }
            PathCurve { x: 67-30;  y: 330 }
            PathCurve { x: 67-30;  y: 304 }
            PathCurve { x: 70-30;  y: 282 }  // position 120
            PathCurve { x: 82-30;  y: 254 }
            PathCurve { x: 93-30;  y: 229 }
            PathCurve { x: 106-30; y: 207 }
            PathCurve { x: 114-30; y: 196 }  // position 160
            PathCurve { x: 144-30; y: 165 }
            PathCurve { x: 165-30; y: 151 }
            PathCurve { x: 191-30; y: 137 }
            PathCurve { x: 242-30; y: 121-70 }  // position 200
            PathCurve { x: 256-30; y: 118-70 }
            PathCurve { x: 289-30; y: 110-70 }
            PathCurve { x: 320-30; y: 106-70 }
            PathCurve { x: 367-30; y: 105-70 }  // position 240
        }
    }
}

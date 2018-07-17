import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

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
            id: car_speed_dial;

            // dial center number
            Text {
                id: car_speed_dial_center_number;
                x: 196;
                y: 203;
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
                opacity: 0.4;
                font.family: "Europe_Ext";
                font.pixelSize: 20;
                smooth:true;
            }
            // trip title
            Text {
                id: car_speed_dial_strip;
                x: 213;
                y: 389;
                visible: true;
                text: "trip:             km";
                color: "#103d44";
                font.family: "icrosoft YaHei UI";
                font.pixelSize: 24;
                smooth:true;
            }
            // trip title content
            Text {
                id: car_speed_dial_strip_content;
                x: 268;
                y: 389;
                visible: true;
                text: "500.2";
                color: "#047f93";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            // dial scale
            Text {
                id: car_speed_dial_scale_0;
                x: 134;
                y: 448;
                visible: true;
                text: "0";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
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
                opacity: 0.15;
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
                opacity: 0.15;
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
                opacity: 0.15;
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
                opacity: 0.15;
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
                opacity: 0.15;
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
                opacity: 0.15;
            }
        }
        // ------------------------- rotation speed dial -------------------------
        Item {
            id: rotation_speed_dial;

            // dial center number
            Text {
                id: rotation_speed_dial_center_number;
                x: 1058;
                y: 203;
                visible: true;
                text: "42";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 135;
                smooth:true;
            }
            // Measurement unit
            Text {
                id: rotation_speed_dial_measurement_unit;
                x: 1102;
                y: 353;
                visible: true;
                text: "x 100/min";
                color: "white";
                opacity: 0.4;
                font.family: "Europe_Ext";
                font.pixelSize: 20;
                smooth:true;
            }
            // trip title
            Text {
                id: rotation_speed_dial_strip;
                x: 1047;
                y: 394;
                visible: true;
                text: "odo:                     km";
                color: "#103d44";
                font.family: "icrosoft YaHei UI";
                font.pixelSize: 24;
                smooth:true;
            }
            // trip title content
            Text {
                id: rotation_speed_dial_strip_content;
                x: 1047 + 60;
                y: 394;
                visible: true;
                text: "3000000";
                color: "#047f93";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            // dial scale
            Text {
                id: rotation_speed_dial_scale_0;
                x: 1288-5;
                y: 454-5;
                visible: true;
                text: "0";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
            Text {
                id: rotation_speed_dial_scale_20;
                x: 1312-5;
                y: 377-5;
                visible: true;
                text: "20";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
            Text {
                id: rotation_speed_dial_scale_40;
                x: 1326-5;
                y: 304-5;
                visible: true;
                text: "40";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
            Text {
                id: rotation_speed_dial_scale_60;
                x: 1323-5;
                y: 213-5;
                visible: true;
                text: "60";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
            Text {
                id: rotation_speed_dial_scale_80;
                x: 1280-5;
                y: 127-5;
                visible: true;
                text: "80";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
            Text {
                id: rotation_speed_dial_scale_100;
                x: 1170-5;
                y: 67-5;
                visible: true;
                text: "100";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
            Text {
                id: rotation_speed_dial_scale_120;
                x: 1051-5;
                y: 48-5;
                visible: true;
                text: "120";
                color: "white";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.15;
            }
        }

        // ------------------------- main menu panel -------------------------
        Item {
            x: 630;
            y: 50;
            property int menuIndex: 0;
            ListModel {
                id: menuModel;
                ListElement { name: ""; icon: "qrc:/theme1/slice/Theme1/Slice/multimedia.png";}
                ListElement { name: ""; icon: "qrc:/theme1/slice/Theme1/Slice/mainpage.png";}
                ListElement { name: ""; icon: "qrc:/theme1/slice/Theme1/Slice/tirepressure.png";}
            }

            Component {
                id: displayDelegate
                Item {
                    width: 40; height: 40;
                    Image { source: icon; }
                }
            }

            PathView {
                id: pathView;
                anchors.fill: parent;
                model: menuModel;
                delegate: displayDelegate;
                path: Path {
                    startX: 0; startY: 0;
//                    PathAttribute { name: "iconScale"; value: 1.0; }
//                    PathAttribute { name: "iconOpacity"; value: 1.0; }
                    PathQuad { x: 250; y: 20; controlX: 150; controlY: -20; }
                }
                pathItemCount: 3;
                currentIndex: 0;
            }
            onMenuIndexChanged: {
                pathView.currentIndex = menuIndex-1;
            }
        }
//        Item {
//            id: pathViewMenu;
//            x: 725;
//            y: 10;
//            opacity: 1;
//            property int menuIndex: 0;
//            ListModel {
//                id: menuModel;
//                ListElement { name: ""; icon: "qrc:/theme1/slice/Theme1/Slice/multimedia.png";}
//                ListElement { name: ""; icon: "qrc:/theme1/slice/Theme1/Slice/mainpage.png";}
//                ListElement { name: ""; icon: "qrc:/theme1/slice/Theme1/Slice/tirepressure.png";}
//            }
//            Component {
//                id: displayDelegate;
//                Item {
//                    width:  0;
//                    height: 0;
//                    scale: PathView.iconScale;
//                    Image {
//                        id: myIcon;
//                        y: 20;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        source: icon;
//                        smooth: true;
//                    }
//                    Text {
//                        anchors {
//                            horizontalCenter: parent.horizontalCenter;
//                            bottom: myIcon.bottom;
//                        }
//                        text: name;
//                        font.pointSize: 24;
//                        font.family: fontFamily;
//                        style: Text.Sunken;
//                        styleColor: "green";
//                        smooth: true;
//                    }
//                }
//            }
//            Component {
//                id: displayHighlight;
//                Rectangle {
//                    width:  200;
//                    height: 200;
//                    border.color: "red";
//                    color: "transparent"; //"lightsteelblue"
//                    radius: 20;
//                    opacity: 0; // 0.1
//                }
//            }
//            PathView {
//                id: pathView;
//                highlight: displayHighlight;
//                preferredHighlightBegin: 0.5;
//                preferredHighlightEnd: 0.5;
//                focus: true;
//                model: menuModel;
//                delegate: displayDelegate;
//                path: Path {
//                    startX: 10;
//                    startY: 180;
//                    PathAttribute { name: "iconScale"; value: 1; }
//                    PathQuad { x: 0; y: 0; controlX: 50; controlY: 50; }
//                    PathAttribute { name: "iconScale"; value: 1.0; }
//                    PathQuad { x: 0; y: 0; controlX: 50; controlY: 50; }
//                    PathAttribute { name: "iconScale"; value: 1; }
//                }
//                pathItemCount: 3;
//                currentIndex: 0;
//            }
//            onMenuIndexChanged: {
//                pathView.currentIndex = menuIndex-1;
////                title.text = getDisplayText(menuIndex);
//            }
//        }

        // ------------------------- car picture -------------------------
        Item {
            id: car_picture;
            Image {
                id: car_image;
                x: 564;
                y: 136;
                source: "qrc:/theme1/slice/Theme1/Slice/dashed_car.png";
            }
        }

        // ------------------------- soc panel -------------------------
        Item {
            id: soc_panel;

            // current time
            Text {
                id: soc_label;
                x: 645;
                y: 367;
                visible: true;
                text: "soc :";
                color: "#068ca5";
                font.family: "Europe_Ext";
                font.pixelSize: 22;
                font.bold: false;
                smooth:true;
            }
            Text {
                id: soc_value;
                x: 645+65;
                y: 367;
                visible: true;
                text: "50%";
                color: "#068ca5";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                font.bold: false;
                smooth:true;
            }

            ProgressBar {
                id: progressbar_soc;
                x: 545;
                y: 407;
                width: 360;
                height: 1;
                value: 0.5;
                style: ProgressBarStyle {
                    background: Rectangle {
                    color:"white";
                    opacity: 0.2;
                    }
                    progress: Rectangle{
                        color: "#068ca5";
                    }
                }
            }

            Rectangle {
                id: progressbar_soc_handle;
                x: progressbar_soc.x + progressbar_soc.width*progressbar_soc.value;
                y: 404;
                width: 7;
                height: 7;
                color: "#068ca5";
                radius: 180;
            }
        }

        // ------------------------- bottom panel -------------------------
        Item {
            id: bottom_panel;

            // current time
            Text {
                id: current_time;
                x: 514;
                y: 485;
                visible: true;
                text: Qt.formatDateTime(new Date(), "hh : mm");
                color: "#068ca5";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
            // current time
            Text {
                id: d;
                x: 693;
                y: 473;
                visible: true;
                text: "D";
                color: "#0e8da1";
                font.family: "Europe_Ext";
                font.pixelSize: 51;
                font.bold: true;
                smooth:true;
            }
            Glow {
                source: d;
                anchors.fill: d;
                radius: 6;
//                samples: 8;
                color: "white";
                opacity: 0.2;
             }
            // current temperature
            Text {
                id: current_temperature;
                x: 790;
                y: 485;
                visible: true;
                text: "36°C-38°C";
                color: "#068ca5";
                font.family: "Europe_Ext";
                font.pixelSize: 24;
                smooth:true;
            }
        }
    }
    Image {
        id: pointer;
        x: 120;
        y: 100;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/Pointer.png";
    }

    MouseArea{
        id: mouseArea;
        anchors.fill: parent;
        onClicked: pathAnim.start();
    }

    PathAnimation {
        id: pathAnim;
        target: pointer;
        duration: 3000;
        anchorPoint: "20, 20";
        orientationEntryDuration: 100;
        orientationExitDuration: 100;
        easing.type: Easing.Linear;
        orientation: PathAnimation.TopFirst;

        path: Path {
            startX: 130;
            startY: 537;
            PathCurve { x: 127-30; y: 536; }  // position 0
            PathCurve { x: 103-30; y: 514; }
            PathCurve { x: 95-30;  y: 500; }
            PathCurve { x: 87-30;  y: 478; }
            PathCurve { x: 78-30;  y: 447; }  // position 40
            PathCurve { x: 74-30;  y: 424; }
            PathCurve { x: 73-30;  y: 410; }
            PathCurve { x: 71-30;  y: 397; }
            PathCurve { x: 69-30;  y: 374; }  // position 80
            PathCurve { x: 67-30;  y: 346; }
            PathCurve { x: 67-30;  y: 330; }
            PathCurve { x: 67-30;  y: 304; }
            PathCurve { x: 70-30;  y: 282; }  // position 120
            PathCurve { x: 82-30;  y: 254; }
            PathCurve { x: 93-30;  y: 229; }
            PathCurve { x: 106-30; y: 207; }
            PathCurve { x: 114-30; y: 196; }  // position 160
            PathCurve { x: 144-30; y: 165; }
            PathCurve { x: 165-30; y: 151; }
            PathCurve { x: 191-30; y: 137; }
            PathCurve { x: 242-30; y: 121-70; }  // position 200
            PathCurve { x: 256-30; y: 118-70; }
            PathCurve { x: 289-30; y: 110-70; }
            PathCurve { x: 320-30; y: 106-70; }
            PathCurve { x: 367-30; y: 105-70; }  // position 240
        }
    }
}

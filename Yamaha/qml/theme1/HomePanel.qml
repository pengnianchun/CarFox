import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/JS/mainpanel_pointer_orbitdata.js" as MainpanelJS

Item {
    id: root_item;
    z: 0
    width: 1440;
    height: 540;
    property var orbitData: [];

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
                    PathQuad { x: 250; y: 20; controlX: 150; controlY: -20; }
                }
                pathItemCount: 3;
                currentIndex: 0;
            }
            onMenuIndexChanged: {
                pathView.currentIndex = menuIndex-1;
            }
        }

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
                text: "50 %";
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
    property bool turnForPathAnimGo: true;
    MouseArea{
        id: mouseArea;
        anchors.fill: parent;
        onClicked: {
            if(turnForPathAnimGo) {
                pathAnimGo.start();
            } else {
                pathAnimBack.start();
            }
        }
//        onPressed: {
//            if(pathAnimGo.running) {
//                pathAnimGo.pause();
//            }
//        }
//        onReleased: {
//            if(pathAnimGo.paused) {
//                pathAnimGo.resume();
//            }
//        }
    }

    Image {
        id: pointer;
        x: 70;
        y: 474;
        visible: true;
        rotation: -23;
        source: "qrc:/theme1/slice/Theme1/Slice/Pointer.png";
        //source: "qrc:/theme1/slice/Theme1/Slice/symmetry_pointer.png";
    }

    PathAnimation {
        id: pathAnimGo;
        target: pointer;
        duration: 3000;
//        orientationEntryDuration: 100;
//        orientationExitDuration: 100;
        easing.type: Easing.Linear;
        orientation: PathAnimation.TopFirst;
        endRotation: 90;

        path: Path {
            startX: 70;
            startY: 474;
//            PathCurve { x: 70;  y: 474; }  // position 0
            PathCurve { x: 49-20;  y: 401-20; }  // position 40
            PathCurve { x: 36-20;  y: 311-20; }  // position 80
            PathCurve { x: 40-20;  y: 223-20; }  // position 120
            PathCurve { x: 94-10;  y: 112-10; }  // position 160
            PathCurve { x: 246-0; y: 47-0; }   // position 200
            PathCurve { x: 381-0; y: 38-0; }   // position 240
        }

        onStarted: {
            console.log("PathAnimation pathAnimGo start");
            pointer.rotation = -23;
//            pointer.x = 90;
//            pointer.y = 494;
        }

        onStopped: {
            console.log("athAnimation pathAnimGo stoped");
//            pathAnimBack.start();
            turnForPathAnimGo = false;
        }
    }

    PathAnimation {
        id: pathAnimBack;
        target: pointer;
        duration: 3000;
//        orientationEntryDuration: 200;
        orientationExitDuration: 100;
        easing.type: Easing.Linear;
        orientation: PathAnimation.BottomFirst;

        path: Path {
            startX: 381-0;
            startY: 38-0;
//            PathCurve { x: 381-0; y: 38-0; }   // position 240
            PathCurve { x: 246-0; y: 47-0; }   // position 200
            PathCurve { x: 94-10;  y: 112-10; }  // position 160
            PathCurve { x: 40-20;  y: 223-20; }  // position 120
            PathCurve { x: 36-20;  y: 311-20; }  // position 80
            PathCurve { x: 49-20;  y: 401-20; }  // position 40
            PathCurve { x: 90-20;  y: 494-20; }  // position 0
        }

        onStarted: {
            console.log("PathAnimation pathAnimGo start");
//            pointer.rotation = 180;
//            pointer.x = 381;
//            pointer.y = 38;
        }

        onStopped: {
            console.log("athAnimation pathAnimGo stoped");
//            pathAnimGo.start();
            turnForPathAnimGo = true;
        }
    }

//    PathAnimation {
//        property int begin_x: 0;
//        property int begin_y: 0;
//        property int end_x: 0;
//        property int end_y: 0;

//        id: pathAnimGo_custom;
//        target: pointer;
//        duration: 3000;
//        orientationEntryDuration: 0;
//        orientationExitDuration: 0;
//        easing.type: Easing.Linear;
//        orientation: PathAnimation.TopFirst;
//        endRotation: 0;

//        path: Path {
//            startX: begin_x;
//            startY: begin_y;
//            PathCurve { x: end_x;  y: end_y; }
//        }

//        onStarted: {
//            console.log("pathAnimGo_custom start");
//        }

//        onStopped: {
//            console.log("pathAnimGo_custom stoped");
//        }
//    }

//    Timer {
//        interval: 100;
//        running: true;
//        repeat: true
//        onTriggered: {
//            pathAnimGo_custom.begin_x = 0;
//            pathAnimGo_custom.begin_y = 0;
//            pathAnimGo_custom.end_x = 0;
//            pathAnimGo_custom.end_y = 0;
//            pathAnimGo_custom.start();
//        }
//    }

    Component.onCompleted: {
        console.log("----------------------- Component.onCompleted --------------------------------");
        orbitData = MainpanelJS.initializeMainPanelPointerOrbitData();
        console.log("orbitData.length = " + orbitData.length);
        console.log("orbitData[0][0] = " + orbitData[0][0]);
        console.log("orbitData[0][1] = " + orbitData[0][1]);
    }
}

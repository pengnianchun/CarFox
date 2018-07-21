import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/JS/mainpanel_pointer_orbitdata.js" as MainpanelJS
import "qrc:/Component/Component"


CommonItem {
    id: root_item;
    z: 0
    width: 1440;
    height: 540;
    property var orbitData: [];
    property int currentCarSpeed: 0
    property int currentTireRotation: 0

    FontLoader {
        id: adobeHeitiStd
        source: "qrc:/Fonts/Theme1/font/AdobeHeitiStd.ttc"
    }

    FontLoader {
        id: europeExt
        source: "qrc:/Fonts/Theme1/font/EuropeExt.ttf"
    }

    Image {
        id: background;
        x: 0;
        y: 0;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/background_v3.png";

        // ------------------------- car speed dial -------------------------
        Item {
            id: car_speed_dial;

            // dial center number
            Text {
                id: car_speed_dial_center_number;
                x: 256;
                y: 203;
                visible: true;
                text: "84";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 120;
                smooth:true;
            }
            // Measurement unit
            Text {
                id: car_speed_dial_measurement_unit;
                x: 279;
                y: 353;
                visible: true;
                text: "km/h";
                color: "white";
                opacity: 0.6;
                font.family: europeExt.name;
                font.pixelSize: 20;
                smooth:true;
            }
            // trip title
            Text {
                id: car_speed_dial_strip;
                x: 210;
                y: 380;
                visible: true;
                text: "trip:              km";
                color: "#103d44";
                font.family: adobeHeitiStd.name;
                font.pixelSize: 24;
                smooth:true;
            }
            // trip title content
            Text {
                id: car_speed_dial_strip_content;
                x: 260 + 2;
                y: 383;
                visible: true;
                text: "500.2";
                color: "#047f93";
                font.family: europeExt.name;
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
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 1;
            }
            Text {
                id: car_speed_dial_scale_40;
                x: 92;
                y: 377;
                visible: true;
                text: "40";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: car_speed_dial_scale_80;
                x: 81;
                y: 304;
                visible: true;
                text: "80";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: car_speed_dial_scale_120;
                x: 77;
                y: 213;
                visible: true;
                text: "120";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: car_speed_dial_scale_160;
                x: 122;
                y: 127;
                visible: true;
                text: "160";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: car_speed_dial_scale_200;
                x: 221;
                y: 67;
                visible: true;
                text: "200";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: car_speed_dial_scale_240;
                x: 339;
                y: 48;
                visible: true;
                text: "240";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
        }
        // ------------------------- rotation speed dial -------------------------
        Item {
            id: rotation_speed_dial;

            // dial center number
            Text {
                id: rotation_speed_dial_center_number;
                x: 1038;
                y: 203;
                visible: true;
                text: "42";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 120;
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
                opacity: 0.6;
                font.family: europeExt.name;
                font.pixelSize: 20;
                smooth:true;
            }
            // trip title
            Text {
                id: rotation_speed_dial_strip;
                x: 1032;
                y: 380;
                visible: true;
                text: "odo:                      km";
                color: "#103d44";
                font.family: adobeHeitiStd.name;
                font.pixelSize: 24;
                smooth:true;
            }
            // trip title content
            Text {
                id: rotation_speed_dial_strip_content;
                x: 1037 + 50 + 2;
                y: 383;
                visible: true;
                text: "3000000";
                color: "#047f93";
                font.family: europeExt.name;
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
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: rotation_speed_dial_scale_20;
                x: 1312-5;
                y: 377-5;
                visible: true;
                text: "20";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: rotation_speed_dial_scale_40;
                x: 1326-5;
                y: 304-5;
                visible: true;
                text: "40";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: rotation_speed_dial_scale_60;
                x: 1323-5;
                y: 213-5;
                visible: true;
                text: "60";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: rotation_speed_dial_scale_80;
                x: 1280-5;
                y: 127-5;
                visible: true;
                text: "80";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: rotation_speed_dial_scale_100;
                x: 1170-5;
                y: 67-5;
                visible: true;
                text: "100";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
            Text {
                id: rotation_speed_dial_scale_120;
                x: 1051-5;
                y: 48-5;
                visible: true;
                text: "120";
                color: "white";
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
                opacity: 0.2;
            }
        }

        // ------------------------- main menu panel -------------------------
        Item {
            id: main_menu_panel;
            x: 580;
            y: 40;
            property int menuIndex: -1;
            property var menu_icons: [
                "qrc:/theme1/slice/Theme1/Slice/dashed_car.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/car_info.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/navigation.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/multimedia.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/ADAS.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/analys.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/comsume.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/dispatche.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/help.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/tire_pressure.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/error.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/settings.png",
                "qrc:/theme1/sub_screen_slice/Theme1/sub_screen_slice/info.png"];

            ListModel {
                id: menuModel;
                ListElement { name: "mainpage"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/mainpage-1.png";}
                ListElement { name: "Vehicle information-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Vehicle information-1.png";}
                ListElement { name: "Navigation-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Navigation-1.png";}
                ListElement { name: "multimedia-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/multimedia-1.png";}
                ListElement { name: "Auxiliary driving-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Auxiliary driving-1.png";}
                ListElement { name: "Analysis of driving behavior-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Analysis of driving behavior-1.png";}
                ListElement { name: "Energy consumption analysis-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Energy consumption analysis-1.png";}
                ListElement { name: "dispatching system-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/dispatching system-1.png";}
                ListElement { name: "Drive for help-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Drive for help-1.png";}
                ListElement { name: "tirepressure-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/tirepressure-1.png";}
                ListElement { name: "fault-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/fault-1.png";}
                ListElement { name: "Set up-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Set up-1.png";}
                ListElement { name: "information-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/information-1.png";}
            }

            Component {
                id: displayDelegate;
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
                    id: pathView_path;
                    startX: 0; startY: 0;
                    PathQuad { id: pathView_pathQuad; x: 350; y: 20; controlX: 150; controlY: -20; }
                }
                pathItemCount: 3;
                currentIndex: main_menu_panel.menuIndex;
            }
//            onMenuIndexChanged: {
//                pathView.currentIndex = menuIndex+1;
//            }
        }

        // ------------------------- car picture -------------------------
        Item {
            id: subscreen;
            Image {
                id: subscreen_image;
                x: 564;
                y: 136;
                source: "qrc:/theme1/slice/Theme1/Slice/dashed_car.png";
                scale: 0.9;
            }
        }

        // ------------------------- soc panel -------------------------
        Item {
            id: soc_panel;

            // current time
            Text {
                id: soc_label;
                x: 645;
                y: 367+10;
                visible: true;
                text: "soc :";
                color: "#068ca5";
                font.family: europeExt.name;
                font.pixelSize: 22;
                font.bold: false;
                smooth:true;
            }
            Text {
                id: soc_value;
                x: 645+65;
                y: 367+10;
                visible: true;
                text: "50 %";
                color: "#068ca5";
                font.family: europeExt.name;
                font.pixelSize: 24;
                font.bold: false;
                smooth:true;
            }

            ProgressBar {
                id: progressbar_soc;
                x: 545;
                y: 407+10;
                width: 360;
                height: 1;
                value: 0.5;
                style: ProgressBarStyle {
                    background: Rectangle {
                    color:"white";
                    opacity: 0.6;
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
                font.family: europeExt.name;
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
                font.family: europeExt.name;
                font.pixelSize: 51;
                font.bold: true;
                smooth:true;
            }
            Glow {
                source: d;
                anchors.fill: d;
                radius: 8;
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
                font.family: europeExt.name;
                font.pixelSize: 24;
                smooth:true;
            }
        }
    }


    // ------------------------- rotation speed dial -------------------------
    Item {
        id: symbols;
        visible: true;
        Image {
            id: symbol_overheating;
            x: 994;
            y: 114;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Battery overheating alarm.png";
        }
        Image {
            id: symbol_batteryCharging;
            x: 1060;
            y: 125;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryCharging.png";
        }
        Image {
            id: symbol_batteryCut;
            x: 942;
            y: 97;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryCut.png";
        }
        Image {
            id: symbol_batteryFault;
            x: 1170;
            y: 98;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryFault.png";
        }
        Image {
            id: symbol_batteryFireAlarm;
            x: 1205;
            y: 138;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryFireAlarm.png";
        }
        Image {
            id: symbol_brakeLight;
            x: 416;
            y: 70;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/BrakeLight.png";
        }
        Image {
            id: symbol_chargingCable;
            x: 1152;
            y: 137;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/chargingCable.png";
        }
        Image {
            id: symbol_defroster;
            x: 383;
            y: 117;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Defroster.png";
        }
        Image {
            id: symbol_driverSystemFault;
            x: 1104;
            y: 134;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/driverSystemFault.png";
        }
        Image {
            id: symbol_engineFailue;
            x: 445;
            y: 115;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/engineFailue.png";
        }
        Image {
            id: symbol_hatchDoor1Alarm;
            x: 241;
            y: 138;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/HatchDoor1Alarm.png";
        }
        Image {
            id: symbol_hatchDoor2Alarm;
            x: 203;
            y: 111;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/HatchDoor2Alarm.png";
        }
        Image {
            id: symbol_highPressureOverhaul;
            x: 280;
            y: 138;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/highPressureOverhaul.png";
        }
        Image {
            id: symbol_lamp_ABS;
            x: 994;
            y: 65;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_ABS.png";
        }
        Image {
            id: symbol_lamp_AC;
            x: 308;
            y: 85;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/lamp_AC.png";
        }
        Image {
            id: symbol_lamp_airFilter;
            x: 886;
            y: 68;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_airFilter.png";
        }
        Image {
            id: symbol_lamp_airPress;
            x: 1052;
            y: 85;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_airPress.png";
        }
        Image {
            id: symbol_lamp_frontFog;
            x: 623;
            y: 88;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_frontFog.png";
        }
        Image {
            id: symbol_lamp_headlight;
            x: 663;
            y: 88;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_headlight.png";
        }
        Image {
            id: symbol_lamp_highBeam;
            x: 703;
            y: 88;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_highBeam.png";
        }
        Image {
            id: symbol_lamp_insulationRed;
            x: 1110;
            y: 91;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_insulationRed.png";
        }
        Image {
            id: symbol_lamp_parkingBrake;
            x: 943;
            y: 48;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_parkingBrake.png";
        }
        Image {
            id: symbol_Lamp_positionLight;
            x: 743;
            y: 88;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_positionLight.png";
        }
        Image {
            id: lsymbol_amp_rearFog;
            x: 783;
            y: 88;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_rearFog.png";
        }
        Image {
            id: symbol_lamp_waterLow;
            x: 528;
            y: 61;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_waterLow.png";
        }
        Image {
            id: symbol_leftBrakeAlarm;
            x: 363;
            y: 85;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/leftBrakeAlarm.png";
        }
        Image {
            id: symbol_mainPowerIndication;
            x: 469;
            y: 64;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/mainPowerIndication.png";
        }
        Image {
            id: symbol_motor_notworking;
            x: 496;
            y: 109;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/motor_notworking.png";
        }
        Image {
            id: symbol_motorHeat;
            x: 254;
            y: 98;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/motorHeat.png";
        }
        Image {
            id: symbol_oil_pressure;
            x: 891;
            y: 116;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/oil pressure.png";
        }
        Image {
            id: symbol_ready;
            x: 258;
            y: 432;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/READY.png";
        }
        Image {
            id: symbol_rightBrakeAlarm;
            x: 331;
            y: 133;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/rightBrakeAlarm.png";
        }
        Image {
            id: symbol_stopWL;
            x: 1129;
            y: 432;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/StopWL.png";
        }
        Image {
            id: symbol_turnLeftWL;
            x: 577;
            y: 83;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/TurnLeftWL.png";
        }
        Image {
            id: symbol_turnRightWL;
            x: 823;
            y: 83;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/TurnRightWL.png"
        }
    }

    Text {
        id: debug_id;
        x: 564 - 50;
        y: 136;
        text: pathView.currentIndex;
        visible: true;
        color: "#068ca5";
        font.family: europeExt.name;
        font.pixelSize: 48;
        font.bold: false;
        smooth:true;
    }

    // key events
    property bool bKeyEnable: true;
    property int index: main_menu_panel.menuIndex;
    onKeyEnter: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyEnter")
        }
    }
    onKeyBack: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyBack")
        }
    }
    onKeyUp: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyUp")
        }
//        if(--index < 0) {
////            index = menuModel.count-1;
//        }
        index--;
        if(index < -1) {
            index = main_menu_panel.menu_icons.length-2;
        }
        set_subscreen(index);
    }
    onKeyDown: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyDown")
        }
//        if(++index >= menuModel.count) {
////            index = 0;
//        }
        index++;
        if(index >= main_menu_panel.menu_icons.length-1) {
            index = -1;
        }
        set_subscreen(index);
    }
    onVisibleChanged: {
        if(visible){
            CarMsg.sendEnableKeys(true);
        } else {
            CarMsg.sendEnableKeys(false);
        }
    }

    function set_subscreen(index) {

        pathView.currentIndex = index;
        console.log("pathView.currentIndex: " + pathView.currentIndex);

        subscreen_image.source = main_menu_panel.menu_icons[index+1];
        console.log("subscreen_image.source: " + subscreen_image.source);
        switch(index+1) {
        case 0:
            subscreen_image.x = 564;
            subscreen_image.y = 136;
            subscreen_image.scale = 0.9;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        }
    }

    property bool turnForPathAnimGo: true;
//    MouseArea{
//        property int index: 1;
//        id: mouseArea;
//        anchors.fill: parent;
////        onClicked: {
////            timer.start();

////            pathView.pathView_path.pathView_pathQuad.x = 350;
////            pathView.pathView_path.pathView_pathQuad.y = 20;
////            pathView.pathView_path.pathView_pathQuad.controlX = 100;
////            pathView.pathView_path.pathView_pathQuad.controlY = -20;

////            if(turnForPathAnimGo) {
////                pathAnimGo.start();
////            } else {
////                pathAnimBack.start();
////            }
////        }
////        onPressed: {
////            if(pathAnimGo.running) {
////                pathAnimGo.pause();
////            }
////        }
////        onReleased: {
////            if(pathAnimGo.paused) {
////                pathAnimGo.resume();
////            }
////        }
//    }

    Image {
        id: pointer_car_speed;
        x: 70;
        y: 474;
        visible: true;
        rotation: -23;
        source: "qrc:/theme1/slice/Theme1/Slice/sun.png";
        scale: 0.8;
    }

    PathAnimation {
        id: pathAnimGo;
        target: pointer_car_speed;
        duration: 3000;
        orientationEntryDuration: 100;
        orientationExitDuration: 100;
        easing.type: Easing.Linear;
//        orientation: PathAnimation.TopFirst;
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
//            pointer.rotation = -23;
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
        target: pointer_car_speed;
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
//        duration: 100;
//        orientationEntryDuration: 100;
//        orientationExitDuration: 100;
//        easing.type: Easing.OutQuad;
////        orientation: PathAnimation.TopFirst;
////        endRotation: 90;

//        path: Path {
//            startX: pathAnimGo_custom.begin_x;
//            startY: pathAnimGo_custom.begin_y;
//            PathCurve { x: pathAnimGo_custom.end_x;  y: pathAnimGo_custom.end_y; }
//        }

//        onStarted: {
//            console.log("pathAnimGo_custom start");
//        }

//        onStopped: {
//            console.log("pathAnimGo_custom stoped");
//        }
//    }

    PathAnimation {
        property int begin_x: 0;
        property int begin_y: 0;
        property int end_x: 0;
        property int end_y: 0;

        id: pathAnim_custom;
        target: pointer_car_speed;
        duration: 2000;
        orientationEntryDuration: 100;
        orientationExitDuration: 100;
        easing.type: Easing.OutQuad;
//        orientation: PathAnimation.TopFirst;
//        endRotation: 90;

        path: Path {
            id: pathAnim_custom_path;
            startX: pathAnim_custom.begin_x;
            startY: pathAnim_custom.begin_y;
            PathCurve { x: pathAnim_custom.end_x;  y: pathAnim_custom.end_y; }
        }

        onStarted: {
            console.log("pathAnim_custom start");
        }

        onStopped: {
            console.log("pathAnim_custom stoped");
        }
    }

//    Timer {
//        property bool direction_forward : true
//        id: timer;
//        interval: 100;
//        running: false;
//        repeat: true
//        onTriggered: {
//            if(direction_forward) {
//                currentCarSpeed++;
//                if(currentCarSpeed >= 239) {
////                    running = false;
//                    direction_forward = false;
//                } else {
////                    pointer.rotation = orbitData[currentCarSpeed][2];
//                    pointer.scale = orbitData[currentCarSpeed][3];

//                    pathAnimGo_custom.begin_x = orbitData[currentCarSpeed][0];
//                    pathAnimGo_custom.begin_y = orbitData[currentCarSpeed][1];
//                    pathAnimGo_custom.end_x = orbitData[currentCarSpeed+1][0];
//                    pathAnimGo_custom.end_y = orbitData[currentCarSpeed+1][1];

//                    pathAnimGo_custom.start();
//                }
//                if(currentCarSpeed%2 == 0) {
//                    currentTireRotation++;
//                }
//            } else {
//                currentCarSpeed--;
//                if(currentCarSpeed <= 0) {
////                    running = false;
//                    direction_forward = true;
//                } else {
////                    pointer.rotation = orbitData[currentCarSpeed][2];
//                    pointer.scale = orbitData[currentCarSpeed][3];

//                    pathAnimGo_custom.begin_x = orbitData[currentCarSpeed][0];
//                    pathAnimGo_custom.begin_y = orbitData[currentCarSpeed][1];
//                    pathAnimGo_custom.end_x = orbitData[currentCarSpeed+1][0];
//                    pathAnimGo_custom.end_y = orbitData[currentCarSpeed+1][1];

//                    pathAnimGo_custom.start();
//                }
//                if(currentCarSpeed%2 == 0) {
//                    currentTireRotation--;
//                }
//            }


//            car_speed_dial_center_number.text = currentCarSpeed;
//            rotation_speed_dial_center_number.text = currentTireRotation;

//            // adjust number position
//            if(currentTireRotation >= 100) {
//                rotation_speed_dial_center_number.x = 1038-100;
//            } else if(currentTireRotation >= 10) {
//                rotation_speed_dial_center_number.x = 1038;
//            } else {
//                rotation_speed_dial_center_number.x = 1098;
//            }
//            if(currentCarSpeed >= 100) {
//                car_speed_dial_center_number.x = 196-50;
//            } else if(currentCarSpeed >= 10) {
//                car_speed_dial_center_number.x = 196-10;
//            } else {
//                car_speed_dial_center_number.x = 256;
//            }
//        }
//    }

    function getRandomInt(max) {
        return Math.floor(Math.random() * Math.floor(max));
    }

    function startPathAnimCustom(start, stop) {
        pathAnim_custom.begin_x = orbitData[start][0];
        pathAnim_custom.begin_y = orbitData[start][1];
        pathAnim_custom.end_x = orbitData[stop][0];
        pathAnim_custom.end_y = orbitData[stop][1];
        pathAnim_custom.start();
    }

//    Timer {
//        property int symbolCounter: 0;
//        property int counter: 0;
//        property int carSpeedRandom: 0;
//        property int carSpeedRandomPre: 0;
//        property int tireRotationRandom: 0;
//        property int tireRotationRandomPre: 0;
//        id: timer;
//        interval: 100;
//        running: false;
//        repeat: true
//        onTriggered: {
//            carSpeedRandom = getRandomInt(240);
//            tireRotationRandom = getRandomInt(120);

//            car_speed_dial_center_number.text = carSpeedRandom;
//            // adjust number position
//            if(carSpeedRandom >= 100) {
//                car_speed_dial_center_number.x = 196-50;
//            } else if(carSpeedRandom >= 10) {
//                car_speed_dial_center_number.x = 196-10;
//            } else {
//                car_speed_dial_center_number.x = 256;
//            }

//            if(counter++>4) {
//                counter = 0;
//                // adjust number position
//                if(tireRotationRandom >= 100) {
//                    rotation_speed_dial_center_number.x = 1038-100;
//                } else if(tireRotationRandom >= 10) {
//                    rotation_speed_dial_center_number.x = 1038;
//                } else {
//                    rotation_speed_dial_center_number.x = 1098;
//                }
//                rotation_speed_dial_center_number.text = tireRotationRandom;

//                if(symbolCounter++ > 20) {
//                    symbols.visible = !symbols.visible;
//                    symbolCounter = 0;
//                }
//            }

//            startPathAnimCustom(carSpeedRandomPre, carSpeedRandom);

//            carSpeedRandomPre = carSpeedRandom;
//        }
//    }

    Text {
        id: point_index;
        x: 500;
        y: 150;
        text: "";
        visible: true;
        color: "white";
        font.pixelSize: 48;
    }
    Text {
        id: cordinate_x;
        x: 500;
        y: 200;
        text: "";
        visible: true;
        color: "white";
        font.pixelSize: 48;
    }
    Text {
        id: cordinate_y;
        x: 500;
        y: 250;
        text: "";
        visible: true;
        color: "white";
        font.pixelSize: 48;
    }

    MouseArea{
        id: mouseArea;
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton | Qt.RightButton;
        onClicked: {
            if(mouse.button == Qt.RightButton) {
                timer_for_sun.direction_up = false;
                console.log("Qt.RightButton");
            } else if(mouse.button == Qt.LeftButton) {
                timer_for_sun.direction_up = true;
                console.log("Qt.LeftButton");
            }
            timer_for_sun.start();
        }
    }

    Timer {
//        property int car_speed_current_point_count: -1;
        property int car_speed_current_point_count: 40;
        property bool direction_up: true;
        id: timer_for_sun;
        interval: 10;
        running: true;
//        repeat: true;
        onTriggered: {
            if(direction_up) {
                car_speed_current_point_count++;
                if(car_speed_current_point_count > 239) {
                    direction_up = false;
                    car_speed_current_point_count = 239;
                }
            } else {
                car_speed_current_point_count--;
                if(car_speed_current_point_count < 0) {
                    direction_up = true;
                    car_speed_current_point_count = 0;
                }
            }

            pointer_car_speed.x = orbitData[car_speed_current_point_count][0];
            pointer_car_speed.y = orbitData[car_speed_current_point_count][1];

            point_index.text = car_speed_current_point_count;
            cordinate_x.text = pointer_car_speed.x;
            cordinate_y.text = pointer_car_speed.y;
        }
    }

    Component.onCompleted: {
        console.log("----------------------- Component.onCompleted --------------------------------");
        //orbitData = MainpanelJS.initializeMainPanelPointerOrbitData();
        orbitData = MainpanelJS.initializeMainPanelPointerOrbitDataDiscrete();
        for(var i=0; i<240; i++) {
            console.log("i=" + i + ", [0]=" + orbitData[i][0] + ", [1]=" + orbitData[i][1] + ", [2]=" + orbitData[i][2] + ", [3]=" + orbitData[i][3]);
        }
//        timer.running = true;
    }
}

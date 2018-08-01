import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/Component/Component"
import "qrc:/JS/mainpanel_pointer_orbitdata.js" as MainpanelJS

CommonItem {
    id: root_item
    width: 1440
    height: 540
    property var carSpeedOrbitData: []
    property var rotationOrbitData: []
    property int currentCarSpeed: 0
    property int currentTireRotation: 0
    property int carSpeed: 0
    property int tireRotation: 0

    FontLoader {
        id: europeExt
        name: "Microsoft"
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
//                font.family: adobeHeitiStd.name;
                font.pixelSize: 24;
                smooth:true;
            }
            // trip title content
            Text {
                id: car_speed_dial_strip_content;
                x: 260 + 3;
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
//                font.family: adobeHeitiStd.name;
                font.pixelSize: 24;
                smooth:true;
            }
            // trip title content
            Text {
                id: rotation_speed_dial_strip_content;
                x: 1037 + 50 + 4;
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
                opacity: 1;
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
            property int menuIndex: 1;
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

//            ListModel {
//                id: menuModel;
//                ListElement { name: "mainpage"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/mainpage-1.png";}
//                ListElement { name: "Vehicle information-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Vehicle information-1.png";}
//                ListElement { name: "Navigation-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Navigation-1.png";}
//                ListElement { name: "multimedia-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/multimedia-1.png";}
//                ListElement { name: "Auxiliary driving-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Auxiliary driving-1.png";}
//                ListElement { name: "Analysis of driving behavior-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Analysis of driving behavior-1.png";}
//                ListElement { name: "Energy consumption analysis-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Energy consumption analysis-1.png";}
//                ListElement { name: "dispatching system-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/dispatching system-1.png";}
//                ListElement { name: "Drive for help-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Drive for help-1.png";}
//                ListElement { name: "tirepressure-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/tirepressure-1.png";}
//                ListElement { name: "fault-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/fault-1.png";}
//                ListElement { name: "Set up-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/Set up-1.png";}
//                ListElement { name: "information-1"; icon: "qrc:/theme1/Home page switching/Theme1/Slice/Home page switching/information-1.png";}
//            }
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
                x: 570;
                y: 160;
                source: "qrc:/theme1/slice/Theme1/Slice/dashed_car.png";
                scale: 0.9;
            }
        }

        // ------------------------- soc panel -------------------------
//        Item {
//            id: soc_panel;

//            // current time
////            Text {
////                id: soc_label;
////                x: 645;
////                y: 367+10;
////                visible: true;
////                text: "soc :";
////                color: "#068ca5";
////                font.family: europeExt.name;
////                font.pixelSize: 22;
////                font.bold: false;
////                smooth:true;
////            }
////            Text {
////                id: soc_value;
////                x: 645+65;
////                y: 367+10;
////                visible: true;
////                text: "50 %";
////                color: "#068ca5";
////                font.family: europeExt.name;
////                font.pixelSize: 24;
////                font.bold: false;
////                smooth:true;
////            }

////            ProgressBar {
////                id: progressbar_soc;
////                x: 545;
////                y: 407+10;
////                width: 360;
////                height: 1;
////                value: 0.5;
////                style: ProgressBarStyle {
////                    background: Rectangle {
////                    color:"white";
////                    opacity: 0.6;
////                    }
////                    progress: Rectangle{
////                        color: "#068ca5";
////                    }
////                }
////            }

////            Rectangle {
////                id: progressbar_soc_handle;
////                x: progressbar_soc.x + progressbar_soc.width*progressbar_soc.value;
////                y: 404;
////                width: 7;
////                height: 7;
////                color: "#068ca5";
////                radius: 180;
////            }
//        }

        // ------------------------- bottom panel -------------------------
        Timer {
            id: timer_for_clock;
            interval: 60*1000;
            running: true;
            repeat: true
            onTriggered: {
                current_time.text = Qt.formatDateTime(new Date(), "hh : mm");
            }
        }

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
    property var symbols_scale_ratio: 0.8;
    Item {
        id: symbols;
        visible: true;
        Image {
            id: symbol_overheating;
            x: 994;
            y: 114;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Battery overheating alarm.png";
        }
        Image {
            id: symbol_batteryCharging;
            x: 1060;
            y: 125;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryCharging.png";
        }
        Image {
            id: symbol_batteryCut;
            x: 942;
            y: 97;
            scale: symbols_scale_ratio;
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
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryFireAlarm.png";
        }
        Image {
            id: symbol_brakeLight;
            x: 416;
            y: 70;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/BrakeLight.png";
        }
        Image {
            id: symbol_chargingCable;
            x: 1152;
            y: 137;
//            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/chargingCable.png";
        }
        Image {
            id: symbol_defroster;
            x: 383;
            y: 117;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Defroster.png";
        }
        Image {
            id: symbol_driverSystemFault;
            x: 1104;
            y: 134;
//            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/driverSystemFault.png";
        }
        Image {
            id: symbol_engineFailue;
            x: 445;
            y: 115;
//            scale: symbols_scale_ratio;
            scale: 1.2;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/engineFailue.png";
        }
        Image {
            id: symbol_hatchDoor1Alarm;
            x: 241;
            y: 138;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/HatchDoor1Alarm.png";
        }
        Image {
            id: symbol_hatchDoor2Alarm;
            x: 203;
            y: 111;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/HatchDoor2Alarm.png";
        }
        Image {
            id: symbol_highPressureOverhaul;
            x: 280;
            y: 138;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/highPressureOverhaul.png";
        }
        Image {
            id: symbol_lamp_ABS;
            x: 994;
            y: 65;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_ABS.png";
        }
        Image {
            id: symbol_lamp_AC;
            x: 308;
            y: 85;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/lamp_AC.png";
        }
        Image {
            id: symbol_lamp_airFilter;
            x: 886;
            y: 68;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_airFilter.png";
        }
        Image {
            id: symbol_lamp_airPress;
            x: 1052;
            y: 85;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_airPress.png";
        }
        Image {
            id: symbol_lamp_frontFog;
            x: 623;
            y: 88;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_frontFog.png";
        }
        Image {
            id: symbol_lamp_headlight;
            x: 663;
            y: 88;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_headlight.png";
        }
        Image {
            id: symbol_lamp_highBeam;
            x: 703;
            y: 88;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_highBeam.png";
        }
        Image {
            id: symbol_lamp_insulationRed;
            x: 1110;
            y: 91;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_insulationRed.png";
        }
        Image {
            id: symbol_lamp_parkingBrake;
            x: 943;
            y: 48;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_parkingBrake.png";
        }
        Image {
            id: symbol_Lamp_positionLight;
            x: 743;
            y: 88;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_positionLight.png";
        }
        Image {
            id: lsymbol_amp_rearFog;
            x: 783;
            y: 88;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_rearFog.png";
        }
        Image {
            id: symbol_lamp_waterLow;
            x: 528;
            y: 61;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_waterLow.png";
        }
        Image {
            id: symbol_leftBrakeAlarm;
            x: 363;
            y: 85;
//            scale: symbols_scale_ratio;
            scale: 1.2;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/leftBrakeAlarm.png";
        }
        Image {
            id: symbol_mainPowerIndication;
            x: 469;
            y: 64;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/mainPowerIndication.png";
        }
        Image {
            id: symbol_motor_notworking;
            x: 496;
            y: 109;
//            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/motor_notworking.png";
        }
        Image {
            id: symbol_motorHeat;
            x: 254;
            y: 98;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/motorHeat.png";
        }
        Image {
            id: symbol_oil_pressure;
            x: 891;
            y: 116;
//            scale: symbols_scale_ratio;
            scale: 1.2;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/oil pressure.png";
        }
        Image {
            id: symbol_ready;
            x: 258;
            y: 432;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/READY.png";
        }
        Image {
            id: symbol_rightBrakeAlarm;
            x: 331;
            y: 133;
//            scale: symbols_scale_ratio;
            scale: 1.2;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/rightBrakeAlarm.png";
        }
        Image {
            id: symbol_stopWL;
            x: 1129;
            y: 432;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/StopWL.png";
        }
        Image {
            id: symbol_turnLeftWL;
            x: 577;
            y: 83;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/TurnLeftWL.png";
        }
        Image {
            id: symbol_turnRightWL;
            x: 823;
            y: 83;
            scale: symbols_scale_ratio;
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/TurnRightWL.png"
        }
    }

    // key events
    property bool bKeyEnable: true;
    property int index: main_menu_panel.menuIndex;
    property bool hideSubscreen: false;
    onKeyEnter: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyEnter")
        }
    }
    onKeyBack: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyBack")
            UiController.showLayer("ThemeSetting")
            main_menu_panel.visible = false;
            subscreen_image.visible = false;
            hideSubscreen = true;
        }
    }
    onKeyUp: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyUp")
        }
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

//    Text {
//        id: subScreenIndex;
//        x: 500;
//        y: 200;
//        visible: true;
//        text: pathView.currentIndex;
//        color: "#068ca5";
//        font.family: europeExt.name;
//        font.pixelSize: 22;
//        font.bold: false;
//        smooth:true;
//    }

    function set_subscreen(index) {
        if(hideSubscreen) {
            subscreen_image.visible = false;
            return;
        }

        pathView.currentIndex = index;
        console.log("pathView.currentIndex: " + pathView.currentIndex);

        subscreen_image.source = main_menu_panel.menu_icons[index+1];
        console.log("subscreen_image.source: " + subscreen_image.source);
        switch(index+1) {
        case 0:
            subscreen_image.x = 570;
            subscreen_image.y = 160;
            subscreen_image.scale = 0.9;
            break;
        case 1:
            subscreen_image.x = 564-100;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 2:
            subscreen_image.x = 564-100;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 3:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 4:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 5:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.9;
            break;
        case 6:
            subscreen_image.x = 564-120;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.9;
            break;
        case 7:
            subscreen_image.x = 564-40;
            subscreen_image.y = 136-40;
            subscreen_image.scale = 0.8;
            break;
        case 8:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 9:subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 10:
            subscreen_image.x = 564-50;
            subscreen_image.y = 136-40;
            subscreen_image.scale = 0.8;
            break;
        case 11:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        case 12:
            subscreen_image.x = 564-80;
            subscreen_image.y = 136-70;
            subscreen_image.scale = 0.8;
            break;
        }
    }

    Image {
        id: pointer_car_speed;
        x: 70;
        y: 474;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/sun.png";
        scale: 0.8;
    }
    Image {
        id: pointer_rotation;
        x: 1440-70;
        y: 474;
        visible: true;
        rotation: -23;
        source: "qrc:/theme1/slice/Theme1/Slice/sun.png";
        scale: 0.8;
    }

    function getRandomInt(max) {
        return Math.floor(Math.random() * Math.floor(max));
    }

//    Timer {
//        property int symbolCounter: 0;
//        property int counter: 0;
//        property int carSpeedRandom: 0;
//        property int carSpeedRandomPre: 0;
//        property int tireRotationRandom: 0;
//        property int tireRotationRandomPre: 0;
//        id: timer_for_random_demo;
//        interval: 100;
//        running: true;
//        repeat: true
//        onTriggered: {

//            carSpeedRandom = getRandomInt(240);
//            tireRotationRandom = getRandomInt(120);

//            car_speed_dial_center_number.text = carSpeedRandom;
//            carSpeed = carSpeedRandom;
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
//                    rotation_speed_dial_center_number.x = 1038-50;
//                } else if(tireRotationRandom >= 10) {
//                    rotation_speed_dial_center_number.x = 1038+20;
//                } else {
//                    rotation_speed_dial_center_number.x = 1098;
//                }
//                rotation_speed_dial_center_number.text = tireRotationRandom;
//                tireRotation = tireRotationRandom;

//                if(symbolCounter++ > 2) {
//                    symbols.visible = !symbols.visible;
//                    symbolCounter = 0;
//                }
//            }

//            carSpeedRandomPre = carSpeedRandom;
//        }
//    }

    Timer {
        property int symbolCounter: 0;
        property int counter: 0;
        property int carSpeedRandom: -1;
        property int tireRotationRandom: -1;
        property bool directionCarSpeedUp: true;
        property bool directionRotationUp: true;
        id: timer_for_random_demo;
        interval: 100;
        running: true;
        repeat: true
        onTriggered: {

            if(directionCarSpeedUp) {
                if(++carSpeedRandom > 240) {
                    carSpeedRandom = 240;
                    directionCarSpeedUp = false;
                }
            } else {
                if(--carSpeedRandom < 0) {
                    carSpeedRandom = 0;
                    directionCarSpeedUp = true;
                }
            }

            car_speed_dial_center_number.text = carSpeedRandom;
            carSpeed = carSpeedRandom;
            // adjust number position
            if(carSpeedRandom >= 100) {
                car_speed_dial_center_number.x = 196-50;
            } else if(carSpeedRandom >= 10) {
                car_speed_dial_center_number.x = 196-10;
            } else {
                car_speed_dial_center_number.x = 256;
            }

            /*if(counter++>4) */{
                counter = 0;

                if(directionRotationUp) {
                    if(++tireRotationRandom > 120) {
                        tireRotationRandom = 120;
                        directionRotationUp = false;
                    }
                } else {
                    if(--tireRotationRandom < 0) {
                        tireRotationRandom = 0;
                        directionRotationUp = true;
                    }
                }

                // adjust number position
                if(tireRotationRandom >= 100) {
                    rotation_speed_dial_center_number.x = 1038-50;
                } else if(tireRotationRandom >= 10) {
                    rotation_speed_dial_center_number.x = 1038+20;
                } else {
                    rotation_speed_dial_center_number.x = 1098;
                }
                rotation_speed_dial_center_number.text = tireRotationRandom;
                tireRotation = tireRotationRandom;

                if(symbolCounter++ > 2) {
                    symbols.visible = !symbols.visible;
                    symbolCounter = 0;
                }
            }
        }
    }

    // -------------- for debug ---------------
    MouseArea{
        id: mouseArea;
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton | Qt.RightButton;
        onClicked: {
            if(mouse.button == Qt.RightButton) {
                timer_for_carSpeedPointer.direction_up = false;
                console.log("Qt.RightButton");
            } else if(mouse.button == Qt.LeftButton) {
                timer_for_carSpeedPointer.direction_up = true;
                console.log("Qt.LeftButton");
            }
            subscreen_image.visible = false;
            carSpeedPointer_Index.visible = true;
            carSpeedPointer_X.visible = true;
            carSpeedPointer_Y.visible = true;
            timer_for_carSpeedPointer.repeat = false;
            timer_for_carSpeedPointer.stepDebug = true;
            timer_for_carSpeedPointer.start();
        }
    }

    Text {
        id: carSpeedPointer_Index;
        x: 564 - 80;
        y: 186;
        text: "Index: " + timer_for_carSpeedPointer.car_speed_current_point_count;
        visible: false;
        color: "#068ca5";
        font.family: europeExt.name;
        font.pixelSize: 24;
        font.bold: false;
        smooth:true;
    }
    Text {
        id: carSpeedPointer_X;
        x: 564 - 80;
        y: 246;
        text: "X: " + pointer_car_speed.x;
        visible: false;
        color: "#068ca5";
        font.family: europeExt.name;
        font.pixelSize: 24;
        font.bold: false;
        smooth:true;
    }
    Text {
        id: carSpeedPointer_Y;
        x: 564 - 80;
        y: 306;
        text: "Y: " + pointer_car_speed.y;
        visible: false;
        color: "#068ca5";
        font.family: europeExt.name;
        font.pixelSize: 24;
        font.bold: false;
        smooth:true;
    }

    //    Text {
    //        id: debug_id;
    //        x: 564 - 50;
    //        y: 136;
    //        text: pathView.currentIndex;
    //        visible: true;
    //        color: "#068ca5";
    //        font.family: europeExt.name;
    //        font.pixelSize: 48;
    //        font.bold: false;
    //        smooth:true;
    //    }
    // -------------------------------------------

    Timer {
        property int car_speed_current_point_count: 0;
        property bool direction_up: true;
        property bool stepDebug: false;
        id: timer_for_carSpeedPointer;
        interval: 10;
        running: true;
        repeat: true;
        onTriggered: {
            if(stepDebug) {
                if(direction_up) {
                    if(++car_speed_current_point_count > 239) {
                        car_speed_current_point_count = 239;
                    }
                } else {
                    if(--car_speed_current_point_count < 0) {
                        car_speed_current_point_count = 0;
                    }
                }
                pointer_car_speed.x = carSpeedOrbitData[car_speed_current_point_count][0];
                pointer_car_speed.y = carSpeedOrbitData[car_speed_current_point_count][1];
            } else {
                // car speed
                var carSpeedDialCenterNumber = Number(car_speed_dial_center_number.text);
                if(carSpeedDialCenterNumber > car_speed_current_point_count) {
                    direction_up = true;
                } else {
                    direction_up = false;
                }


                if(direction_up) {
                    if(car_speed_current_point_count < carSpeedDialCenterNumber) {
                        if(++car_speed_current_point_count > 239) {
                            car_speed_current_point_count = 239;
                        }
                        pointer_car_speed.x = carSpeedOrbitData[car_speed_current_point_count][0];
                        pointer_car_speed.y = carSpeedOrbitData[car_speed_current_point_count][1];
                    }
                } else {
                    if(car_speed_current_point_count > carSpeedDialCenterNumber) {
                        if(--car_speed_current_point_count < 0) {
                            car_speed_current_point_count = 0;
                        }
                        pointer_car_speed.x = carSpeedOrbitData[car_speed_current_point_count][0];
                        pointer_car_speed.y = carSpeedOrbitData[car_speed_current_point_count][1];
                    }
                }
            }
        }
    }

    Timer {
        property int rotation_current_point_count: -1;
        property bool direction_up: true;
        id: timer_for_rotationPointer;
        interval: 10;
        running: true;
        repeat: true;
        onTriggered: {
            // rotation
            var rotationDialCenterNumber = 2*Number(rotation_speed_dial_center_number.text);
            if(rotationDialCenterNumber > rotation_current_point_count) {
                direction_up = true;
            } else {
                direction_up = false;
            }

            if(direction_up) {
                if(rotation_current_point_count < rotationDialCenterNumber) {
                    if(++rotation_current_point_count > 239) {
                        rotation_current_point_count = 239;
                    }
                    pointer_rotation.x = rotationOrbitData[rotation_current_point_count][0];
                    pointer_rotation.y = rotationOrbitData[rotation_current_point_count][1];
                }
            } else {
                if(rotation_current_point_count > rotationDialCenterNumber) {
                    if(--rotation_current_point_count < 0) {
                        rotation_current_point_count = 0;
                    }
                    pointer_rotation.x = rotationOrbitData[rotation_current_point_count][0];
                    pointer_rotation.y = rotationOrbitData[rotation_current_point_count][1];
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("----------------------- Component.onCompleted --------------------------------");
        carSpeedOrbitData = MainpanelJS.initializeMainPanel_CarSpeedPointer_OrbitDataDiscrete();
        rotationOrbitData = MainpanelJS.initializeMainPanel_RotationPointer_OrbitDataDiscrete();
//        for(var i=0; i<240; i++) {
//            console.log("i=" + i + ", [0]=" + carSpeedOrbitData[i][0] + ", [1]=" + carSpeedOrbitData[i][1] + ", [2]=" + carSpeedOrbitData[i][2] + ", [3]=" + carSpeedOrbitData[i][3]);
//        }
        set_subscreen(index);
    }

    onCarSpeedChanged: {
        if(carSpeed>0 && carSpeed<40) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 0.2;
            car_speed_dial_scale_80.opacity = 0.2;
            car_speed_dial_scale_120.opacity = 0.2;
            car_speed_dial_scale_160.opacity = 0.2;
            car_speed_dial_scale_200.opacity = 0.2;
            car_speed_dial_scale_240.opacity = 0.2;
        } else if(carSpeed>=40 && carSpeed<80) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 1;
            car_speed_dial_scale_80.opacity = 0.2;
            car_speed_dial_scale_120.opacity = 0.2;
            car_speed_dial_scale_160.opacity = 0.2;
            car_speed_dial_scale_200.opacity = 0.2;
            car_speed_dial_scale_240.opacity = 0.2;
        } else if(carSpeed>=80 && carSpeed<120) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 1;
            car_speed_dial_scale_80.opacity = 1;
            car_speed_dial_scale_120.opacity = 0.2;
            car_speed_dial_scale_160.opacity = 0.2;
            car_speed_dial_scale_200.opacity = 0.2;
            car_speed_dial_scale_240.opacity = 0.2;
        } else if(carSpeed>=120 && carSpeed<160) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 1;
            car_speed_dial_scale_80.opacity = 1;
            car_speed_dial_scale_120.opacity = 1;
            car_speed_dial_scale_160.opacity = 0.2;
            car_speed_dial_scale_200.opacity = 0.2;
            car_speed_dial_scale_240.opacity = 0.2;
        } else if(carSpeed>=160 && carSpeed<200) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 1;
            car_speed_dial_scale_80.opacity = 1;
            car_speed_dial_scale_120.opacity = 1;
            car_speed_dial_scale_160.opacity = 1;
            car_speed_dial_scale_200.opacity = 0.2;
            car_speed_dial_scale_240.opacity = 0.2;
        } else if(carSpeed>=200 && carSpeed<240) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 1;
            car_speed_dial_scale_80.opacity = 1;
            car_speed_dial_scale_120.opacity = 1;
            car_speed_dial_scale_160.opacity = 1;
            car_speed_dial_scale_200.opacity = 1;
            car_speed_dial_scale_240.opacity = 0.2;
        } else if(carSpeed>=240) {
            car_speed_dial_scale_0.opacity = 1;
            car_speed_dial_scale_40.opacity = 1;
            car_speed_dial_scale_80.opacity = 1;
            car_speed_dial_scale_120.opacity = 1;
            car_speed_dial_scale_160.opacity = 1;
            car_speed_dial_scale_200.opacity = 1;
            car_speed_dial_scale_240.opacity = 1;
        }
    }

    onTireRotationChanged: {
        if(tireRotation>0 && tireRotation<20) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 0.2;
            rotation_speed_dial_scale_40.opacity = 0.2;
            rotation_speed_dial_scale_60.opacity = 0.2;
            rotation_speed_dial_scale_80.opacity = 0.2;
            rotation_speed_dial_scale_100.opacity = 0.2;
            rotation_speed_dial_scale_120.opacity = 0.2;
        } else if(tireRotation>=20 && tireRotation<40) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 1;
            rotation_speed_dial_scale_40.opacity = 0.2;
            rotation_speed_dial_scale_60.opacity = 0.2;
            rotation_speed_dial_scale_80.opacity = 0.2;
            rotation_speed_dial_scale_100.opacity = 0.2;
            rotation_speed_dial_scale_120.opacity = 0.2;
        } else if(tireRotation>=40 && tireRotation<60) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 1;
            rotation_speed_dial_scale_40.opacity = 1;
            rotation_speed_dial_scale_60.opacity = 0.2;
            rotation_speed_dial_scale_80.opacity = 0.2;
            rotation_speed_dial_scale_100.opacity = 0.2;
            rotation_speed_dial_scale_120.opacity = 0.2;
        } else if(tireRotation>=60 && tireRotation<80) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 1;
            rotation_speed_dial_scale_40.opacity = 1;
            rotation_speed_dial_scale_60.opacity = 1;
            rotation_speed_dial_scale_80.opacity = 0.2;
            rotation_speed_dial_scale_100.opacity = 0.2;
            rotation_speed_dial_scale_120.opacity = 0.2;
        } else if(tireRotation>=80 && tireRotation<100) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 1;
            rotation_speed_dial_scale_40.opacity = 1;
            rotation_speed_dial_scale_60.opacity = 1;
            rotation_speed_dial_scale_80.opacity = 1;
            rotation_speed_dial_scale_100.opacity = 0.2;
            rotation_speed_dial_scale_120.opacity = 0.2;
        } else if(tireRotation>=100 && tireRotation<120) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 1;
            rotation_speed_dial_scale_40.opacity = 1;
            rotation_speed_dial_scale_60.opacity = 1;
            rotation_speed_dial_scale_80.opacity = 1;
            rotation_speed_dial_scale_100.opacity = 1;
            rotation_speed_dial_scale_120.opacity = 0.2;
        } else if(tireRotation>=120) {
            rotation_speed_dial_scale_0.opacity = 1;
            rotation_speed_dial_scale_20.opacity = 1;
            rotation_speed_dial_scale_40.opacity = 1;
            rotation_speed_dial_scale_60.opacity = 1;
            rotation_speed_dial_scale_80.opacity = 1;
            rotation_speed_dial_scale_100.opacity = 1;
            rotation_speed_dial_scale_120.opacity = 1;
        }
    }
}

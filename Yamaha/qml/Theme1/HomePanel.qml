import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "qrc:/Component/Component"

CommonItem {
    id: root_item

    width: 1440
    height: 540

    property int  alarmCode: CarMsg.warningId //警告提示
    property int  carSpeedValue: CarMsg.carSpeed; // 车速
    property int  engineSpeedValue: CarMsg.rpm; // 转速
    property int  carVoyage: CarMsg.soc * 3 // 续航里程
    property int  carSoc: CarMsg.soc; // SOC
    property real carBattery: CarMsg.battery; // 蓄电池电压
    property real carTotalVoltage: CarMsg.totalVoltage; // 总电压
    property real carTotalCurrent: CarMsg.totalCurrent; // 总电流
    property real carTrip: CarMsg.trip // TRIP
    property real carOdo: CarMsg.odo // ODO
    property int  carWaterTemp: CarMsg.engineWaterTemp; // 水温
    property int  carGearValue: CarMsg.gear // 档位

    // Bezier Canvas
    property int carBezierSample: 240
    property var carGaugesPos: [100, 460, -10, 400, -50, -25, 400, 10] // [{x0,y0, x1,y1, x2,y2, x3,y3}]
    property var carEnginePos: [1280, 460, 1380, 368, 1500, 3, 1000, 10] // [{x0,y0, x1,y1, x2,y2, x3,y3}]

    function getCarGaugesPosX(pos, step) {
        var t = 1.0/carBezierSample * step
        var t1 = 1 - t
        var x = pos[0]*Math.pow(t1,3) + 3*pos[2]*t*Math.pow(t1,2) + 3*pos[4]*Math.pow(t,2)*t1 + pos[6]*Math.pow(t,3);
        return x
    }

    function getCarGaugesPosY(pos, step) {
        var t= 1.0/carBezierSample * step
        var t1 = 1 - t
        var y = pos[1]*Math.pow(t1,3) + 3*pos[3]*t*Math.pow(t1,2) + 3*pos[5]*Math.pow(t,2)*t1 + pos[7]*Math.pow(t,3);
        return y
    }
    // Bezier Canvas

    onCarSpeedValueChanged: {
        if (carSpeedValue >= 0 && carSpeedValue < 40) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 0.2
            car_speed_dial_scale_80.opacity  = 0.2
            car_speed_dial_scale_120.opacity = 0.2
            car_speed_dial_scale_160.opacity = 0.2
            car_speed_dial_scale_200.opacity = 0.2
            car_speed_dial_scale_240.opacity = 0.2
        } else if (carSpeedValue >= 40 && carSpeedValue < 80) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 1
            car_speed_dial_scale_80.opacity  = 0.2
            car_speed_dial_scale_120.opacity = 0.2
            car_speed_dial_scale_160.opacity = 0.2
            car_speed_dial_scale_200.opacity = 0.2
            car_speed_dial_scale_240.opacity = 0.2
        } else if (carSpeedValue >= 80 && carSpeedValue < 120) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 1
            car_speed_dial_scale_80.opacity  = 1
            car_speed_dial_scale_120.opacity = 0.2
            car_speed_dial_scale_160.opacity = 0.2
            car_speed_dial_scale_200.opacity = 0.2
            car_speed_dial_scale_240.opacity = 0.2
        } else if (carSpeedValue >= 120 && carSpeedValue < 160) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 1
            car_speed_dial_scale_80.opacity  = 1
            car_speed_dial_scale_120.opacity = 1
            car_speed_dial_scale_160.opacity = 0.2
            car_speed_dial_scale_200.opacity = 0.2
            car_speed_dial_scale_240.opacity = 0.2
        } else if (carSpeedValue >= 160 && carSpeedValue < 200) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 1
            car_speed_dial_scale_80.opacity  = 1
            car_speed_dial_scale_120.opacity = 1
            car_speed_dial_scale_160.opacity = 1
            car_speed_dial_scale_200.opacity = 0.2
            car_speed_dial_scale_240.opacity = 0.2
        } else if (carSpeedValue >= 200 && carSpeedValue < 240) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 1
            car_speed_dial_scale_80.opacity  = 1
            car_speed_dial_scale_120.opacity = 1
            car_speed_dial_scale_160.opacity = 1
            car_speed_dial_scale_200.opacity = 1
            car_speed_dial_scale_240.opacity = 0.2
        } else if( carSpeedValue >= 240) {
            car_speed_dial_scale_0.opacity   = 1
            car_speed_dial_scale_40.opacity  = 1
            car_speed_dial_scale_80.opacity  = 1
            car_speed_dial_scale_120.opacity = 1
            car_speed_dial_scale_160.opacity = 1
            car_speed_dial_scale_200.opacity = 1
            car_speed_dial_scale_240.opacity = 1
        } else {
            // default
        }
    }

    onEngineSpeedValueChanged: {
        if(engineSpeedValue >= 0 && engineSpeedValue < 20) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 0.2
            engine_speed_dial_scale_40.opacity  = 0.2
            engine_speed_dial_scale_60.opacity  = 0.2
            engine_speed_dial_scale_80.opacity  = 0.2
            engine_speed_dial_scale_100.opacity = 0.2
            engine_speed_dial_scale_120.opacity = 0.2
        } else if(engineSpeedValue >= 20 && engineSpeedValue < 40) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 1
            engine_speed_dial_scale_40.opacity  = 0.2
            engine_speed_dial_scale_60.opacity  = 0.2
            engine_speed_dial_scale_80.opacity  = 0.2
            engine_speed_dial_scale_100.opacity = 0.2
            engine_speed_dial_scale_120.opacity = 0.2
        } else if(engineSpeedValue >= 40 && engineSpeedValue < 60) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 1
            engine_speed_dial_scale_40.opacity  = 1
            engine_speed_dial_scale_60.opacity  = 0.2
            engine_speed_dial_scale_80.opacity  = 0.2
            engine_speed_dial_scale_100.opacity = 0.2
            engine_speed_dial_scale_120.opacity = 0.2
        } else if(engineSpeedValue >= 60 && engineSpeedValue < 80) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 1
            engine_speed_dial_scale_40.opacity  = 1
            engine_speed_dial_scale_60.opacity  = 1
            engine_speed_dial_scale_80.opacity  = 0.2
            engine_speed_dial_scale_100.opacity = 0.2
            engine_speed_dial_scale_120.opacity = 0.2
        } else if(engineSpeedValue >= 80 && engineSpeedValue < 100) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 1
            engine_speed_dial_scale_40.opacity  = 1
            engine_speed_dial_scale_60.opacity  = 1
            engine_speed_dial_scale_80.opacity  = 1
            engine_speed_dial_scale_100.opacity = 0.2
            engine_speed_dial_scale_120.opacity = 0.2
        } else if(engineSpeedValue >= 100 && engineSpeedValue < 120) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 1
            engine_speed_dial_scale_40.opacity  = 1
            engine_speed_dial_scale_60.opacity  = 1
            engine_speed_dial_scale_80.opacity  = 1
            engine_speed_dial_scale_100.opacity = 1
            engine_speed_dial_scale_120.opacity = 0.2
        } else if(engineSpeedValue >= 120) {
            engine_speed_dial_scale_0.opacity   = 1
            engine_speed_dial_scale_20.opacity  = 1
            engine_speed_dial_scale_40.opacity  = 1
            engine_speed_dial_scale_60.opacity  = 1
            engine_speed_dial_scale_80.opacity  = 1
            engine_speed_dial_scale_100.opacity = 1
            engine_speed_dial_scale_120.opacity = 1
        } else {
            // default
        }
    }

    FontLoader {
        id: adobeHeitiStd
        name: "Microsoft"
    }

    Image {
        id: background
        x: 0
        y: 0
        visible: true
        source: "qrc:/theme1/slice/Theme1/Slice/background_v3.png"

        // ------------------------- car speed dial -------------------------
        Item {
            id: car_speed_dial

            // dial center number
            Text {
                id: car_speed_dial_center_number
                x: 256
                y: 203
                visible: true
                text: carSpeedValue
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 120
            }
            // Measurement unit
            Text {
                id: car_speed_dial_measurement_unit
                x: 279
                y: 353
                visible: true
                text: qsTr("km/h")
                color: "white"
                opacity: 0.6
                font.family: adobeHeitiStd.name
                font.pixelSize: 20
            }
            // trip title
            Text {
                id: car_speed_dial_strip
                x: 210
                y: 380
                visible: true
                text: qsTr("trip:               km")
                color: "#103d44"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
            }
            // trip title content
            Text {
                id: car_speed_dial_strip_content
                x: 263
                y: 380
                width: 110
                height: 24
                visible: true
                text: carTrip
                color: "#047f93"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                horizontalAlignment: Text.AlignRight
            }
            // dial scale
            Text {
                id: car_speed_dial_scale_0
                x: 134
                y: 448
                visible: true
                text: qsTr("0")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 1
            }
            Text {
                id: car_speed_dial_scale_40
                x: 92
                y: 377
                visible: true
                text: qsTr("40")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: car_speed_dial_scale_80
                x: 81
                y: 304
                visible: true
                text: qsTr("80")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: car_speed_dial_scale_120
                x: 77
                y: 213
                visible: true
                text: qsTr("120")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: car_speed_dial_scale_160
                x: 122
                y: 127
                visible: true
                text: qsTr("160")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: car_speed_dial_scale_200
                x: 221
                y: 67
                visible: true
                text: qsTr("200")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: car_speed_dial_scale_240
                x: 339
                y: 48
                visible: true
                text: qsTr("240")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
        }
        // ------------------------- engine speed dial -------------------------
        Item {
            id: engine_speed_dial

            // engine speed value
            Text {
                id: engine_speed_dial_center_number
                x: 1038
                y: 203
                visible: true
                text: engineSpeedValue
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 120
            }
            // Measurement unit
            Text {
                id: engine_speed_dial_measurement_unit
                x: 1102
                y: 353
                visible: true
                text: qsTr("x 100/min")
                color: "white"
                opacity: 0.6
                font.family: adobeHeitiStd.name
                font.pixelSize: 20
            }
            // trip title
            Text {
                id: engine_speed_dial_strip
                x: 1032
                y: 380
                visible: true
                text: qsTr("odo:                      km")
                color: "#103d44"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
            }
            // trip title content
            Text {
                id: engine_speed_dial_strip_content
                x: 1091
                y: 380
                width: 160
                height: 24
                visible: true
                text: carOdo
                color: "#047f93"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                horizontalAlignment: Text.AlignRight
            }
            // dial scale
            Text {
                id: engine_speed_dial_scale_0
                x: 1283
                y: 450
                visible: true
                text: qsTr("0")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 1
            }
            Text {
                id: engine_speed_dial_scale_20
                x: 1307
                y: 372
                visible: true
                text: qsTr("20")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: engine_speed_dial_scale_40
                x: 1321
                y: 300
                visible: true
                text: qsTr("40")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: engine_speed_dial_scale_60
                x: 1318
                y: 208
                visible: true
                text: qsTr("60")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: engine_speed_dial_scale_80
                x: 1275
                y: 122
                visible: true
                text: qsTr("80")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: engine_speed_dial_scale_100
                x: 1165
                y: 62
                visible: true
                text: qsTr("100")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
            Text {
                id: engine_speed_dial_scale_120
                x: 1046
                y: 43
                visible: true
                text: qsTr("120")
                color: "white"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                opacity: 0.2
            }
        }
        // ------------------------- engine speed dial -------------------------

        // ------------------------- main menu panel -------------------------
        Item {
            id: main_menu_panel
            x: 580
            y: 40
            property int menuIndex: -1
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
                id: menuModel
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
                id: displayDelegate
                Item {
                    width: 40; height: 40;
                    Image { source: icon; }
                }
            }

            PathView {
                id: pathView
                anchors.fill: parent
                model: menuModel
                delegate: displayDelegate
                path: Path {
                    id: pathView_path
                    startX: 0; startY: 0
                    PathQuad { id: pathView_pathQuad; x: 350; y: 20; controlX: 150; controlY: -20; }
                }
                pathItemCount: 3
                currentIndex: main_menu_panel.menuIndex
            }
        }

        // ------------------------- car picture -------------------------
        Item {
            id: subscreen
            Image {
                id: subscreen_image
                x: 570
                y: 160
                source: "qrc:/theme1/slice/Theme1/Slice/dashed_car.png"
                scale: 0.9
            }
        }

        // ------------------------- soc panel -------------------------
        Item {
            id: soc_panel

            // current time
            Text {
                id: soc_label
                x: 645
                y: 367+10
                visible: true
                text: "soc :"
                color: "#068ca5"
                font.family: adobeHeitiStd.name
                font.pixelSize: 22
                font.bold: false
            }
            Text {
                id: soc_value
                x: 645+65
                y: 367+10
                visible: true
                text: carSoc + " %"
                color: "#068ca5"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
                font.bold: false
            }

            ProgressBar {
                id: progressbar_soc
                x: 545
                y: 407+10
                width: 360
                height: 1
                value: carSoc / 100
                style: ProgressBarStyle {
                    background: Rectangle {
                        color:"white"
                        opacity: 0.6
                    }
                    progress: Rectangle{
                        color: "#068ca5"
                    }
                }
            }

            Rectangle {
                id: progressbar_soc_handle
                x: progressbar_soc.x + progressbar_soc.width*progressbar_soc.value
                y: 414
                width: 7
                height: 7
                color: "#068ca5"
                radius: 180
            }
        }

        // ------------------------- bottom panel -------------------------
        Timer {
            id: timer_for_clock
            interval: 60*1000
            running: true
            repeat: true
            onTriggered: {
                current_time.text = Qt.formatDateTime(new Date(), "hh : mm")
            }
        }

        Item {
            id: bottom_panel

            // current time
            Text {
                id: current_time
                x: 514
                y: 485
                visible: true
                text: Qt.formatDateTime(new Date(), "hh : mm")
                color: "#068ca5"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
            }
            // current time
            Text {
                id: d
                x: 693
                y: 473
                visible: true
                text: "D"
                color: "#0e8da1"
                font.family: adobeHeitiStd.name
                font.pixelSize: 51
                font.bold: true
            }
            Glow {
                source: d
                anchors.fill: d
                radius: 8;
                color: "white"
                opacity: 0.2
            }
            // current temperature
            Text {
                id: current_temperature
                x: 790
                y: 485
                visible: true
                text: "36°C-38°C"
                color: "#068ca5"
                font.family: adobeHeitiStd.name
                font.pixelSize: 24
            }
        }
    }

    property var symbols_scale_ratio: 0.8

    Item {
        id: symbols
        visible: true
        Image {
            id: symbol_overheating
            x: 994
            y: 114
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Battery overheating alarm.png"
        }
        Image {
            id: symbol_batteryCharging
            x: 1060
            y: 125
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryCharging.png"
        }
        Image {
            id: symbol_batteryCut
            x: 942
            y: 97
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryCut.png"
        }
        Image {
            id: symbol_batteryFault
            x: 1170
            y: 98
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryFault.png"
        }
        Image {
            id: symbol_batteryFireAlarm
            x: 1205
            y: 138
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/batteryFireAlarm.png"
        }
        Image {
            id: symbol_brakeLight
            x: 416
            y: 70
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/BrakeLight.png"
        }
        Image {
            id: symbol_chargingCable
            x: 1152
            y: 137
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/chargingCable.png"
        }
        Image {
            id: symbol_defroster
            x: 383
            y: 117
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Defroster.png"
        }
        Image {
            id: symbol_driverSystemFault
            x: 1104
            y: 134
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/driverSystemFault.png"
        }
        Image {
            id: symbol_engineFailue
            x: 445
            y: 115
            scale: 1.2
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/engineFailue.png"
        }
        Image {
            id: symbol_hatchDoor1Alarm
            x: 241
            y: 138
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/HatchDoor1Alarm.png"
        }
        Image {
            id: symbol_hatchDoor2Alarm
            x: 203
            y: 111
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/HatchDoor2Alarm.png"
        }
        Image {
            id: symbol_highPressureOverhaul
            x: 280
            y: 138
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/highPressureOverhaul.png"
        }
        Image {
            id: symbol_lamp_ABS
            x: 994
            y: 65
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_ABS.png"
        }
        Image {
            id: symbol_lamp_AC
            x: 308
            y: 85
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/lamp_AC.png"
        }
        Image {
            id: symbol_lamp_airFilter
            x: 886
            y: 68
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_airFilter.png"
        }
        Image {
            id: symbol_lamp_airPress
            x: 1052
            y: 85
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_airPress.png"
        }
        Image {
            id: symbol_lamp_frontFog
            x: 623
            y: 88
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_frontFog.png"
        }
        Image {
            id: symbol_lamp_headlight
            x: 663
            y: 88
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_headlight.png"
        }
        Image {
            id: symbol_lamp_highBeam
            x: 703
            y: 88
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_highBeam.png"
        }
        Image {
            id: symbol_lamp_insulationRed
            x: 1110
            y: 91
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_insulationRed.png"
        }
        Image {
            id: symbol_lamp_parkingBrake
            x: 943
            y: 48
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_parkingBrake.png"
        }
        Image {
            id: symbol_Lamp_positionLight
            x: 743
            y: 88
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_positionLight.png"
        }
        Image {
            id: lsymbol_amp_rearFog
            x: 783
            y: 88
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_rearFog.png"
        }
        Image {
            id: symbol_lamp_waterLow
            x: 528
            y: 61
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/Lamp_waterLow.png"
        }
        Image {
            id: symbol_leftBrakeAlarm
            x: 363
            y: 85
            scale: 1.2
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/leftBrakeAlarm.png"
        }
        Image {
            id: symbol_mainPowerIndication
            x: 469
            y: 64
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/mainPowerIndication.png"
        }
        Image {
            id: symbol_motor_notworking
            x: 496
            y: 109
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/motor_notworking.png"
        }
        Image {
            id: symbol_motorHeat
            x: 254
            y: 98
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/motorHeat.png"
        }
        Image {
            id: symbol_oil_pressure
            x: 891
            y: 116
            scale: 1.2
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/oil pressure.png"
        }
        Image {
            id: symbol_ready
            x: 258
            y: 432
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/READY.png"
        }
        Image {
            id: symbol_rightBrakeAlarm
            x: 331
            y: 133
            scale: 1.2
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/rightBrakeAlarm.png"
        }
        Image {
            id: symbol_stopWL
            x: 1129
            y: 432
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/StopWL.png"
        }
        Image {
            id: symbol_turnLeftWL
            x: 577
            y: 83
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/TurnLeftWL.png"
        }
        Image {
            id: symbol_turnRightWL
            x: 823
            y: 83
            scale: symbols_scale_ratio
            source: "qrc:/theme1/Home page switching/Theme1/Symbol/TurnRightWL.png"
        }
    }

    // key events
    property bool bKeyEnable: true
    property int index: main_menu_panel.menuIndex
    property bool hideSubscreen: false
    property bool bChangeTheme: false
    onKeyEnter: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyEnter")
        }
        if (bChangeTheme) {
            UiController.switchThemeTo("CustomTheme2")
        }
    }
    onKeyBack: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyBack")
            //main_menu_panel.visible = false;
            //subscreen_image.visible = false;
            hideSubscreen = true;
        }
        bChangeTheme = !bChangeTheme
    }
    onKeyUp: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyUp")
        }
        if(index-- < -1) {
            index = main_menu_panel.menu_icons.length - 2
        }
        set_subscreen(index)
    }
    onKeyDown: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyDown")
        }
        if(index++ >= main_menu_panel.menu_icons.length-1) {
            index = -1
        }
        set_subscreen(index)
    }

    onVisibleChanged: {
        if(visible){
            CarMsg.sendEnableKeys(true)
        } else {
            CarMsg.sendEnableKeys(false)
        }
    }

    function set_subscreen(index) {
        if(hideSubscreen) {
            subscreen_image.visible = false
            return
        }

        pathView.currentIndex = index
        console.log("pathView.currentIndex: " + pathView.currentIndex)

        subscreen_image.source = main_menu_panel.menu_icons[index+1]
        console.log("subscreen_image.source: " + subscreen_image.source)
        switch(index+1) {
        case 0:
            subscreen_image.x = 570
            subscreen_image.y = 160
            subscreen_image.scale = 0.9
            break;
        case 1:
            subscreen_image.x = 564-100
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        case 2:
            subscreen_image.x = 564-100
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        case 3:
            subscreen_image.x = 564-80
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        case 4:
            subscreen_image.x = 564-80
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        case 5:
            subscreen_image.x = 564-80
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.9
            break;
        case 6:
            subscreen_image.x = 564-120
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.9
            break;
        case 7:
            subscreen_image.x = 564-40
            subscreen_image.y = 136-40
            subscreen_image.scale = 0.8
            break;
        case 8:
            subscreen_image.x = 564-80
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        case 9:subscreen_image.x = 564-80
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        case 10:
            subscreen_image.x = 564-50
            subscreen_image.y = 136-40
            subscreen_image.scale = 0.8
            break;
        case 11:

            subscreen_image.visible = false
            break;
        case 12:
            subscreen_image.x = 564-80
            subscreen_image.y = 136-70
            subscreen_image.scale = 0.8
            break;
        }
    }

    Image {
        id: pointer_car_speed
        x: 70
        y: 474
        visible: true
        source: "qrc:/theme1/slice/Theme1/Slice/sun.png"
        scale: 0.8

        Behavior on x { NumberAnimation {} }
        Behavior on y { NumberAnimation {} }
    }
    Image {
        id: pointer_engine
        x: 1370
        y: 474
        visible: true
        rotation: -23
        source: "qrc:/theme1/slice/Theme1/Slice/sun.png"
        scale: 0.8

        Behavior on x { NumberAnimation {} }
        Behavior on y { NumberAnimation {} }
    }

    Timer {
        property int car_speed_current_point_count: 0
        property bool direction_up: true
        id: timer_for_carSpeedPointer
        interval: 10
        running: true
        repeat: true
        onTriggered: {
            // car speed
            var carSpeedDialCenterNumber = Number(car_speed_dial_center_number.text)
            if(carSpeedDialCenterNumber > car_speed_current_point_count) {
                direction_up = true
            } else {
                direction_up = false
            }

            if(direction_up) {
                if(car_speed_current_point_count < carSpeedDialCenterNumber) {
                    if(++car_speed_current_point_count > 239) {
                        car_speed_current_point_count = 239
                    }
                    pointer_car_speed.x = getCarGaugesPosX(carGaugesPos, car_speed_current_point_count)
                    pointer_car_speed.y = getCarGaugesPosY(carGaugesPos, car_speed_current_point_count)
                }
            } else {
                if(car_speed_current_point_count > carSpeedDialCenterNumber) {
                    if(--car_speed_current_point_count < 0) {
                        car_speed_current_point_count = 0
                    }
                    pointer_car_speed.x = getCarGaugesPosX(carGaugesPos, car_speed_current_point_count)
                    pointer_car_speed.y = getCarGaugesPosY(carGaugesPos, car_speed_current_point_count)
                }
            }
        }
    }

    Timer {
        property int engine_current_point_count: 0
        property bool direction_up: true
        id: timer_for_engineSpeedPointer
        interval: 10
        running: true
        repeat: true
        onTriggered: {
            // engine speed
            var engineDialCenterNumber = 2 * Number(engine_speed_dial_center_number.text)
            if(engineDialCenterNumber > engine_current_point_count) {
                direction_up = true
            } else {
                direction_up = false
            }

            if(direction_up) {
                if(engine_current_point_count < engineDialCenterNumber) {
                    if(++engine_current_point_count > 239) {
                        engine_current_point_count = 239
                    }
                    pointer_engine.x = getCarGaugesPosX(carEnginePos, engine_current_point_count)
                    pointer_engine.y = getCarGaugesPosY(carEnginePos, engine_current_point_count)
                }
            } else {
                if(engine_current_point_count > engineDialCenterNumber) {
                    if(--engine_current_point_count < 0) {
                        engine_current_point_count = 0
                    }
                    pointer_engine.x = getCarGaugesPosX(carEnginePos, engine_current_point_count)
                    pointer_engine.y = getCarGaugesPosY(carEnginePos, engine_current_point_count)
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("----------------------- Component.onCompleted --------------------------------");
        set_subscreen(index);
    }

    // Demo
    function getRandomInt(max) {
        return Math.floor(Math.random() * Math.floor(max))
    }

    Timer {
        property int symbolCounter: 0
        property int counter: 0
        property int carSpeedRandom: -1
        property int tireRotationRandom: -1
        property bool directionCarSpeedUp: true
        property bool directionRotationUp: true
        id: timer_for_random_demo
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            if(directionCarSpeedUp) {
                if(++carSpeedRandom > 240) {
                    carSpeedRandom = 240
                    directionCarSpeedUp = false
                }
            } else {
                if(--carSpeedRandom < 0) {
                    carSpeedRandom = 0
                    directionCarSpeedUp = true
                }
            }

            car_speed_dial_center_number.text = carSpeedRandom
            carSpeedValue = carSpeedRandom
            // adjust number position
            if(carSpeedRandom >= 100) {
                car_speed_dial_center_number.x = 196-50
            } else if(carSpeedRandom >= 10) {
                car_speed_dial_center_number.x = 196-10
            } else {
                car_speed_dial_center_number.x = 256
            }

            /*if(counter++>4) */{
                counter = 0;
                if(directionRotationUp) {
                    if(++tireRotationRandom > 120) {
                        tireRotationRandom = 120
                        directionRotationUp = false
                    }
                } else {
                    if(--tireRotationRandom < 0) {
                        tireRotationRandom = 0
                        directionRotationUp = true
                    }
                }

                // adjust number position
                if(tireRotationRandom >= 100) {
                    engine_speed_dial_center_number.x = 1038-50
                } else if(tireRotationRandom >= 10) {
                    engine_speed_dial_center_number.x = 1038+20
                } else {
                    engine_speed_dial_center_number.x = 1098
                }
                engine_speed_dial_center_number.text = tireRotationRandom
                engineSpeedValue = tireRotationRandom

                if(symbolCounter++ > 2) {
                    symbols.visible = !symbols.visible
                    symbolCounter = 0
                }
            }
        }
    }
    // Demo
}

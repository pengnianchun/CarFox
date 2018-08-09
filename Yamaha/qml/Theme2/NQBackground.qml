import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQml 2.0
import "qrc:/JS/AlarmCode.js" as AlarmInfoCode

Item {
    width: 1440
    height: 540
    layer.enabled: true

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Symbol/"

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

    property int  carStartRemainTime: 60 // 发车倒计时
    property string textBlue: "#0088ff"

    function currentDateTime(){
        return Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss ddd");
    }

    FontLoader {
        id: msyh
        name: "Microsoft"
    }

    onCarGearValueChanged: {
        if (carGearValue === 0xA) {
            gearN.source = sourceImageUrl + "gear_N0.png"
            gearD.source = sourceImageUrl + "gear_D.png"
            gearR.source = sourceImageUrl + "gear_R.png"
            gearDValue.text = ""
        } else if (carGearValue === 0xB) {
            gearN.source = sourceImageUrl + "gear_N.png"
            gearD.source = sourceImageUrl + "gear_D.png"
            gearR.source = sourceImageUrl + "gear_R0.png"
            gearDValue.text = ""
        } else if (carGearValue === 0x9) {
            gearN.source = sourceImageUrl + "gear_N.png"
            gearD.source = sourceImageUrl + "gear_D0.png"
            gearR.source = sourceImageUrl + "gear_R.png"
            gearDValue.text = ""
        } else if (carGearValue >= 0x1 && carGearValue <= 0x7) {
            gearN.source = sourceImageUrl + "gear_N.png"
            gearD.source = sourceImageUrl + "gear_D0.png"
            gearR.source = sourceImageUrl + "gear_R.png"
            gearDValue.text = carGearValue
        } else {
            gearN.source = sourceImageUrl + "gear_N.png"
            gearD.source = sourceImageUrl + "gear_D.png"
            gearR.source = sourceImageUrl + "gear_R.png"
            gearDValue.text = ""
        }
    }

    //警告提示
    onAlarmCodeChanged: {
        if (alarmCode > 0 && alarmCode < 28) {
            alarm_info.text = AlarmInfoCode.getAlarmCodeInfo()[alarmCode];
        } else {
            alarm_info.text = ""
        }
    }

    Rectangle {
        id: blackbg
        anchors.fill: parent
        color: "black"
    }

    Image {
        id: line_up
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 61
        source: "qrc:/theme2/symbol/Theme2/Symbol/line_up.png"
        sourceSize.width: 1245
        sourceSize.height: 2
        asynchronous: true
        cache: true
    }

    Image {
        id: line_left
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_left.png"
        sourceSize.width: 75
        sourceSize.height: 447
        asynchronous: true
        cache: true
    }

    Image {
        id: line_right
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_right.png"
        sourceSize.width: 75
        sourceSize.height: 447
        asynchronous: true
        cache: true
    }

    Image {
        id: line_down
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_down.png"
        sourceSize.width: 1245
        sourceSize.height: 2
        asynchronous: true
        cache: true
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 550
        visible: homepanel_visible

        Item {
            width: 370
            height: 370
            Image {
                id: speed_left
                source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
                sourceSize.width: 370
                sourceSize.height: 370
                asynchronous: true
                cache: true
            }
            Rectangle {
                x: 185
                y: -5
                width: 20
                height: 20
                radius: 10
                color: "lightblue"

                transform: Rotation {
                    origin.x: 0; origin.y: 190;
                    angle: (carSpeedValue * 2.5) - 135
                    Behavior on angle {
                        SpringAnimation { spring: 2; damping: 0.2 }
                    }
                }
            }
        }

        Item {
            width: 370
            height: 370
            Image {
                id: speed_right
                source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
                sourceSize.width: 370
                sourceSize.height: 370
                asynchronous: true
                cache: true
            }
            Rectangle {
                x: 185
                y: -5
                width: 20
                height: 20
                radius: 10
                color: "lightblue"

                transform: Rotation {
                    origin.x: 0; origin.y: 190;
                    angle: (engineSpeedValue * 13.5) - 135
                    Behavior on angle {
                        SpringAnimation { spring: 0.8; damping: 0.2 }
                    }
                }
            }
        }
    }

    // 发车倒计时
    Rectangle {
        anchors.centerIn: parent
        width: homepanel_visible ? 500 : 800
        height: homepanel_visible ? 300 : 410
        color: "#111111"
        radius: 10

        ColumnLayout{
            id: carStartup
            anchors.fill: parent
            visible: homepanel_visible && carStartRemainTime > 0

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Image {
                    source: "qrc:/theme2/symbol/Theme2/Symbol/Countdown.png"
                    sourceSize.width: 24
                    sourceSize.height: 33
                    asynchronous: true
                    cache: true
                }

                Text {
                    text: qsTr("发车倒计时")
                    color: textBlue
                    font.family: msyh.name
                    font.pixelSize: 30
                }
            }
            Text { /* 占位 */ }
            QTimeCountDown {
                id: countDown
                anchors.left: parent.left
                anchors.leftMargin: 200
                anchors.top: parent.top
                anchors.topMargin: 150
                visible: homepanel_visible
                countDownTime: carStartRemainTime
                countDownTimer: carStartRemainTime >= 0
                pixelSize: 36
            }
        }
        Text {
            anchors.centerIn: parent
            visible: homepanel_visible && !carStartup.visible /*&& carSpeedValue < 10*/
            text: qsTr("谨慎驾驶 注意行人")
            color: textBlue
            font.family: msyh.name
            font.pixelSize: 30
        }
    }

    // 车速
    Item {
        id: carSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: homepanel_visible ? 150 : 80
        width: 200
        height: 110

        Text {
            anchors.centerIn: parent
            text: carSpeedValue
            color: "white"
            font.family: msyh.name
            font.pixelSize: 135
        }
    }

    // 车速单位
    Text {
        anchors.left: carSpeed.right
        anchors.leftMargin: -20
        anchors.bottom: carSpeed.bottom
        text: qsTr("km/h")
        color: "#666666"
        font.family: msyh.name
        font.pixelSize: 16
    }

    // 续航里程 & SOC
    Rectangle {
        id: rectLeft
        anchors.top: carSpeed.bottom
        anchors.topMargin: 20
        anchors.left: carSpeed.left
        width: 220
        height: 120
        radius: 10
        color: "#111111"

        ColumnLayout {
            anchors.top: parent.top
            anchors.topMargin: 5
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: qsTr("续航里程：") + carVoyage + qsTr(" km")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
            Text {
                text: qsTr("SOC：") + carSoc + qsTr(" %")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
        }

        // SOC  图片
        Image {
            id: socImage
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Symbol/soc.png"
            sourceSize.width: 127
            sourceSize.height: 31
            asynchronous: true
            cache: true
        }

        Row {
            anchors.left: socImage.left
            anchors.leftMargin: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            spacing: 3
            Repeater {
                model: carSoc/9
                Image { source: "qrc:/theme2/symbol/Theme2/Symbol/soc_progress.png" }
            }
        }
    }

    // 告警
    Item {
        anchors.top: rectLeft.bottom
        anchors.topMargin: 10
        anchors.left: rectLeft.left
        anchors.leftMargin: 10
        visible: homepanel_visible && alarmCode != 0
        Image {
            id: warning
            anchors.left: parent.left
            anchors.leftMargin: 60
            source: "qrc:/theme2/symbol/Theme2/Symbol/StopWL.png"
            asynchronous: true
            cache: true
            verticalAlignment: Image.AlignVCenter
        }
        Text {
            id: alarm_info
            anchors.top: warning.bottom
            anchors.horizontalCenter: warning.horizontalCenter
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
        Timer {
            interval: 800
            repeat: true
            running: carWaterTemp > 103
            onTriggered: {
                warning.visible = !warning.visible
            }
        }
    }

    // 转速
    Item {
        id: engineSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.right: parent.right
        anchors.rightMargin: homepanel_visible ? 170 : 100
        width: 200
        height: 110

        Text {
            anchors.centerIn: parent
            text: engineSpeedValue
            color: "white"
            font.family: msyh.name
            font.pixelSize: 135
        }
    }

    // 转速单位
    Text {
        anchors.left: engineSpeed.right
        anchors.leftMargin: -20
        anchors.bottom: engineSpeed.bottom
        text: qsTr("x100\r\nr/min")
        color: "#666666"
        font.family: msyh.name
        font.pixelSize: 16
    }

    // 制动气压 & 蓄电池电压
    Rectangle {
        id: rectRight
        anchors.top: engineSpeed.bottom
        anchors.topMargin: 20
        anchors.left: engineSpeed.left
        width: 220
        height: 120
        radius: 10
        color: "#111111"

        ColumnLayout {
            anchors.top: parent.top
            anchors.topMargin: 5
            spacing: -2
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: qsTr("蓄电池")  + qsTr("：") + carBattery.toFixed(1) + qsTr(" V")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
            Text {
                text: qsTr("总电压") + qsTr("：") + carTotalVoltage.toFixed(1) + qsTr(" V")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
            Text {
                text: qsTr("总电流")  + qsTr("：") + carTotalCurrent.toFixed(1) + qsTr(" A")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
        }

        // 档位
        RowLayout {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 40
            Image {
                id: gearN
                source: sourceImageUrl + "gear_N0.png"
                asynchronous: true
                cache: true
            }
            Image {
                id: gearD
                source: sourceImageUrl + "gear_D.png"
                asynchronous: true
                cache: true
                Text {
                    id: gearDValue
                    anchors.left: gearD.right
                    anchors.bottom: gearD.bottom
                    anchors.bottomMargin: -8
                    color: "#0aff00"
                    font.pixelSize: 35
                }
            }
            Image {
                id: gearR
                source: sourceImageUrl + "gear_R.png"
                asynchronous: true
                cache: true
            }
        }
    }

    // 爬坡模式
    Image {
        id: modePP
        anchors.top: rectRight.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: rectRight.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Symbol/climbingmode.png"
        visible: homepanel_visible && CarMsg.climbingMode
        asynchronous: true
        cache: true
    }

    Text {
        anchors.top: modePP.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: modePP.horizontalCenter
        text: qsTr("故障等级: 0x") + CarMsg.faultLevel.toString(16)
        color: "white"
        font.pixelSize: 16
        visible: CarMsg.faultLevel !== 0
    }

    Item {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        Text {
            anchors.right: textDateTime.left
            anchors.rightMargin: 400
            text: qsTr("气压1: ") + CarMsg.apVol1.toFixed(2) + qsTr(" Mpa")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
//        Text {
//            anchors.right: textDateTime.left
//            anchors.rightMargin: 250
//            text: qsTr("电机控制器: ") + CarMsg.moterControlTemp.toFixed(0) + qsTr(" ℃")
//            color: "white"
//            font.family: msyh.name
//            font.pixelSize: 20
//        }
        Text {
            anchors.right: textDateTime.left
            anchors.rightMargin: 100
            text: qsTr("总里程: ") + carOdo.toFixed(1) + qsTr(" km")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
        Text {
            id: textDateTime
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
        Text {
            anchors.left: textDateTime.right
            anchors.leftMargin: 100
            text: qsTr("小计里程： ") + carTrip.toFixed(1) + qsTr(" km")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
//        Text {
//            anchors.left: textDateTime.right
//            anchors.leftMargin: 250
//            text: qsTr("电机温度： ") + CarMsg.moterTemp.toFixed(0) + qsTr(" ℃")
//            color: "white"
//            font.family: msyh.name
//            font.pixelSize: 20
//        }
        Text {
            anchors.left: textDateTime.right
            anchors.leftMargin: 400
            text: qsTr("气压2： ") + CarMsg.apVol2.toFixed(2) + qsTr(" Mpa")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            textDateTime.text = currentDateTime()

//            if (carSpeedValue < 99) {
//                carSpeedValue += Math.floor(Math.random() * Math.floor(5));
//            } else {
//                carSpeedValue = 0
//            }

//            if (engineSpeedValue < 19) {
//                engineSpeedValue += 1;
//            } else {
//                engineSpeedValue = 0
//            }
        }
    }

    Component.onCompleted: {

    }
}

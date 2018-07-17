import QtQuick 2.0
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/theme2/JS/HomePanelCtrl.js" as HomeCtrl

CommonItem {
    width: 1440
    height: 540

    visible: false
    layer.enabled: true

    property int carSpeedValue: CarMsg.carSpeed; // 车速
    property int engineSpeedValue: CarMsg.rpm; // 转速
    property int carVoyage: 99 // 续航里程
    property int carSoc: CarMsg.soc; // SOC
    property real carBreakPressure: 1.0; // 制动气压
    property int carBattery: 12; // 蓄电池电压

    FontLoader {
        id: msyh
        source: "qrc:/Fonts/font/msyh.ttc"
    }

    NQBackground {
        id: background
        anchors.fill: parent
    }

    IconPanel {
        id: iconPanel
        width: parent.width
        height: 60
    }

    // 车速
    Item {
        id: carSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: 150
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
        }

        Row {
            anchors.left: socImage.left
            anchors.leftMargin: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            spacing: 3
            Repeater {
                model: 10
                Image { source: "qrc:/theme2/symbol/Theme2/Symbol/soc_progress.png" }
            }
        }
    }

    RowLayout {
        anchors.top: rectLeft.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: rectLeft.horizontalCenter

        Image {
            source: "qrc:/theme2/symbol/Theme2/Symbol/StopWL.png"
        }
        Text {
            text: qsTr("水温高于98度")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
    }

    // 转速
    Item {
        id: engineSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.right: parent.right
        anchors.rightMargin: 150
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
        anchors.bottom: engineSpeed.bottom
        text: qsTr("x1000\r\nr/min")
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
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: qsTr("制动气压： ") + carBreakPressure + qsTr(" Mpa")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
            Text {
                text: qsTr("蓄电池电压： ") + carBattery + qsTr(" V")
                color: "#666666"
                font.family: msyh.name
                font.pixelSize: 16
            }
        }

        // 档位
        RowLayout {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            Image {
                id: gearN
                source: "qrc:/theme2/symbol/Theme2/Symbol/gear-N.png"
            }
            Image {
                id: gearD
                source: "qrc:/theme2/symbol/Theme2/Symbol/gear_D.png"
            }
            Image {
                id: gearP
                source: "qrc:/theme2/symbol/Theme2/Symbol/gear_R.png"
            }
        }
    }

    Image {
        id: modePP
        anchors.top: rectRight.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: rectRight.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Symbol/climbingmode.png"
    }

    MenuPanel {

    }

    Timer {
        id: demo_run
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            carSpeedValue ++ // 车速
            engineSpeedValue++ // 转速
            background.carSpeedRotation = carSpeedValue
            carVoyage++ // 续航里程
            carSoc++ // SOC
            carBreakPressure++ // 制动气压
            carBattery++ // 蓄电池电压
        }
    }

    onVisibleChanged: {

    }

    Component.onCompleted: {
        demo_run.running = true
    }
}

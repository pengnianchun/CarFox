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
        source: "qrc:/Fonts/Font/msyh.ttc"
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

    MenuPanel {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
    }

    // Demo
    function getRandomInt(max) {
      return Math.floor(Math.random() * Math.floor(max));
    }

    Timer {
        id: demo_run
        interval: 500
        repeat: true
        running: false
        onTriggered: {
            carSpeedValue += getRandomInt(3) // 车速
            engineSpeedValue += 1 // 转速
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

import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/theme2/JS/HomePanelCtrl.js" as HomeCtrl

CommonItem {
    width: 1440
    height: 540

    visible: false
    layer.enabled: true

    property bool homepanel_visible: true
    property int  mainMenuIndex: 0

    property int  carSpeedValue: CarMsg.carSpeed; // 车速
    property int  engineSpeedValue: CarMsg.rpm; // 转速
    property int  carVoyage: 99 // 续航里程
    property int  carSoc: CarMsg.soc; // SOC
    property real carBreakPressure: 1.0; // 制动气压
    property real carBattery: 12; // 蓄电池电压
    property real carTrip: 0 // TRIP
    property real carOdo: 0 // ODO
    property int  carWaterTemp: 0; // 水温
    property int  carStartRemainTime: 10 // 发车倒计时

    property bool bKeyEnable: true

    property string textBlue: "#0088ff"

    onKeyEnter: function() {
        console.debug("HomePanel onKeyEnter")
        if (mainMenuIndex === 0) {
            console.debug("HomePanel show menuPanel")
            menuPanel.visible = true
        }
    }

    onKeyBack: function() {
        console.debug("HomePanel onKeyBack")
        if (mainMenuIndex === 0) {
            console.debug("HomePanel hide menuPanel")
            menuPanel.visible = false
        }
    }

    onKeyUp: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyUp")
        }
    }

    onKeyDown: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyDown")
        }
    }

    onMainMenuIndexChanged: {
        homepanel_visible = mainMenuIndex ? false : true
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

    Item {
        width: 800
        height: 410
        anchors.centerIn: parent

        // 导航
        Navigation { visible: mainMenuIndex === 1; }
        // 电话
        Phone { visible: mainMenuIndex === 2; }
        // 音乐
        Music { visible: mainMenuIndex === 3; }
        // 广播
        Radio { visible: mainMenuIndex === 4; }
        // 设置
        Setting { visible: mainMenuIndex === 5; }
        // ADAS
        Adas { visible: mainMenuIndex === 6; }
        // 雷达
        Radar { visible: mainMenuIndex === 7; }
        // 胎压
        TirePressure { visible: mainMenuIndex === 8; }
        // 倒车影像
        BackCamera { visible: mainMenuIndex === 9; }
        // 驾驶行为分析
        DriveAnalysis { visible: mainMenuIndex === 10; }
        // 智能维保预测
        Consumption { visible: mainMenuIndex === 11; }
        // 历史能耗分析
        ConsumptionHistory { visible: mainMenuIndex === 12; }
        // 整车诊断
        Diagnostic { visible: mainMenuIndex === 13; }
        // 整车调度
        Schedule { visible: mainMenuIndex === 14; }
        // 驾驶求助
        Ask4Help { visible: mainMenuIndex === 15; }
        // 天气日历
        CalendarWeather { visible: mainMenuIndex === 16; }
    }

    MenuPanel {
        id: menuPanel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
    }

    // Demo
    function getRandomInt(max) {
        return Math.floor(Math.random() * Math.floor(max));
    }

    Timer {
        id: demo_run
        interval: 200
        repeat: true
        running: false
        onTriggered: {
            if (carSpeedValue > 99) { // 车速
                carSpeedValue = 0
            } else {
                carSpeedValue += 1
            }

            if (engineSpeedValue > 20) { // 转速
                engineSpeedValue = 0
            } else {
                engineSpeedValue += 1
            }

            carVoyage++ // 续航里程

            if (carSoc === 100) { // SOC
                carSoc = 0
            } else {
                carSoc++
            }

            if (carBreakPressure > 10) { // 制动气压
                carBreakPressure = 0
            } else {
                carBreakPressure += 0.1
            }

            if (carBattery > 24) {  // 蓄电池电压
                carBattery = 0.0
            } else {
                carBattery += 0.1
            }

            if (carTrip > 1000000) { // TRIP
                carTrip = 0
            } else {
                carTrip += getRandomInt(5)
            }

            if (carOdo > 1000000) { // ODO
                carOdo = 0
            } else {
                carOdo += getRandomInt(5)
            }

            if (carWaterTemp > 120) { // 水温
                carWaterTemp = 0
            } else {
                carWaterTemp++
            }
        }
    }

    onVisibleChanged: {
        if(visible){
            CarMsg.sendEnableKeys(true);
            demo_run.running = true
        } else {
            CarMsg.sendEnableKeys(false);
            demo_run.running = false
        }
    }

    Component.onCompleted: {

    }
}

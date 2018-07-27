import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/Theme/Theme2/JS/HomePanelCtrl.js" as HomeCtrl

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
    property int  carGearValue: 1 // 档位
    property bool carGearRadar: false

    property bool bKeyEnable: true

    property string textBlue: "#0088ff"
    property string currentLayer: ""

    onKeyEnter: function() {
        console.debug("HomePanel onKeyEnter")
        if (mainMenuIndex === 0) {
            console.debug("HomePanel show menuPanel")
            if (carGearValue != 3) {
                menuPanel.visible = true
            }
        }
    }

    onKeyBack: function() {
        if (mainMenuIndex === 0) {
            console.debug("HomePanel hide menuPanel")
            menuPanel.visible = false
        }
    }

    onKeyUp: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyUp")
            carGearRadar = !carGearRadar
        }
    }

    onKeyDown: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyDown")
            carGearRadar = !carGearRadar
        }
    }

    onMainMenuIndexChanged: {
        console.debug("onMainMenuIndexChanged " + mainMenuIndex)
        homepanel_visible = mainMenuIndex ? false : true

        if (currentLayer !== "") {
            UiController.hideLayer(currentLayer);
        }

        if (mainMenuIndex === 1) {
            currentLayer = "Navigation";
        }
        else if (mainMenuIndex === 2) {
            currentLayer = "Phone";
        }
        else if (mainMenuIndex === 3) {
            currentLayer = "Music";
        }
        else if (mainMenuIndex === 4) {
            currentLayer = "Radio";
        }
        else if (mainMenuIndex === 5) {
            currentLayer = "Setting";
        }
        else if (mainMenuIndex === 6) {
            currentLayer = "Adas";
        }
        else if (mainMenuIndex === 7) {
            currentLayer = "TirePressure";
        }
        else if (mainMenuIndex === 8) {
            currentLayer = "DriveAnalysis";
        }
        else if (mainMenuIndex === 9) {
            currentLayer = "Consumption";
        }
        else if (mainMenuIndex === 10) {
            currentLayer = "ConsumptionHistory";
        }
        else if (mainMenuIndex === 11) {
            currentLayer = "Diagnostic";
        }
        else if (mainMenuIndex === 12) {
            currentLayer = "Schedule";
        }
        else if (mainMenuIndex === 13) {
            currentLayer = "Ask4Help";
        }
        else if (mainMenuIndex === 14) {
            currentLayer = "CalendarWeather";
        }
        else if (mainMenuIndex === 15) {
            currentLayer = "CarInfo";
        }
        else {
            currentLayer = ""
        }

        if (currentLayer !== "") {
            UiController.showLayer(currentLayer);
            UiController.setLayerProperty(currentLayer, "x", 320);
            UiController.setLayerProperty(currentLayer, "y", 65);
        }
    }

    onCarGearValueChanged: {
        console.debug("onCarGearValueChanged " + carGearValue)
        if (carGearValue === 3) { // 倒车
            carGearRadar = false // 默认倒车影像
            if (mainMenuIndex !== 0) {
                mainMenuIndex = 0 // 隐藏模块
                menuPanel.visible = false
            }
            homepanel_visible = false // 隐藏主界面
        }
        else {
            if (mainMenuIndex !== 0) {
                homepanel_visible = false
            } else {
                homepanel_visible = true
            }
        }
    }

//    NQBackground {
//        id: background
//        anchors.fill: parent
//    }

    IconPanel {
        id: iconPanel
        width: parent.width
        height: 60
    }

    Item {
        width: 800
        height: 410
        anchors.centerIn: parent

//        // 导航
//        Navigation { visible: mainMenuIndex === 1; }
//        // 电话
//        Phone { visible: mainMenuIndex === 2; }
//        // 音乐
//        Music { visible: mainMenuIndex === 3; }
//        // 广播
//        Radio { visible: mainMenuIndex === 4; }
//        // 设置
//        Setting { visible: mainMenuIndex === 5; }
//        // ADAS
//        Adas { visible: mainMenuIndex === 6; }
//        // 雷达
//        Radar { visible: mainMenuIndex === 7; }
//        // 胎压
//        TirePressure { visible: mainMenuIndex === 8; }
//        // 倒车影像
//        BackCamera { visible: mainMenuIndex === 9; }
//        // 驾驶行为分析
//        DriveAnalysis { visible: mainMenuIndex === 10; }
//        // 智能维保预测
//        Consumption { visible: mainMenuIndex === 11; }
//        // 历史能耗分析
//        ConsumptionHistory { visible: mainMenuIndex === 12; }
//        // 整车诊断
//        Diagnostic { visible: mainMenuIndex === 13; }
//        // 整车调度
//        Schedule { visible: mainMenuIndex === 14; }
//        // 驾驶求助
//        Ask4Help { visible: mainMenuIndex === 15; }
//        // 天气日历
//        CalendarWeather { visible: mainMenuIndex === 16; }

//        // 导航
//        Loader { source: navigation; visible: mainMenuIndex === 1; }
//        // 电话
//        Loader { sourceComponent: phone; visible: mainMenuIndex === 2; }
//        // 音乐
//        Loader { sourceComponent: music; visible: mainMenuIndex === 3; }
//        // 广播
//        Loader { sourceComponent: radio; visible: mainMenuIndex === 4; }
//        // 设置
//        Loader { sourceComponent: setting; visible: mainMenuIndex === 5; }
//        // ADAS
//        Loader { sourceComponent: adas; visible: mainMenuIndex === 6; }
//        // 雷达
//        Loader { sourceComponent: radar; visible: mainMenuIndex === 7; }
//        // 胎压
//        Loader { sourceComponent: tirePressure; visible: mainMenuIndex === 8; }
//        // 倒车影像
//        Loader { sourceComponent: backCamera; visible: mainMenuIndex === 9; }
//        // 驾驶行为分析
//        Loader { sourceComponent: driveAnalysis; visible: mainMenuIndex === 10; }
//        // 智能维保预测
//        Loader { sourceComponent: consumption; visible: mainMenuIndex === 11; }
//        // 历史能耗分析
//        Loader { sourceComponent: consumptionHistory; visible: mainMenuIndex === 12; }
//        // 整车诊断
//        Loader { sourceComponent: diagnostic; visible: mainMenuIndex === 13; }
//        // 整车调度
//        Loader { sourceComponent: schedule; visible: mainMenuIndex === 14; }
//        // 驾驶求助
//        Loader { sourceComponent: ask4Help; visible: mainMenuIndex === 15; }
//        // 天气日历
//        Loader { sourceComponent: calendarWeather; visible: mainMenuIndex === 16; }

//        // 导航
//        Loader { source: "qrc:/Theme/theme2/Navigation.qml"; visible: mainMenuIndex === 1; }
//        // 电话
//        Loader { source: "qrc:/Theme/theme2/Phone.qml"; visible: mainMenuIndex === 2; }
//        // 音乐
//        Loader { source: "qrc:/Theme/theme2/Music.qml"; visible: mainMenuIndex === 3; }
//        // 广播
//        Loader { source: "qrc:/Theme/theme2/Radio.qml"; visible: mainMenuIndex === 4; }
//        // 设置
//        Loader { source: "qrc:/Theme/theme2/Setting.qml"; visible: mainMenuIndex === 5; }
//        // ADAS
//        Loader { source: "qrc:/Theme/theme2/Adas.qml"; visible: mainMenuIndex === 6; }
//        // 雷达
//        Loader { source: "qrc:/Theme/theme2/Radar.qml"; visible: mainMenuIndex === 7; }
//        // 胎压
//        Loader { source: "qrc:/Theme/theme2/TirePressure.qml"; visible: mainMenuIndex === 8; }
//        // 倒车影像
//        Loader { source: "qrc:/Theme/theme2/BackCamera.qml"; visible: mainMenuIndex === 9; }
//        // 驾驶行为分析
//        Loader { source: "qrc:/Theme/theme2/DriveAnalysis.qml"; visible: mainMenuIndex === 10; }
//        // 智能维保预测
//        Loader { source: "qrc:/Theme/theme2/Consumption.qml"; visible: mainMenuIndex === 11; }
//        // 历史能耗分析
//        Loader { source: "qrc:/Theme/theme2/ConsumptionHistory.qml"; visible: mainMenuIndex === 12; }
//        // 整车诊断
//        Loader { source: "qrc:/Theme/theme2/Diagnostic.qml"; visible: mainMenuIndex === 13; }
//        // 整车调度
//        Loader { source: "qrc:/Theme/theme2/Schedule.qml"; visible: mainMenuIndex === 14; }
//        // 驾驶求助
//        Loader { source: "qrc:/Theme/theme2/Ask4Help.qml"; visible: mainMenuIndex === 15; }
//        // 天气日历
//        Loader { source: "qrc:/Theme/theme2/CalendarWeather.qml"; visible: mainMenuIndex === 16; }
//        // 公交信息查询
//        Loader { source: "qrc:/Theme/theme2/CarInfo.qml"; visible: mainMenuIndex === 17; }

        // 雷达
        Radar { visible: carGearValue === 3 && carGearRadar; }
        // 倒车影像
        BackCamera { visible: carGearValue === 3 && !carGearRadar; }
    }

    MenuPanel {
        id: menuPanel
        z: 10
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
//            if (carSpeedValue > 99) { // 车速
//                carSpeedValue = 0
//            } else {
//                carSpeedValue += 1
//            }

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

            if (carStartRemainTime > 30) {
                carGearValue = 1
            } else if (carStartRemainTime > 10) {
                carGearValue = 3
            } else {
                carGearValue = 2
            }
        }
    }

    onVisibleChanged: {
        if(visible){
            CarMsg.sendEnableKeys(true);
            demo_run.running = true
        UiController.showLayer("NQBackground")
        } else {
            CarMsg.sendEnableKeys(false);
            demo_run.running = false
        }
    }

//    Component { id : navigation; Navigation {} }
//    Component { id : phone; Phone {} }
//    Component { id : music; Music {} }
//    Component { id : radio; Radio {} }
//    Component { id : setting; Setting {} }
//    Component { id : adas; Adas {} }
//    Component { id : radar; Radar {} }
//    Component { id : tirePressure; TirePressure {} }
//    Component { id : backCamera; BackCamera {} }
//    Component { id : driveAnalysis; DriveAnalysis {} }
//    Component { id : consumption; Consumption {} }
//    Component { id : consumptionHistory; ConsumptionHistory {} }
//    Component { id : diagnostic; Diagnostic {} }
//    Component { id : schedule; Schedule {} }
//    Component { id : ask4Help; Ask4Help {} }
//    Component { id : calendarWeather; CalendarWeather {} }

    Component.onCompleted: {
        UiController.showLayer("NQBackground")
    }
}

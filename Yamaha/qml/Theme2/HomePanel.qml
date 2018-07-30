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

    property int  carGearValue: CarMsg.gear // 档位
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

    onVisibleChanged: {
        if(visible){
            CarMsg.sendEnableKeys(true);
        } else {
            CarMsg.sendEnableKeys(false);
        }
    }

    Component.onCompleted: {

    }
}

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

    property bool bKeyEnable: true
    property bool homepanel_visible: true
    property int  mainMenuIndex: 0

    property int carGearValue: CarMsg.gear // 档位
    property int carGearRadar: 0 // 0-None,1-雷达,2-倒车影像

    property string textBlue: "#0088ff"
    property string currentLayer: ""

    onKeyEnter: function() {
        console.debug("HomePanel onKeyEnter")
    }

    onKeyBack: function() {
        if (mainMenuIndex === 0) {
            console.debug("HomePanel hide menuPanel")
            if (carGearRadar !== 0) {
                carGearRadar = 0
                homepanel_visible = true
            }
        }
    }

    onKeyUp: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyUp")
            if (carGearValue === 7) {
                if (carGearRadar === 1) {
                    carGearRadar = 2
                } else {
                    carGearRadar = 1
                }
            }
        }
    }

    onKeyDown: function() {
        if (bKeyEnable) {
            console.debug("HomePanel onKeyDown")
            if (carGearValue === 7) {
                if (carGearRadar === 1) {
                    carGearRadar = 2
                } else {
                    carGearRadar = 1
                }
            }
        }
    }

    onMainMenuIndexChanged: {
        console.debug("onMainMenuIndexChanged " + mainMenuIndex)
        homepanel_visible = mainMenuIndex ? false : true

        if (currentLayer !== "") {
            UiController.hideLayer(currentLayer);
        }

        if (mainMenuIndex === 1) {
            currentLayer = "CarInfo";
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
            currentLayer = "Navigation";
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
        if (carGearValue === 7) { // 倒车
            carGearRadar = 2 // 默认倒车影像
            if (mainMenuIndex !== 0) {
                mainMenuIndex = 0 // 隐藏模块
            }
            homepanel_visible = false // 隐藏主界面
        }
        else {
            carGearRadar = 0
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
        Radar { visible: carGearValue === 7 && carGearRadar === 1; }
        // 倒车影像
        BackCamera { visible: carGearValue === 7 && carGearRadar === 2; }
    }

    MenuPanel {
        id: menuPanel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
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

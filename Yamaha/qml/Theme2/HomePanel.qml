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
    property bool bChangeTheme: false

    onKeyEnter: function() {
        console.debug("HomePanel onKeyEnter")
        if (bChangeTheme) {
            UiController.switchThemeTo("CustomTheme1")
        }
    }

    onKeyBack: function() {
        if (mainMenuIndex === 0) {
            console.debug("HomePanel hide menuPanel")
            if (carGearRadar !== 0) {
                carGearRadar = 0
                homepanel_visible = true
            }
        }
        bChangeTheme = !bChangeTheme
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

        if (mainMenuIndex > 0 && mainMenuIndex < modelMenu.count) {
            currentLayer = modelMenu.get(mainMenuIndex).layer
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

    ListModel {
        id: modelMenu
        ListElement { src: "home.png"; layer: ""; }
        ListElement { src: "infoSearch.png"; layer: "CarInfo"; }
        ListElement { src: "phone.png"; layer: "Phone"; }
        ListElement { src: "music.png"; layer: "Music"; }
        ListElement { src: "radio.png"; layer: "Radio"; }
        ListElement { src: "setting.png"; layer: "Setting"; }
        ListElement { src: "adas.png"; layer: "Adas"; }
        ListElement { src: "tirePressure.png"; layer: "TirePressure"; }
        ListElement { src: "driveAnalysis.png"; layer: "DriveAnalysis"; }
        ListElement { src: "maintenanceForcast.png"; layer: "Consumption"; }
        ListElement { src: "consumptionAnalysis.png"; layer: "ConsumptionHistory"; }
        ListElement { src: "diagnosticInfo.png"; layer: "Diagnostic"; }
        ListElement { src: "schedule.png"; layer: "Schedule"; }
        ListElement { src: "help.png"; layer: "Ask4Help"; }
        ListElement { src: "calendar.png"; layer: "CalendarWeather"; }
        ListElement { src: "navigation.png"; layer: "Navigation"; }
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

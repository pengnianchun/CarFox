import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property bool bKeyEnable: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/infoSearch/"
    property int currentIndex: 0
    property string currentLayer: ""

    function showCurrent() {
        if (currentLayer !== "") {
            UiController.hideLayer(currentLayer);
        }

        if (currentIndex === 0) {
            currentLayer = "ControlSystem";
        }
        else if (currentIndex === 1) {
            currentLayer = "EngineSystem";
        }
        else if (currentIndex === 2) {
            currentLayer = "AuxiliarySystem";
        }
        else if (currentIndex === 3) {
            currentLayer = "TcuSystem";
        }
        else if (currentIndex === 4) {
            currentLayer = "BatterySystem";
        }
        else if (currentIndex === 5) {
            currentLayer = "BatteryStatus";
        }
        else if (currentIndex === 6) {
            currentLayer = "AirConditioning";
        }
        else if (currentIndex === 7) {
            currentLayer = "InstrumentSystem";
        }
        else if (currentIndex === 8) {
            currentLayer = "InstrumentModule";
        }
        else {
            currentLayer = ""
        }

        if (visible && currentLayer !== "") {
            UiController.showLayer(currentLayer);
            UiController.setLayerProperty(currentLayer, "x", 320);
            UiController.setLayerProperty(currentLayer, "y", 65);
        }
    }

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo enterMenu")
        }
    }

    hideMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo hideMenu")
        }
        UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo previousMenu")
            if (currentIndex > 0) {
                currentIndex--
            } else {
                UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            }
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo nextMenu")
            if (currentIndex < 8) {
                currentIndex++
            } else {
                UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            }
        }
    }

    onCurrentIndexChanged: {
        console.debug("onCurrentIndexChanged:" + currentIndex)
        showCurrent()
    }

    onVisibleChanged: {
        if (visible) {
            showCurrent()
        } else {
            if (currentLayer !== "") {
                UiController.hideLayer(currentLayer);
                currentIndex = 0
                currentLayer = ""
            }
        }
    }

    Component.onCompleted: {

    }
}

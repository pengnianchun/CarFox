import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"
import "qrc:/Common"


MenuItem {
    width: 800
    height: 410

    property bool bKeyEnable: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/infoSearch/"
    property int currentIndex: 0
    property string currentLayer: ""


    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo enterMenu")
        }
    }

    hideMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo hideMenu")
        }
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo previousMenu")
            currentIndex--
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("CarInfo nextMenu")
            currentIndex++
        }
    }

    onCurrentIndexChanged: {
        console.debug("onCurrentIndexChanged:" + currentIndex)

        if (currentLayer !== "") {
            UiController.hideLayer(currentLayer);
        }

        if (currentIndex === 0) {
            currentLayer = "EngineSystem";
        }
        else if (currentIndex === 1) {
            currentLayer = "AuxiliarySystem";
        }
        else if (currentIndex === 2) {
            currentLayer = "TcuSystem";
        }
        else if (currentIndex === 3) {
            currentLayer = "BatterySystem";
        }
        else if (currentIndex === 4) {
            currentLayer = "BatteryStatus";
        }
        else if (currentIndex === 5) {
            currentLayer = "AirConditioning";
        }
        else if (currentIndex === 6) {
            currentLayer = "TirePressure";
        }
        else if (currentIndex === 8) {
            currentLayer = "DriveAnalysis";
        }
        else if (currentIndex === 9) {
            currentLayer = "Consumption";
        }
        else if (currentIndex === 10) {
            currentLayer = "ConsumptionHistory";
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







    onVisibleChanged: {
//        if(visible) {
//            UiController.setLayerProperty(currentLayer, "x", 320);
//            UiController.setLayerProperty(currentLayer, "y", 65);
//            UiController.showLayer("EngineSystem");
//        }
    }

    Component.onCompleted: {

    }

}

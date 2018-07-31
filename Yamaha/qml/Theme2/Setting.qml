import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property bool bKeyEnable: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/setting/"

    property int backlightValue: 50
    //property var dateYMDHMId: [hour,miniute,year,month,day,submit]
    //property var dateYMDHMStatus: [true,false,false,false,false,false]
    //property var initializeDateTime: ["2018","08","08","00","00","00","Mon"]
    //property bool checkDateTimeSetting: CarMsg.checkDateTimeSetting
    //property var utcMcuDateTime: CarMsg.dateTime>0 ? Qt.formatDateTime(new Date(CarMsg.dateTime*1000), "yyyy-MM-dd-hh-mm-ss-ddd").split("-") : initializeDateTime;

    ListModel {
        id: appModel
        Component.onCompleted: {
            append({"icon": sourceImageUrl + "setting_light.png"});
            append({"icon": sourceImageUrl + "setting_vol.png"});
            append({"icon": sourceImageUrl + "setting_lang.png"});
        }
    }

    Component {
        id: appDelegate
        Item {
            width: 320
            height: 48

            Image {
                id: myIcon
                anchors.horizontalCenter: parent.horizontalCenter
                source: icon
                smooth: true
            }
        }
    }

    ListView {
        id: setting
        x: 250
        y: 45
        width: 350
        height: 200
        clip: true
        model: appModel
        delegate: appDelegate
        highlight: Image { source: sourceImageUrl + "setting_select.png"; }
    }

    Rectangle {
        id: light
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 240
        width: 300
        height: 80
        color: "transparent"
        border.color: "#ffffff"
        border.width: 2
        radius: 10
        visible: !bKeyEnable && setting.currentIndex === 0
        TextFieldWeir {
            id: percentage
            anchors.centerIn: parent
            textValue: backlightValue.toString() + " %"
            width: 100
            height: 40
            textWidth: 100
            textHeight: 40
            fontSize: 24
            fontBold: true
            fontColor: "#ffffff"
        }
    }

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting enterMenu")
            bKeyEnable = false
        }
    }

    hideMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting hideMenu")
        }
        UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting previousMenu")
            if (setting.currentIndex > 0) {
                setting.currentIndex--
            } else {
                UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            }
        } else {
            if (setting.currentIndex === 0 && backlightValue > 0) {
                backlightValue -= 10;
                CarMsg.sendBrightnessControl(backlightValue);
            }
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting nextMenu")
            if (setting.currentIndex < 2) {
                setting.currentIndex++
            } else {
                UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            }
        } else {
            if (setting.currentIndex === 0 && backlightValue < 100) {
                backlightValue += 10;
                CarMsg.sendBrightnessControl(backlightValue);
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            setting.currentIndex = 0
            bKeyEnable = true
        }
    }

    Component.onCompleted: {

    }
}

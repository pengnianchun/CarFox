import QtQuick 2.0
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property bool bKeyEnable: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/setting/"

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
        x: 225
        y: 40
        width: 350
        height: 200
        clip: true
        model: appModel
        delegate: appDelegate
        highlight: Image { source: sourceImageUrl + "setting_select.png"; }
    }

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting enterMenu")
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
        }
    }

    onVisibleChanged: {
        if (visible) {
            setting.currentIndex = 0
        }
    }

    Component.onCompleted: {

    }
}

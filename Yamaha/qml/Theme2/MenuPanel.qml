import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQml.Models 2.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    id: menuItem

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Menu/"

    menuLayerId: "MenuPanel"
    parentMenuId: "NULL"

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel enterMenu")
        }
    }

    hideMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel hideMenu")
            homepanel_visible = true
            mainMenuIndex = listMenu.currentIndex = 0
            UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
        }
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel previousMenu")
            if (carGearValue !== 7) {
                if (mainMenuIndex > 0) {
                    mainMenuIndex = --listMenu.currentIndex
                }
//                if (mainMenuIndex === 1 || mainMenuIndex === 5) {
//                    bKeyEnable = false
//                }
            }
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel nextMenu")
            if (carGearValue !== 7) {
                if (mainMenuIndex < listMenu.count - 1) {
                    mainMenuIndex = ++listMenu.currentIndex
                }
                if (mainMenuIndex === 1 || mainMenuIndex === 5) {
                    bKeyEnable = false
                }
            }
        }
    }

    Component {
        id: delegateMenu

        Image {
            asynchronous: true
            cache: true
            source: model.selected ? sourceImageUrl + "select" + model.src : sourceImageUrl + model.src
            sourceSize.width: 40
            sourceSize.height: 36
        }
    }

    Rectangle {
        width: homepanel_visible ? 500 : 800
        height: 45
        anchors.centerIn: parent
        color: "#004b8d"
        radius: 10
        Behavior on width {
            NumberAnimation { duration: 800 }
        }
    }

    ListView {
        id: listMenu
        width: homepanel_visible ? 450 : 750
        height: 35
        anchors.centerIn: parent
        clip: true
        model: modelMenu
        delegate: delegateMenu
        spacing: 35
        orientation: ListView.Horizontal
        highlight: Rectangle { color: "lightsteelblue"; radius: 3; }
        Behavior on width {
            NumberAnimation { duration: 800 }
        }
    }

    Component.onCompleted: {

    }
}

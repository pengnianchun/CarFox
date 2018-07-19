import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQml.Models 2.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    id: menuItem

    property bool bKeyEnable: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Menu/"

    menuLayerId: "MenuPanel"
    parentMenuId: "NULL"

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel enterMenu")
            homepanel_visible = false
            UiController.setLayerProperty("HomePanel", "bKeyEnable", false);
            UiController.setLayerProperty("MenuPanel", "bKeyEnable", true);
        }
    }

    hideMenu: function() {
        //调用关闭三层菜单通用函数
        //MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
        //homepanel_visible = true
        //listMenu.currentIndex = 0

        if (bKeyEnable) {
            console.debug("MenuPanel hideMenu")
            homepanel_visible = true
            mainMenuIndex = listMenu.currentIndex = 0
            UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            UiController.setLayerProperty("MenuPanel", "bKeyEnable", false);
        }
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel previousMenu")
            mainMenuIndex = --listMenu.currentIndex
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("MenuPanel nextMenu")
            mainMenuIndex = ++listMenu.currentIndex
        }
    }

    ListModel {
        id: modelMenu
        ListElement { src: "home.png"; }
        ListElement { src: "navigation.png"; }
        ListElement { src: "phone.png"; }
        ListElement { src: "music.png"; }
        ListElement { src: "radio.png"; }
        ListElement { src: "setting.png"; }
        ListElement { src: "adas.png"; }
        ListElement { src: "more.png"; }
    }

    Component {
        id: nameDelegate

        Image {
            asynchronous: true
            cache: true
            source: sourceImageUrl + model.src
        }
    }

    Rectangle {
        width: 550
        height: 45
        anchors.centerIn: parent
        color: "lightblue"
        radius: 10
    }

    ListView {
        id: listMenu
        width: 500
        height: 35
        anchors.centerIn: parent
        clip: true
        model: modelMenu
        delegate: nameDelegate
        spacing: 35
        orientation: ListView.Horizontal
        highlight: Rectangle { color: "lightsteelblue"; radius: 3; }
    }

    Component.onCompleted: {

    }
}

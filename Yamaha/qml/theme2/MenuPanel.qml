import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQml.Models 2.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    id: menu_item

    property bool bKeyEnable: false
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Menu/"

    menuLayerId: "MenuPanel"
    parentMenuId: "Null"

    enterMenu: function() {
        if (bKeyEnable) {
        //default
            console.debug("MenuPanel onKeyEnter")
            homepanel_visible = false
        }
    }

    hideMenu: function() {
        //调用关闭三层菜单通用函数
        //MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
        homepanel_visible = true
    }

    previousMenu: function() {
        // default
        mainMenuIndex--
        listMenu.currentIndex = mainMenuIndex
    }

    nextMenu: function() {
        // default
        mainMenuIndex++
        listMenu.currentIndex = mainMenuIndex
    }

    ListModel {
        id: modelMenu
        ListElement { src: "home.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "navigation.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "phone.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "music.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "radio.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "setting.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "adas.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
        ListElement { src: "more.png"; qml: "qrc:/Theme/theme2/Navigation.qml"; }
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
        onHighlightChanged: {
            navi.visible = true
            console.debug("onHighlightChanged"+modelMenu.qml)
            mloder.setSource(modelMenu.qml)
        }
    }

    Component.onCompleted: {

    }

}

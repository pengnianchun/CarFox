import QtQuick 2.0
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    id: menu_item

    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Menu/"
    property string sourceImageGreyUrl: "qrc:/theme2/symbol/Theme2/Symbol_gray/"

    menuLayerId: "MenuMainDetail"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        //default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        //MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }

    ListModel {
        id: modelMenu
        ListElement { src: "home.png"; enable: true }
        ListElement { src: "navigation.png"; enable: true }
        ListElement { src: "phone.png"; enable: true }
        ListElement { src: "music.png"; enable: true }
        ListElement { src: "radio.png"; enable: true }
        ListElement { src: "setting.png"; enable: true }
        ListElement { src: "adas.png"; enable: true }
        ListElement { src: "more.png"; enable: true }
    }

    Component {
        id: nameDelegate

        Image {
            asynchronous: true
            cache: true
            source: model.enable ? sourceImageUrl + model.src : sourceImageGreyUrl + model.src
        }
    }

    ListView {
        id: listLeft
        width: 500
        height: 35
        anchors.centerIn: parent
        clip: true
        model: modelMenu
        delegate: nameDelegate
        spacing: 35
        orientation: ListView.Horizontal
    }
}

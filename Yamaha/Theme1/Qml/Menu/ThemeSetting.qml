import QtQuick 2.6
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    parentMenuId: "MenuPanel"
    menuLayerId: "ThemeSetting"

    property bool bKeyEnable: false
    property int  currentIndex: 0
    property int  themeCount: 3 // CustomTheme1, CustomTheme2, CustomTheme3

    enterMenu: function() {
        currentIndex = listview_theme.listViewSelectId.currentIndex
        console.debug("CustomTheme:" + currentIndex)
        if (0 === currentIndex) {
            UiController.switchThemeTo("CustomTheme1")
        } else if (1 === currentIndex) {
            UiController.switchThemeTo("CustomTheme2")
        } else if (2 === currentIndex) {
            UiController.switchThemeTo("CustomTheme3")
        } else {
            // default
        }
    }
    hideMenu: function() {
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            UiController.currentLayerId = "closeThemeSetting";
            bKeyEnable = false;
        }
    }
    previousMenu: function() {
        //上一页
        currentIndex = (currentIndex - 1) % themeCount
        if (currentIndex < 0) {
            currentIndex = themeCount - 1
        }
        listview_theme.listViewSelectId.currentIndex = currentIndex
    }
    nextMenu: function() {
        //下一页
        currentIndex = (currentIndex + 1) % themeCount
        listview_theme.listViewSelectId.currentIndex = currentIndex
    }

    ListModel {
        id: theme_model
        ListElement { name: "主题 1" }
        ListElement { name: "主题 2" }
    }

    ListViewSelectWeir {
        id: listview_theme
        width: 420
        height: 200
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -7
        listModel: theme_model
    }
}

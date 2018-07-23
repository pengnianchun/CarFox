import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Common/Component"
import "../../JS/MenuMainController.js" as MenuMainController

MenuItem {
    width: 1440
    height: 544
    visible: false

    menuLayerId: "MenuMainDetail"
    parentMenuId: "MenuPanel"

    property int menuCurrentIndex: 0
    property int moduleCurrentIndex: 0
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string menuMainBackGroundImage: sourceImageUrl + "SubMenu/submenutips.png";
    property int titleFontSize: 20
    property string titleColor: "#00deff"

    enterMenu: function() {
        // default
    }
    hideMenu: function() {
        // default
    }
    previousMenu: function(){
        //仪表信息模块上一页处理
        if (menuCurrentIndex === MenuMainController.menuInstrumentSystemIndexSP) {
            if ((moduleCurrentIndex > 0) && (moduleCurrentIndex <= 3)) {
                moduleCurrentIndex--;
            } else {
                moduleCurrentIndex = 3;
            }
            MenuMainController.showModule(moduleCurrentIndex);
        }
    }
    nextMenu: function() {
        //仪表信息模块下一页处理
        if(menuCurrentIndex === MenuMainController.menuInstrumentSystemIndexSP){
            if ((moduleCurrentIndex >= 0) && (moduleCurrentIndex < 3)) {
                moduleCurrentIndex++;
            } else {
                moduleCurrentIndex = 0;
            }
            MenuMainController.showModule(moduleCurrentIndex);
        }
    }

    Image {
        id: menu_main_detail_background
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        source: menuMainBackGroundImage
    }
    TextFieldWeir {
        id: menu_info_title
        width: 200
        height: 20
        textWidth: 200
        textHeight: 20
        fontColor: titleColor
        fontSize: titleFontSize
        fontBold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 70
        textValue: menuCurrentIndex === MenuMainController.menuInstrumentSystemIndexSP ?
                       qsTr(MenuMainController.moduleInfoTitleArray[moduleCurrentIndex]) :
                       qsTr(MenuMainController.menuInfoTitleArray[menuCurrentIndex])
    }
    TurnPageWeir {
        id: turn_page
        visible: menuCurrentIndex === MenuMainController.menuInstrumentSystemIndexSP ? true : false
        width: 100
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 695
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        fontSize: 20
        currentPageIndex: (moduleCurrentIndex + 1)
        totalPageCount: "4"
    }
}

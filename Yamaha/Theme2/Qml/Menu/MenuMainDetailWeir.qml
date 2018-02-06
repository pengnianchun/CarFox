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

    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string menuMainBackGroundImage: sourceImageUrl + "SubMenu/submenutips.png";
    property var menuInfoTitleArray: ["控制","发动机","辅助","TCU","电池管理","电池状态","空调","仪表","设置"]
    property var moduleInfoTitleArray: ["仪表系统信息","前模块","中模块","后模块"]
    property int menuCurrentIndex: 0
    property int moduleCurrentIndex: 0
    property string titleColor: "#00deff"
    property int titleFontSize: 20

    enterMenu: function(){}
    hideMenu: function(){}
    previousMenu: function(){
        if(menuCurrentIndex === 7){
            if((moduleCurrentIndex >= 0)&&(moduleCurrentIndex < 3)){
                moduleCurrentIndex++;
            }else{
                moduleCurrentIndex = 0;
            }
            MenuMainController.showModule(moduleCurrentIndex);
        }else{}
    }
    nextMenu: function(){
        if(menuCurrentIndex === 7){
            if((moduleCurrentIndex > 0)&&(moduleCurrentIndex <= 3)){
                moduleCurrentIndex--;
            }else{
                moduleCurrentIndex = 3;
            }
            MenuMainController.showModule(moduleCurrentIndex);
        }else{}
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
        textValue: menuCurrentIndex === 7 ? qsTr(moduleInfoTitleArray[moduleCurrentIndex]) : qsTr(menuInfoTitleArray[menuCurrentIndex]) + "系统信息"
    }
    TurnPageWeir {
        id: turn_page
        visible: menuCurrentIndex === 7 ? true : false
        width: 100
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 695
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        fontSize: 20
        currentPageIndex: (moduleCurrentIndex+1)//"1"
        totalPageCount: "4"
    }
}

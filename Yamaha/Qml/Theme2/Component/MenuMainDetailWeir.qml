import QtQuick 2.6
import QtQuick.Layouts 1.0
//import "../../Common/"
import "qrc:/Common/Qml/Common"
import "../JS/MenuMainController.js" as MenuMainController

Item {
    property string sourceImageUrl: "qrc:/Theme2/Qml/Theme2/Image/"
    property string menuMainBackGroundImage: sourceImageUrl + "SubMenu/submenutips.png";
    property var menuInfoTitleArray: ["控制","发动机","辅助","TCU","电池管理","电池状态","空调","仪表","设置"]
    property var moduleInfoTitleArray: ["仪表系统信息","前模块","中模块","后模块"]
    property int menuCurrentIndex: 0
    property int moduleCurrentIndex: 0
    property string titleColor: "#00deff"
    property int titleFontSize: 20
    property var menuInfoId: [control_system,engine_system,
        auxiliary_system,tcu_system,battery_system,battery_status,
        airconditioning_system,instrument_system,setting_system]
    property var moduleInfoId: [instrument_system,before_module,
        center_module,after_module]
    width: 1200
    height: 420
    onMenuCurrentIndexChanged: {
        for(var i=0;i<moduleInfoId.length;i++){
            moduleInfoId[i].visible = false;
        }
        moduleCurrentIndex = 0;
        turn_page.currentPageIndex = moduleCurrentIndex + 1;
        setting_system.settingSystemId[0].listViewSelectId.currentIndex = 0;
        MenuMainController.currentMenuDetailInfo(menuCurrentIndex,menuInfoId);
    }
    onModuleCurrentIndexChanged: {
        MenuMainController.currentModuleDetailInfo(moduleCurrentIndex,moduleInfoId);
        turn_page.currentPageIndex = moduleCurrentIndex + 1;
    }

    Image {
        id: menu_main_detail_background
        anchors.centerIn: parent
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
        anchors.topMargin: 30
        textValue: menuCurrentIndex === 7 ? qsTr(moduleInfoTitleArray[moduleCurrentIndex]) : qsTr(menuInfoTitleArray[menuCurrentIndex]) + "系统信息"
    }
    ControlSystemWeir {//layer3
        id: control_system
        width: 750
        height: 350
        x: 240
        y: 80
        visible: true
    }
    EngineSystemWeir {//layer3
        id: engine_system
        width: 750
        height: 350
        x: 220
        y: 80
        visible: false
    }
    AuxiliarySystemWeir {//layer3
        id: auxiliary_system
        width: 750
        height: 350
        x: 330
        y: 80
        visible: false
    }
    TcuSystemWeir {//layer3
        id: tcu_system
        width: 750
        height: 350
        x: 250
        y: 80
        visible: false
    }
    BatterySystemWeir {//layer3
        id: battery_system
        width: 750
        height: 350
        x: 240
        y: 80
        visible: false
    }
    BatteryStatusWeir {//layer3
        id: battery_status
        width: 750
        height: 350
        x: 240
        y: 80
        visible: false
    }
    AirConditioningWeir {//layer3
        id: airconditioning_system
        width: 750
        height: 350
        x: 240
        y: 80
        visible: false
    }
    InstrumentSystemWeir {//layer3
        id: instrument_system
        width: 900
        height: 350
        x: 180
        y: 80
        visible: false
    }

    BeforeModuleWeir {//layer3
        id: before_module
        width: 900
        height: 350
        x: 180
        y: 80
        visible: false
    }
    CenterModuleWeir {//layer3
        id: center_module
        width: 900
        height: 350
        x: 180
        y: 80
        visible: false
    }
    AfterModuleWeir {//layer3
        id: after_module
        width: 900
        height: 350
        x: 180
        y: 80
        visible: false
    }
    SettingSystemWeir {//layer3
        id: setting_system
        width: 850
        height: 350
        x: 180
        y: 80
        visible: false
    }
    TurnPageWeir {
        id: turn_page
        visible: menuCurrentIndex === 7 ? true : false
        width: 100
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 575
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -10
        fontSize: 20
        currentPageIndex: "1"
        totalPageCount: "4"
    }
}

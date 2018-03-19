import QtQuick 2.6
import CustomEnum 1.0
import QtQuick.Layouts 1.1
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: setting_system
    width: 1440
    height: 544
    menuLayerId: "TimeSettingsMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property string sourceImageUrl: "qrc:/Theme/Theme1/Image/"
    property string menuTipsBackGroundImage: sourceImageUrl + "MenuPanel/menutips.png";
    property var settingSystemId: [listview_setting,listview_theme,date_setting]
    property var settingSystemStatus: [false,false,true]
    property var dateYMDHMId: [hour,miniute,year,month,day,submit]
    property var dateYMDHMStatus: [true,false,false,false,false,false]

    enterMenu: function(){
        //调用设置模块Enter函数
        MenuMainDetailController.enterSettingSystemAction(setting_system,settingSystemId,dateYMDHMId);
    }
    hideMenu: function(){
        //调用设置模块Return函数
        MenuMainDetailController.returnSettingSystemAction(setting_system,dateYMDHMId,menuLayerId,parentMenuId);
    }
    previousMenu: function(){
        //时间数值递增函数调用
        MenuMainDetailController.turnPageStatus(setting_system,settingSystemId,dateYMDHMId,"add");
    }
    nextMenu: function(){
        //时间数值递减函数调用
        MenuMainDetailController.turnPageStatus(setting_system,settingSystemId,dateYMDHMId,"reduce");
    }
    //CarStatus.dateTime
    property var utcMcuDateTime: Qt.formatDateTime(new Date(), "yyyy-MM-dd-hh-mm-ss-ddd").split("-");
    Timer{
        id: timer
        interval: 1000
        running: false
        repeat: false
        onTriggered:{
            utcMcuDateTime = Qt.formatDateTime(new Date(CarMsg.dataTime*1000), "yyyy-MM-dd-hh-mm-ss-ddd").split("-");
        }
    }
    TextFieldWeir {
        id: title
        textValue: "时间设置信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    ListModel {
        id: setting_model
        ListElement { name: "时间设置" }
        ListElement { name: "主题设置" }
    }
    ListModel {
        id: theme_model
        ListElement { name: "主题 1" }
        ListElement { name: "主题 2" }
    }
    ListViewSelectWeir {
        id: listview_setting
        width: 420
        height: 200
        visible: settingSystemStatus[0]
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -7
        listModel: setting_model
    }
    ListViewSelectWeir {
        id: listview_theme
        width: 420
        height: 200
        visible: settingSystemStatus[1]
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -7
        listModel: theme_model
    }
    ColumnLayout {
        id: date_setting
        width: 350
        height: 200
        spacing: 20
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -7
        visible: settingSystemStatus[2]
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            TextFieldWeir {
                id: hour
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[3]
                fontSize: 28
                fontColor: dateYMDHMStatus[0] ? "#00deff" : "#ffffff"
            }
            TextFieldWeir {
                id: second
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: ":"
                fontSize: 28
            }
            TextFieldWeir {
                id: miniute
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[4]
                fontSize: 28
                fontColor: dateYMDHMStatus[1] ? "#00deff" : "#ffffff"
            }
        }
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            TextFieldWeir {
                id: year
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[0]
                fontSize: 28
                fontColor: dateYMDHMStatus[2] ? "#00deff" : "#ffffff"
            }
            TextFieldWeir {
                id: spaceone
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: "-"
                fontSize: 28
            }
            TextFieldWeir {
                id: month
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[1]
                fontSize: 28
                fontColor: dateYMDHMStatus[3] ? "#00deff" : "#ffffff"
            }
            TextFieldWeir {
                id: spacetwo
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: "-"
                fontSize: 28
            }
            TextFieldWeir {
                id: day
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[2]
                fontSize: 28
                fontColor: dateYMDHMStatus[4] ? "#00deff" : "#ffffff"
            }
        }
        TextFieldWeir {
            id: submit
            width: 100
            height: 30
            textWidth: 100
            textHeight: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            textValue: "确认"
            fontSize: 28
            fontColor: dateYMDHMStatus[5] ? "#00deff" : "#ffffff"
        }
    }
}

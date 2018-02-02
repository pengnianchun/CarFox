import QtQuick 2.6
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    id: setting_system
    menuLayerId: "SettingSystem"
    parentMenuId: "MenuMainDetail"
    width: 900
    height: 350
    x: 270
    y: 130

    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string menuTipsBackGroundImage: sourceImageUrl + "SubMenu/menutips.png";
    property string subscriptImage: sourceImageUrl + "HomePanel/minus.png";
    property var settingSystemId: [listview_setting,listview_theme,date_setting]
    property var settingSystemStatus: [true,false,false]
    property var dateYMDHMId: [hour,miniute,year,month,day,submit]
    property var dateYMDHMStatus: [true,false,false,false,false,false]

    enterMenu: function(){
        MenuMainDetailController.enterSettingSystemAction(setting_system,settingSystemId,dateYMDHMId);
    }
    hideMenu: function(){
        MenuMainDetailController.returnSettingSystemAction(setting_system,dateYMDHMId,menuLayerId,parentMenuId);
    }
    previousMenu: function(){
        MenuMainDetailController.turnPageStatus(setting_system,settingSystemId,dateYMDHMId,"add");
    }
    nextMenu: function(){
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
            utcMcuDateTime = Qt.formatDateTime(new Date(), "yyyy-MM-dd-hh-mm-ss-ddd").split("-");
        }
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
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        listModel: setting_model
    }
    ListViewSelectWeir {
        id: listview_theme
        width: 420
        height: 200
        visible: settingSystemStatus[1]
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        listModel: theme_model
    }
    ColumnLayout {
        id: date_setting
        width: 350
        height: 200
        spacing: 20
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
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
        /*
        TimeHMSWeir {
            id: hmsDisplay
            width: 200
            height: 50
            hourValue: "00"
            spaceValue: ":"
            minuteValue: "00"
            timeFontSize: 24
            anchors.left: parent.left
            anchors.leftMargin: 200
        }
        TimeInfoWeir{
            width: 400
            height: 50
            visible: true
            timerDate: false
            dateFontSize: 24
            anchors.left: parent.left
            anchors.leftMargin: 130
            onHourChanged: {
                hmsDisplay.hourValue = qsTr("%1").arg(hour)
            }
            onMinuteChanged: {
                hmsDisplay.minuteValue = qsTr("%1").arg(minute);
            }
            onSecondChanged: {
                hmsDisplay.spaceValue = ":";
            }
        }
        */
    }
}

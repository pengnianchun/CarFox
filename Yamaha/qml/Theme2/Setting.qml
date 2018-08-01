import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    id: settingMenu
    width: 800
    height: 410

    property bool bKeyEnable: true
    property string sourceImageUrl: "qrc:/theme2/symbol/Theme2/Modules/setting/"

    property int backlightValue: 50
    property int dateYMDHMIndex: 0
    property var dateYMDHMMin: [2000,1,1,0,0]
    property var dateYMDHMMax: [2100,12,31,23,59]
    property var dateYMDHMId: [year,month,day,hour,miniute,submit]
    property var utcMcuDateTime: Qt.formatDateTime(new Date(), "yyyy-MM-dd-hh-mm-ss").split("-");

    ListModel {
        id: appModel
        Component.onCompleted: {
            append({"icon": sourceImageUrl + "setting_light.png"});
            append({"icon": sourceImageUrl + "setting_vol.png"});
            append({"icon": sourceImageUrl + "setting_lang.png"});
        }
    }

    Component {
        id: appDelegate
        Item {
            width: 320
            height: 48

            Image {
                id: myIcon
                anchors.horizontalCenter: parent.horizontalCenter
                source: icon
                smooth: true
            }
        }
    }

    ListView {
        id: setting
        x: 250
        y: 45
        width: 350
        height: 200
        clip: true
        model: appModel
        delegate: appDelegate
        highlight: Image { source: sourceImageUrl + "setting_select.png"; }
    }

    Rectangle {
        id: light
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 240
        width: 300
        height: 80
        color: "transparent"
        border.color: "#ffffff"
        border.width: 2
        radius: 10
        visible: !bKeyEnable && setting.currentIndex === 0

        TextFieldWeir {
            id: percentage
            anchors.centerIn: parent
            textValue: backlightValue.toString() + " %"
            width: 100
            height: 40
            textWidth: 100
            textHeight: 40
            fontSize: 24
            fontBold: true
            fontColor: "#ffffff"
        }
    }

    Rectangle {
        id: timeSetting
        anchors.top: setting.top
        anchors.topMargin: 200
        width: 800
        height: 80
        color: "transparent"
        visible: !bKeyEnable && setting.currentIndex === 1

        RowLayout {
            x: 100
            y: 0
            spacing: 10
            TextFieldWeir {
                id: year
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[0]
                fontSize: 28
                fontColor: dateYMDHMIndex === 0 ? "#00deff" : "#ffffff"
            }
            TextFieldWeir {
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
                fontColor: dateYMDHMIndex === 1 ? "#00deff" : "#ffffff"
            }
            TextFieldWeir {
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
                fontColor: dateYMDHMIndex === 2 ? "#00deff" : "#ffffff"
            }
        }

        RowLayout {
            x: 500
            y: 0
            spacing: 10
            TextFieldWeir {
                id: hour
                width: 50
                height: 50
                textWidth: 50
                textHeight: 50
                textValue: utcMcuDateTime[3]
                fontSize: 28
                fontColor: dateYMDHMIndex === 3 ? "#00deff" : "#ffffff"
            }
            TextFieldWeir {
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
                fontColor: dateYMDHMIndex === 4 ? "#00deff" : "#ffffff"
            }
        }

        TextFieldWeir {
            id: submit
            y: 60
            width: 100
            height: 30
            anchors.horizontalCenterOffset: 0
            anchors.bottomMargin: -11
            textWidth: 100
            textHeight: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            textValue: "确认"
            fontSize: 28
            fontColor: dateYMDHMIndex === 5 ? "#00deff" : "#ffffff"
        }
    }

    enterMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting enterMenu")
            bKeyEnable = false
        } else {
            if (setting.currentIndex === 1) {
                if (dateYMDHMIndex === 5) {
                    var date = new Date(year.textValue + '-' + month.textValue + '-' + day.textValue +
                                        ' ' + hour.textValue +':' + miniute.textValue +':00');
                    console.info("Setting enterMenu Date: " + date)
                    var timestamp = date.getTime()
                    CarMsg.sendDateTime(timestamp);
                } else {
                    dateYMDHMIndex++
                }
            }
        }
    }

    hideMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting hideMenu")
        }
        UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
    }

    previousMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting previousMenu")
            if (setting.currentIndex > 0) {
                setting.currentIndex--
            } else {
                UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            }
        } else {
            if (setting.currentIndex === 0 && backlightValue > 0) {
                backlightValue -= 10;
                CarMsg.sendBrightnessControl(backlightValue);
            } else if (setting.currentIndex === 1) {
                //
                var cur = parseInt(dateYMDHMId[dateYMDHMIndex].textValue)
                cur = cur - 1
                if (cur < dateYMDHMMin[dateYMDHMIndex]) {
                    cur = dateYMDHMMax[dateYMDHMIndex]
                }
                if (cur < 10) {
                    cur = "0" + cur
                }
                dateYMDHMId[dateYMDHMIndex].textValue = cur.toString()
            }
        }
    }

    nextMenu: function() {
        if (bKeyEnable) {
            console.debug("Setting nextMenu")
            if (setting.currentIndex < 2) {
                setting.currentIndex++
            } else {
                UiController.setLayerProperty("HomePanel", "bKeyEnable", true);
            }
        } else {
            if (setting.currentIndex === 0 && backlightValue < 100) {
                backlightValue += 10;
                CarMsg.sendBrightnessControl(backlightValue);
            } else if (setting.currentIndex === 1) {
                //
                var cur = parseInt(dateYMDHMId[dateYMDHMIndex].textValue)
                cur = cur + 1
                if (cur > dateYMDHMMax[dateYMDHMIndex]) {
                    cur = dateYMDHMMin[dateYMDHMIndex]
                }
                if (cur < 10) {
                    cur = "0" + cur
                }
                dateYMDHMId[dateYMDHMIndex].textValue = cur.toString()
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            setting.currentIndex = 0
            bKeyEnable = true
        }
    }

    Component.onCompleted: {

    }
}

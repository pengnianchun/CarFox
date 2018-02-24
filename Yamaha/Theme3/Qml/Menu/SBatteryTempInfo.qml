import QtQuick 2.6
import CustomEnum 1.0
import "./"
import QtQuick.Layouts 1.1

Item {
    id: root
    anchors.fill: parent
    visible: false;

    Image {
        id: bettary_Temp_Title
        x:271
        y:23
        width:210
        height:44
        source: "qrc:/Theme/Theme3/Image/MenuPanel/battery_temp_title.png"
    }

    Row {
        x:34
        y:62

        spacing: 10

        SBatteryTempColumn {
            id: bettary_box1
            title: qsTr("电池箱1")
            model: ListModel {
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
            }
        }

        SBatteryTempColumn {
            id: bettary_box2
            title: qsTr("电池箱2")
            model: ListModel {
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
            }
        }

        SBatteryTempColumn {
            id: bettary_box3
            title: qsTr("电池箱3")
            model: ListModel {
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
            }
        }

        SBatteryTempColumn {
            id: bettary_box4
            title: qsTr("电池箱4")
            model: ListModel {
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
                ListElement { name: "020℃";value: "020℃" }
                ListElement { name: "1-7";value: "8-11" }
            }
        }
    }
}

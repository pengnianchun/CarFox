import QtQuick 2.6
import CustomEnum 1.0
import "./"
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
Item {
    id: root
    x:382
    y:77
    visible: false;

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string bettaryTempTitleImage:sourceImageUrl+"Image/MenuPanel/battery_temp_title.png";

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onKeyShortPressed: {
            if(key === 1) //back键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("SBatteryTempInfo");
                UiController.showLayer("MenuPanel");
            }
        }
    }


    Image {
        id: bettary_Temp_Title
        x:271
        y:23
        width:210
        height:44
        source: bettaryTempTitleImage
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

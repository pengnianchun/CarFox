import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
//import "../../Common/"
import "qrc:/Common/Qml/Common"

Item {
    width: 750
    height: 350

    ListModel {
        id: listmodelone
        ListElement { name: "电机输入电压";value: "0";unit: "V" }
        ListElement { name: "电机输入电流";value: "0";unit: "A" }
        ListElement { name: "电机温度";value: "0";unit: "℃" }
        ListElement { name: "电机控制器温度";value: "0";unit: "℃" }
        ListElement { name: "整车模式";value: "0";unit: "" }
        ListElement { name: "程序版本";value: "0.00";unit: "" }
        ListElement { name: "整车控制器Life";value: "0";unit: "" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "加速踏板百分比";value: "0.0";unit: "%" }
        ListElement { name: "制动踏板百分比";value: "0.0";unit: "V" }
        ListElement { name: "数字量输入1";value: "00000000";unit: "" }
        ListElement { name: "数字量输入2";value: "00000000";unit: "" }
        ListElement { name: "数字量输入3";value: "00000000";unit: "" }
        ListElement { name: "数字量输出1";value: "00000000";unit: "" }
        ListElement { name: "数字量输出2";value: "00000000";unit: "" }
        ListElement { name: "数字量输出3";value: "00000000";unit: "" }
    }
    RowLayout {
        anchors.fill: parent
        spacing: 50
        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
        }
    }
}

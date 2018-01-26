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
        ListElement { name: "电池 01";value: "0.000";unit: "V" }
        ListElement { name: "电池 02";value: "0.000";unit: "V" }
        ListElement { name: "电池 03";value: "0.000";unit: "V" }
        ListElement { name: "电池 04";value: "0.000";unit: "V" }
        ListElement { name: "电池 05";value: "0.000";unit: "V" }
        ListElement { name: "电池 06";value: "0.000";unit: "V" }
        ListElement { name: "电池 07";value: "0.000";unit: "V" }
        ListElement { name: "电池 08";value: "0.000";unit: "V" }
        ListElement { name: "电池 09";value: "0.000";unit: "V" }
        ListElement { name: "电池 10";value: "0.000";unit: "V" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "探针 01";value: "0";unit: "℃" }
        ListElement { name: "探针 02";value: "0";unit: "℃" }
        ListElement { name: "探针 03";value: "0";unit: "℃" }
        ListElement { name: "探针 04";value: "0";unit: "℃" }
        ListElement { name: "探针 05";value: "0";unit: "℃" }
        ListElement { name: "探针 06";value: "0";unit: "℃" }
        ListElement { name: "探针 07";value: "0";unit: "℃" }
        ListElement { name: "探针 08";value: "0";unit: "℃" }
        ListElement { name: "探针 09";value: "0";unit: "℃" }
        ListElement { name: "探针 10";value: "0";unit: "℃" }
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
            unitWidthList: 40
        }
    }
}

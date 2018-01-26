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
        ListElement { name: "发动机油耗";value: "0";unit: "L/H" }
        ListElement { name: "发动机水温";value: "0";unit: "℃" }
        ListElement { name: "发动机负荷";value: "0";unit: "%" }
        ListElement { name: "尿素液位";value: "0";unit: "%" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "发动机目标油门";value: "0.0";unit: "%" }
        ListElement { name: "发动机实际油门";value: "0.0";unit: "%" }
        ListElement { name: "发动机机轴压力";value: "00000000";unit: "KPM" }
        ListElement { name: "发动机进气温度";value: "00000000";unit: "℃" }
    }
    RowLayout {
        anchors.fill: parent
        spacing: 50
        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 60
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 60
        }
    }
}

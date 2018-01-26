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
        ListElement { name: "油泵DC/AC W相输出电流";value: "0";unit: "A" }
        ListElement { name: "油泵DC/AC V相输出电流";value: "0";unit: "A" }
        ListElement { name: "油泵DC/AC U相输出电流";value: "0";unit: "A" }
        ListElement { name: "散热器温度";value: "0";unit: "℃" }
        ListElement { name: "故障代码";value: "0";unit: "" }
    }
    ListViewWeir {
        listModel: listmodelone
        width: parent.width
        height: parent.height
        textWidthList: 500
        fontSizeList: 15
    }
}

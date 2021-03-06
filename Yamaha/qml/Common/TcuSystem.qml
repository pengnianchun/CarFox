import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    menuLayerId: "TcuSystem"
    parentMenuId: "MenuMainDetail"

    //TCU系统信息
    property string actualClutchPosition: CarMsg.actualClutchPosition //离合实际位置
    property string tcuFaultCode: CarMsg.tcuFaultCode.toString(2) //TCU故障信息
    property string axisRpm: CarMsg.axisRpm //变速箱输出轴转速
    property string fmi: CarMsg.fmi //FMI值
    property string cm: CarMsg.cm //CM值
    property string oc: CarMsg.oc.toString(16) //OC值

    onActualClutchPositionChanged: { //离合实际位置
        if ("0" === actualClutchPosition) {
            listmodelone.setProperty(0, "value", "分离");
        } else if ("1" === actualClutchPosition) {
            listmodelone.setProperty(0, "value", "结合");
        } else if ("2" === actualClutchPosition) {
            listmodelone.setProperty(0, "value", "半联动");
        } else {
            // default
            listmodelone.setProperty(0, "value", "未知");
        }
    }
    onTcuFaultCodeChanged: { //TCU故障信息
        listmodelone.setProperty(1, "value", tcuFaultCode);
    }
    onAxisRpmChanged: { //变速箱输出轴转速
        listmodelone.setProperty(2, "value", axisRpm);
    }
    onFmiChanged: { //FMI值
        listmodelone.setProperty(3, "value", fmi);
    }
    onCmChanged: { //CM值
        listmodelone.setProperty(4, "value", cm);
    }
    onOcChanged: { //OC值
        listmodelone.setProperty(5, "value", oc);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "离合实际位置"; value: "0"; unit: "" }
        ListElement { name: "TCU故障信息"; value: "00000000"; unit: "" }
        ListElement { name: "变速箱输出轴转速"; value: "0"; unit: "" }
        ListElement { name: "FMI"; value: "0"; unit: "" }
        ListElement { name: "CM"; value: "0"; unit: "" }
        ListElement { name: "OC"; value: "0"; unit: "" }
    }

    Image {
        x: 275
        y: 25
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/more_before.png"
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("TCU系统信息")
        color: "white"
        font.pixelSize: 28
    }

    Image {
        x: 525
        y: 25
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/more.png"
    }

    Image {
        anchors.top: title.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Modules/infoSearch/bg_title.png"
    }

    ListViewWeir {
        x: 200
        y: 80
        width: 400
        height: 300
        listModel: listmodelone
        fontSizeList: 12
        unitWidthList: 45
    }

    enterMenu: function() {
        // default
    }

    hideMenu: function() {
        // default
    }

    previousMenu: function() {
        // default
    }

    nextMenu: function() {
        // default
    }

    onVisibleChanged: {
        if (visible) {
            CarMsg.sendMenuInfo(24, 0);
        }
    }

    Component.onCompleted: {

    }
}

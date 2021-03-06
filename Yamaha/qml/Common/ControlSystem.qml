import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    parentMenuId: "MenuMainDetail"
    menuLayerId: "ControlSystem"

    // 9.控制系统信息帧
    property string motorInVoltage: CarMsg.motorInVoltage.toFixed(1) //电机输入电压, 0 V
    property string motorInCurrent: CarMsg.motorInCurrent.toFixed(1) //电机输入电流, 0 A
    property string motorTemp: CarMsg.motorTemp.toFixed(0) //电机温度, 0 ℃
    property string motorControllerTemp: CarMsg.motorControllerTemp //电机控制器温度, 0 ℃
    property string carVcuMode: CarMsg.carVcuMode //整车模式, 0
    property string version: CarMsg.version.toFixed(2) //程序版本, 0.00
    property string carLife: CarMsg.carLife //整车控制器Life, 0
    property string accelPedalPercent: CarMsg.accelPedalPercent.toFixed(2) //加速踏板百分比,0.0 %
    property string brakePedalPercent: CarMsg.brakePedalPercent.toFixed(2) //制动踏板百分比,0.0 %
    property string din1: CarMsg.din1.toString(2) //数字量输入1, 00000000（2进制显示）
    property string din2: CarMsg.din2.toString(2) //数字量输入2, 00000000（2进制显示）
    property string din3: CarMsg.din3.toString(2) //数字量输入3, 00000000（2进制显示）
    property string dout1: CarMsg.dout1.toString(2) //数字量输出1, 00000000（2进制显示）
    property string dout2: CarMsg.dout2.toString(2) //数字量输出2, 00000000（2进制显示）
    property string dout3: CarMsg.dout3.toString(2) //数字量输出3, 00000000（2进制显示）

    onMotorInVoltageChanged: {
        listmodelone.setProperty(0, "value", motorInVoltage);
    }

    onMotorInCurrentChanged: {
        listmodelone.setProperty(1, "value", motorInCurrent);
    }

    onMotorTempChanged: {
        listmodelone.setProperty(2, "value", motorTemp);
    }

    onMotorControllerTempChanged: {
        listmodelone.setProperty(3, "value", motorControllerTemp);
    }

    onCarVcuModeChanged: {
        listmodelone.setProperty(4, "value", carVcuMode);
    }

    onVersionChanged: {
        listmodelone.setProperty(5, "value", version);
    }

    onCarLifeChanged: {
        listmodelone.setProperty(6, "value", carLife);
    }

    onAccelPedalPercentChanged: {
        if (accelPedalPercent > 100) {
            listmodeltwo.setProperty(0, "value", "100.00");
        } else {
            listmodeltwo.setProperty(0, "value", accelPedalPercent);
        }
    }

    onBrakePedalPercentChanged: {
        if (brakePedalPercent > 100) {
            listmodeltwo.setProperty(1, "value", "100.00");
        } else {
            listmodeltwo.setProperty(1, "value", brakePedalPercent);
        }
    }

    onDin1Changed: {
        listmodeltwo.setProperty(2, "value", din1);
    }

    onDin2Changed: {
        listmodeltwo.setProperty(3, "value", din2);
    }

    onDin3Changed: {
        listmodeltwo.setProperty(4, "value", din3);
    }

    onDout1Changed: {
        listmodeltwo.setProperty(5, "value", dout1);
    }

    onDout2Changed: {
        listmodeltwo.setProperty(6, "value", dout2);
    }

    onDout3Changed: {
        listmodeltwo.setProperty(7, "value", dout3);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "电机输入电压"; value: "0.0"; unit: "V" }
        ListElement { name: "电机输入电流"; value: "0.0"; unit: "A" }
        ListElement { name: "电机温度"; value: "0"; unit: "℃" }
        ListElement { name: "电机控制器温度"; value: "0"; unit: "℃" }
        ListElement { name: "整车模式"; value: ""; unit: "" }
        ListElement { name: "程序版本"; value: ""; unit: "" }
        ListElement { name: "整车控制器Life"; value: ""; unit: "" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "加速踏板百分比"; value: "0.00"; unit: "%" }
        ListElement { name: "制动踏板百分比"; value: "0.00"; unit: "%" }
        ListElement { name: "数字量输入1"; value: ""; unit: "" }
        ListElement { name: "数字量输入2"; value: ""; unit: "" }
        ListElement { name: "数字量输入3"; value: ""; unit: "" }
        ListElement { name: "数字量输出1"; value: ""; unit: "" }
        ListElement { name: "数字量输出2"; value: ""; unit: "" }
        ListElement { name: "数字量输出3"; value: ""; unit: "" }
    }

    Text {
        id: title
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("控制系统信息")
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
        x: 40
        y: 80
        width: 400
        height: 300
        listModel: listmodelone
        fontSizeList: 12
        unitWidthList: 45
    }

    ListViewWeir {
        x: 410
        y: 80
        width: 400
        height: 300
        listModel: listmodeltwo
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
            CarMsg.sendMenuInfo(21, 0);
        }
    }

    Component.onCompleted: {

    }
}

import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    menuLayerId: "BatterySystem"
    parentMenuId: "MenuMainDetail"

    //电池管理系统
    property double batMaxChargeCurrent: CarMsg.batMaxChargeCurrent.toFixed(1) //最大允许充电电流
    property double batMaxDischargeCurrent: CarMsg.batMaxDischargeCurrent.toFixed(1) //最大允许放电电流
    property double batAverageVoltage: CarMsg.batAverageVoltage.toFixed(2) //单体平均电压
    property int batStatus1: CarMsg.batStatus1.toString(2) //电池状态1
    property int batStatus2: CarMsg.batStatus2.toString(2) //电池状态2
    property int batStatus3: CarMsg.batStatus3.toString(2) //电池状态3
    property double irmOhmPositive: CarMsg.irmOhmPositive //总正绝缘阻值
    property double irmOhmNegative: CarMsg.irmOhmNegative //总负绝缘阻值
    property double batMaxVoltage: CarMsg.batMaxVoltage.toFixed(2) //单体最高电压
    property double batMinVoltage: CarMsg.batMinVoltage.toFixed(2) //单体最低电压
    property double batteryHighestTemp: CarMsg.batteryHighestTemp.toFixed(0) //单体最高温度

    onBatMaxChargeCurrentChanged: { //最大允许充电电流
        listmodelone.setProperty(0, "value", batMaxChargeCurrent);
    }
    onBatMaxDischargeCurrentChanged: { //最大允许放电电流
        listmodelone.setProperty(1, "value", batMaxDischargeCurrent);
    }
    onBatAverageVoltageChanged: { //单体平均电压
        listmodelone.setProperty(2, "value", batAverageVoltage);
    }
    onBatStatus1Changed: { //电池状态1
        listmodelone.setProperty(3, "value", batStatus1);
    }
    onBatStatus2Changed: { //电池状态2
        listmodelone.setProperty(4, "value", batStatus2);
    }
    onBatStatus3Changed: { //电池状态3
        listmodelone.setProperty(5, "value", batStatus3);
    }
    onIrmOhmPositiveChanged: { //总正绝缘阻值
        listmodeltwo.setProperty(0, "value", irmOhmPositive);
    }
    onIrmOhmNegativeChanged: { //总负绝缘阻值
        listmodeltwo.setProperty(1, "value", irmOhmNegative);
    }
    onBatMaxVoltageChanged: { //单体最高电压
        listmodeltwo.setProperty(2, "value", batMaxVoltage);
    }
    onBatMinVoltageChanged: { //单体最低电压
        listmodeltwo.setProperty(3, "value", batMinVoltage);
    }
    onBatteryHighestTempChanged: { //单体最高温度
        listmodeltwo.setProperty(4, "value", batteryHighestTemp);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "最大允许充电电流"; value: "0"; unit: "A" }
        ListElement { name: "最大允许放电电流"; value: "0"; unit: "A" }
        ListElement { name: "单体平均电压"; value: "0.00"; unit: "V" }
        ListElement { name: "电池状态 1"; value: "0000000"; unit: "" }
        ListElement { name: "电池状态 2"; value: "0000000"; unit: "" }
        ListElement { name: "电池状态 3"; value: "0000000"; unit: "" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "总正绝缘电阻"; value: "0"; unit: "KΩ" }
        ListElement { name: "总负绝缘电阻"; value: "0"; unit: "KΩ" }
        ListElement { name: "单体最高电圧"; value: "0.00"; unit: "V" }
        ListElement { name: "单体最低电压"; value: "0.00"; unit: "V" }
        ListElement { name: "单体最高温度"; value: "-40"; unit: "℃" }
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
        text: qsTr("电池管理系统")
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

    Component.onCompleted: {
        //CarMsg.sendMenuInfo(?, ?);
    }
}

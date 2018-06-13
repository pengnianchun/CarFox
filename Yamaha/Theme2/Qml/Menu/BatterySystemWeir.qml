import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    x: 360
    y: 130
    width: 750
    height: 350

    menuLayerId: "BatterySystem"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        // default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }

    //电池管理系统
    property double batMaxChargeCurrent: CarMsg.batMaxChargeCurrent //最大允许充电电流
    property double batMaxDischargeCurrent: CarMsg.batMaxDischargeCurrent //最大允许放电电流
    property double batAverageVoltage: CarMsg.batAverageVoltage //单体平均电压
    property int batStatus1: CarMsg.batStatus1 //电池状态1
    property int batStatus2: CarMsg.batStatus2 //电池状态2
    property int batStatus3: CarMsg.batStatus3 //电池状态3
    property double irmOhmPositive: CarMsg.irmOhmPositive //总正绝缘阻值
    property double irmOhmNegative: CarMsg.irmOhmNegative //总负绝缘阻值
    property double batMaxVoltage: CarMsg.batMaxVoltage //单体最高电压
    property double batMinVoltage: CarMsg.batMinVoltage //单体最低电压
    property double batteryHighestTemp: CarMsg.batteryHighestTemp //单体最高温度

    property double bmsVersion: CarMsg.bmsVersion //BMS程序版本号
    property int bmsModuleAmount: CarMsg.bmsModuleAmount //BMS模块总数量
    property int bmsLife: CarMsg.bmsLife //BMS的Life值
    property int batteryPackHighestTemp: CarMsg.batteryPackHighestTemp //电池组最高温度
    property int batteryPackMinTemp: CarMsg.batteryPackMinTemp //电池组最低温度
    property int batteryManagePackEnergy: CarMsg.batteryManagePackEnergy //电池组当前电量
    property int bmsControlStatus: CarMsg.bmsControlStatus //BMS管控状态
    property int batAmount: CarMsg.batAmount //单体电池总数
    property int rechargeStatus: CarMsg.rechargeStatus //充电状态
    property int tempStyletAmount: CarMsg.tempStyletAmount //可充电储能系统温度探针个数
    property int outletPositiveTemp: CarMsg.outletPositiveTemp //充电插座直流电源正极温度
    property int outletNegativeTemp: CarMsg.outletNegativeTemp //充电插座直流电源负极温度
    property int powerBatteryType: CarMsg.powerBatteryType //动力电池类型
    property int powerBatteryRecharge: CarMsg.powerBatteryRecharge //动力电池充电次数

    //#ListModelOne
    property int index1: 0
    onBatMaxChargeCurrentChanged: { //最大允许充电电流
        listmodelone.setProperty(index1++, "value", batMaxChargeCurrent.toFixed(1));  // 0
    }
    onBatMaxDischargeCurrentChanged: { //最大允许放电电流
        listmodelone.setProperty(index1++, "value", batMaxDischargeCurrent.toFixed(1)); // 1
    }
    onBatAverageVoltageChanged: { //单体平均电压
        listmodelone.setProperty(index1++, "value", batAverageVoltage.toFixed(2)); // 2
    }
    onBatStatus1Changed: { //电池状态1
        listmodelone.setProperty(index1++, "value", batStatus1.toFixed(8)); // 3
    }
    onBatStatus2Changed: { //电池状态2
        listmodelone.setProperty(index1++, "value", batStatus2.toFixed(8)); // 4
    }
    onBatStatus3Changed: { //电池状态3
        listmodelone.setProperty(index1++, "value", batStatus3.toFixed(8)); // 5
    }
    onIrmOhmPositiveChanged: { //总正绝缘阻值
        listmodelone.setProperty(index1++, "value", irmOhmPositive.toFixed(0)); // 6
    }
    onIrmOhmNegativeChanged: { //总负绝缘阻值
        listmodelone.setProperty(index1++, "value", irmOhmNegative.toFixed(0)); // 7
    }
    onBatMaxVoltageChanged: { //单体最高电压
        listmodelone.setProperty(index1++, "value", batMaxVoltage.toFixed(2)); // 8
    }
    onBatMinVoltageChanged: { //单体最低电压
        listmodelone.setProperty(index1++, "value", batMinVoltage.toFixed(2)); // 9
    }
    onBatteryHighestTempChanged: { //单体最高温度
        listmodelone.setProperty(index1++, "value", batteryHighestTemp.toFixed(1)); // 10
    }
    //#ListModelOne END

    //#ListModelTwo
    property int index2: 0
    onBmsVersionChanged: { //BMS程序版本号
        listmodeltwo.setProperty(index2++, "value", bmsVersion.toFixed(1)); // 1
    }
    onBmsModuleAmountChanged: { //BMS模块总数量
        listmodeltwo.setProperty(index2++, "value", bmsModuleAmount.toFixed(0)); // 2
    }
    onBmsLifeChanged: { //BMS的Life值
        listmodeltwo.setProperty(index2++, "value", bmsLife.toFixed(0)); // 3
    }
    onBatteryPackHighestTempChanged: { //电池组最高温度
        listmodeltwo.setProperty(index2++, "value", batteryPackHighestTemp.toFixed(0)); // 4
    }
    onBatteryPackMinTempChanged:  { //电池组最低温度
        listmodeltwo.setProperty(index2++, "value", batteryPackMinTemp.toFixed(0)); // 5
    }
    onBatteryManagePackEnergyChanged: { //电池组当前电量
        listmodeltwo.setProperty(index2++, "value", batteryManagePackEnergy.toFixed(1)); // 6
    }
    onBmsControlStatusChanged: { //BMS管控状态#
        listmodeltwo.setProperty(index2++, "value", bmsControlStatus.toFixed(0)); // 7
    }
    onBatAmountChanged: { //单体电池总数
        listmodeltwo.setProperty(index2++, "value", batAmount.toFixed(0)); // 8
    }
    onRechargeStatusChanged: { //充电状态#
        listmodeltwo.setProperty(index2++, "value", rechargeStatus.toFixed(0)); // 9
    }
    // 显示不下，暂时注释以下三项
//    onTempStyletAmountChanged:  { //可充电储能系统温度探针个数
//        listmodeltwo.setProperty(index2++, "value", tempStyletAmount.toFixed(0)); // 10
//    }
//    onOutletPositiveTempChanged: { //充电插座直流电源正极温度
//        listmodeltwo.setProperty(index2++, "value", outletPositiveTemp.toFixed(0)); // 11
//    }
//    onOutletNegativeTempChanged: { //充电插座直流电源负极温度
//        listmodeltwo.setProperty(index2++, "value", outletNegativeTemp.toFixed(0)); // 12
//    }
    onPowerBatteryTypeChanged:  { //动力电池类型#
        listmodeltwo.setProperty(index2++, "value", powerBatteryType.toFixed(0)); // 13
    }
    onPowerBatteryRechargeChanged:  { //动力电池充电次数
        listmodeltwo.setProperty(index2++, "value", powerBatteryRecharge.toFixed(0)); // 14
    }
    //#ListModelOne END

    ListModel {
        id: listmodelone
        ListElement { name: "最大允许充电电流"; value: "0"; unit: "A" }
        ListElement { name: "最大允许放电电流"; value: "0"; unit: "A" }
        ListElement { name: "单体平均电压"; value: "0.00"; unit: "V" }
        ListElement { name: "电池状态 1"; value: "0000000"; unit: "" }
        ListElement { name: "电池状态 2"; value: "0000000"; unit: "" }
        ListElement { name: "电池状态 3"; value: "0000000"; unit: "" }
        ListElement { name: "总正绝缘电阻"; value: "0"; unit: "KΩ" }
        ListElement { name: "总负绝缘电阻"; value: "0"; unit: "KΩ" }
        ListElement { name: "单体最高电圧"; value: "0.00"; unit: "V" }
        ListElement { name: "单体最低电压"; value: "0.00"; unit: "V" }
        ListElement { name: "单体最高温度"; value: "-40"; unit: "℃" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "BMS程序版本号"; value: "0.0"; unit: "" }
        ListElement { name: "BMS模块总数量"; value: ""; unit: "" }
        ListElement { name: "BMS的Life值"; value: ""; unit: "" }
        ListElement { name: "电池组最高温度"; value: "0"; unit: "℃" }
        ListElement { name: "电池组最低温度"; value: "0"; unit: "℃" }
        ListElement { name: "电池组当前电量"; value: "0.0"; unit: "kWh" }
        ListElement { name: "BMS管控状态"; value: ""; unit: "" }
        ListElement { name: "单体电池总数"; value: ""; unit: "" }
        ListElement { name: "充电状态"; value: "0"; unit: "" }
        // 显示不下，暂时注释以下三项
//        ListElement { name: "可充电储能系统温度探针个数"; value: ""; unit: "" }
//        ListElement { name: "充电插座直流电源正极温度"; value: "0"; unit: "℃" }
//        ListElement { name: "充电插座直流电源负极温度"; value: "0"; unit: "℃" }
        ListElement { name: "动力电池类型"; value: ""; unit: "" }
        ListElement { name: "动力电池充电次数"; value: ""; unit: "" }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 50

        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 45
        }

        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-50
            height: parent.height
            fontSizeList: 15
            unitWidthList: 45
        }
    }
}

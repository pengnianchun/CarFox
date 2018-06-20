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
    property int batStatus1: CarMsg.batStatus1.toString(2) //电池状态1
    property int batStatus2: CarMsg.batStatus2.toString(2) //电池状态2
    property int batStatus3: CarMsg.batStatus3.toString(2) //电池状态3
    property double irmOhmPositive: CarMsg.irmOhmPositive //总正绝缘阻值
    property double irmOhmNegative: CarMsg.irmOhmNegative //总负绝缘阻值
    property double batMaxVoltage: CarMsg.batMaxVoltage.toFixed(2) //单体最高电压
    property double batMinVoltage: CarMsg.batMinVoltage.toFixed(2) //单体最低电压
    property double batteryHighestTemp: CarMsg.batteryHighestTemp //单体最高温度

    property double bmsVersion: CarMsg.bmsVersion //BMS程序版本号
    property int bmsModuleAmount: CarMsg.bmsModuleAmount //BMS模块总数量
    property int bmsLife: CarMsg.bmsLife //BMS的Life值
    property int batteryPackHighestTemp: CarMsg.batteryPackHighestTemp //电池组最高温度
    property int batteryPackMinTemp: CarMsg.batteryPackMinTemp //电池组最低温度
    property int batteryManagePackEnergy: CarMsg.batteryManagePackEnergy.toFixed(1) //电池组当前电量
    property int bmsControlStatus: CarMsg.bmsControlStatus //BMS管控状态
    property int batAmount: CarMsg.batAmount //单体电池总数
    property int rechargeStatus: CarMsg.rechargeStatus //充电状态
    property int tempStyletAmount: CarMsg.tempStyletAmount //可充电储能系统温度探针个数
    property int outletPositiveTemp: CarMsg.outletPositiveTemp //充电插座直流电源正极温度
    property int outletNegativeTemp: CarMsg.outletNegativeTemp //充电插座直流电源负极温度
    property int powerBatteryType: CarMsg.powerBatteryType //动力电池类型
    property int powerBatteryRecharge: CarMsg.powerBatteryRecharge //动力电池充电次数

    //#ListModelOne
    onBatMaxChargeCurrentChanged: { //最大允许充电电流
        listmodelone.setProperty(0, "value", batMaxChargeCurrent.toFixed(1));
    }
    onBatMaxDischargeCurrentChanged: { //最大允许放电电流
        listmodelone.setProperty(1, "value", batMaxDischargeCurrent.toFixed(1));
    }
    onBatAverageVoltageChanged: { //单体平均电压
        listmodelone.setProperty(2, "value", batAverageVoltage.toFixed(2));
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
        listmodelone.setProperty(6, "value", irmOhmPositive.toFixed(0));
    }
    onIrmOhmNegativeChanged: { //总负绝缘阻值
        listmodelone.setProperty(7, "value", irmOhmNegative.toFixed(0));
    }
    onBatMaxVoltageChanged: { //单体最高电压
        listmodelone.setProperty(8, "value", batMaxVoltage.toFixed(2));
    }
    onBatMinVoltageChanged: { //单体最低电压
        listmodelone.setProperty(9, "value", batMinVoltage.toFixed(2));
    }
    onBatteryHighestTempChanged: { //单体最高温度
        listmodelone.setProperty(10, "value", batteryHighestTemp.toFixed(1));
    }
    //#ListModelOne END

    //#ListModelTwo
    onBmsVersionChanged: { //BMS程序版本号
        listmodeltwo.setProperty(0, "value", bmsVersion.toFixed(1));
    }
    onBmsModuleAmountChanged: { //BMS模块总数量
        listmodeltwo.setProperty(1, "value", bmsModuleAmount.toFixed(0));
    }
    onBmsLifeChanged: { //BMS的Life值
        listmodeltwo.setProperty(2, "value", bmsLife.toFixed(0));
    }
    onBatteryPackHighestTempChanged: { //电池组最高温度
        listmodeltwo.setProperty(3, "value", batteryPackHighestTemp.toFixed(0));
    }
    onBatteryPackMinTempChanged:  { //电池组最低温度
        listmodeltwo.setProperty(4, "value", batteryPackMinTemp.toFixed(0));
    }
    onBatteryManagePackEnergyChanged: { //电池组当前电量
        listmodeltwo.setProperty(5, "value", batteryManagePackEnergy.toFixed(1));
    }
    onBmsControlStatusChanged: { //BMS管控状态#
        listmodeltwo.setProperty(6, "value", bmsControlStatus.toFixed(0));
    }
    onBatAmountChanged: { //单体电池总数
        listmodeltwo.setProperty(7, "value", batAmount.toFixed(0));
    }
    onRechargeStatusChanged: { //充电状态#
        listmodeltwo.setProperty(8, "value", rechargeStatus.toFixed(0));
    }
    // 显示不下，暂时注释以下三项
//    onTempStyletAmountChanged:  { //可充电储能系统温度探针个数
//        listmodeltwo.setProperty(index2++, "value", tempStyletAmount.toFixed(0));
//    }
//    onOutletPositiveTempChanged: { //充电插座直流电源正极温度
//        listmodeltwo.setProperty(index2++, "value", outletPositiveTemp.toFixed(0));
//    }
//    onOutletNegativeTempChanged: { //充电插座直流电源负极温度
//        listmodeltwo.setProperty(index2++, "value", outletNegativeTemp.toFixed(0));
//    }
    onPowerBatteryTypeChanged:  { //动力电池类型#
        listmodeltwo.setProperty(9, "value", powerBatteryType.toFixed(0));
    }
    onPowerBatteryRechargeChanged:  { //动力电池充电次数
        listmodeltwo.setProperty(10, "value", powerBatteryRecharge.toFixed(0));
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

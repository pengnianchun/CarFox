import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"


MenuItem{
    id:root
    x:377
    y:44
    visible:false
    menuLayerId: "BatteryManageSysInfo"
    parentMenuId: "MenuPanel"

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("BatteryManageSysInfo");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
    }
    nextMenu: function(){
        UiController.hideLayer("BatteryManageSysInfo");
        UiController.showLayer("PowerBattery1");
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("BatteryManageSysInfo");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
    }

    Image{
        id:title
        x:250
        y:28
        width:209
        height:43
        source:"qrc:/Theme/Theme3/Image/MenuPanel/batteryManageSysInfo.png";
    }

    Row{
        x:30
        y:74
        spacing:25

        Column{
            spacing:6
            BatteryManageColumn{pName:"BMS程序版本号";pValue:CarMsg?CarMsg.bmsVersion:"0"}
            BatteryManageColumn{pName:"BMS模块总数量";pValue:CarMsg?CarMsg.bmsModuleAmount:"0"}
            BatteryManageColumn{pName:"动力电池类型";
                pValue:CarMsg?((CarMsg.powerBatteryType===1)?
                qsTr("磷酸铁锂"):((CarMsg.powerBatteryType===2)?
                qsTr("三元聚合物"):((CarMsg.powerBatteryType===3)?
                qsTr("钛酸锂"):((CarMsg.powerBatteryType===4)?
                qsTr("锰酸锂电池"):((CarMsg.powerBatteryType===5)?
                qsTr("聚合物锂离子电池"):((CarMsg.powerBatteryType===6)?
                qsTr("镍类电池"):((CarMsg.powerBatteryType===7)?
                qsTr("燃料电池"):((CarMsg.powerBatteryType===8)?
                qsTr("钴酸锂"):((CarMsg.powerBatteryType===9)?
                qsTr("超级电容"):qsTr("")))))))))):""}
            BatteryManageColumn{pName:"动力电池充电次数";pValue:CarMsg?CarMsg.powerBatteryRecharge:"0"}
            BatteryManageColumn{pName:"BMS的Life值";pValue:CarMsg?CarMsg.bmsLife:"0"}
            BatteryManageColumn{pName:"电池组最高温度";pValue:CarMsg?CarMsg.batteryPackHighestTemp+"℃":"0℃"}
            BatteryManageColumn{pName:"电池组最低温度";pValue:CarMsg?CarMsg.batteryPackMinTemp+"℃":"0"+"℃"}
            BatteryManageColumn{pName:"电池组当前电量";pValue:CarMsg?CarMsg.batteryManagePackEnergy+"kwh":"0"+"kwh"}
        }
        Column{
            spacing:6
            BatteryManageColumn{pName:"单体平均电压";pValue:CarMsg?CarMsg.batAverageVoltage+"V":"0"+"V"}
            BatteryManageColumn{pName:"正极绝缘电阻阻值";pValue:CarMsg?CarMsg.irmOhmPositive+"KΩ":"0"+"KΩ"}
            BatteryManageColumn{pName:"负极绝缘电阻阻值";pValue:CarMsg?CarMsg.irmOhmNegative+"KΩ":"0"+"KΩ"}
            BatteryManageColumn{pName:"单体电池最高电压";pValue:CarMsg?CarMsg.batMaxVoltage+"V":"0"+"V"}
            BatteryManageColumn{pName:"单体电池最低电压";pValue:CarMsg?CarMsg.batMinVoltage+"V":"0"+"V"}
            BatteryManageColumn{pName:"BMS管控状态";
                pValue:CarMsg?((CarMsg.bmsControlStatus===0)?
                                   qsTr("正常"):((CarMsg.bmsControlStatus===1)?
                                                   qsTr("均衡"):((CarMsg.bmsControlStatus===2)?
                                                                   qsTr("加热"):((CarMsg.bmsControlStatus===3)?
                                                                                   qsTr("冷却"):qsTr(""))))):""}
            BatteryManageColumn{pName:"单体电池总数";pValue:CarMsg?CarMsg.batAmount:"0"}
            BatteryManageColumn{pName:"充电状态";pValue: CarMsg?((CarMsg.rechargeStatus===0x01)?
                                                   qsTr("停车充电"):((CarMsg.rechargeStatus===0x02)?
                                                   qsTr("行驶充电"):((CarMsg.rechargeStatus===0x03)?
                                                   qsTr("未充电状态"):((CarMsg.rechargeStatus===0x04)?
                                                   qsTr("充电完成"):qsTr(""))))):""}
        }
    }
    Column{
        x:30
        y:243
        spacing:6
        BatteryManageColumn1{pName:"可充电储能系统温度探针个数";pValue:CarMsg?CarMsg.tempStyletAmount:"0"}
        BatteryManageColumn1{pName:"充电插座直流电源正极温度";pValue:CarMsg?CarMsg.outletPositiveTemp:"0"}
        BatteryManageColumn1{pName:"充电插座直流电源负极温度";pValue:CarMsg?CarMsg.outletNegativeTemp:"0"}
    }
}

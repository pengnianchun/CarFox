import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
MenuItem{
    id:root
    x:377
    y:44

    menuLayerId: "PowerBattery1"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string powerBattery1TitleImage:sourceImageUrl+"Image/MenuPanel/powerBattery1.png";

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("PowerBattery1");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        UiController.hideLayer("PowerBattery1");
        UiController.showLayer("BatteryManageSysInfo");
    }
    nextMenu: function(){
        UiController.hideLayer("PowerBattery1");
        UiController.showLayer("PowerBattery2");
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("PowerBattery1");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
//        UiController.setLayerProperty("MainPanel","busPanelVisible",true);
    }

//    Connections {
//        // 链接CarMsg信号
//        target: CarMsg
//        onKeyShortPressed: {
//            if(key === 1) //back键
//            {
//                if(root.visible == false)
//                {
//                    return;
//                }
//                UiController.hideLayer("PowerBattery1");
//                UiController.showLayer("MenuPanel");
//            }
//            if(key === 3) //next键
//            {
//                if(root.visible == false)
//                {
//                    return;
//                }

//            }
//        }
//    }

    Image {
        id: powerBattery1_title
        x:271
        y:23
        width: 363
        height: 44
        source: powerBattery1TitleImage
    }

    Row{
        x:80     //第一列起始位置
        y:62
        spacing: 270    //列距

        Column{
            spacing:11    //行距
            PowerBattery1Column{ pID:1; pText:"单体电压过高报警"; pSwitch: CarMsg?CarMsg.batVoltageMaxAlarm:false; }
            PowerBattery1Column{ pID:2; pText:"单体电压过高截止报警"; pSwitch: CarMsg?CarMsg.batVoltageMaxAbortAlarm:false; }
            PowerBattery1Column{ pID:3; pText:"单体电压过低报警"; pSwitch: CarMsg?CarMsg.batVoltageMinAlarm:false; }
            PowerBattery1Column{ pID:4; pText:"单体电压过低截止报警"; pSwitch: CarMsg?CarMsg.batVoltageMinAbortAlarm:false; }
            PowerBattery1Column{ pID:5; pText:"峰值放电电流过大"; pSwitch: CarMsg?CarMsg.dischargeCurrentMaxAlarm:false; }
            PowerBattery1Column{ pID:6; pText:"峰值充电电流过大"; pSwitch: CarMsg?CarMsg.chargeCurrentMaxAlarm:false; }
            PowerBattery1Column{ pID:7; pText:"电池温度过高报警"; pSwitch: CarMsg?CarMsg.batTempMaxAlarm:false; }
            PowerBattery1Column{ pID:8; pText:"电池放电温度过低报警"; pSwitch: CarMsg?CarMsg.dischargeCurrentTempMinAlarm:false; }
            PowerBattery1Column{ pID:9; pText:"电池温度过高截止报警"; pSwitch: CarMsg?CarMsg.batTempMaxAbortAlarm:false; }
            PowerBattery1Column{ pID:10; pText:"电池放电温度过低截止报警"; pSwitch: CarMsg?CarMsg.dischargeCurrentTempMinAbortAlarm:false; }
            PowerBattery1Column{ pID:11; pText:"单体电压压差过大报警"; pSwitch: CarMsg?CarMsg.dropoutVoltageMaxAlarm:false; }
        }

        Column{
            spacing:11    //行距
            PowerBattery1Column{ pID:13; pText:"单体电压压差过大截止报警"; pSwitch: CarMsg?CarMsg.dropoutVoltageMaxAbortAlarm:false; }
            PowerBattery1Column{ pID:14; pText:"电池充电电压过高"; pSwitch: CarMsg?CarMsg.chargeVoltageMaxAlarm:false; }
            PowerBattery1Column{ pID:15; pText:"动力电池温度差异报警"; pSwitch: CarMsg?CarMsg.batTempDifferentAlarm:false; }
            PowerBattery1Column{ pID:16; pText:"动力电池充电温度过低"; pSwitch: CarMsg?CarMsg.batChargeTempMinAlarm:false;  }
            PowerBattery1Column{ pID:17; pText:"动力电池soc过低报警"; pSwitch: CarMsg?CarMsg.socMinAlarm:false; }
            PowerBattery1Column{ pID:18; pText:"动力电池模块通讯失效"; pSwitch: CarMsg?CarMsg.batModuleCommunicationFail:false; }
            PowerBattery1Column{ pID:19; pText:"bms系统故障"; pSwitch: CarMsg?CarMsg.bmsSystemFault:false; }
            PowerBattery1Column{ pID:20; pText:"动力蓄电池故障"; pSwitch: CarMsg?CarMsg.batteryFault:false; }
            PowerBattery1Column{ pID:21; pText:"制动能力回收电流过大报警"; pSwitch: CarMsg?CarMsg.energyRecoveryCurrentMaxAlarm:false; }
        }
    }
}

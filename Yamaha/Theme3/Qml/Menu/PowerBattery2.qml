import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
MenuItem{
    id:root
    x:377
    y:44
    visible:false
    menuLayerId: "PowerBattery2"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string powerBattery2TitleImage:sourceImageUrl+"Image/MenuPanel/powerBattery2.png";

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("PowerBattery2");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        UiController.hideLayer("PowerBattery2");
        UiController.showLayer("PowerBattery1");
    }
    nextMenu: function(){
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("PowerBattery2");
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
//                UiController.hideLayer("PowerBattery2");
//                UiController.showLayer("MenuPanel");
//            }
//            if(key === 2) //next键
//            {
//                if(root.visible == false)
//                {
//                    return;
//                }
//                UiController.hideLayer("PowerBattery2");
//                UiController.showLayer("PowerBattery1");
//            }
//        }
//    }

    Image {
        id: powerBattery2_title
        x:271
        y:23
        width: 365
        height: 44
        source: powerBattery2TitleImage
    }

    Row{
       x:80
       y:62
       spacing: 283
       Column{
           spacing: 11
           PowerBattery2Column{name:"1";value:"峰值放电电流过大截止报警";pSwitch: CarMsg?CarMsg.dischargeCurrentMaxAbortAlarm:false;}
           PowerBattery2Column{name:"2";value:"电池充电温度过高报警";pSwitch: CarMsg?CarMsg.chargeCurrentTempMaxAlarm:false;}
           PowerBattery2Column{name:"3";value:"电池充电温度过高截止报警";pSwitch: CarMsg?CarMsg.chargeCurrentTempMaxAbortAlarm:false;}
           PowerBattery2Column{name:"4";value:"电池充电温度过低截止报警";pSwitch: CarMsg?CarMsg.batChargeTempMinAbortAlarm:false;}
           PowerBattery2Column{name:"5";value:"动力电池soc过高报警";pSwitch: CarMsg?CarMsg.socMaxAlarm:false;}
           PowerBattery2Column{name:"6";value:"制动能量回收单体电压过高报警";pSwitch: CarMsg?CarMsg.energyRecoveryVoltageMaxAlarm:false;}
           PowerBattery2Column{name:"7";value:"制动能量回收单体电压过高截止报警";pSwitch: CarMsg?CarMsg.energyRecoveryVoltageMaxAbort:false;}
           PowerBattery2Column{name:"8";value:"取消制动能力回收功能";pSwitch: CarMsg?CarMsg.energyRecoveryCancel:false;}
       }
       Column{
           spacing: 11
           PowerBattery2Column{name:"1";value:"soc跳变报警";pSwitch: CarMsg?CarMsg.socJumpAlarm:false;}
           PowerBattery2Column{name:"2";value:"可充电储能系统不匹配报警";pSwitch: CarMsg?CarMsg.mismatchingAlarm:false;}
           PowerBattery2Column{name:"3";value:"车载储能装置类型过压报警";pSwitch: CarMsg?CarMsg.vehicleMountedTypeMax:false;}
           PowerBattery2Column{name:"4";value:"车载储能装置类型欠压报警";pSwitch: CarMsg?CarMsg.vehicleMountedTypeMin:false;}
           PowerBattery2Column{name:"5";value:"车载储能装置类型过充";pSwitch: CarMsg?CarMsg.vehicleMountedTypeOvercharge:false;}
       }
    }
}

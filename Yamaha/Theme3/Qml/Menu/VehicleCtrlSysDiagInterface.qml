import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
MenuItem{
    id:root
    x:380
    y:57
    visible: false
    menuLayerId: "VehicleCtrlSysDiagInterface"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string powerBattery1TitleImage:sourceImageUrl+"Image/MenuPanel/vehicleCtrlSysDiagInterface.png";

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("VehicleCtrlSysDiagInterface");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        UiController.hideLayer("VehicleCtrlSysDiagInterface");
        UiController.showLayer("VCU");
    }
    nextMenu: function(){
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("VehicleCtrlSysDiagInterface");
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
//                if(root.visible === false)
//                {
//                    return;
//                }
//                UiController.hideLayer("VehicleCtrlSysDiagInterface");
//                UiController.showLayer("MenuPanel");
//            }
//            if(key === 2) //prev键
//            {
//                if(root.visible === false)
//                {
//                    return;
//                }
//                UiController.hideLayer("VehicleCtrlSysDiagInterface");
//                UiController.showLayer("VCU");
//            }
//        }
//    }

    Image {
        id: powerBattery1_title
        x:214
        y:0
        width: 256
        height: 43
        source: powerBattery1TitleImage
    }

    Row{
        x:32
        y:48
        spacing: 20

        Column{
            spacing: 5
            VehicleCtrlSysDiagInterfaceColumn{pID:"1.";pText:"驱动系统故障报警";pSwitch:CarMsg?CarMsg.driveFaultAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"2.";pText:"驱动控制器过压报警";pSwitch:CarMsg?CarMsg.controlOvervoltageAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"3.";pText:"驱动控制器欠压报警";pSwitch:CarMsg?CarMsg.controlUndervoltageAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"4.";pText:"驱动控制器编码器报警";pSwitch:CarMsg?CarMsg.controlEncodingFault:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"5.";pText:"驱动控制器高温报警";pSwitch:CarMsg?CarMsg.controlHighTempAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"6.";pText:"驱动控制器高温截止报警";pSwitch:CarMsg?CarMsg.controlHighTempAbortAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"7.";pText:"驱动控制器主接触器故障";pSwitch:CarMsg?CarMsg.controlMainContactorFault:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"8.";pText:"驱动控制器过流报警";pSwitch:CarMsg?CarMsg.controlOvercurrentAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"9.";pText:"驱动电机高温报警";pSwitch:CarMsg?CarMsg.motorHighTempAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"10.";pText:"驱动电机高温截止报警";pSwitch:CarMsg?CarMsg.motorHigtTempAbortAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"11.";pText:"驱动电机旋故障报警";pSwitch:CarMsg?CarMsg.motorRotaryFault:false}
            }
        Column{
            spacing: 5
            VehicleCtrlSysDiagInterfaceColumn{pID:"12.";pText:"驱动电机功率受限报警";pSwitch:CarMsg?CarMsg.controlMotorPowerLimitation:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"13.";pText:"驱动电机转矩受限报警";pSwitch:CarMsg?CarMsg.motorRotaryLimitation:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"14.";pText:"驱动电机水温过高报警";pSwitch:CarMsg?CarMsg.motorWaterTempOvertop:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"15.";pText:"加速踏板信号值异常报警";pSwitch:CarMsg?CarMsg.acceleratorPedalFault:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"16.";pText:"刹车踏板信号值异常报警";pSwitch:CarMsg?CarMsg.motorRotaryLimitation:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"17.";pText:"安全带报警";pSwitch:CarMsg?CarMsg.seatbeltAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"18.";pText:"座椅开关报警";pSwitch:CarMsg?CarMsg.seatSwitchAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"19.";pText:"右侧舱门开启报警";pSwitch:CarMsg?CarMsg.controlRightDoorsOpenAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"20.";pText:"左侧舱门开启报警";pSwitch:CarMsg?CarMsg.controlLeftDoorsOpenAlarm:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"21.";pText:"司机门未关报警";pSwitch:CarMsg?CarMsg.chauffeurDoorsNotClose:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"22.";pText:"高压开关门开启报警";pSwitch:CarMsg?CarMsg.highTensionSwitchOpen:false}
        }
        Column{
            spacing: 5
            VehicleCtrlSysDiagInterfaceColumn{pID:"23.";pText:"充电门开启报警";pSwitch:CarMsg?CarMsg.chargeDoorOpen:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"24.";pText:"安全门开启报警";pSwitch:CarMsg?CarMsg.safetyDoorOpen:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"25.";pText:"低压开关门开启报警";pSwitch:CarMsg?CarMsg.lowVoltageSwitchOpen:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"26.";pText:"ABS系统故障";pSwitch:CarMsg?CarMsg.absSystemFault:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"27.";pText:"空压机控制器高温报警";pSwitch:CarMsg?CarMsg.airCompressorControlHighTemp:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"28.";pText:"空压机电机高温报警";pSwitch:CarMsg?CarMsg.airCompressorMotorHighTemp:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"29.";pText:"助力泵控制器报警";pSwitch:CarMsg?CarMsg.boosterPumpControlHighTemp:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"30.";pText:"助力泵电机高温报警";pSwitch:CarMsg?CarMsg.boosterPumpMotorHighTemp:false}
            VehicleCtrlSysDiagInterfaceColumn{pID:"VCU程序版本号";pText:CarMsg?CarMsg.vcuVersion:00.0}
            VehicleCtrlSysDiagInterfaceColumn{pID:"VCU系统Life值";pText:CarMsg?CarMsg.vcuLife:000}
        }
    }
}

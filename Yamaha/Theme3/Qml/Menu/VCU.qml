import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
MenuItem{
    id:root
    x:366
    y:64
    visible: false
    menuLayerId: "VCU"
    parentMenuId: "MenuPanel"

    onVisibleChanged: {
        if(visible)
        {
            CarMsg.sendMenuInfo(21, 0);
        }
    }

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string vcuTitleImage:sourceImageUrl+"Image/MenuPanel/VCU.png";

    function getMotorvalue1Status(status)
    {
        if((status === 0)||(status === 1)||
            (status === 2)||(status === 3)||
            (status === 4)||(status === 5)||
            (status === 6)||(status === 7))
        {
            return qsTr("正常工作");
        }
        else if((status === 8)||(status === 9)||
                (status === 10)||(status === 11)||
                (status === 12)||(status === 13)||
                (status === 14)||(status === 15))
        {
            return qsTr("电机停机");
        }
        return qsTr("");
    }

    function getMotorvalue2Status(status)
    {
        if((status === 0)||(status === 1)||
            (status === 2)||(status === 3)||
            (status === 9)||(status === 10)||
            (status === 11))
        {
            return qsTr("非回收状态");
        }
        else if((status === 4)||(status === 5)||
                (status === 6)||(status === 7)||
                (status === 12)||(status === 13)||
                (status === 14)||(status === 15))
        {
            return qsTr("能量回收");
        }
    }

    function getMotorvalue3Status(status)
    {
        if((status === 0)||(status === 1)||
            (status === 4)||(status === 5)||
            (status === 8)||(status === 9)||
            (status === 12)||(status === 13))
        {
            return qsTr("非零速锁定");
        }
        else if((status === 4)||(status === 5)||
                (status === 6)||(status === 7)||
                (status === 12)||(status === 13)||
                (status === 14)||(status === 15))
        {
            return qsTr("零速锁定");
        }
    }

    function getMotorvalue4Status(status)
    {
        if((status === 0)||(status === 2)||
            (status === 4)||(status === 6)||
            (status === 8)||(status === 10)||
            (status === 12)||(status === 14))
        {
            return qsTr("非定速状态");
        }
        else if((status === 1)||(status === 3)||
                (status === 5)||(status === 7)||
                (status === 9)||(status === 11)||
                (status === 13)||(status === 15))
        {
            return qsTr("定速巡航模式");
        }
    }

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("VCU");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
    }
    nextMenu: function(){
        UiController.hideLayer("VCU");
        UiController.showLayer("VehicleCtrlSysDiagInterface");
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("TPMS");
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
//                UiController.hideLayer("VCU");
//                UiController.showLayer("MenuPanel");
//            }
//            if(key === 3) //next键
//            {
//                if(root.visible === false)
//                {
//                    return;
//                }
//                UiController.hideLayer("VCU");
//                UiController.showLayer("VehicleCtrlSysDiagInterface");
//            }
//        }
//    }

    Image{
        id:vcu_title
        x:307
        y:0
        width:164
        height:44
        source:vcuTitleImage
    }
    Row{
        x:95
        y:40
        spacing:30
        Text {
            id:sys_state_name
            text:"驱动系统状态"
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id: sys_state_value
            text:CarMsg?((CarMsg.driveSystemStatus === 0)?
                             qsTr("READY"):((CarMsg.driveSystemStatus === 1)?
                             qsTr("WAIT"):((CarMsg.driveSystemStatus === 3)?
                             qsTr("STOP"):qsTr("无效")))):qsTr("无效")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id: foot_brake_name
            text:"脚刹"
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id: foot_brake_value
            text:CarMsg?((CarMsg.mechanicalBrakeStatus === 0)?
                             qsTr("无"):((CarMsg.mechanicalBrakeStatus === 1)?
                             qsTr("无"):((CarMsg.mechanicalBrakeStatus === 2)?
                             qsTr("制动"):((CarMsg.mechanicalBrakeStatus === 3)?
                             qsTr("制动"):qsTr("无"))))):qsTr("")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id: hand_brake_name
            text:"手刹"
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id: hand_brake_value
            text:CarMsg?((CarMsg.mechanicalBrakeStatus === 0)?
                             qsTr("无"):((CarMsg.mechanicalBrakeStatus === 1)?
                             qsTr("制动"):((CarMsg.mechanicalBrakeStatus === 2)?
                             qsTr("无"):((CarMsg.mechanicalBrakeStatus === 3)?
                             qsTr("制动"):qsTr("无"))))):qsTr("")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
    }

    Row{
        x:95
        y:66
        spacing:30
        Text {
            id:motor_state_name
            text:"驱动电机状态"
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "#00ccff"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id:motor_state_value1
            text: CarMsg ? getMotorvalue1Status(CarMsg.driveMotorStatus) : qsTr("")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id:motor_state_value2
            text:CarMsg? getMotorvalue2Status(CarMsg.driveMotorStatus) : qsTr("")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id:motor_state_value3
            text:CarMsg? getMotorvalue3Status(CarMsg.driveMotorStatus) : qsTr("")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            id:motor_state_value4
            text:CarMsg? getMotorvalue4Status(CarMsg.driveMotorStatus) : qsTr("")
            font.family: "PingFang SC Regular"
            font.pixelSize: 17; font.weight: Font.Black
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }
    }

    Row{
        x:95
        y:91
        spacing:20
        Column{
            spacing:5
            VCUColumn{name:"钥匙acc档";value:CarMsg?((CarMsg.keyAcc===false)?qsTr("关闭"):((CarMsg.keyAcc===true)?qsTr("开启"):qsTr(""))):qsTr("")}
            VCUColumn{name:"高压互锁状态";value:CarMsg?((CarMsg.highVoltageInterLock===false)?qsTr("互锁状态"):((CarMsg.highVoltageInterLock===true)?qsTr("非互锁"):qsTr(""))):qsTr("")}
            VCUColumn{name:"空压机工作状态";value:CarMsg?((CarMsg.airCompressorWork===false)?qsTr("停止"):((CarMsg.airCompressorWork===true)?qsTr("启动"):qsTr(""))):qsTr("")}
            VCUColumn{name:"空压机电机转速";value:CarMsg?CarMsg.airCompressorMotorSpeed+"rpm":0+"rpm"}
            VCUColumn{name:"空压机电机温度";value:CarMsg?CarMsg.airCompressorMotorTemp+"℃":0+"℃"}
            VCUColumn{name:"空压机控制器温度";value:CarMsg?CarMsg.airCompressorControlTemp+"℃":0+"℃"}
            VCUColumn{name:"气压3";value:CarMsg?CarMsg.airPress3+"mpa":0+"mpa"}
            VCUColumn{name:"气压4";value:CarMsg?CarMsg.airPress4+"mpa":0+"mpa"}
            VCUColumn{name:"气压5";value:CarMsg?CarMsg.airPress5+"mpa":0+"mpa"}
        }
        Column{
            spacing:5
            VCUColumn{name:"钥匙on档";value:CarMsg?((CarMsg.keyOn===false)?qsTr("关闭"):((CarMsg.keyOn===true)?qsTr("开启"):qsTr(""))):qsTr("")}
            VCUColumn{name:"高压上电状态";value:CarMsg?((CarMsg.highVoltagePowerUp===false)?qsTr("下电"):((CarMsg.highVoltagePowerUp===true)?qsTr("上电"):qsTr(""))):qsTr("")}
            VCUColumn{name:"助力汞工作状态";value:CarMsg?((CarMsg.boosterPumpWork===false)?qsTr("停止"):((CarMsg.boosterPumpWork===true)?qsTr("启动"):qsTr(""))):qsTr("")}
            VCUColumn{name:"转向助力电机转速";value:CarMsg?CarMsg.steeringAssistMotorSpeed+"rpm":0+"rpm"}
            VCUColumn{name:"转向助力电机温度";value:CarMsg?CarMsg.steeringAssistMotorTemp+"℃":0+"℃"}
            VCUColumn{name:"转向控制器温度";value:CarMsg?CarMsg.steeringControlDeviceTemp+"℃":0+"℃"}
            VCUColumn{name:"最高报警等级";value:CarMsg?((CarMsg.highestAlarmGrade === 0x00)?
                                                      qsTr("无故障"):((CarMsg.highestAlarmGrade === 0x01)?
                                                      qsTr("1级故障"):((CarMsg.highestAlarmGrade === 0x02)?
                                                      qsTr("2级故障"):((CarMsg.highestAlarmGrade === 0x03)?
                                                      qsTr("3级故障"):qsTr("异常"))))):qsTr("")}
            VCUColumn{name:"故障报警形势";value:CarMsg?((CarMsg.faultAlarmSituation === 0)?qsTr("正常"):((CarMsg.faultAlarmSituation === 1)?qsTr("光报警"):((CarMsg.faultAlarmSituation === 2)?qsTr("光和声报警"):qsTr("")))):qsTr("")}
            VCUColumn{name:"档位驱动模式";value:CarMsg?((CarMsg.driveGearsMode===0)?
                                                      qsTr("直驱模式"):((CarMsg.driveGearsMode===1)?
                                                      qsTr("AMT模式"):((CarMsg.driveGearsMode===2)?
                                                      qsTr("CVT模式"):((CarMsg.driveGearsMode===4)?
                                                      qsTr("轮边驱动模式"):qsTr(""))))):qsTr("")}
        }
    }
    Text{
        id:bdu_name
        x:95
        y:350
        text:"BDU箱内主回路继电器上下电命令"
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"
        horizontalAlignment: Text.AlignLeft
    }
    Text{
        x:412
        y:350
        id:bdu_value
        text:CarMsg?((CarMsg.bduSwitch === 0x00)?
                      qsTr("无请求"):((CarMsg.bduSwitch === 0x01)?
                      qsTr("上电命令"):((CarMsg.bduSwitch === 0x02)?
                      qsTr("下电命令"):qsTr("")))):qsTr("")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignLeft
    }
}

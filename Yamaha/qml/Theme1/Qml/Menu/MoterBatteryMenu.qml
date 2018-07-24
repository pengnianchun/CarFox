import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Component/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "MoterBatteryMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property var voltageInfo: CarMsg.voltageInfo
    property var tempInfo: CarMsg.tempInfo
    property var carLoadTitleArray: ["电池管理系统信息","单体电池信息（电池箱1）","单体电池信息（电池箱2）",
        "单体电池信息（电池箱3）","单体电池信息（电池箱4）","单体电池信息（电池箱5）","单体电池信息（电池箱6）","单体电池信息（电池箱7）"
        ,"单体电池信息（电池箱8）","单体电池信息（电池箱9）","单体电池信息（电池箱10）","电池诊断信息1","电池诊断信息2"]
    property int carLoadCurrentIndex: 0

    onVoltageInfoChanged: {
        battery_model.clear();
        for(var i in voltageInfo){
            battery_model.append({"number":i,"voltage":voltageInfo[i].toFixed(2)});
        }
    }
    onTempInfoChanged: {
        temperature_model.clear();
        for(var i in tempInfo){
            temperature_model.append({"number":i,"temperature":tempInfo[i].toFixed(0)});
        }
    }
    ListModel { id: battery_model }
    ListModel { id: temperature_model }
    onVisibleChanged: {
        if(visible){
            update_model_timer.running = true;
        }else{
            update_model_timer.running = false;
        }
    }
    Timer {
        id: update_model_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            if(carLoadCurrentIndex === 0){
                listmodel9.setProperty(0,"value",CarMsg.bmsVersion.toFixed(1));
                listmodel9.setProperty(1,"value",CarMsg.bmsModuleAmount.toFixed(0));
                var batteryType = "";
                if(CarMsg.powerBatteryType === 1){
                    batteryType = "磷酸铁锂";
                }else if(CarMsg.powerBatteryType === 2){
                    batteryType = "三元聚合物";
                }else if(CarMsg.powerBatteryType === 3){
                    batteryType = "钛酸锂";
                }else if(CarMsg.powerBatteryType === 4){
                    batteryType = "锰酸锂电池";
                }else if(CarMsg.powerBatteryType === 5){
                    batteryType = "聚合物锂离子电池";
                }else if(CarMsg.powerBatteryType === 6){
                    batteryType = "镍类电池";
                }else if(CarMsg.powerBatteryType === 7){
                    batteryType = "燃料电池";
                }else if(CarMsg.powerBatteryType === 8){
                    batteryType = "钴酸锂";
                }else if(CarMsg.powerBatteryType === 9){
                    batteryType = "超级电容";
                }else{}
                listmodel9.setProperty(2,"value",batteryType);
                listmodel9.setProperty(3,"value",CarMsg.batMaxVoltage.toFixed(1));
                listmodel9.setProperty(4,"value",CarMsg.batteryPackHighestTemp.toFixed(0));
                listmodel9.setProperty(5,"value",CarMsg.batteryManagePackEnergy.toFixed(1));
                listmodel9.setProperty(6,"value",CarMsg.irmOhmPositive.toFixed(1));
                listmodel9.setProperty(7,"value",CarMsg.batAmount.toFixed(0));
                listmodel9.setProperty(8,"value",CarMsg.tempStyletAmount.toFixed(0));
                listmodel9.setProperty(9,"value",CarMsg.outletPositiveTemp.toFixed(0));
                listmodel9.setProperty(10,"value",CarMsg.outletNegativeTemp.toFixed(0));
                listmodel10.setProperty(0,"value",CarMsg.powerBatteryRecharge.toFixed(0));
                listmodel10.setProperty(1,"value",CarMsg.bmsLife.toFixed(0));
                listmodel10.setProperty(2,"value",CarMsg.batteryPackMinTemp.toFixed(0));
                var bmsStatus = "";
                if(CarMsg.bmsControlStatus === 0){
                    bmsStatus = "正常";
                }else if(CarMsg.bmsControlStatus === 1){
                    bmsStatus = "均衡";
                }else if(CarMsg.bmsControlStatus === 2){
                    bmsStatus = "加热";
                }else if(CarMsg.bmsControlStatus === 3){
                    bmsStatus = "冷却";
                }else{}
                listmodel10.setProperty(3,"value",CarMsg.batMinVoltage.toFixed(1));
                listmodel10.setProperty(4,"value",bmsStatus);
                listmodel10.setProperty(5,"value",CarMsg.irmOhmNegative.toFixed(1));
                var chargeStatus = "";
                if(CarMsg.rechargeStatus === 0x01){
                    chargeStatus = "停车充电";
                }else if(CarMsg.rechargeStatus === 0x02){
                    chargeStatus = "行驶充电";
                }else if(CarMsg.rechargeStatus === 0x03){
                    chargeStatus = "未充电状态";
                }else if(CarMsg.rechargeStatus === 0x04){
                    chargeStatus = "充电完成";
                }else if(CarMsg.rechargeStatus === 0xFE){
                    chargeStatus = "异常";
                }else{}
                listmodel10.setProperty(6,"value",chargeStatus);
            }else if((carLoadCurrentIndex === 11)||(carLoadCurrentIndex === 12)){
                listmodel11.setProperty(0,"checkstatus",CarMsg.batVoltageMaxAlarm);
                listmodel11.setProperty(1,"checkstatus",CarMsg.batVoltageMaxAbortAlarm);
                listmodel11.setProperty(2,"checkstatus",CarMsg.batVoltageMinAlarm);
                listmodel11.setProperty(3,"checkstatus",CarMsg.batVoltageMinAbortAlarm);
                listmodel11.setProperty(4,"checkstatus",CarMsg.chargeCurrentMaxAlarm);
                listmodel11.setProperty(5,"checkstatus",CarMsg.dischargeCurrentMaxAlarm);
                listmodel11.setProperty(6,"checkstatus",CarMsg.dischargeCurrentMaxAbortAlarm);
                listmodel11.setProperty(7,"checkstatus",CarMsg.dischargeCurrentTempMinAlarm);
                listmodel11.setProperty(8,"checkstatus",CarMsg.dischargeCurrentTempMinAbortAlarm);
                listmodel11.setProperty(9,"checkstatus",CarMsg.chargeCurrentTempMaxAlarm);
                listmodel11.setProperty(10,"checkstatus",CarMsg.chargeCurrentTempMaxAbortAlarm);
                listmodel12.setProperty(0,"checkstatus",CarMsg.batTempMaxAlarm);
                listmodel12.setProperty(1,"checkstatus",CarMsg.batTempMaxAbortAlarm);
                listmodel12.setProperty(2,"checkstatus",CarMsg.dropoutVoltageMaxAlarm);
                listmodel12.setProperty(3,"checkstatus",CarMsg.dropoutVoltageMaxAbortAlarm);
                listmodel12.setProperty(4,"checkstatus",CarMsg.chargeVoltageMaxAlarm);
                listmodel12.setProperty(5,"checkstatus",CarMsg.batTempDifferentAlarm);
                listmodel12.setProperty(6,"checkstatus",CarMsg.batChargeTempMinAbortAlarm);
                listmodel12.setProperty(7,"checkstatus",CarMsg.batChargeTempMinAlarm);
                listmodel12.setProperty(8,"checkstatus",CarMsg.socMinAlarm);
                listmodel12.setProperty(9,"checkstatus",CarMsg.socMaxAlarm);
                listmodel12.setProperty(10,"checkstatus",CarMsg.batModuleCommunicationFail);
                listmodel13.setProperty(0,"checkstatus",CarMsg.bmsSystemFault);
                listmodel13.setProperty(1,"checkstatus",CarMsg.batteryFault);
                listmodel13.setProperty(2,"checkstatus",CarMsg.energyRecoveryCurrentMaxAlarm);
                listmodel13.setProperty(3,"checkstatus",CarMsg.energyRecoveryVoltageMaxAlarm);
                listmodel13.setProperty(4,"checkstatus",CarMsg.energyRecoveryVoltageMaxAbort);
                listmodel13.setProperty(5,"checkstatus",CarMsg.energyRecoveryCancel);
                listmodel13.setProperty(6,"checkstatus",CarMsg.socJumpAlarm);
                listmodel13.setProperty(7,"checkstatus",CarMsg.mismatchingAlarm);
                listmodel13.setProperty(8,"checkstatus",CarMsg.vehicleMountedTypeMax);
                listmodel13.setProperty(9,"checkstatus",CarMsg.vehicleMountedTypeMin);
                listmodel13.setProperty(10,"checkstatus",CarMsg.vehicleMountedTypeOvercharge);
            }else if((battery_model.count !==0)){
                for(var i=0;i<10;i++){
                    listmodel1.setProperty(i,"value",battery_model.get(i).voltage);
                }
                for(var j=10;j<20;j++){
                    listmodel2.setProperty(j-10,"value",battery_model.get(j).voltage);
                }
                for(var k=20;k<30;k++){
                    listmodel3.setProperty(k-20,"value",battery_model.get(k).voltage);
                }
                for(var l=30;l<40;l++){
                    listmodel4.setProperty(l-30,"value",battery_model.get(l).voltage);
                }
                for(var m=40;m<50;m++){
                    listmodel5.setProperty(m-40,"value",battery_model.get(m).voltage);
                }
                for(var n=50;n<60;n++){
                    listmodel6.setProperty(n-50,"value",battery_model.get(n).voltage);
                }
                if(temperature_model.count !== 0){
                    for(var o=0;o<10;o++){
                        listmodel7.setProperty(o,"value",temperature_model.get(o).temperature);
                    }
                    for(var p=10;p<20;p++){
                        listmodel8.setProperty(p-10,"value",temperature_model.get(p).temperature);
                    }
                }else{}
            }else{}
        }
    }
    onCarLoadCurrentIndexChanged: {
        if(carLoadCurrentIndex === 0){
            CarMsg.sendMenuInfo(23,0);
        }else if(carLoadCurrentIndex === 1){
            CarMsg.sendMenuInfo(25,1);
        }else if(carLoadCurrentIndex === 2){
            CarMsg.sendMenuInfo(25,2);
        }else if(carLoadCurrentIndex === 3){
            CarMsg.sendMenuInfo(25,3);
        }else if(carLoadCurrentIndex === 4){
            CarMsg.sendMenuInfo(25,4);
        }else if(carLoadCurrentIndex === 5){
            CarMsg.sendMenuInfo(25,5);
        }else if(carLoadCurrentIndex === 6){
            CarMsg.sendMenuInfo(25,6);
        }else if(carLoadCurrentIndex === 7){
            CarMsg.sendMenuInfo(25,7);
        }else if(carLoadCurrentIndex === 8){
            CarMsg.sendMenuInfo(25,8);
        }else if(carLoadCurrentIndex === 9){
            CarMsg.sendMenuInfo(25,9);
        }else if(carLoadCurrentIndex === 10){
            CarMsg.sendMenuInfo(25,10);
        }else if(carLoadCurrentIndex === 11){
            CarMsg.sendMenuInfo(24,0);
        }else if(carLoadCurrentIndex === 12){
            CarMsg.sendMenuInfo(24,0);
        }else{}
    }
    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
            UiController.currentLayerId = "closeMoter";
            bKeyEnable = false;
        }
    }
    previousMenu: function(){
        if(bKeyEnable){
            if(carLoadCurrentIndex === 0){
                carLoadCurrentIndex = carLoadTitleArray.length-1;
            }else{
                carLoadCurrentIndex--;
            }
        }else{}
    }
    nextMenu: function(){
        if(bKeyEnable){
            if(carLoadCurrentIndex === carLoadTitleArray.length-1){
                carLoadCurrentIndex = 0;
            }else{
                carLoadCurrentIndex++;
            }
        }else{}
    }
    TextFieldWeir {
        id: title
        textValue: carLoadTitleArray[carLoadCurrentIndex]
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    ListModel {
        id: listmodel1
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel2
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel3
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel4
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel5
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel6
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel7
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel8
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel9
        ListElement { name: "bms程序版本号";value: "";unit: "" }
        ListElement { name: "bms模块总数量";value: "";unit: "" }
        ListElement { name: "动力电池类型";value: "";unit: "" }
        ListElement { name: "单体电池最高电圧";value: "";unit: "V" }
        ListElement { name: "电池组最高温度";value: "";unit: "℃" }
        ListElement { name: "电池组当前电量";value: "";unit: "kwh" }
        ListElement { name: "正极绝缘电阻阻值";value: "";unit: "kΩ" }
        ListElement { name: "单体电池总数";value: "";unit: "" }
        ListElement { name: "可充电储能系统温度探针个数";value: "";unit: "" }
        ListElement { name: "充电插座直流电源正极温度";value: "";unit: "℃" }
        ListElement { name: "充电插座直流电源负极温度";value: "";unit: "℃" }
    }
    ListModel {
        id: listmodel10
        ListElement { name: "动力电池充电次数";value: "";unit: "" }
        ListElement { name: "bms的life值";value: "";unit: "" }
        ListElement { name: "电池组最低温度";value: "";unit: "℃" }
        ListElement { name: "单体电池最低电压";value: "";unit: "" }
        ListElement { name: "bms管控状态";value: "";unit: "" }
        ListElement { name: "负极绝缘电阻阻值";value: "";unit: "kΩ" }
        ListElement { name: "充电状态";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
        ListElement { name: "";value: "";unit: "" }
    }
    ListModel {
        id: listmodel11
        ListElement { name: "单体电压过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压过高截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压过低截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "峰值充电电流过大";value: "";unit: "";checkstatus: false }
        ListElement { name: "峰值放电电流过大";value: "";unit: "";checkstatus: false }
        ListElement { name: "峰值放电电流过大截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池放电温度过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池放电温度过低截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电温度过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电温度过高截止报警";value: "";unit: "";checkstatus: false }
    }
    ListModel {
        id: listmodel12
        ListElement { name: "电池温度过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池温度过高截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压压差过大报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压压差过大截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电电压过高";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池温度差异报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电温度过低截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池充电温度过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池SOC过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池SOC过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池模块通讯失效";value: "";unit: "";checkstatus: false }
    }
    ListModel {
        id: listmodel13
        ListElement { name: "BMS系统故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力蓄电池故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "制动能量回收电流过大报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "制动能量回收单体电压过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "制动能量回收单体电压过高截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "取消制动能量回收功能";value: "";unit: "";checkstatus: false }
        ListElement { name: "SOC跳变报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "可充电储能系统不匹配报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "车载储能装置类型过压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "车载储能装置类型欠压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "车载储能装置类型过充";value: "";unit: "";checkstatus: false }
    }
    TurnPageWeir {
        id: turn_page
        width: 100
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 360
        anchors.top: parent.top
        anchors.topMargin: 110
        fontSize: 15
        currentPageIndex: (carLoadCurrentIndex+1)
        totalPageCount: carLoadTitleArray.length
    }
    TextFieldWeir {
        x: 940
        y: 160
        visible: (carLoadCurrentIndex<=10)&&(carLoadCurrentIndex>0) ? true : false
        textValue: "(单位：V)"
        width: 50
        height: 30
        textHeight: 30
        fontSize: 12
        fontColor: "#00a7f5"
    }
    TextFieldWeir {
        x: 940
        y: 330
        z: 3
        visible: (carLoadCurrentIndex<=10)&&(carLoadCurrentIndex>0) ? true : false
        textValue: "(单位：℃)"
        width: 50
        height: 30
        textHeight: 30
        fontSize: 12
        fontColor: "#00a7f5"
    }
    //电池组信息
    ColumnLayout {
        z: 1
        visible: (carLoadCurrentIndex<=10)&&(carLoadCurrentIndex>0) ? true : false
        width: 650
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 120
        spacing: -150
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "01~10"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel1
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 0
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "11~20"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel2
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "21~30"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel3
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 1
                textValue: "31~40"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel4
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "41~50"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel5
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "51~60"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel6
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        Item { width: parent.width; height: 30 }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "01~10"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel7
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "11~20"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel8
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
    }
    //电池管理系统
    RowLayout{
        visible: carLoadCurrentIndex === 0 ? true : false
        width: 600
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 30
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel9
                delegate: TextValueWeir {
                    width: 280
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    titleColor: "#00a7f5"
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel10
                delegate: TextValueWeir {
                    width: 280
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    titleColor: "#00a7f5"
                    fontSize: 12
                }
            }
        }
    }
    //动力电池诊断系统
    RowLayout{
        visible: carLoadCurrentIndex === 11 ? true : false
        width: 600
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 40
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 10
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel11
                delegate: TextRadioWeir {
                    width: 280
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel12
                delegate: TextRadioWeir {
                    width: 280
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
    }
    RowLayout{
        visible: carLoadCurrentIndex === 12 ? true : false
        width: 600
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 40
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 10
        ColumnLayout {
            width: parent.width
            height: parent.height
            anchors.left: parent.left
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel13
                delegate: TextRadioWeir {
                    width: 280
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
    }
}

import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "VcuSystemMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property var carLoadTitleArray: ["整车控制系统","整车控制系统诊断页面"]
    property int carLoadCurrentIndex: 0
    property bool bKeyEnable: false
    property int driveSystemStatus: CarMsg.driveSystemStatus
    property int driveMotorStatus: CarMsg.driveMotorStatus
    property int mechanicalBrakeStatus: CarMsg.mechanicalBrakeStatus
    property bool keyAcc: CarMsg.keyAcc
    property bool keyOn: CarMsg.keyOn
    property bool highVoltageInterLock: CarMsg.highVoltageInterLock
    property bool highVoltagePowerUp: CarMsg.highVoltagePowerUp
    property bool airCompressorWork: CarMsg.airCompressorWork
    property bool boosterPumpWork: CarMsg.boosterPumpWork
    property real airCompressorMotorSpeed: CarMsg.airCompressorMotorSpeed
    property real steeringAssistMotorSpeed: CarMsg.steeringAssistMotorSpeed
    property int steeringAssistMotorTemp: CarMsg.steeringAssistMotorTemp
    property int airCompressorMotorTemp: CarMsg.airCompressorMotorTemp
    property int airCompressorControlTemp: CarMsg.airCompressorControlTemp
    property int steeringControlDeviceTemp: CarMsg.steeringControlDeviceTemp
    property real airPress3: CarMsg.airPress3
    property real airPress4: CarMsg.airPress4
    property real airPress5: CarMsg.airPress5
    property int highestAlarmGrade: CarMsg.highestAlarmGrade
    property int faultAlarmSituation: CarMsg.faultAlarmSituation
    property int driveGearsMode: CarMsg.driveGearsMode
    property int bduSwitch: CarMsg.bduSwitch

    property bool driveFaultAlarm: CarMsg.driveFaultAlarm
    property bool controlOvervoltageAlarm: CarMsg.controlOvervoltageAlarm
    property bool controlUndervoltageAlarm: CarMsg.controlUndervoltageAlarm
    property bool controlEncodingFault: CarMsg.controlEncodingFault
    property bool controlHighTempAlarm: CarMsg.controlHighTempAlarm
    property bool controlHighTempAbortAlarm: CarMsg.controlHighTempAbortAlarm
    property bool controlMainContactorFault: CarMsg.controlMainContactorFault
    property bool controlOvercurrentAlarm: CarMsg.controlOvercurrentAlarm
    property bool motorHighTempAlarm: CarMsg.motorHighTempAlarm
    property bool motorHigtTempAbortAlarm: CarMsg.motorHigtTempAbortAlarm
    property bool motorRotaryFault: CarMsg.motorRotaryFault
    property bool controlMotorPowerLimitation: CarMsg.controlMotorPowerLimitation
    property bool motorRotaryLimitation: CarMsg.motorRotaryLimitation
    property bool motorWaterTempOvertop: CarMsg.motorWaterTempOvertop
    property bool acceleratorPedalFault: CarMsg.acceleratorPedalFault
    property bool brakePedalFaule: CarMsg.brakePedalFaule
    property bool seatbeltAlarm: CarMsg.seatbeltAlarm
    property bool seatSwitchAlarm: CarMsg.seatSwitchAlarm
    property bool controlRightDoorsOpenAlarm: CarMsg.controlRightDoorsOpenAlarm
    property bool controlLeftDoorsOpenAlarm: CarMsg.controlLeftDoorsOpenAlarm
    property bool chauffeurDoorsNotClose: CarMsg.chauffeurDoorsNotClose
    property bool highTensionSwitchOpen: CarMsg.highTensionSwitchOpen
    property bool chargeDoorOpen: CarMsg.chargeDoorOpen
    property bool safetyDoorOpen: CarMsg.safetyDoorOpen
    property bool lowVoltageSwitchOpen: CarMsg.lowVoltageSwitchOpen
    property bool absSystemFault: CarMsg.absSystemFault
    property bool airCompressorControlHighTemp: CarMsg.airCompressorControlHighTemp
    property bool airCompressorMotorHighTemp: CarMsg.airCompressorMotorHighTemp
    property bool boosterPumpControlHighTemp: CarMsg.boosterPumpControlHighTemp
    property bool boosterPumpMotorHighTemp: CarMsg.boosterPumpMotorHighTemp
    property string vcuVersion: CarMsg.vcuVersion.toFixed(1)
    property string vcuLife: CarMsg.vcuLife.toFixed(0)


    //整车控制系统
    onDriveSystemStatusChanged: {
        if(driveSystemStatus === 0){
            listmodelone.setProperty(0,"value","READY");
        }else if(driveSystemStatus === 1){
            listmodelone.setProperty(0,"value","WAIT");
        }else if(driveSystemStatus === 2){
            listmodelone.setProperty(0,"value","STOP");
        }else{
            listmodelone.setProperty(0,"value","无效");
        }
    }
    onDriveMotorStatusChanged: {
        if((driveMotorStatus & 0x01) === 0){
            motor1.textValue = "正常工作";
        }else{
            motor1.textValue = "电机停机";
        }
        if((driveMotorStatus & 0x02) === 0){
            motor2.textValue = "非回收状态";
        }else{
            motor2.textValue = "能量回收";
        }
        if((driveMotorStatus & 0x03) === 0){
            motor3.textValue = "非零速锁定";
        }else{
            motor3.textValue = "零速锁定";
        }
        if((driveMotorStatus & 0x04) === 0){
            motor4.textValue = "非定速状态";
        }else{
            motor4.textValue = "定速巡航模式";
        }
    }
    onMechanicalBrakeStatusChanged: {
        if((mechanicalBrakeStatus & 0x01) === 0){
            system1.textValue = "无";
        }else{
            system1.textValue = "制动";
        }
        if((mechanicalBrakeStatus & 0x02) === 0){
            system2.textValue = "无";
        }else{
            system2.textValue = "制动";
        }
    }
    onKeyAccChanged: {
        if(keyAcc === true){
            listmodelone.setProperty(2,"value","关闭");
        }else{
            listmodelone.setProperty(2,"value","开启");
        }
    }
    onKeyOnChanged: {
        if(keyOn === true){
            listmodeltwo.setProperty(0,"value","关闭");
        }else{
            listmodeltwo.setProperty(0,"value","开启");
        }
    }
    onHighVoltageInterLockChanged: {
        if(highVoltageInterLock === true){
            listmodelone.setProperty(3,"value","互锁状态");
        }else{
            listmodelone.setProperty(3,"value","非互锁");
        }
    }
    onHighVoltagePowerUpChanged: {
        if(highVoltagePowerUp === true){
            listmodeltwo.setProperty(1,"value","下电");
        }else{
            listmodeltwo.setProperty(1,"value","上电");
        }
    }
    onAirCompressorWorkChanged: {
        if(airCompressorWork === true){
            listmodelone.setProperty(4,"value","停止");
        }else{
            listmodelone.setProperty(4,"value","启动");
        }
    }
    onBoosterPumpWorkChanged: {
        if(boosterPumpWork === true){
            listmodeltwo.setProperty(2,"value","停止");
        }else{
            listmodeltwo.setProperty(2,"value","启动");
        }
    }
    onAirCompressorMotorSpeedChanged: {
        listmodelone.setProperty(5,"value",airCompressorMotorSpeed.toFixed(1));
    }
    onSteeringAssistMotorSpeedChanged: {
        listmodeltwo.setProperty(3,"value",steeringAssistMotorSpeed.toFixed(1));
    }
    onSteeringAssistMotorTempChanged: {
        listmodeltwo.setProperty(4,"value",steeringAssistMotorTemp.toFixed(0));
    }
    onAirCompressorMotorTempChanged: {
        listmodelone.setProperty(6,"value",airCompressorMotorTemp.toFixed(0));
    }
    onAirCompressorControlTempChanged: {
        listmodelone.setProperty(7,"value",airCompressorControlTemp.toFixed(0));
    }
    onSteeringControlDeviceTempChanged: {
        listmodeltwo.setProperty(5,"value",steeringControlDeviceTemp.toFixed(0));
    }
    onAirPress3Changed: {
        listmodelone.setProperty(8,"value",airPress3.toFixed(1));
    }
    onAirPress4Changed: {
        listmodelone.setProperty(9,"value",airPress4.toFixed(1));
    }
    onAirPress5Changed: {
        listmodelone.setProperty(10,"value",airPress5.toFixed(1));
    }
    onHighestAlarmGradeChanged: {
        if(highestAlarmGrade === 0){
            listmodeltwo.setProperty(6,"value","无故障");
        }else if(highestAlarmGrade === 1){
            listmodeltwo.setProperty(6,"value","1级故障");
        }else if(highestAlarmGrade === 2){
            listmodeltwo.setProperty(6,"value","2级故障");
        }else if(highestAlarmGrade === 3){
            listmodeltwo.setProperty(6,"value","3级故障");
        }else{
            listmodeltwo.setProperty(6,"value","异常");
        }
    }
    onFaultAlarmSituationChanged: {
        if(faultAlarmSituation === 0){
            listmodeltwo.setProperty(7,"value","正常");
        }else if(faultAlarmSituation === 1){
            listmodeltwo.setProperty(7,"value","光报警");
        }else if(faultAlarmSituation === 2){
            listmodeltwo.setProperty(7,"value","光和声报警");
        }else{}
    }
    onDriveGearsModeChanged: {
        if(driveGearsMode === 0){
            listmodeltwo.setProperty(8,"value","直驱模式");
        }else if(driveGearsMode === 1){
            listmodeltwo.setProperty(8,"value","AMT模式");
        }else if(driveGearsMode === 2){
            listmodeltwo.setProperty(8,"value","CVT模式");
        }else{
            listmodeltwo.setProperty(8,"value","轮边驱动模式");
        }
    }
    onBduSwitchChanged: {
        if(bduSwitch === 0){
            bdu.textValue = "无请求";
        }else if(bduSwitch === 1){
            bdu.textValue = "上电命令";
        }else{
            bdu.textValue = "下电命令";
        }
    }
    //整车控制系统诊断信息
    onDriveFaultAlarmChanged: {
        listmodelthree.setProperty(0,"checkstatus",driveFaultAlarm);
    }
    onControlOvervoltageAlarmChanged: {
        listmodelthree.setProperty(1,"checkstatus",controlOvervoltageAlarm);
    }
    onControlUndervoltageAlarmChanged: {
        listmodelthree.setProperty(2,"checkstatus",controlUndervoltageAlarm);
    }
    onControlEncodingFaultChanged: {
        listmodelthree.setProperty(3,"checkstatus",controlEncodingFault);
    }
    onControlHighTempAlarmChanged: {
        listmodelthree.setProperty(4,"checkstatus",controlHighTempAlarm);
    }
    onControlHighTempAbortAlarmChanged: {
        listmodelthree.setProperty(5,"checkstatus",controlHighTempAbortAlarm);
    }
    onControlMainContactorFaultChanged: {
        listmodelthree.setProperty(6,"checkstatus",controlMainContactorFault);
    }
    onControlOvercurrentAlarmChanged: {
        listmodelthree.setProperty(7,"checkstatus",controlOvercurrentAlarm);
    }
    onMotorHighTempAlarmChanged: {
        listmodelthree.setProperty(8,"checkstatus",motorHighTempAlarm);
    }
    onMotorHigtTempAbortAlarmChanged: {
        listmodelthree.setProperty(9,"checkstatus",motorHigtTempAbortAlarm);
    }
    onMotorRotaryFaultChanged: {
        listmodelthree.setProperty(10,"checkstatus",motorRotaryFault);
    }
    onControlMotorPowerLimitationChanged: {
        listmodelfour.setProperty(0,"checkstatus",controlMotorPowerLimitation);
    }
    onMotorRotaryLimitationChanged: {
        listmodelfour.setProperty(1,"checkstatus",motorRotaryLimitation);
    }
    onMotorWaterTempOvertopChanged: {
        listmodelfour.setProperty(2,"checkstatus",motorWaterTempOvertop);
    }
    onAcceleratorPedalFaultChanged: {
        listmodelfour.setProperty(3,"checkstatus",acceleratorPedalFault);
    }
    onBrakePedalFauleChanged: {
        listmodelfour.setProperty(4,"checkstatus",brakePedalFaule);
    }
    onSeatbeltAlarmChanged: {
        listmodelfour.setProperty(5,"checkstatus",seatbeltAlarm);
    }
    onSeatSwitchAlarmChanged: {
        listmodelfour.setProperty(6,"checkstatus",seatSwitchAlarm);
    }
    onControlRightDoorsOpenAlarmChanged: {
        listmodelfour.setProperty(7,"checkstatus",controlRightDoorsOpenAlarm);
    }
    onControlLeftDoorsOpenAlarmChanged: {
        listmodelfour.setProperty(8,"checkstatus",controlLeftDoorsOpenAlarm);
    }
    onChauffeurDoorsNotCloseChanged: {
        listmodelfour.setProperty(9,"checkstatus",chauffeurDoorsNotClose);
    }
    onHighTensionSwitchOpenChanged: {
        listmodelfour.setProperty(10,"checkstatus",highTensionSwitchOpen);
    }
    onChargeDoorOpenChanged: {
        listmodelfive.setProperty(0,"checkstatus",chargeDoorOpen);
    }
    onSafetyDoorOpenChanged: {
        listmodelfive.setProperty(1,"checkstatus",safetyDoorOpen);
    }
    onLowVoltageSwitchOpenChanged: {
        listmodelfive.setProperty(2,"checkstatus",lowVoltageSwitchOpen);
    }
    onAbsSystemFaultChanged: {
        listmodelfive.setProperty(3,"checkstatus",absSystemFault);
    }
    onAirCompressorControlHighTempChanged: {
        listmodelfive.setProperty(4,"checkstatus",airCompressorControlHighTemp);
    }
    onAirCompressorMotorHighTempChanged: {
        listmodelfive.setProperty(5,"checkstatus",airCompressorMotorHighTemp);
    }
    onBoosterPumpControlHighTempChanged: {
        listmodelfive.setProperty(6,"checkstatus",boosterPumpControlHighTemp);
    }
    onBoosterPumpMotorHighTempChanged: {
        listmodelfive.setProperty(7,"checkstatus",boosterPumpMotorHighTemp);
    }
    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
            carLoadCurrentIndex = 0;
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
    onCarLoadCurrentIndexChanged: {
        if(carLoadCurrentIndex === 0){
            CarMsg.sendMenuInfo(21,0);
        }else if(carLoadCurrentIndex === 1){
            CarMsg.sendMenuInfo(22,0);
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
    ListModel {
        id: listmodelone
        //脚刹 无 手刹 无
        ListElement { name: "驱动系统状态";value: "READY";unit: "" }
        //正常工作 非回收 非零锁 非定速
        ListElement { name: "驱动电机状态";value: "";unit: "" }
        ListElement { name: "钥匙acc档";value: "关闭";unit: "" }
        ListElement { name: "高压互锁状态";value: "互锁";unit: "" }
        ListElement { name: "空压机工作状态";value: "停止";unit: "" }
        ListElement { name: "空压机电机转速";value: "0";unit: "r/min" }
        ListElement { name: "空压机电机温度";value: "0";unit: "℃" }
        ListElement { name: "空压控制器温度";value: "0";unit: "℃" }
        ListElement { name: "气压3";value: "0";unit: "mpa" }
        ListElement { name: "气压4";value: "0";unit: "mpa" }
        ListElement { name: "气压5";value: "0";unit: "mpa" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "钥匙on档";value: "关闭";unit: "" }
        ListElement { name: "高压上电状态";value: "下电";unit: "" }
        ListElement { name: "助力泵工作状态";value: "停止";unit: "" }
        ListElement { name: "转向助力电机转速";value: "0";unit: "r/min" }
        ListElement { name: "转向助力电机温度";value: "0";unit: "℃" }
        ListElement { name: "转向控制器温度";value: "0";unit: "℃" }
        ListElement { name: "最高报警等级";value: "无故障";unit: "" }
        ListElement { name: "故障报警形式";value: "正常";unit: "" }
        ListElement { name: "档位驱动模式";value: "直驱模式";unit: "" }
    }
    ListModel {
        id: listmodelthree
        ListElement { name: "驱动系统故障报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器过压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器欠压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器编码器故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器高温截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器主接触器故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器过流报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动电机高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动电机高温截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动电机旋转故障报警";value: "";unit: "";checkstatus: false }
    }
    ListModel {
        id: listmodelfour
        ListElement { name: "驱动电机功率受限报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动电机转矩首先报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动电机水温过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "加速踏板信号值异常报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "刹车踏板信号值异常报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "安全带报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "座椅开关报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "右侧舱门开启报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "左侧舱门开启报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "司机门未关报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "高压开关门开启报警";value: "";unit: "";checkstatus: false }
    }
    ListModel {
        id: listmodelfive
        ListElement { name: "充电门开启报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "安全门开启报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "低压开关门开启报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "ABS系统故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "空压机控制器高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "空压机电机高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "助力泵控制器高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "助力泵电机高温报警";value: "";unit: "";checkstatus: false }
    }
    //整车控制系统
    RowLayout {
        width: 560
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 50
        visible: carLoadCurrentIndex === 0 ? true : false
        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 12
            titleColorList: "#00a7f5"
            listViewSpacing: 25
            unitWidthList: 40
        }
        ListViewWeir {
            anchors.top: parent.top
            anchors.topMargin: 50
            listModel: listmodeltwo
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 12
            titleColorList: "#00a7f5"
            listViewSpacing: 25
            unitWidthList: 40
        }
    }
    RowLayout{
        visible: carLoadCurrentIndex === 0 ? true : false
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.right: parent.right
        anchors.rightMargin: 540
        spacing: 25
        TextValueWeir {
            id: system1
            width: 90
            height: 30
            textTitle: "脚刹"
            textValue: "制动"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 90
            fontSize: 12
        }
        TextValueWeir {
            id: system2
            width: 90
            height: 30
            textTitle: "手刹"
            textValue: "制动"
            unitValue: ""
            titleColor: "#00a7f5"
            textWidth: 90
            fontSize: 12
        }
    }
    RowLayout{
        visible: carLoadCurrentIndex === 0 ? true : false
        anchors.top: parent.top
        anchors.topMargin: 175
        anchors.right: parent.right
        anchors.rightMargin: 560
        spacing: 25
        TextFieldWeir {
            id: motor1
            textValue: "正常工作"
            width: 60
            height: 30
            fontSize: 12
            fontBold: true
        }
        TextFieldWeir {
            id: motor2
            textValue: "非回收状态"
            width: 60
            height: 30
            fontSize: 12
            fontBold: true
        }
        TextFieldWeir {
            id: motor3
            textValue: "非零速锁定"
            width: 60
            height: 30
            fontSize: 12
            fontBold: true
        }
        TextFieldWeir {
            id: motor4
            textValue: "非定速状态"
            width: 60
            height: 30
            fontSize: 12
            fontBold: true
        }
    }
    TextValueWeir {
        id: bdu
        visible: carLoadCurrentIndex === 0 ? true : false
        width: 360
        height: 20
        anchors.left: parent.left
        anchors.leftMargin: 440
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 105
        textTitle: "bdu箱内主回路继电器上下电命令"
        textValue: "无请求"
        unitValue: ""
        titleColor: "#00a7f5"
        textWidth: 360
        fontSize: 12
    }
    //整车控制诊断信息
    RowLayout {
        width: 560
        height: 360
        visible: carLoadCurrentIndex === 1 ? true : false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -20
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 20
        ColumnLayout {
            width: parent.width/3
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodelthree
                delegate: TextRadioWeir {
                    width: 180
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/3
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodelfour
                delegate: TextRadioWeir {
                    width: 180
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/3
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodelfive
                delegate: TextRadioWeir {
                    width: 180
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
            ColumnLayout{
                anchors.top: parent.top
                anchors.topMargin: 200
                anchors.right: parent.right
                spacing: -5
                TextValueWeir {
                    width: 180
                    height: 30
                    textTitle: "VCU程序版本号"
                    textValue: vcuVersion
                    unitValue: ""
                    titleColor: "#00a7f5"
                    textWidth: 180
                    fontSize: 12
                }
                TextValueWeir {
                    width: 180
                    height: 30
                    textTitle: "VCU系统Life值"
                    textValue: vcuLife
                    unitValue: ""
                    titleColor: "#00a7f5"
                    textWidth: 180
                    fontSize: 12
                }
                TextValueWeir {
                    width: 180
                    height: 30
                    textTitle: "沂星CAN通信协议"
                    textValue: "5.2"
                    unitValue: ""
                    titleColor: "#00a7f5"
                    textWidth: 180
                    fontSize: 12
                }
            }
        }
    }
}

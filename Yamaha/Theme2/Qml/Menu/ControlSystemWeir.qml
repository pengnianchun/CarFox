import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

//整车控制系统
MenuItem {
    x: 360
    y: 130
    width: 750
    height: 350

    parentMenuId: "MenuMainDetail"
    menuLayerId: "ControlSystem"

    property int currentIndex: 0

    enterMenu: function(){
        // Do nothing
    }
    hideMenu: function(){
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){
        //上一页
        currentIndex = (currentIndex + 1) % 2
    }
    nextMenu: function(){
        //下一页
        currentIndex = (currentIndex - 1) % 2
    }

    // 9.整车控制系统信息帧
    property int driveSystemStatus: CarMsg.driveSystemStatus //驱动系统状态
    property int driveMotorStatus: CarMsg.driveMotorStatus //驱动电机状态
    property int mechanicalBrakeStatus: CarMsg.mechanicalBrakeStatus //机械制动状态(手刹/脚刹)
    property bool keyAcc: CarMsg.keyAcc //钥匙ACC档
    property bool keyOn: CarMsg.keyOn //钥匙ON档
    property bool highVoltageInterLock: CarMsg.highVoltageInterLock //高压互锁状态
    property bool highVoltagePowerUp: CarMsg.highVoltagePowerUp //高压上电状态
    property bool airCompressorWork: CarMsg.airCompressorWork //空压机工作状态
    property bool boosterPumpWork: CarMsg.boosterPumpWork //助力泵工作状态
    property real airCompressorMotorSpeed: CarMsg.airCompressorMotorSpeed //空压机电机转速
    property real steeringAssistMotorSpeed: CarMsg.steeringAssistMotorSpeed //转向助力电机转速
    property int steeringAssistMotorTemp: CarMsg.steeringAssistMotorTemp //转向助力电机温度
    property int airCompressorMotorTemp: CarMsg.airCompressorMotorTemp //空压机电机温度
    property int airCompressorControlTemp: CarMsg.airCompressorControlTemp //空压控制器温度
    property int steeringControlDeviceTemp: CarMsg.steeringControlDeviceTemp //转向控制器温度
    property real airPress3: CarMsg.airPress3 //气压3
    property real airPress4: CarMsg.airPress4 //气压4
    property real airPress5: CarMsg.airPress5 //气压5
    property int highestAlarmGrade: CarMsg.highestAlarmGrade //最高报警等级
    property int faultAlarmSituation: CarMsg.faultAlarmSituation //故障报警形式
    property int driveGearsMode: CarMsg.driveGearsMode //档位驱动模式
    property int bduSwitch: CarMsg.bduSwitch //BDU箱内主回路继电器上下电命令

    // 10.整车控制系统诊断信息帧(报警帧)
    property bool driveFaultAlarm: CarMsg.driveFaultAlarm //驱动系统故障报警
    property bool controlOvervoltageAlarm: CarMsg.controlOvervoltageAlarm //驱动控制器过压报警
    property bool controlUndervoltageAlarm: CarMsg.controlUndervoltageAlarm //驱动控制器欠压报警
    property bool controlEncodingFault: CarMsg.controlEncodingFault //驱动控制器编码故障
    property bool controlHighTempAlarm: CarMsg.controlHighTempAlarm //驱动控制器高温报警
    property bool controlHighTempAbortAlarm: CarMsg.controlHighTempAbortAlarm //驱动控制器高温截止报警
    property bool controlMainContactorFault: CarMsg.controlMainContactorFault //驱动控制器主接触器故障
    property bool controlOvercurrentAlarm: CarMsg.controlOvercurrentAlarm //驱动控制器过流报警
    property bool motorHighTempAlarm: CarMsg.motorHighTempAlarm //驱动电机高温报警
    property bool motorHigtTempAbortAlarm: CarMsg.motorHigtTempAbortAlarm //驱动电机高温截止报警
    property bool motorRotaryFault: CarMsg.motorRotaryFault //驱动电机旋变故障报警
    property bool controlMotorPowerLimitation: CarMsg.controlMotorPowerLimitation //驱动电机功率受限报警
    property bool motorRotaryLimitation: CarMsg.motorRotaryLimitation //驱动电机转矩受限报警
    property bool motorWaterTempOvertop: CarMsg.motorWaterTempOvertop //驱动电机水温过高报警
    property bool acceleratorPedalFault: CarMsg.acceleratorPedalFault //加速踏板信号值异常报警
    property bool brakePedalFaule: CarMsg.brakePedalFaule //刹车踏板信号值异常报警
    property bool seatbeltAlarm: CarMsg.seatbeltAlarm //安全带报警
    property bool seatSwitchAlarm: CarMsg.seatSwitchAlarm //座椅开关报警
    property bool controlRightDoorsOpenAlarm: CarMsg.controlRightDoorsOpenAlarm //右侧舱门开启报警
    property bool controlLeftDoorsOpenAlarm: CarMsg.controlLeftDoorsOpenAlarm //左侧舱门开启报警
    property bool chauffeurDoorsNotClose: CarMsg.chauffeurDoorsNotClose //司机门未关报警
    property bool highTensionSwitchOpen: CarMsg.highTensionSwitchOpen //高压开关门开启报警
    property bool chargeDoorOpen: CarMsg.chargeDoorOpen //充电门开启报警
    property bool safetyDoorOpen: CarMsg.safetyDoorOpen //安全门开启报警
    property bool lowVoltageSwitchOpen: CarMsg.lowVoltageSwitchOpen //低压开关门开启报警
    property bool absSystemFault: CarMsg.absSystemFault //ABS系统故障
    property bool airCompressorControlHighTemp: CarMsg.airCompressorControlHighTemp //空压机控制器高温报警
    property bool airCompressorMotorHighTemp: CarMsg.airCompressorMotorHighTemp //空压机电机高温报警
    property bool boosterPumpControlHighTemp: CarMsg.boosterPumpControlHighTemp //助力泵控制器高温报警
    property bool boosterPumpMotorHighTemp: CarMsg.boosterPumpMotorHighTemp //助力泵电机高温报警
    property string vcuVersion: CarMsg.vcuVersion.toFixed(1) //VCU程序版本号
    property string vcuLife: CarMsg.vcuLife.toFixed(0) //VCU系统Life值

    //#ListModelOne
    onDriveSystemStatusChanged: { //驱动系统状态
        if (driveSystemStatus === 0) {
            listmodelone.setProperty(0, "value", "READY");
        } else if (driveSystemStatus === 1){
            listmodelone.setProperty(0, "value", "WAIT");
        } else if (driveSystemStatus === 2){
            listmodelone.setProperty(0, "value", "STOP");
        } else {
            listmodelone.setProperty(0, "value", "无效");
        }
    }
    onDriveMotorStatusChanged: { //驱动电机状态#SP
        if ((driveMotorStatus & 0x01) === 0) {
            motor1.textValue = "正常工作";
        } else {
            motor1.textValue = "电机停机";
        }
        if ((driveMotorStatus & 0x02) === 0) {
            motor2.textValue = "非回收状态";
        } else {
            motor2.textValue = "能量回收";
        }
        if ((driveMotorStatus & 0x03) === 0) {
            motor3.textValue = "非零速锁定";
        } else {
            motor3.textValue = "零速锁定";
        }
        if ((driveMotorStatus & 0x04) === 0) {
            motor4.textValue = "非定速状态";
        } else {
            motor4.textValue = "定速巡航模式";
        }
    }
    onMechanicalBrakeStatusChanged: { //机械制动状态#SP
        if ((mechanicalBrakeStatus & 0x01) === 0) {
            system1.textValue = "无";
        } else {
            system1.textValue = "制动";
        }
        if ((mechanicalBrakeStatus & 0x02) === 0) {
            system2.textValue = "无";
        } else {
            system2.textValue = "制动";
        }
    }
    onKeyAccChanged: { //钥匙ACC档
        if (keyAcc === true) {
            listmodelone.setProperty(3, "value", "关闭");
        } else {
            listmodelone.setProperty(3, "value", "开启");
        }
    }
    onKeyOnChanged: { //钥匙ON档
        if (keyOn === true) {
            listmodelone.setProperty(4, "value", "关闭");
        } else {
            listmodelone.setProperty(4, "value", "开启");
        }
    }
    onHighVoltageInterLockChanged: { //高压互锁状态
        if (highVoltageInterLock === true) {
            listmodelone.setProperty(5, "value", "互锁状态");
        } else {
            listmodelone.setProperty(5, "value", "非互锁");
        }
    }
    onHighVoltagePowerUpChanged: { //高压上电状态
        if (highVoltagePowerUp === true) {
            listmodelone.setProperty(6, "value", "下电");
        } else {
            listmodelone.setProperty(6, "value", "上电");
        }
    }
    onAirCompressorWorkChanged: { //空压机工作状态
        if (airCompressorWork === true) {
            listmodelone.setProperty(7, "value", "停止");
        } else {
            listmodelone.setProperty(7, "value", "启动");
        }
    }
    onBoosterPumpWorkChanged: { //助力泵工作状态
        if (boosterPumpWork === true) {
            listmodelone.setProperty(8, "value", "停止");
        } else {
            listmodelone.setProperty(8, "value", "启动");
        }
    }
    onAirCompressorMotorSpeedChanged: { //空压机电机转速
        listmodelone.setProperty(9, "value", airCompressorMotorSpeed.toFixed(0));
    }
    onSteeringAssistMotorSpeedChanged: { //转向助力电机转速
        listmodelone.setProperty(10, "value", steeringAssistMotorSpeed.toFixed(0));
    }
    //#ListModelOne END

    //#ListModelTwo
    onSteeringAssistMotorTempChanged: { //转向助力电机温度
        listmodeltwo.setProperty(0, "value", steeringAssistMotorTemp.toFixed(0));
    }
    onAirCompressorMotorTempChanged: { //空压机电机温度
        listmodeltwo.setProperty(1, "value", airCompressorMotorTemp.toFixed(0));
    }
    onAirCompressorControlTempChanged: { //空压控制器温度
        listmodeltwo.setProperty(2, "value", airCompressorControlTemp.toFixed(0));
    }
    onSteeringControlDeviceTempChanged: { //转向控制器温度
        listmodeltwo.setProperty(3, "value", steeringControlDeviceTemp.toFixed(0));
    }
    onAirPress3Changed: { //气压3
        listmodeltwo.setProperty(4, "value", airPress3.toFixed(1));
    }
    onAirPress4Changed: { //气压4
        listmodeltwo.setProperty(5, "value", airPress4.toFixed(1));
    }
    onAirPress5Changed: { //气压5
        listmodeltwo.setProperty(6, "value", airPress5.toFixed(1));
    }
    onHighestAlarmGradeChanged: { //最高报警等级
        if (highestAlarmGrade === 0) {
            listmodeltwo.setProperty(7, "value", "无故障");
        } else if (highestAlarmGrade === 1) {
            listmodeltwo.setProperty(7, "value", "1级故障");
        } else if (highestAlarmGrade === 2) {
            listmodeltwo.setProperty(7, "value", "2级故障");
        } else if (highestAlarmGrade === 3) {
            listmodeltwo.setProperty(7, "value", "3级故障");
        } else {
            listmodeltwo.setProperty(7, "value", "异常");
        }
    }
    onFaultAlarmSituationChanged: { //故障报警形式
        if (faultAlarmSituation === 0) {
            listmodeltwo.setProperty(8, "value", "正常");
        } else if(faultAlarmSituation === 1) {
            listmodeltwo.setProperty(8, "value", "光报警");
        } else if(faultAlarmSituation === 2) {
            listmodeltwo.setProperty(8, "value", "声光报警");
        } else {
            listmodeltwo.setProperty(8, "value", "");
        }
    }
    onDriveGearsModeChanged: { //档位驱动模式
        if (driveGearsMode === 0) {
            listmodeltwo.setProperty(9, "value", "直驱模式");
        } else if (driveGearsMode === 1) {
            listmodeltwo.setProperty(9, "value", "AMT模式");
        } else if (driveGearsMode === 2) {
            listmodeltwo.setProperty(9, "value", "CVT模式");
        } else {
            listmodeltwo.setProperty(9, "value", "轮边驱动模式");
        }
    }
    onBduSwitchChanged: { //BDU箱内主回路继电器上下电命令
        if(bduSwitch === 0){
            listmodeltwo.setProperty(10, "value", "无请求");
        }else if(bduSwitch === 1){
            listmodeltwo.setProperty(10, "value", "上电命令");
        }else{
            listmodeltwo.setProperty(10, "value", "下电命令");
        }
    }
    //#ListModelTwo END

    //#ListModelThree
    onDriveFaultAlarmChanged: {
        listmodelthree.setProperty(0, "checkstatus", driveFaultAlarm);
    }
    onControlOvervoltageAlarmChanged: {
        listmodelthree.setProperty(1, "checkstatus", controlOvervoltageAlarm);
    }
    onControlUndervoltageAlarmChanged: {
        listmodelthree.setProperty(2, "checkstatus", controlUndervoltageAlarm);
    }
    onControlEncodingFaultChanged: {
        listmodelthree.setProperty(3, "checkstatus", controlEncodingFault);
    }
    onControlHighTempAlarmChanged: {
        listmodelthree.setProperty(4, "checkstatus", controlHighTempAlarm);
    }
    onControlHighTempAbortAlarmChanged: {
        listmodelthree.setProperty(5, "checkstatus", controlHighTempAbortAlarm);
    }
    onControlMainContactorFaultChanged: {
        listmodelthree.setProperty(6, "checkstatus", controlMainContactorFault);
    }
    onControlOvercurrentAlarmChanged: {
        listmodelthree.setProperty(7, "checkstatus", controlOvercurrentAlarm);
    }
    onMotorHighTempAlarmChanged: {
        listmodelthree.setProperty(8, "checkstatus", motorHighTempAlarm);
    }
    onMotorHigtTempAbortAlarmChanged: {
        listmodelthree.setProperty(9, "checkstatus", motorHigtTempAbortAlarm);
    }
    onMotorRotaryFaultChanged: {
        listmodelthree.setProperty(10, "checkstatus", motorRotaryFault);
    }
    //#ListModelThree END

    //#ListModelFour
    onControlMotorPowerLimitationChanged: {
        listmodelfour.setProperty(0, "checkstatus", controlMotorPowerLimitation);
    }
    onMotorRotaryLimitationChanged: {
        listmodelfour.setProperty(1, "checkstatus", motorRotaryLimitation);
    }
    onMotorWaterTempOvertopChanged: {
        listmodelfour.setProperty(2, "checkstatus", motorWaterTempOvertop);
    }
    onAcceleratorPedalFaultChanged: {
        listmodelfour.setProperty(3, "checkstatus", acceleratorPedalFault);
    }
    onBrakePedalFauleChanged: {
        listmodelfour.setProperty(4, "checkstatus", brakePedalFaule);
    }
    onSeatbeltAlarmChanged: {
        listmodelfour.setProperty(5, "checkstatus", seatbeltAlarm);
    }
    onSeatSwitchAlarmChanged: {
        listmodelfour.setProperty(6, "checkstatus", seatSwitchAlarm);
    }
    onControlRightDoorsOpenAlarmChanged: {
        listmodelfour.setProperty(7, "checkstatus", controlRightDoorsOpenAlarm);
    }
    onControlLeftDoorsOpenAlarmChanged: {
        listmodelfour.setProperty(8, "checkstatus", controlLeftDoorsOpenAlarm);
    }
    onChauffeurDoorsNotCloseChanged: {
        listmodelfour.setProperty(9, "checkstatus", chauffeurDoorsNotClose);
    }
    onHighTensionSwitchOpenChanged: {
        listmodelfour.setProperty(10, "checkstatus", highTensionSwitchOpen);
    }
    //#ListModelFour END

    //#ListModelFive
    onChargeDoorOpenChanged: {
        listmodelfive.setProperty(0, "checkstatus", chargeDoorOpen);
    }
    onSafetyDoorOpenChanged: {
        listmodelfive.setProperty(1, "checkstatus", safetyDoorOpen);
    }
    onLowVoltageSwitchOpenChanged: {
        listmodelfive.setProperty(2, "checkstatus", lowVoltageSwitchOpen);
    }
    onAbsSystemFaultChanged: {
        listmodelfive.setProperty(3, "checkstatus", absSystemFault);
    }
    onAirCompressorControlHighTempChanged: {
        listmodelfive.setProperty(4, "checkstatus", airCompressorControlHighTemp);
    }
    onAirCompressorMotorHighTempChanged: {
        listmodelfive.setProperty(5, "checkstatus", airCompressorMotorHighTemp);
    }
    onBoosterPumpControlHighTempChanged: {
        listmodelfive.setProperty(6, "checkstatus", boosterPumpControlHighTemp);
    }
    onBoosterPumpMotorHighTempChanged: {
        listmodelfive.setProperty(7, "checkstatus", boosterPumpMotorHighTemp);
    }
    //#ListModelFive END

    GridLayout { //驱动电机状态
        x: 170
        columns: 2
        rowSpacing: -10
        columnSpacing: 30
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 455
        visible: currentIndex === 0 ? true : false

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

    RowLayout { //机械制动状态
        x: 150
        visible: currentIndex === 0 ? true : false
        anchors.top: parent.top
        anchors.topMargin: 65
        anchors.right: parent.right
        anchors.rightMargin: 405
        spacing: 10
        TextValueWeir {
            id: system1
            width: 90
            height: 30
            textTitle: "脚刹" //"脚" will Break the layout?
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

    ListModel {
        id: listmodelone
        ListElement { name: "驱动系统状态"; value: "READY"; unit: "" }
        ListElement { name: "驱动电机状态"; value: ""; unit: "" }
        ListElement { name: "机械制动状态"; value: ""; unit: "" }
        ListElement { name: "钥匙ACC档"; value: "关闭"; unit: "" }
        ListElement { name: "钥匙ON档"; value: "关闭"; unit: "" }
        ListElement { name: "高压互锁状态"; value: "互锁"; unit: "" }
        ListElement { name: "高压上电状态"; value: "下电"; unit: "" }
        ListElement { name: "空压机工作状态"; value: "停止"; unit: "" }
        ListElement { name: "助力泵工作状态"; value: "停止"; unit: "" }
        ListElement { name: "空压机电机转速"; value: "0"; unit: "RPM" }
        ListElement { name: "转向助力电机转速"; value: "0"; unit: "RPM" }
    }

    ListModel {
        id: listmodeltwo
        ListElement { name: "转向助力电机温度"; value: "0"; unit: "℃" }
        ListElement { name: "空压机电机温度"; value: "0"; unit: "℃" }
        ListElement { name: "空压控制器温度"; value: "0"; unit: "℃" }
        ListElement { name: "转向控制器温度"; value: "0"; unit: "℃" }
        ListElement { name: "气压3"; value: "0"; unit: "Mpa" }
        ListElement { name: "气压4"; value: "0"; unit: "Mpa" }
        ListElement { name: "气压5"; value: "0"; unit: "Mpa" }
        ListElement { name: "最高报警等级"; value: "无故障"; unit: "" }
        ListElement { name: "故障报警形式"; value: "正常"; unit: "" }
        ListElement { name: "档位驱动模式"; value: "直驱模式"; unit: "" }
        ListElement { name: "BDU箱内主回路继电器"; value: ""; unit: "" }
    }

    ListModel {
        id: listmodelthree
        ListElement { name: "驱动系统故障报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器过压报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器欠压报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器编码器故障"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器高温报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器高温截止报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器主接触器故障"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动控制器过流报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动电机高温报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动电机高温截止报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动电机旋转故障报警"; value: ""; unit: ""; checkstatus: false }
    }

    ListModel {
        id: listmodelfour
        ListElement { name: "驱动电机功率受限报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动电机转矩首先报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "驱动电机水温过高报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "加速踏板信号值异常报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "刹车踏板信号值异常报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "安全带报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "座椅开关报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "右侧舱门开启报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "左侧舱门开启报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "司机门未关报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "高压开关门开启报警"; value: ""; unit: ""; checkstatus: false }
    }

    ListModel {
        id: listmodelfive
        ListElement { name: "充电门开启报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "安全门开启报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "低压开关门开启报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "ABS系统故障"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "空压机控制器高温报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "空压机电机高温报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "助力泵控制器高温报警"; value: ""; unit: ""; checkstatus: false }
        ListElement { name: "助力泵电机高温报警"; value: ""; unit: ""; checkstatus: false }
    }

    // 9.整车控制系统信息帧
    RowLayout {
        anchors.fill: parent
        spacing: 50
        visible: currentIndex === 0 ? true : false

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

    // 10.整车控制系统诊断信息帧(报警帧)
    RowLayout {
        anchors.fill: parent
        visible: currentIndex === 1 ? true : false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -20
        anchors.top: parent.top
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

    Component.onCompleted: {
        CarMsg.sendMenuInfo(21, 0);
    }
}

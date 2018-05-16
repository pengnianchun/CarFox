import QtQuick 2.6
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "TirePressureMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property int tireIndex: -1;
    property int tireStudentNo: 0;  //需要学习轮胎的个数
    property string sourceImageUrl: "qrc:/Theme/Theme1/Image/MenuPanel/"
    //车胎压力温度信息
    property int tire1SensorBad: CarMsg.frontLeftTireSensorBad;
    property int tire1AirOut: CarMsg.frontLeftTireAirOut;
    property real tire1Voltage: CarMsg.frontLeftTireVoltage;     //new
    property real tire1Pressure: CarMsg.frontLeftTirePress.toFixed(1);
    property int tire1Temperature: CarMsg.frontLeftTireTemp;

    property int tire2SensorBad: CarMsg.frontRightTireSensorBad;
    property int tire2AirOut: CarMsg.frontRightTireAirOut;
    property real tire2Voltage: CarMsg.fronRightTireVoltage;
    property real tire2Pressure: CarMsg.fronRightTirePress.toFixed(1);
    property int tire2Temperature: CarMsg.frontRightTireTemp;

    property int tire3SensorBad: CarMsg.backLeftTireSensorBad1;
    property int tire3AirOut: CarMsg.backLeftTireAirOut1;
    property real tire3Voltage: CarMsg.backLeftTireVoltage1;
    property real tire3Pressure: CarMsg.backLeftTirePress1.toFixed(1);
    property int tire3Temperature: CarMsg.backLeftTireTemp1;

    property int tire4SensorBad: CarMsg.backLeftTireSensorBad2;
    property int tire4AirOut: CarMsg.backLeftTireAirOut2;
    property real tire4Voltage: CarMsg.backLeftTireVoltage2;
    property real tire4Pressure: CarMsg.backLeftTirePress2.toFixed(1);
    property int tire4Temperature: CarMsg.backLeftTireTemp2;

    property int tire5SensorBad: CarMsg.backRightTireSensorBad1;
    property int tire5AirOut: CarMsg.backRightTireAirOut1;
    property real tire5Voltage: CarMsg.backRightTireVoltage1;
    property real tire5Pressure: CarMsg.backRightTirePress1.toFixed(1);
    property int tire5Temperature: CarMsg.backRightTireTemp1;

    property int tire6SensorBad: CarMsg.backRightTireSensorBad2;
    property int tire6AirOut: CarMsg.backRightTireSensorBad1;
    property real tire6Voltage: CarMsg.backRightTireVoltage2;
    property real tire6Pressure: CarMsg.backRightTirePress2.toFixed(1);
    property int tire6Temperature: CarMsg.backRightTireTemp2;

    property int studentIndex: CarMsg.tirepIndex
    property int studentStatus: CarMsg.tirepStatus
    property string tireInfo: "轮胎状态正常";
    property var tireIdArray: [tire_adjust, tire_confirm]
    property var tireIndexArray: [tireOne, tireTwo, tireThree, tireFour, tireFive, tireSix]
    property bool tireStatus: true;

    enterMenu: function(){
        if(bKeyEnable){
            if(tireStatus){
                tireIdArray[0].fontColor = "red";
                tireIdArray[1].fontColor = "#06fd00";
                CarMsg.sendTirePressContrl(tireIndex ,1);   //胎压学习设置接口  开始学习
                tireStudentNo = tireIndex;
                console.log("start student " + tireIndex);
                tireStatus = false;
            }else{
                if(tireIdArray[0].fontColor === "red"){
                    console.log("tire function " + tireIdArray[0].textValue);
                }else{
                    console.log("tire function " + tireIdArray[1].textValue);
                }
                tireIdArray[0].fontColor = "#06fd00";
                tireIdArray[1].fontColor = "#06fd00";
                CarMsg.sendTirePressContrl(tireIndex ,0);   //胎压学习设置接口  取消学习
                setTireStudentDisable();
                tireStatus = true;
            }
        }else{}
    }
    nextMenu: function(){
        if((bKeyEnable)&&(!tireStatus)){
            MenuMainDetailController.switchTireStatus(tireIdArray);
        }else{
            if(bKeyEnable){
                tireIndex++;
                if(tireIndex >= 6){
                    tireIndex = 5;
                }
                console.log("tire ++ " + tireIndex);
            }
        }
    }
    previousMenu: function(){
        if((bKeyEnable)&&(!tireStatus)){
            MenuMainDetailController.switchTireStatus(tireIdArray);
        }else{
            if(bKeyEnable){
                tireIndex --;
                if(tireIndex <= -1){
                    tireIndex = -1
                }
                console.log("tire -- " + tireIndex);
            }
        }
    }
    hideMenu: function(){
        if(bKeyEnable){
            if(tireStatus){
                MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
                bKeyEnable = false;
            }else{
                tireIdArray[0].fontColor = "#06fd00";
                tireIdArray[1].fontColor = "#06fd00";
            }
            tireStatus = true;
            CarMsg.sendTirePressContrl(tireIndex ,0);   //胎压学习设置接口  取消学习
            tireInfo = "轮胎状态正常"
            setTireStudentDisable();
        }
    }
    onTireIndexChanged: {
        setTireIndexEnable();
    }
    onStudentIndexChanged: { //正在学习中的轮胎编号
        setStudentIndexEnable();
    }
    onStudentStatusChanged: {//正在学习中的轮胎学习状态
        setStudentIndexEnable();
    }
    onTire1AirOutChanged: if(tire1AirOut == 1) {tireIndexArray[0].opacity = 1.0; tireIndexArray[0].source = sourceImageUrl + "tireRed.png"; tireInfo = "1轮胎漏气"}else{tireIndexArray[0].opacity = 0.0;}
    onTire2AirOutChanged: if(tire2AirOut == 1) {tireIndexArray[1].opacity = 1.0; tireIndexArray[1].source = sourceImageUrl + "tireRed.png"; tireInfo = "2轮胎漏气"}else{tireIndexArray[1].opacity = 0.0;}
    onTire3AirOutChanged: if(tire3AirOut == 1) {tireIndexArray[2].opacity = 1.0; tireIndexArray[2].source = sourceImageUrl + "tireRed.png"; tireInfo = "3轮胎漏气"}else{tireIndexArray[2].opacity = 0.0;}
    onTire4AirOutChanged: if(tire4AirOut == 1) {tireIndexArray[3].opacity = 1.0; tireIndexArray[3].source = sourceImageUrl + "tireRed.png"; tireInfo = "4轮胎漏气"}else{tireIndexArray[3].opacity = 0.0;}
    onTire5AirOutChanged: if(tire5AirOut == 1) {tireIndexArray[4].opacity = 1.0; tireIndexArray[4].source = sourceImageUrl + "tireRed.png"; tireInfo = "5轮胎漏气"}else{tireIndexArray[4].opacity = 0.0;}
    onTire6AirOutChanged: if(tire6AirOut == 1) {tireIndexArray[5].opacity = 1.0; tireIndexArray[5].source = sourceImageUrl + "tireRed.png"; tireInfo = "6轮胎漏气"}else{tireIndexArray[5].opacity = 0.0;}

    onTire1SensorBadChanged: if(tire1SensorBad == 1) {tireIndexArray[0].opacity = 1.0; tireIndexArray[0].source = sourceImageUrl + "tireRed.png"; tireInfo = "1轮胎传感器故障"}else{tireIndexArray[0].opacity = 0.0;}
    onTire2SensorBadChanged: if(tire2SensorBad == 1) {tireIndexArray[1].opacity = 1.0; tireIndexArray[1].source = sourceImageUrl + "tireRed.png"; tireInfo = "2轮胎传感器故障"}else{tireIndexArray[1].opacity = 0.0;}
    onTire3SensorBadChanged: if(tire3SensorBad == 1) {tireIndexArray[2].opacity = 1.0; tireIndexArray[2].source = sourceImageUrl + "tireRed.png"; tireInfo = "3轮胎传感器故障"}else{tireIndexArray[2].opacity = 0.0;}
    onTire4SensorBadChanged: if(tire4SensorBad == 1) {tireIndexArray[3].opacity = 1.0; tireIndexArray[3].source = sourceImageUrl + "tireRed.png"; tireInfo = "4轮胎传感器故障"}else{tireIndexArray[3].opacity = 0.0;}
    onTire5SensorBadChanged: if(tire5SensorBad == 1) {tireIndexArray[4].opacity = 1.0; tireIndexArray[4].source = sourceImageUrl + "tireRed.png"; tireInfo = "5轮胎传感器故障"}else{tireIndexArray[4].opacity = 0.0;}
    onTire6SensorBadChanged: if(tire6SensorBad == 1) {tireIndexArray[5].opacity = 1.0; tireIndexArray[5].source = sourceImageUrl + "tireRed.png"; tireInfo = "6轮胎传感器故障"}else{tireIndexArray[5].opacity = 0.0;}

    function setTireIndexEnable(){
        for(var i = 0; i <= tireIndex; i++ ){
            tireIndexArray[i].opacity = 1.0;
            tireIndexArray[i].source = sourceImageUrl + "tireGreen.png";
        }
        for(var j = 5; j > tireIndex; j --){
            tireIndexArray[j].opacity = 0.0;
        }
    }
    function setStudentIndexEnable(){
        if(studentStatus == 1){//学习成功
            tireIndexArray[studentIndex].opacity = 1.0;
            tireIndexArray[studentIndex].source = sourceImageUrl + "tireGreen.png";
            console.log("学习轮胎序号 -- " + studentIndex);
            for(var i = 5; i > studentIndex; i --){
                tireIndexArray[i].opacity = 0.0;
            }
            if(tireStudentNo == studentIndex){
                setTireStudentDisable();
                tireInfo = "学习成功";
            }
            else{
                tireInfo = "学习中...";
            }
        }else if(studentStatus == 0){//学习失败
            tireIndexArray[studentIndex].opacity = 1.0;
            tireIndexArray[studentIndex].source = sourceImageUrl + "tireYellow.png";
            for(var j = 5; j > studentIndex; j --){
                tireIndexArray[j].opacity = 0.0;
            }
            tireInfo = "失败请重新开始";
        }else if(studentStatus == 2){//取消学习
            setTireStudentDisable();
            tireInfo = "已取消学习";
        }else{}
    }
    /* 退出时对相应数据初始化*/
    function setTireStudentDisable(){
        for(var i = 0; i <= 5; i ++){
            tireIndexArray[i].opacity = 0.0;
            tireIndex = -1;
        }
        if(tire1AirOut == 1) {tireIndexArray[0].opacity = 1.0; tireIndexArray[0].source = sourceImageUrl + "tireRed.png"; tireInfo = "1轮胎漏气"}
        if(tire2AirOut == 1) {tireIndexArray[1].opacity = 1.0; tireIndexArray[1].source = sourceImageUrl + "tireRed.png"; tireInfo = "2轮胎漏气"}
        if(tire3AirOut == 1) {tireIndexArray[2].opacity = 1.0; tireIndexArray[2].source = sourceImageUrl + "tireRed.png"; tireInfo = "3轮胎漏气"}
        if(tire4AirOut == 1) {tireIndexArray[3].opacity = 1.0; tireIndexArray[3].source = sourceImageUrl + "tireRed.png"; tireInfo = "4轮胎漏气"}
        if(tire5AirOut == 1) {tireIndexArray[4].opacity = 1.0; tireIndexArray[4].source = sourceImageUrl + "tireRed.png"; tireInfo = "5轮胎漏气"}
        if(tire6AirOut == 1) {tireIndexArray[5].opacity = 1.0; tireIndexArray[5].source = sourceImageUrl + "tireRed.png"; tireInfo = "6轮胎漏气"}
        if(tire1SensorBad == 1) {tireIndexArray[0].opacity = 1.0; tireIndexArray[0].source = sourceImageUrl + "tireRed.png"; tireInfo = "1轮胎传感器故障"}
        if(tire2SensorBad == 1) {tireIndexArray[1].opacity = 1.0; tireIndexArray[1].source = sourceImageUrl + "tireRed.png"; tireInfo = "2轮胎传感器故障"}
        if(tire3SensorBad == 1) {tireIndexArray[2].opacity = 1.0; tireIndexArray[2].source = sourceImageUrl + "tireRed.png"; tireInfo = "3轮胎传感器故障"}
        if(tire4SensorBad == 1) {tireIndexArray[3].opacity = 1.0; tireIndexArray[3].source = sourceImageUrl + "tireRed.png"; tireInfo = "4轮胎传感器故障"}
        if(tire5SensorBad == 1) {tireIndexArray[4].opacity = 1.0; tireIndexArray[4].source = sourceImageUrl + "tireRed.png"; tireInfo = "5轮胎传感器故障"}
        if(tire6SensorBad == 1) {tireIndexArray[5].opacity = 1.0; tireIndexArray[5].source = sourceImageUrl + "tireRed.png"; tireInfo = "6轮胎传感器故障"}
    }

    Image {
        id: tireOne; y: 185; z: 1; opacity: 0.0
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: -96;
    }
    Image {
        id: tireTwo; y: 185; z: 1; opacity: 0.0
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: +78;
    }
    Image {
        id: tireThree; y: 305; z: 1; opacity: 0.0
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: -116;
    }
    Image {
        id: tireFour; y: 305; z: 1; opacity: 0.0
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: -78;
    }
    Image {
        id: tireFive; y: 305; z: 1; opacity: 0.0
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: +59;
    }
    Image {
        id:tireSix; y: 305; z: 1; opacity: 0.0
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: +97;
    }
    TextFieldWeir {
        id: title
        textValue: "胎压检测信息"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    Image {
        y: 160;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.horizontalCenterOffset: -10;
        source: sourceImageUrl + "tireOther.png"
    }
    TextFieldWeir {
        id: tire1
        x: 490
        y: 200
        textValue: tire1Pressure + " Mpa" + "<br>" + tire1Temperature + " ℃  " + tire1Voltage + " V"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire2
        x: 790
        y: 200
        textValue: tire2Pressure + " Mpa" + "<br>" + tire2Temperature + " ℃  " + tire2Voltage + " V"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire3
        x: 390
        y: 320
        textValue: tire3Pressure + " Mpa" + "<br>" + tire3Temperature + " ℃  " + tire3Voltage + " V"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire4
        x: 470
        y: 320
        textValue: tire4Pressure + " Mpa" + "<br>" + tire4Temperature + " ℃  " + tire4Voltage + " V"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire5
        x: 810
        y: 320
        textValue: tire5Pressure + " Mpa" + "<br>" + tire5Temperature + " ℃  " + tire5Voltage + " V"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire6
        x: 890
        y: 320
        textValue: tire6Pressure + " Mpa" + "<br>" + tire6Temperature + " ℃  " + tire6Voltage + " V"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire_adjust
        x: 470
        y: 270
        textValue: "学习"
        width: 50
        height: 60
        fontSize: 15
        fontBold: true
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire_info
        x: 640
        y: 270
        textValue: tireInfo
        width: 150
        height: 60
        fontSize: 15
        fontBold: true
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire_confirm
        x: 810
        y: 270
        textValue: "取消"
        width: 50
        height: 60
        fontSize: 15
        fontBold: true
        fontColor: "#06fd00"
    }
}

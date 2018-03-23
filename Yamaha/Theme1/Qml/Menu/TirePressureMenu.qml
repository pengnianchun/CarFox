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
    property string sourceImageUrl: "qrc:/Theme/Theme1/Image/MenuPanel/"
    //车胎压力温度信息
    property real tire1Pressure: CarMsg.frontLeftTirePress.toFixed(1);
    property real tire1Temperature: CarMsg.frontLeftTireTemp.toFixed(0);
    property real tire2Pressure: CarMsg.fronRightTirePress.toFixed(1);
    property real tire2Temperature: CarMsg.frontRightTireTemp.toFixed(0);
    property real tire3Pressure: CarMsg.backLeftTirePress1.toFixed(1);
    property real tire3Temperature: CarMsg.backLeftTireTemp1.toFixed(0);
    property real tire4Pressure: CarMsg.backLeftTirePress2.toFixed(1);
    property real tire4Temperature: CarMsg.backLeftTireTemp2.toFixed(0);
    property real tire5Pressure: CarMsg.backRightTirePress1.toFixed(1);
    property real tire5Temperature: CarMsg.backRightTireTemp1.toFixed(0);
    property real tire6Pressure: CarMsg.backRightTirePress2.toFixed(1);
    property real tire6Temperature: CarMsg.backRightTireTemp2.toFixed(0);
    property string tireInfo: "各轮胎状态正常";
    property var tireIdArray: [tire_adjust,tire_confirm];
    property bool tireStatus: true;

    enterMenu: function(){
        if(bKeyEnable){
            if(tireStatus){
                tireIdArray[0].fontColor = "red";
                tireIdArray[1].fontColor = "#06fd00";
                tireStatus = false;
            }else{
                if(tireIdArray[0].fontColor === "red"){
                    console.log("tire function " + tireIdArray[0].textValue);
                }else{
                    console.log("tire function " + tireIdArray[1].textValue);
                }
                tireIdArray[0].fontColor = "#06fd00";
                tireIdArray[1].fontColor = "#06fd00";
                tireStatus = true;
            }
        }else{}
    }
    nextMenu: function(){
        if((bKeyEnable)&&(!tireStatus)){
            MenuMainDetailController.switchTireStatus(tireIdArray);
        }else{}
    }
    previousMenu: function(){
        if((bKeyEnable)&&(!tireStatus)){
            MenuMainDetailController.switchTireStatus(tireIdArray);
        }else{}
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
        }
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
        source: sourceImageUrl + "tire.png"
    }
    TextFieldWeir {
        id: tire1
        x: 490
        y: 200
        textValue: tire1Pressure + " MPA" + "<br>" + tire1Temperature + " ℃"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire2
        x: 790
        y: 200
        textValue: tire2Pressure + " MPA" + "<br>" + tire2Temperature + " ℃"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire3
        x: 390
        y: 320
        textValue: tire3Pressure + " MPA" + "<br>" + tire3Temperature + " ℃"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire4
        x: 470
        y: 320
        textValue: tire4Pressure + " MPA" + "<br>" + tire4Temperature + " ℃"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire5
        x: 810
        y: 320
        textValue: tire5Pressure + " MPA" + "<br>" + tire5Temperature + " ℃"
        width: 100
        height: 60
        fontSize: 12
        fontColor: "#06fd00"
    }
    TextFieldWeir {
        id: tire6
        x: 890
        y: 320
        textValue: tire6Pressure + " MPA" + "<br>" + tire6Temperature + " ℃"
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
        textValue: "确认"
        width: 50
        height: 60
        fontSize: 15
        fontBold: true
        fontColor: "#06fd00"
    }
}

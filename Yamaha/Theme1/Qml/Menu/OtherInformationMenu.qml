import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "OtherInformationMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false

    enterMenu: function(){
        if(bKeyEnable){
            if(open_buzzer.fontColor === "#00a7f5"){
                CarMsg.sendBuzzerControl(true);
                console.log("open buzzer !!!");
            }else if(close_buzzer.fontColor === "#00a7f5"){
                CarMsg.sendBuzzerControl(false);
                console.log("close buzzer !!!");
            }else{}
        }else{}
    }
    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
        }else{}
    }
    previousMenu: function(){
        if(bKeyEnable){
            chooseBuzzerStatusAction();
        }else{}
    }
    nextMenu: function(){
        if(bKeyEnable){
            chooseBuzzerStatusAction();
        }else{}
    }
    function chooseBuzzerStatusAction(){
        if(open_buzzer.fontColor === "#00a7f5"){
            open_buzzer.fontColor = "#ffffff";
            close_buzzer.fontColor = "#00a7f5";
        }else{
            open_buzzer.fontColor = "#00a7f5";
            close_buzzer.fontColor = "#ffffff";
        }
    }
    TextFieldWeir {
        id: title
        textValue: "杂项信息查询"
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    TextValueWeir {
        width: 200
        height: 30
        textTitle: "速比"
        textValue: CarMsg.velocityRatio.toFixed(0)
        unitValue: ""
        titleColor: "#00a7f5"
        textWidth: 400
        fontSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 190
        leftAlignStatus: true
    }
    TextValueWeir {
        width: 200
        height: 30
        textTitle: "蜂鸣器"
        textValue: CarMsg.buzzerStatus ? "开启" : "关闭"
        unitValue: ""
        titleColor: "#00a7f5"
        textWidth: 400
        fontSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 240
        leftAlignStatus: true
    }
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -30
        anchors.top: parent.top
        anchors.topMargin: 290
        TextValueWeir {
            id: open_buzzer
            width: 50
            height: 30
            textTitle: ""
            textValue: "开启"
            unitValue: ""
            fontColor: "#00a7f5"
            textWidth: 50
            fontSize: 12
            leftAlignStatus: true
        }
        TextValueWeir {
            id: close_buzzer
            width: 50
            height: 30
            textTitle: ""
            textValue: "关闭"
            unitValue: ""
            fontColor: "#ffffff"
            textWidth: 50
            fontSize: 12
            leftAlignStatus: true
        }
    }
}

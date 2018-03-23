import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/JS/InstrumentInfo.js" as InstrumentInfo
import "../../JS/InstrumentController.js" as InstrumentController
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "InstrumentSysMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property var listModelInstrumentIdArray: [listmodel_instrument1,listmodel_instrument2,listmodel_instrument3]
    property var listModelIdArray: [listmodel_one,listmodel_two,listmodel_three]
    //0：仪表信息 1：前模块 2：中模块 3：后模块
    property var instrumentTitleArray: ["仪表系统信息","前模块","中模块","后模块"]
    property int instrumentCurrentIndex: 4

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
            if(instrumentCurrentIndex === 0){
                listmodel_instrument1.setProperty(0,"checkstatus",CarMsg.inputCtrl01);
                listmodel_instrument1.setProperty(1,"checkstatus",CarMsg.inputCtrl02);
                listmodel_instrument1.setProperty(2,"checkstatus",CarMsg.inputCtrl03);
                listmodel_instrument1.setProperty(3,"checkstatus",CarMsg.inputCtrl04);
                listmodel_instrument1.setProperty(4,"checkstatus",CarMsg.inputCtrl05);
                listmodel_instrument1.setProperty(5,"checkstatus",CarMsg.inputCtrl06);
                listmodel_instrument1.setProperty(6,"checkstatus",CarMsg.inputCtrl07);
                listmodel_instrument1.setProperty(7,"checkstatus",CarMsg.inputCtrl08);
                listmodel_instrument1.setProperty(8,"checkstatus",CarMsg.inputCtrl09);
                listmodel_instrument1.setProperty(9,"checkstatus",CarMsg.inputCtrl10);
                listmodel_instrument1.setProperty(10,"checkstatus",CarMsg.inputCtrl11);
                listmodel_instrument1.setProperty(11,"checkstatus",CarMsg.inputCtrl12);
                listmodel_instrument2.setProperty(0,"checkstatus",CarMsg.inputCtrl13);
                listmodel_instrument2.setProperty(1,"checkstatus",CarMsg.inputCtrl14);
                listmodel_instrument2.setProperty(2,"checkstatus",CarMsg.inputCtrl15);
                listmodel_instrument2.setProperty(3,"checkstatus",CarMsg.inputCtrl16);
                listmodel_instrument2.setProperty(4,"checkstatus",CarMsg.inputCtrl17);
                listmodel_instrument2.setProperty(5,"checkstatus",CarMsg.inputCtrl18);
                listmodel_instrument2.setProperty(6,"checkstatus",CarMsg.inputCtrl19);
                listmodel_instrument2.setProperty(7,"checkstatus",CarMsg.inputCtrl20);
                listmodel_instrument2.setProperty(8,"checkstatus",CarMsg.inputCtrl21);
                listmodel_instrument2.setProperty(9,"checkstatus",CarMsg.inputCtrl22);
                listmodel_instrument2.setProperty(10,"checkstatus",CarMsg.inputCtrl23);
                listmodel_instrument2.setProperty(11,"checkstatus",CarMsg.inputCtrl24);
                listmodel_instrument3.setProperty(0,"checkstatus",CarMsg.inputCtrl25);
                listmodel_instrument3.setProperty(1,"checkstatus",CarMsg.inputCtrl26);
                listmodel_instrument3.setProperty(2,"checkstatus",CarMsg.inputCtrl27);
                listmodel_instrument3.setProperty(3,"checkstatus",CarMsg.inputCtrl28);
                listmodel_instrument3.setProperty(4,"checkstatus",CarMsg.inputCtrl29);
                listmodel_instrument3.setProperty(5,"checkstatus",CarMsg.inputCtrl30);
                listmodel_instrument3.setProperty(6,"checkstatus",CarMsg.inputCtrl31);
                listmodel_instrument3.setProperty(7,"checkstatus",CarMsg.inputCtrl32);
                listmodel_instrument3.setProperty(8,"checkstatus",CarMsg.inputCtrl33);
                listmodel_instrument3.setProperty(9,"checkstatus",CarMsg.inputCtrl34);
                listmodel_instrument3.setProperty(10,"checkstatus",CarMsg.inputCtrl35);
            }else if(instrumentCurrentIndex === 1){
                listmodel_one.setProperty(0,"value",CarMsg.frontOutputCurrent01.toFixed(1));
                listmodel_one.setProperty(1,"value",CarMsg.frontOutputCurrent02.toFixed(1));
                listmodel_one.setProperty(2,"value",CarMsg.frontOutputCurrent03.toFixed(1));
                listmodel_one.setProperty(3,"value",CarMsg.frontOutputCurrent04.toFixed(1));
                listmodel_one.setProperty(4,"value",CarMsg.frontOutputCurrent05.toFixed(1));
                listmodel_one.setProperty(5,"value",CarMsg.frontOutputCurrent06.toFixed(1));
                listmodel_one.setProperty(6,"value",CarMsg.frontOutputCurrent07.toFixed(1));
                listmodel_one.setProperty(7,"value",CarMsg.frontOutputCurrent08.toFixed(1));
                listmodel_one.setProperty(8,"value",CarMsg.frontOutputCurrent09.toFixed(1));
                listmodel_one.setProperty(9,"value",CarMsg.frontOutputCurrent10.toFixed(1));
                listmodel_one.setProperty(10,"value",CarMsg.frontOutputCurrent11.toFixed(1));
                listmodel_one.setProperty(11,"value",CarMsg.frontOutputCurrent12.toFixed(1));
                listmodel_one.setProperty(12,"value",CarMsg.frontOutputCurrent13.toFixed(1));
                listmodel_one.setProperty(13,"value",CarMsg.frontOutputCurrent14.toFixed(1));
                listmodel_one.setProperty(14,"value",CarMsg.frontOutputCurrent15.toFixed(1));
                listmodel_one.setProperty(0,"checkstatus",CarMsg.frontOutputFault01);
                listmodel_one.setProperty(1,"checkstatus",CarMsg.frontOutputFault02);
                listmodel_one.setProperty(2,"checkstatus",CarMsg.frontOutputFault03);
                listmodel_one.setProperty(3,"checkstatus",CarMsg.frontOutputFault04);
                listmodel_one.setProperty(4,"checkstatus",CarMsg.frontOutputFault05);
                listmodel_one.setProperty(5,"checkstatus",CarMsg.frontOutputFault06);
                listmodel_one.setProperty(6,"checkstatus",CarMsg.frontOutputFault07);
                listmodel_one.setProperty(7,"checkstatus",CarMsg.frontOutputFault08);
                listmodel_one.setProperty(8,"checkstatus",CarMsg.frontOutputFault09);
                listmodel_one.setProperty(9,"checkstatus",CarMsg.frontOutputFault10);
                listmodel_one.setProperty(10,"checkstatus",CarMsg.frontOutputFault11);
                listmodel_one.setProperty(11,"checkstatus",CarMsg.frontOutputFault12);
                listmodel_one.setProperty(12,"checkstatus",CarMsg.frontOutputFault13);
                listmodel_one.setProperty(13,"checkstatus",CarMsg.frontOutputFault14);
                listmodel_one.setProperty(14,"checkstatus",CarMsg.frontOutputFault15);
                listmodel_two.setProperty(0,"checkstatus",CarMsg.frontSwitch01);
                listmodel_two.setProperty(1,"checkstatus",CarMsg.frontSwitch02);
                listmodel_two.setProperty(2,"checkstatus",CarMsg.frontSwitch03);
                listmodel_two.setProperty(3,"checkstatus",CarMsg.frontSwitch04);
                listmodel_two.setProperty(4,"checkstatus",CarMsg.frontSwitch05);
                listmodel_two.setProperty(5,"checkstatus",CarMsg.frontSwitch06);
                listmodel_two.setProperty(6,"checkstatus",CarMsg.frontSwitch07);
                listmodel_two.setProperty(7,"checkstatus",CarMsg.frontSwitch08);
                listmodel_two.setProperty(8,"checkstatus",CarMsg.frontSwitch09);
                listmodel_two.setProperty(9,"checkstatus",CarMsg.frontSwitch10);
                listmodel_two.setProperty(10,"checkstatus",CarMsg.frontSwitch11);
                listmodel_two.setProperty(11,"checkstatus",CarMsg.frontSwitch12);
                listmodel_two.setProperty(12,"checkstatus",CarMsg.frontSwitch13);
                listmodel_two.setProperty(13,"checkstatus",CarMsg.frontSwitch14);
                listmodel_two.setProperty(14,"checkstatus",CarMsg.frontSwitch15);
                listmodel_three.setProperty(0,"checkstatus",CarMsg.frontSwitch16);
                if(CarMsg.frontAnalogInput01 > 0){
                    analog_input1.checkRadioStatus = true;
                }else{
                    analog_input1.checkRadioStatus = false;
                }
                if(CarMsg.frontAnalogInput02 > 0){
                    analog_input2.checkRadioStatus = true;
                }else{
                    analog_input2.checkRadioStatus = false;
                }
                if(CarMsg.frontHzInput > 0){
                    frequency_input.checkRadioStatus = true;
                }else{
                    frequency_input.checkRadioStatus = false;
                }if(CarMsg.frontSpeedInput > 0){
                    speed_input.checkRadioStatus = true;
                }else{
                    speed_input.checkRadioStatus = false;
                }
                analog_input1_value.textValue = CarMsg.frontAnalogInput01.toFixed(1);
                analog_input2_value.textValue = CarMsg.frontAnalogInput02.toFixed(1);
                frequency_input_value.textValue = CarMsg.frontAnalogInput02.toFixed(0);
                speed_input_value.textValue = CarMsg.frontAnalogInput02.toFixed(0);
            }else if(instrumentCurrentIndex === 2){
                listmodel_one.setProperty(0,"value",CarMsg.middleOutputCurrent01.toFixed(1));
                listmodel_one.setProperty(1,"value",CarMsg.middleOutputCurrent02.toFixed(1));
                listmodel_one.setProperty(2,"value",CarMsg.middleOutputCurrent03.toFixed(1));
                listmodel_one.setProperty(3,"value",CarMsg.middleOutputCurrent04.toFixed(1));
                listmodel_one.setProperty(4,"value",CarMsg.middleOutputCurrent05.toFixed(1));
                listmodel_one.setProperty(5,"value",CarMsg.middleOutputCurrent06.toFixed(1));
                listmodel_one.setProperty(6,"value",CarMsg.middleOutputCurrent07.toFixed(1));
                listmodel_one.setProperty(7,"value",CarMsg.middleOutputCurrent08.toFixed(1));
                listmodel_one.setProperty(8,"value",CarMsg.middleOutputCurrent09.toFixed(1));
                listmodel_one.setProperty(9,"value",CarMsg.middleOutputCurrent10.toFixed(1));
                listmodel_one.setProperty(10,"value",CarMsg.middleOutputCurrent11.toFixed(1));
                listmodel_one.setProperty(11,"value",CarMsg.middleOutputCurrent12.toFixed(1));
                listmodel_one.setProperty(12,"value",CarMsg.middleOutputCurrent13.toFixed(1));
                listmodel_one.setProperty(13,"value",CarMsg.middleOutputCurrent14.toFixed(1));
                listmodel_one.setProperty(14,"value",CarMsg.middleOutputCurrent15.toFixed(1));
                listmodel_one.setProperty(0,"checkstatus",CarMsg.middleOutputFault01);
                listmodel_one.setProperty(1,"checkstatus",CarMsg.middleOutputFault02);
                listmodel_one.setProperty(2,"checkstatus",CarMsg.middleOutputFault03);
                listmodel_one.setProperty(3,"checkstatus",CarMsg.middleOutputFault04);
                listmodel_one.setProperty(4,"checkstatus",CarMsg.middleOutputFault05);
                listmodel_one.setProperty(5,"checkstatus",CarMsg.middleOutputFault06);
                listmodel_one.setProperty(6,"checkstatus",CarMsg.middleOutputFault07);
                listmodel_one.setProperty(7,"checkstatus",CarMsg.middleOutputFault08);
                listmodel_one.setProperty(8,"checkstatus",CarMsg.middleOutputFault09);
                listmodel_one.setProperty(9,"checkstatus",CarMsg.middleOutputFault10);
                listmodel_one.setProperty(10,"checkstatus",CarMsg.middleOutputFault11);
                listmodel_one.setProperty(11,"checkstatus",CarMsg.middleOutputFault12);
                listmodel_one.setProperty(12,"checkstatus",CarMsg.middleOutputFault13);
                listmodel_one.setProperty(13,"checkstatus",CarMsg.middleOutputFault14);
                listmodel_one.setProperty(14,"checkstatus",CarMsg.middleOutputFault15);
                listmodel_two.setProperty(0,"checkstatus",CarMsg.middleSwitch01);
                listmodel_two.setProperty(1,"checkstatus",CarMsg.middleSwitch02);
                listmodel_two.setProperty(2,"checkstatus",CarMsg.middleSwitch03);
                listmodel_two.setProperty(3,"checkstatus",CarMsg.middleSwitch04);
                listmodel_two.setProperty(4,"checkstatus",CarMsg.middleSwitch05);
                listmodel_two.setProperty(5,"checkstatus",CarMsg.middleSwitch06);
                listmodel_two.setProperty(6,"checkstatus",CarMsg.middleSwitch07);
                listmodel_two.setProperty(7,"checkstatus",CarMsg.middleSwitch08);
                listmodel_two.setProperty(8,"checkstatus",CarMsg.middleSwitch09);
                listmodel_two.setProperty(9,"checkstatus",CarMsg.middleSwitch10);
                listmodel_two.setProperty(10,"checkstatus",CarMsg.middleSwitch11);
                listmodel_two.setProperty(11,"checkstatus",CarMsg.middleSwitch12);
                listmodel_two.setProperty(12,"checkstatus",CarMsg.middleSwitch13);
                listmodel_two.setProperty(13,"checkstatus",CarMsg.middleSwitch14);
                listmodel_two.setProperty(14,"checkstatus",CarMsg.middleSwitch15);
                listmodel_three.setProperty(0,"checkstatus",CarMsg.middleSwitch16);
                if(CarMsg.middleAnalogInput01 > 0){
                    analog_input1.checkRadioStatus = true;
                }else{
                    analog_input1.checkRadioStatus = false;
                }
                if(CarMsg.middleAnalogInput02 > 0){
                    analog_input2.checkRadioStatus = true;
                }else{
                    analog_input2.checkRadioStatus = false;
                }
                if(CarMsg.middleHzInput > 0){
                    frequency_input.checkRadioStatus = true;
                }else{
                    frequency_input.checkRadioStatus = false;
                }if(CarMsg.middleSpeedInput > 0){
                    speed_input.checkRadioStatus = true;
                }else{
                    speed_input.checkRadioStatus = false;
                }
                analog_input1_value.textValue = CarMsg.middleAnalogInput01.toFixed(1);
                analog_input2_value.textValue = CarMsg.middleAnalogInput02.toFixed(1);
                frequency_input_value.textValue = CarMsg.middleAnalogInput02.toFixed(0);
                speed_input_value.textValue = CarMsg.middleAnalogInput02.toFixed(0);
            }else if(instrumentCurrentIndex === 3){
                listmodel_one.setProperty(0,"value",CarMsg.backOutputCurrent01.toFixed(1));
                listmodel_one.setProperty(1,"value",CarMsg.backOutputCurrent02.toFixed(1));
                listmodel_one.setProperty(2,"value",CarMsg.backOutputCurrent03.toFixed(1));
                listmodel_one.setProperty(3,"value",CarMsg.backOutputCurrent04.toFixed(1));
                listmodel_one.setProperty(4,"value",CarMsg.backOutputCurrent05.toFixed(1));
                listmodel_one.setProperty(5,"value",CarMsg.backOutputCurrent06.toFixed(1));
                listmodel_one.setProperty(6,"value",CarMsg.backOutputCurrent07.toFixed(1));
                listmodel_one.setProperty(7,"value",CarMsg.backOutputCurrent08.toFixed(1));
                listmodel_one.setProperty(8,"value",CarMsg.backOutputCurrent09.toFixed(1));
                listmodel_one.setProperty(9,"value",CarMsg.backOutputCurrent10.toFixed(1));
                listmodel_one.setProperty(10,"value",CarMsg.backOutputCurrent11.toFixed(1));
                listmodel_one.setProperty(11,"value",CarMsg.backOutputCurrent12.toFixed(1));
                listmodel_one.setProperty(12,"value",CarMsg.backOutputCurrent13.toFixed(1));
                listmodel_one.setProperty(13,"value",CarMsg.backOutputCurrent14.toFixed(1));
                listmodel_one.setProperty(14,"value",CarMsg.backOutputCurrent15.toFixed(1));
                listmodel_one.setProperty(0,"checkstatus",CarMsg.backOutputFault01);
                listmodel_one.setProperty(1,"checkstatus",CarMsg.backOutputFault02);
                listmodel_one.setProperty(2,"checkstatus",CarMsg.backOutputFault03);
                listmodel_one.setProperty(3,"checkstatus",CarMsg.backOutputFault04);
                listmodel_one.setProperty(4,"checkstatus",CarMsg.backOutputFault05);
                listmodel_one.setProperty(5,"checkstatus",CarMsg.backOutputFault06);
                listmodel_one.setProperty(6,"checkstatus",CarMsg.backOutputFault07);
                listmodel_one.setProperty(7,"checkstatus",CarMsg.backOutputFault08);
                listmodel_one.setProperty(8,"checkstatus",CarMsg.backOutputFault09);
                listmodel_one.setProperty(9,"checkstatus",CarMsg.backOutputFault10);
                listmodel_one.setProperty(10,"checkstatus",CarMsg.backOutputFault11);
                listmodel_one.setProperty(11,"checkstatus",CarMsg.backOutputFault12);
                listmodel_one.setProperty(12,"checkstatus",CarMsg.backOutputFault13);
                listmodel_one.setProperty(13,"checkstatus",CarMsg.backOutputFault14);
                listmodel_one.setProperty(14,"checkstatus",CarMsg.backOutputFault15);
                listmodel_two.setProperty(0,"checkstatus",CarMsg.backSwitch01);
                listmodel_two.setProperty(1,"checkstatus",CarMsg.backSwitch02);
                listmodel_two.setProperty(2,"checkstatus",CarMsg.backSwitch03);
                listmodel_two.setProperty(3,"checkstatus",CarMsg.backSwitch04);
                listmodel_two.setProperty(4,"checkstatus",CarMsg.backSwitch05);
                listmodel_two.setProperty(5,"checkstatus",CarMsg.backSwitch06);
                listmodel_two.setProperty(6,"checkstatus",CarMsg.backSwitch07);
                listmodel_two.setProperty(7,"checkstatus",CarMsg.backSwitch08);
                listmodel_two.setProperty(8,"checkstatus",CarMsg.backSwitch09);
                listmodel_two.setProperty(9,"checkstatus",CarMsg.backSwitch10);
                listmodel_two.setProperty(10,"checkstatus",CarMsg.backSwitch11);
                listmodel_two.setProperty(11,"checkstatus",CarMsg.backSwitch12);
                listmodel_two.setProperty(12,"checkstatus",CarMsg.backSwitch13);
                listmodel_two.setProperty(13,"checkstatus",CarMsg.backSwitch14);
                listmodel_two.setProperty(14,"checkstatus",CarMsg.backSwitch15);
                listmodel_three.setProperty(0,"checkstatus",CarMsg.backSwitch16);
                if(CarMsg.backAnalogInput01 > 0){
                    analog_input1.checkRadioStatus = true;
                }else{
                    analog_input1.checkRadioStatus = false;
                }
                if(CarMsg.backAnalogInput02 > 0){
                    analog_input2.checkRadioStatus = true;
                }else{
                    analog_input2.checkRadioStatus = false;
                }
                if(CarMsg.backHzInput > 0){
                    frequency_input.checkRadioStatus = true;
                }else{
                    frequency_input.checkRadioStatus = false;
                }if(CarMsg.backSpeedInput > 0){
                    speed_input.checkRadioStatus = true;
                }else{
                    speed_input.checkRadioStatus = false;
                }
                analog_input1_value.textValue = CarMsg.backAnalogInput01.toFixed(1);
                analog_input2_value.textValue = CarMsg.backAnalogInput02.toFixed(1);
                frequency_input_value.textValue = CarMsg.backAnalogInput02.toFixed(0);
                speed_input_value.textValue = CarMsg.backAnalogInput02.toFixed(0);
            }else{}
        }
    }
    onInstrumentCurrentIndexChanged: {
        //仪表信息显示前中后模块判断
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        if(instrumentCurrentIndex === 0){
            CarMsg.sendMenuInfo(5,0);
            InstrumentController.initializeInstrumentModel(listModelInstrumentIdArray,instrumentInfoResource);
        }else if(instrumentCurrentIndex === 1){
            CarMsg.sendMenuInfo(6,0);
            InstrumentController.initializeBeforeModule(listModelIdArray,instrumentInfoResource);
        }else if(instrumentCurrentIndex === 2){
            CarMsg.sendMenuInfo(7,0);
            InstrumentController.initializeCenterModule(listModelIdArray,instrumentInfoResource);
        }else if(instrumentCurrentIndex === 3){
            CarMsg.sendMenuInfo(8,0);
            InstrumentController.initializeAfterModule(listModelIdArray,instrumentInfoResource);
        }else{}
    }
    Component.onCompleted: { instrumentCurrentIndex = 0 }
    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
            bKeyEnable = false;
            instrumentCurrentIndex = 0;
            title.textValue = instrumentTitleArray[instrumentCurrentIndex];
        }
    }
    previousMenu: function(){
        if((instrumentCurrentIndex > 0)&&(instrumentCurrentIndex <= 3)){
            instrumentCurrentIndex--;
        }else{
            instrumentCurrentIndex = 3;
        }
    }
    nextMenu: function(){
        if((instrumentCurrentIndex >= 0)&&(instrumentCurrentIndex < 3)){
            instrumentCurrentIndex++;
        }else{
            instrumentCurrentIndex = 0;
        }
    }
    TextFieldWeir {
        id: title
        textValue: instrumentTitleArray[instrumentCurrentIndex]
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 100
    }
    ListModel {
        id: listmodel_instrument1
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_instrument2
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_instrument3
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_one
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:2 }
    }
    ListModel {
        id: listmodel_two
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_three
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    RowLayout {
        width: 560
        height: 400
        visible: instrumentCurrentIndex === 0 ? true : false
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.horizontalCenterOffset: 50
        spacing: 50
        ListViewRadioWeir {
            listModel: listmodel_instrument1
            width: parent.width/3-50
            height: parent.height
            widthListView: parent.width/3-100
            fontSizeList: 12
            listRadioType: 2
            listViewSpacing: 20
        }
        ListViewRadioWeir {
            listModel: listmodel_instrument2
            width: parent.width/3-50
            height: parent.height
            widthListView: parent.width/3-100
            fontSizeList: 12
            unitWidthList: 40
            listRadioType: 1
            listViewSpacing: 20
        }
        ListViewRadioWeir {
            listModel: listmodel_instrument3
            width: parent.width/3-50
            height: parent.height
            widthListView: parent.width/3-100
            fontSizeList: 12
            unitWidthList: 40
            listRadioType: 1
            listViewSpacing: 20
        }
    }
    RowLayout {
        width: 560
        height: 400
        visible: instrumentCurrentIndex !== 0 ? true : false
        anchors.top: parent.top
        anchors.topMargin: 130
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: -40
        ListViewRadioStatusWeir {
            listModel: listmodel_one
            width: parent.width/2-50
            height: parent.height
            widthListView: parent.width/2-100
            fontSizeList: 12
            listRadioType: 2
            listViewSpacing: 20
        }
        ListViewRadioWeir {
            listModel: listmodel_two
            width: parent.width/2-50
            height: parent.height
            widthListView: parent.width/2-100
            fontSizeList: 12
            unitWidthList: 40
            listRadioType: 1
            listViewSpacing: 20
        }
    }
    ColumnLayout{
        width: 300
        height: 400
        visible: instrumentCurrentIndex !== 0 ? true : false
        anchors.top: parent.top
        anchors.topMargin: 35
        anchors.right: parent.right
        anchors.rightMargin: 260
        spacing: -200
        ListViewRadioWeir {
            listModel: listmodel_three
            width: 150
            height: 30
            widthListView: 150
            heightListView: 30
            fontSizeList: 12
            unitWidthList: 40
            listRadioType: 1
            listViewSpacing: 20
        }
        TextRadioWeir {
            id: analog_input1
            width: 150
            height: 30
            radioType: 2
            textTitle: "模拟量输入 1"
            textValue: ""
            unitValue: ""
            checkRadioStatus: false
            fontSize: 12
            textWidth: 150
            unitWidth: 0
        }
        TextFieldWeir {
            id: analog_input1_value
            width: 150
            height: 30
            fontSize: 12
            fontBold: true
            textValue: qsTr("%1 Ω").arg((0).toFixed(1))
        }
        TextRadioWeir {
            id: analog_input2
            width: 150
            height: 30
            radioType: 2
            textTitle: "模拟量输入 2"
            textValue: ""
            unitValue: ""
            checkRadioStatus: false
            fontSize: 12
            textWidth: 160
            unitWidth: 0
        }
        TextFieldWeir {
            id: analog_input2_value
            width: 150
            height: 30
            fontSize: 12
            fontBold: true
            textValue: qsTr("%1 Ω").arg((0).toFixed(1))
        }
        TextRadioWeir {
            id: frequency_input
            width: 150
            height: 30
            radioType: 2
            textTitle: "频率输入"
            textValue: ""
            unitValue: ""
            checkRadioStatus: false
            fontSize: 12
            textWidth: 150
            unitWidth: 0
        }
        TextFieldWeir {
            id: frequency_input_value
            width: 150
            height: 30
            fontSize: 12
            fontBold: true
            textValue: qsTr("%1 HZ").arg((0).toFixed(1))
        }
        TextRadioWeir {
            id: speed_input
            width: 150
            height: 30
            radioType: 2
            textTitle: "车速输入"
            textValue: ""
            unitValue: ""
            checkRadioStatus: false
            fontSize: 12
            textWidth: 150
            unitWidth: 0
        }
        TextFieldWeir {
            id: speed_input_value
            width: 150
            height: 30
            fontSize: 12
            fontBold: true
            textValue: qsTr("%1 KM/H").arg((0).toFixed(1))
        }
    }
}

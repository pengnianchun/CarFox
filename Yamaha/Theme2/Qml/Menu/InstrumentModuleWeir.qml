import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "qrc:/Common/JS/InstrumentInfo.js" as InstrumentInfo
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "../../JS/InstrumentController.js" as InstrumentController

MenuItem {
    x: 265
    y: 120
    width: 900
    height: 350

    menuLayerId: "InstrumentModule"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        // default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }

    onVisibleChanged: {
        if(visible){
            update_model_timer.running = true;
        }else{
            update_model_timer.running = false;
        }
    }

    property int instrumentCurrentIndex: 0
    property var listModelIdArray: [listmodel_one, listmodel_two, listmodel_three, listmodel_four]

    onInstrumentCurrentIndexChanged: {
        //仪表信息显示前中后模块判断
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        if (instrumentCurrentIndex === 1) {
            CarMsg.sendMenuInfo(6,0);
            InstrumentController.initializeBeforeModule(listModelIdArray, instrumentInfoResource);
        } else if (instrumentCurrentIndex === 2) {
            CarMsg.sendMenuInfo(7,0);
            InstrumentController.initializeCenterModule(listModelIdArray, instrumentInfoResource);
        } else if (instrumentCurrentIndex === 3) {
            CarMsg.sendMenuInfo(8,0);
            InstrumentController.initializeAfterModule(listModelIdArray, instrumentInfoResource);
        } else {
            // default
        }
    }

    Timer {
        id: update_model_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            if (instrumentCurrentIndex === 0) {
                //
            } else if (instrumentCurrentIndex === 1) {
                listmodel_one.setProperty(0, "value", CarMsg.frontOutputCurrent01.toFixed(1));
                listmodel_one.setProperty(1, "value", CarMsg.frontOutputCurrent02.toFixed(1));
                listmodel_one.setProperty(2, "value", CarMsg.frontOutputCurrent03.toFixed(1));
                listmodel_one.setProperty(3, "value", CarMsg.frontOutputCurrent04.toFixed(1));
                listmodel_one.setProperty(4, "value", CarMsg.frontOutputCurrent05.toFixed(1));
                listmodel_one.setProperty(5, "value", CarMsg.frontOutputCurrent06.toFixed(1));
                listmodel_one.setProperty(6, "value", CarMsg.frontOutputCurrent07.toFixed(1));
                listmodel_one.setProperty(7, "value", CarMsg.frontOutputCurrent08.toFixed(1));
                listmodel_two.setProperty(0, "value", CarMsg.frontOutputCurrent09.toFixed(1));
                listmodel_two.setProperty(1, "value", CarMsg.frontOutputCurrent10.toFixed(1));
                listmodel_two.setProperty(2, "value", CarMsg.frontOutputCurrent11.toFixed(1));
                listmodel_two.setProperty(3, "value", CarMsg.frontOutputCurrent12.toFixed(1));
                listmodel_two.setProperty(4, "value", CarMsg.frontOutputCurrent13.toFixed(1));
                listmodel_two.setProperty(5, "value", CarMsg.frontOutputCurrent14.toFixed(1));
                listmodel_two.setProperty(6, "value", CarMsg.frontOutputCurrent15.toFixed(1));
                listmodel_one.setProperty(0, "checkstatus", CarMsg.frontOutputFault01);
                listmodel_one.setProperty(1, "checkstatus", CarMsg.frontOutputFault02);
                listmodel_one.setProperty(2, "checkstatus", CarMsg.frontOutputFault03);
                listmodel_one.setProperty(3, "checkstatus", CarMsg.frontOutputFault04);
                listmodel_one.setProperty(4, "checkstatus", CarMsg.frontOutputFault05);
                listmodel_one.setProperty(5, "checkstatus", CarMsg.frontOutputFault06);
                listmodel_one.setProperty(6, "checkstatus", CarMsg.frontOutputFault07);
                listmodel_one.setProperty(7, "checkstatus", CarMsg.frontOutputFault08);
                listmodel_two.setProperty(0, "checkstatus", CarMsg.frontOutputFault09);
                listmodel_two.setProperty(1, "checkstatus", CarMsg.frontOutputFault10);
                listmodel_two.setProperty(2, "checkstatus", CarMsg.frontOutputFault11);
                listmodel_two.setProperty(3, "checkstatus", CarMsg.frontOutputFault12);
                listmodel_two.setProperty(4, "checkstatus", CarMsg.frontOutputFault13);
                listmodel_two.setProperty(5, "checkstatus", CarMsg.frontOutputFault14);
                listmodel_two.setProperty(6, "checkstatus", CarMsg.frontOutputFault15);
                listmodel_three.setProperty(0, "checkstatus", CarMsg.frontSwitch01);
                listmodel_three.setProperty(1, "checkstatus", CarMsg.frontSwitch02);
                listmodel_three.setProperty(2, "checkstatus", CarMsg.frontSwitch03);
                listmodel_three.setProperty(3, "checkstatus", CarMsg.frontSwitch04);
                listmodel_three.setProperty(4, "checkstatus", CarMsg.frontSwitch05);
                listmodel_three.setProperty(5, "checkstatus", CarMsg.frontSwitch06);
                listmodel_three.setProperty(6, "checkstatus", CarMsg.frontSwitch07);
                listmodel_three.setProperty(7, "checkstatus", CarMsg.frontSwitch08);
                listmodel_four.setProperty(0, "checkstatus", CarMsg.frontSwitch09);
                listmodel_four.setProperty(1, "checkstatus", CarMsg.frontSwitch10);
                listmodel_four.setProperty(2, "checkstatus", CarMsg.frontSwitch11);
                listmodel_four.setProperty(3, "checkstatus", CarMsg.frontSwitch12);
                listmodel_four.setProperty(4, "checkstatus", CarMsg.frontSwitch13);
                listmodel_four.setProperty(5, "checkstatus", CarMsg.frontSwitch14);
                listmodel_four.setProperty(6, "checkstatus", CarMsg.frontSwitch15);
                listmodel_four.setProperty(7, "checkstatus", CarMsg.frontSwitch16);

                if (CarMsg.frontAnalogInput01 > 0) {
                    analog_input1.checkRadioStatus = true;
                } else {
                    analog_input1.checkRadioStatus = false;
                }
                if (CarMsg.frontAnalogInput02 > 0) {
                    analog_input2.checkRadioStatus = true;
                } else {
                    analog_input2.checkRadioStatus = false;
                }
                if (CarMsg.frontHzInput > 0) {
                    frequency_input.checkRadioStatus = true;
                } else {
                    frequency_input.checkRadioStatus = false;
                }
                if (CarMsg.frontSpeedInput > 0) {
                    speed_input.checkRadioStatus = true;
                } else {
                    speed_input.checkRadioStatus = false;
                }
                analog_input1.textValue = CarMsg.frontAnalogInput01.toFixed(1);
                analog_input2.textValue = CarMsg.frontAnalogInput02.toFixed(1);
                frequency_input.textValue = CarMsg.frontHzInput.toFixed(0);
                speed_input.textValue = CarMsg.frontSpeedInput.toFixed(0);
            } else if (instrumentCurrentIndex === 2) {
                listmodel_one.setProperty(0, "value", CarMsg.middleOutputCurrent01.toFixed(1));
                listmodel_one.setProperty(1, "value", CarMsg.middleOutputCurrent02.toFixed(1));
                listmodel_one.setProperty(2, "value", CarMsg.middleOutputCurrent03.toFixed(1));
                listmodel_one.setProperty(3, "value", CarMsg.middleOutputCurrent04.toFixed(1));
                listmodel_one.setProperty(4, "value", CarMsg.middleOutputCurrent05.toFixed(1));
                listmodel_one.setProperty(5, "value", CarMsg.middleOutputCurrent06.toFixed(1));
                listmodel_one.setProperty(6, "value", CarMsg.middleOutputCurrent07.toFixed(1));
                listmodel_one.setProperty(7, "value", CarMsg.middleOutputCurrent08.toFixed(1));
                listmodel_two.setProperty(0, "value", CarMsg.middleOutputCurrent09.toFixed(1));
                listmodel_two.setProperty(1, "value", CarMsg.middleOutputCurrent10.toFixed(1));
                listmodel_two.setProperty(2, "value", CarMsg.middleOutputCurrent11.toFixed(1));
                listmodel_two.setProperty(3, "value", CarMsg.middleOutputCurrent12.toFixed(1));
                listmodel_two.setProperty(4, "value", CarMsg.middleOutputCurrent13.toFixed(1));
                listmodel_two.setProperty(5, "value", CarMsg.middleOutputCurrent14.toFixed(1));
                listmodel_two.setProperty(6, "value", CarMsg.middleOutputCurrent15.toFixed(1));
                listmodel_one.setProperty(0, "checkstatus", CarMsg.middleOutputFault01);
                listmodel_one.setProperty(1, "checkstatus", CarMsg.middleOutputFault02);
                listmodel_one.setProperty(2, "checkstatus", CarMsg.middleOutputFault03);
                listmodel_one.setProperty(3, "checkstatus", CarMsg.middleOutputFault04);
                listmodel_one.setProperty(4, "checkstatus", CarMsg.middleOutputFault05);
                listmodel_one.setProperty(5, "checkstatus", CarMsg.middleOutputFault06);
                listmodel_one.setProperty(6, "checkstatus", CarMsg.middleOutputFault07);
                listmodel_one.setProperty(7, "checkstatus", CarMsg.middleOutputFault08);
                listmodel_two.setProperty(0, "checkstatus", CarMsg.middleOutputFault09);
                listmodel_two.setProperty(1, "checkstatus", CarMsg.middleOutputFault10);
                listmodel_two.setProperty(2, "checkstatus", CarMsg.middleOutputFault11);
                listmodel_two.setProperty(3, "checkstatus", CarMsg.middleOutputFault12);
                listmodel_two.setProperty(4, "checkstatus", CarMsg.middleOutputFault13);
                listmodel_two.setProperty(5, "checkstatus", CarMsg.middleOutputFault14);
                listmodel_two.setProperty(6, "checkstatus", CarMsg.middleOutputFault15);
                listmodel_three.setProperty(0, "checkstatus", CarMsg.middleSwitch01);
                listmodel_three.setProperty(1, "checkstatus", CarMsg.middleSwitch02);
                listmodel_three.setProperty(2, "checkstatus", CarMsg.middleSwitch03);
                listmodel_three.setProperty(3, "checkstatus", CarMsg.middleSwitch04);
                listmodel_three.setProperty(4, "checkstatus", CarMsg.middleSwitch05);
                listmodel_three.setProperty(5, "checkstatus", CarMsg.middleSwitch06);
                listmodel_three.setProperty(6, "checkstatus", CarMsg.middleSwitch07);
                listmodel_three.setProperty(7, "checkstatus", CarMsg.middleSwitch08);
                listmodel_four.setProperty(0, "checkstatus", CarMsg.middleSwitch09);
                listmodel_four.setProperty(1, "checkstatus", CarMsg.middleSwitch10);
                listmodel_four.setProperty(2, "checkstatus", CarMsg.middleSwitch11);
                listmodel_four.setProperty(3, "checkstatus", CarMsg.middleSwitch12);
                listmodel_four.setProperty(4, "checkstatus", CarMsg.middleSwitch13);
                listmodel_four.setProperty(5, "checkstatus", CarMsg.middleSwitch14);
                listmodel_four.setProperty(6, "checkstatus", CarMsg.middleSwitch15);
                listmodel_four.setProperty(7, "checkstatus", CarMsg.middleSwitch16);

                if (CarMsg.middleAnalogInput01 > 0) {
                    analog_input1.checkRadioStatus = true;
                } else {
                    analog_input1.checkRadioStatus = false;
                }
                if (CarMsg.middleAnalogInput02 > 0) {
                    analog_input2.checkRadioStatus = true;
                } else {
                    analog_input2.checkRadioStatus = false;
                }
                if (CarMsg.middleHzInput > 0) {
                    frequency_input.checkRadioStatus = true;
                } else {
                    frequency_input.checkRadioStatus = false;
                }
                if (CarMsg.middleSpeedInput > 0) {
                    speed_input.checkRadioStatus = true;
                } else {
                    speed_input.checkRadioStatus = false;
                }
                analog_input1.textValue = CarMsg.middleAnalogInput01.toFixed(1);
                analog_input2.textValue = CarMsg.middleAnalogInput02.toFixed(1);
                frequency_input.textValue = CarMsg.frontHzInput.toFixed(0);
                speed_input.textValue = CarMsg.frontSpeedInput.toFixed(0);
            } else if (instrumentCurrentIndex === 3) {
                listmodel_one.setProperty(0, "value", CarMsg.backOutputCurrent01.toFixed(1));
                listmodel_one.setProperty(1, "value", CarMsg.backOutputCurrent02.toFixed(1));
                listmodel_one.setProperty(2, "value", CarMsg.backOutputCurrent03.toFixed(1));
                listmodel_one.setProperty(3, "value", CarMsg.backOutputCurrent04.toFixed(1));
                listmodel_one.setProperty(4, "value", CarMsg.backOutputCurrent05.toFixed(1));
                listmodel_one.setProperty(5, "value", CarMsg.backOutputCurrent06.toFixed(1));
                listmodel_one.setProperty(6, "value", CarMsg.backOutputCurrent07.toFixed(1));
                listmodel_one.setProperty(7, "value", CarMsg.backOutputCurrent08.toFixed(1));
                listmodel_two.setProperty(0, "value", CarMsg.backOutputCurrent09.toFixed(1));
                listmodel_two.setProperty(1, "value", CarMsg.backOutputCurrent10.toFixed(1));
                listmodel_two.setProperty(2, "value", CarMsg.backOutputCurrent11.toFixed(1));
                listmodel_two.setProperty(3, "value", CarMsg.backOutputCurrent12.toFixed(1));
                listmodel_two.setProperty(4, "value", CarMsg.backOutputCurrent13.toFixed(1));
                listmodel_two.setProperty(5, "value", CarMsg.backOutputCurrent14.toFixed(1));
                listmodel_two.setProperty(6, "value", CarMsg.backOutputCurrent15.toFixed(1));
                listmodel_one.setProperty(0, "checkstatus", CarMsg.backOutputFault01);
                listmodel_one.setProperty(1, "checkstatus", CarMsg.backOutputFault02);
                listmodel_one.setProperty(2, "checkstatus", CarMsg.backOutputFault03);
                listmodel_one.setProperty(3, "checkstatus", CarMsg.backOutputFault04);
                listmodel_one.setProperty(4, "checkstatus", CarMsg.backOutputFault05);
                listmodel_one.setProperty(5, "checkstatus", CarMsg.backOutputFault06);
                listmodel_one.setProperty(6, "checkstatus", CarMsg.backOutputFault07);
                listmodel_one.setProperty(7, "checkstatus", CarMsg.backOutputFault08);
                listmodel_two.setProperty(0, "checkstatus", CarMsg.backOutputFault09);
                listmodel_two.setProperty(1, "checkstatus", CarMsg.backOutputFault10);
                listmodel_two.setProperty(2, "checkstatus", CarMsg.backOutputFault11);
                listmodel_two.setProperty(3, "checkstatus", CarMsg.backOutputFault12);
                listmodel_two.setProperty(4, "checkstatus", CarMsg.backOutputFault13);
                listmodel_two.setProperty(5, "checkstatus", CarMsg.backOutputFault14);
                listmodel_two.setProperty(6, "checkstatus", CarMsg.backOutputFault15);
                listmodel_three.setProperty(0, "checkstatus", CarMsg.backSwitch01);
                listmodel_three.setProperty(1, "checkstatus", CarMsg.backSwitch02);
                listmodel_three.setProperty(2, "checkstatus", CarMsg.backSwitch03);
                listmodel_three.setProperty(3, "checkstatus", CarMsg.backSwitch04);
                listmodel_three.setProperty(4, "checkstatus", CarMsg.backSwitch05);
                listmodel_three.setProperty(5, "checkstatus", CarMsg.backSwitch06);
                listmodel_three.setProperty(6, "checkstatus", CarMsg.backSwitch07);
                listmodel_three.setProperty(7, "checkstatus", CarMsg.backSwitch08);
                listmodel_four.setProperty(0, "checkstatus", CarMsg.backSwitch09);
                listmodel_four.setProperty(1, "checkstatus", CarMsg.backSwitch10);
                listmodel_four.setProperty(2, "checkstatus", CarMsg.backSwitch11);
                listmodel_four.setProperty(3, "checkstatus", CarMsg.backSwitch12);
                listmodel_four.setProperty(4, "checkstatus", CarMsg.backSwitch13);
                listmodel_four.setProperty(5, "checkstatus", CarMsg.backSwitch14);
                listmodel_four.setProperty(6, "checkstatus", CarMsg.backSwitch15);
                listmodel_four.setProperty(7, "checkstatus", CarMsg.backSwitch16);

                if (CarMsg.backAnalogInput01 > 0) {
                    analog_input1.checkRadioStatus = true;
                } else {
                    analog_input1.checkRadioStatus = false;
                }
                if (CarMsg.backAnalogInput02 > 0) {
                    analog_input2.checkRadioStatus = true;
                } else {
                    analog_input2.checkRadioStatus = false;
                }
                if (CarMsg.backHzInput > 0) {
                    frequency_input.checkRadioStatus = true;
                } else {
                    frequency_input.checkRadioStatus = false;
                }
                if (CarMsg.backSpeedInput > 0) {
                    speed_input.checkRadioStatus = true;
                } else {
                    speed_input.checkRadioStatus = false;
                }
                analog_input1.textValue = CarMsg.backAnalogInput01.toFixed(1);
                analog_input2.textValue = CarMsg.backAnalogInput02.toFixed(1);
                frequency_input.textValue = CarMsg.frontHzInput.toFixed(0);
                speed_input.textValue = CarMsg.frontSpeedInput.toFixed(0);
            } else {
                // default
            }
        }
    }

    ListModel {
        id: listmodel_one
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
    }
    ListModel {
        id: listmodel_two
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
        ListElement { name: ""; value: "0.0"; unit: "A"; checkstatus: false }
    }
    ListModel {
        id: listmodel_three
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
    }
    ListModel {
        id: listmodel_four
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
    }

    RowLayout {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        Rectangle {
            width: 530
            height: 270
            color: "transparent"
            border.color: "#ffffff"
            radius: 20
            Rectangle {
                width: 50
                height: 20
                color: "#000000"
                anchors.top: parent.top
                anchors.topMargin: -10
                anchors.horizontalCenter: parent.horizontalCenter
                TextFieldWeir {
                    textWidth: parent.width
                    textHeight: parent.height
                    textValue: "输出"
                    fontBold: true
                    fontSize: 15
                }
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                listModel: listmodel_one
                width: parent.width/4-70
                height: parent.height
                widthListView: parent.width/4-100
                fontSizeList: 15
                listRadioType: 2
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 260
                listModel: listmodel_two
                width: parent.width/4-70
                height: parent.height
                widthListView: parent.width/4-100
                fontSizeList: 15
                unitWidthList: 40
                listRadioType: 2
            }
        }
        Rectangle {
            width: 395
            height: 270
            color: "transparent"
            border.color: "#ffffff"
            radius: 20
            Rectangle {
                width: 50
                height: 20
                color: "#000000"
                anchors.top: parent.top
                anchors.topMargin: -10
                anchors.horizontalCenter: parent.horizontalCenter
                TextFieldWeir {
                    textWidth: parent.width
                    textHeight: parent.height
                    textValue: "输入"
                    fontBold: true
                    fontSize: 15
                }
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                listModel: listmodel_three
                width: parent.width/4-130
                height: parent.height
                widthListView: parent.width/4-150
                fontSizeList: 15
                unitWidthList: 40
                listRadioType: 1
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 210
                listModel: listmodel_four
                width: parent.width/4-70
                height: parent.height
                widthListView: parent.width/4-100
                fontSizeList: 15
                unitWidthList: 40
                listRadioType: 1
            }
        }
    }

    ColumnLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        RowLayout {
            spacing: 100
            TextRadioWeir {
                id: analog_input1
                width: 260
                height: 30
                radioType: 2
                textTitle: "模拟量输入 1"
                textValue: "1.0"//0.1倍
                unitValue: "Ω"
                checkRadioStatus: false
                fontSize: 15
                unitWidth: 60
            }
            TextRadioWeir {
                id: analog_input2
                width: 260
                height: 30
                radioType: 2
                textTitle: "模拟量输入 2"
                textValue: "1.0"//0.1倍
                unitValue: "Ω"
                checkRadioStatus: false
                fontSize: 15
                unitWidth: 60
            }
        }
        RowLayout {
            spacing: 100
            TextRadioWeir {
                id: frequency_input
                width: 260
                height: 30
                radioType: 2
                textTitle: "频率输入"
                textValue: "1.0"
                unitValue: "HZ"
                checkRadioStatus: false
                fontSize: 15
                unitWidth: 60
            }
            TextRadioWeir {
                id: speed_input
                width: 260
                height: 30
                radioType: 2
                textTitle: "车速输入"
                textValue: "120"
                unitValue: "KM/H"
                checkRadioStatus: false
                fontSize: 15
                unitWidth: 60
            }
        }
    }
}

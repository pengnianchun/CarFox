import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/JS/InstrumentInfo.js" as InstrumentInfo
import "qrc:/JS/InstrumentController.js" as InstrumentController

MenuItem {
    width: 800
    height: 410

    menuLayerId: "InstrumentModule"
    parentMenuId: "MenuMainDetail"

    property int instrumentCurrentIndex: 0
    property var listModelIdArray: [listmodel_one, listmodel_two, listmodel_three, listmodel_four]

    onInstrumentCurrentIndexChanged: {
        //仪表信息显示前中后模块判断
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        if (instrumentCurrentIndex === 1) {
            CarMsg.sendMenuInfo(6, 0);
            InstrumentController.initializeBeforeModule(listModelIdArray, instrumentInfoResource);
        } else if (instrumentCurrentIndex === 2) {
            CarMsg.sendMenuInfo(7, 0);
            InstrumentController.initializeCenterModule(listModelIdArray, instrumentInfoResource);
        } else if (instrumentCurrentIndex === 3) {
            CarMsg.sendMenuInfo(8, 0);
            InstrumentController.initializeAfterModule(listModelIdArray, instrumentInfoResource);
        } else {
            // default
        }
    }

    //6.前模块帧
    property string frontOutputCurrent01: CarMsg.frontOutputCurrent01.toFixed(2)
    property string frontOutputCurrent02: CarMsg.frontOutputCurrent02.toFixed(2)
    property string frontOutputCurrent03: CarMsg.frontOutputCurrent03.toFixed(2)
    property string frontOutputCurrent04: CarMsg.frontOutputCurrent04.toFixed(2)
    property string frontOutputCurrent05: CarMsg.frontOutputCurrent05.toFixed(2)
    property string frontOutputCurrent06: CarMsg.frontOutputCurrent06.toFixed(2)
    property string frontOutputCurrent07: CarMsg.frontOutputCurrent07.toFixed(2)
    property string frontOutputCurrent08: CarMsg.frontOutputCurrent08.toFixed(2)
    property string frontOutputCurrent09: CarMsg.frontOutputCurrent09.toFixed(2)
    property string frontOutputCurrent10: CarMsg.frontOutputCurrent10.toFixed(2)
    property string frontOutputCurrent11: CarMsg.frontOutputCurrent11.toFixed(2)
    property string frontOutputCurrent12: CarMsg.frontOutputCurrent12.toFixed(2)
    property string frontOutputCurrent13: CarMsg.frontOutputCurrent13.toFixed(2)
    property string frontOutputCurrent14: CarMsg.frontOutputCurrent14.toFixed(2)
    property string frontOutputCurrent15: CarMsg.frontOutputCurrent15.toFixed(2)

    property bool frontOutputFault01: CarMsg.frontOutputFault01
    property bool frontOutputFault02: CarMsg.frontOutputFault02
    property bool frontOutputFault03: CarMsg.frontOutputFault03
    property bool frontOutputFault04: CarMsg.frontOutputFault04
    property bool frontOutputFault05: CarMsg.frontOutputFault05
    property bool frontOutputFault06: CarMsg.frontOutputFault06
    property bool frontOutputFault07: CarMsg.frontOutputFault07
    property bool frontOutputFault08: CarMsg.frontOutputFault08
    property bool frontOutputFault09: CarMsg.frontOutputFault09
    property bool frontOutputFault10: CarMsg.frontOutputFault10
    property bool frontOutputFault11: CarMsg.frontOutputFault11
    property bool frontOutputFault12: CarMsg.frontOutputFault12
    property bool frontOutputFault13: CarMsg.frontOutputFault13
    property bool frontOutputFault14: CarMsg.frontOutputFault14
    property bool frontOutputFault15: CarMsg.frontOutputFault15

    property bool frontSwitch01: CarMsg.frontSwitch01
    property bool frontSwitch02: CarMsg.frontSwitch02
    property bool frontSwitch03: CarMsg.frontSwitch03
    property bool frontSwitch04: CarMsg.frontSwitch04
    property bool frontSwitch05: CarMsg.frontSwitch05
    property bool frontSwitch06: CarMsg.frontSwitch06
    property bool frontSwitch07: CarMsg.frontSwitch07
    property bool frontSwitch08: CarMsg.frontSwitch08
    property bool frontSwitch09: CarMsg.frontSwitch09
    property bool frontSwitch10: CarMsg.frontSwitch10
    property bool frontSwitch11: CarMsg.frontSwitch11
    property bool frontSwitch12: CarMsg.frontSwitch12
    property bool frontSwitch13: CarMsg.frontSwitch13
    property bool frontSwitch14: CarMsg.frontSwitch14
    property bool frontSwitch15: CarMsg.frontSwitch15
    property bool frontSwitch16: CarMsg.frontSwitch16

    //7.中模块帧
    property string middleOutputCurrent01: CarMsg.middleOutputCurrent01.toFixed(2)
    property string middleOutputCurrent02: CarMsg.middleOutputCurrent02.toFixed(2)
    property string middleOutputCurrent03: CarMsg.middleOutputCurrent03.toFixed(2)
    property string middleOutputCurrent04: CarMsg.middleOutputCurrent04.toFixed(2)
    property string middleOutputCurrent05: CarMsg.middleOutputCurrent05.toFixed(2)
    property string middleOutputCurrent06: CarMsg.middleOutputCurrent06.toFixed(2)
    property string middleOutputCurrent07: CarMsg.middleOutputCurrent07.toFixed(2)
    property string middleOutputCurrent08: CarMsg.middleOutputCurrent08.toFixed(2)
    property string middleOutputCurrent09: CarMsg.middleOutputCurrent09.toFixed(2)
    property string middleOutputCurrent10: CarMsg.middleOutputCurrent10.toFixed(2)
    property string middleOutputCurrent11: CarMsg.middleOutputCurrent11.toFixed(2)
    property string middleOutputCurrent12: CarMsg.middleOutputCurrent12.toFixed(2)
    property string middleOutputCurrent13: CarMsg.middleOutputCurrent13.toFixed(2)
    property string middleOutputCurrent14: CarMsg.middleOutputCurrent14.toFixed(2)
    property string middleOutputCurrent15: CarMsg.middleOutputCurrent15.toFixed(2)

    property bool middleOutputFault01: CarMsg.middleOutputFault01
    property bool middleOutputFault02: CarMsg.middleOutputFault02
    property bool middleOutputFault03: CarMsg.middleOutputFault03
    property bool middleOutputFault04: CarMsg.middleOutputFault04
    property bool middleOutputFault05: CarMsg.middleOutputFault05
    property bool middleOutputFault06: CarMsg.middleOutputFault06
    property bool middleOutputFault07: CarMsg.middleOutputFault07
    property bool middleOutputFault08: CarMsg.middleOutputFault08
    property bool middleOutputFault09: CarMsg.middleOutputFault09
    property bool middleOutputFault10: CarMsg.middleOutputFault10
    property bool middleOutputFault11: CarMsg.middleOutputFault11
    property bool middleOutputFault12: CarMsg.middleOutputFault12
    property bool middleOutputFault13: CarMsg.middleOutputFault13
    property bool middleOutputFault14: CarMsg.middleOutputFault14
    property bool middleOutputFault15: CarMsg.middleOutputFault15

    property bool middleSwitch01: CarMsg.middleSwitch01
    property bool middleSwitch02: CarMsg.middleSwitch02
    property bool middleSwitch03: CarMsg.middleSwitch03
    property bool middleSwitch04: CarMsg.middleSwitch04
    property bool middleSwitch05: CarMsg.middleSwitch05
    property bool middleSwitch06: CarMsg.middleSwitch06
    property bool middleSwitch07: CarMsg.middleSwitch07
    property bool middleSwitch08: CarMsg.middleSwitch08
    property bool middleSwitch09: CarMsg.middleSwitch09
    property bool middleSwitch10: CarMsg.middleSwitch10
    property bool middleSwitch11: CarMsg.middleSwitch11
    property bool middleSwitch12: CarMsg.middleSwitch12
    property bool middleSwitch13: CarMsg.middleSwitch13
    property bool middleSwitch14: CarMsg.middleSwitch14
    property bool middleSwitch15: CarMsg.middleSwitch15
    property bool middleSwitch16: CarMsg.middleSwitch16

    //8.后模块帧
    property string backOutputCurrent01: CarMsg.backOutputCurrent01
    property string backOutputCurrent02: CarMsg.backOutputCurrent02
    property string backOutputCurrent03: CarMsg.backOutputCurrent03
    property string backOutputCurrent04: CarMsg.backOutputCurrent04
    property string backOutputCurrent05: CarMsg.backOutputCurrent05
    property string backOutputCurrent06: CarMsg.backOutputCurrent06
    property string backOutputCurrent07: CarMsg.backOutputCurrent07
    property string backOutputCurrent08: CarMsg.backOutputCurrent08
    property string backOutputCurrent09: CarMsg.backOutputCurrent09
    property string backOutputCurrent10: CarMsg.backOutputCurrent10
    property string backOutputCurrent11: CarMsg.backOutputCurrent11
    property string backOutputCurrent12: CarMsg.backOutputCurrent12
    property string backOutputCurrent13: CarMsg.backOutputCurrent13
    property string backOutputCurrent14: CarMsg.backOutputCurrent14
    property string backOutputCurrent15: CarMsg.backOutputCurrent15

    property bool backOutputFault01: CarMsg.backOutputFault01
    property bool backOutputFault02: CarMsg.backOutputFault02
    property bool backOutputFault03: CarMsg.backOutputFault03
    property bool backOutputFault04: CarMsg.backOutputFault04
    property bool backOutputFault05: CarMsg.backOutputFault05
    property bool backOutputFault06: CarMsg.backOutputFault06
    property bool backOutputFault07: CarMsg.backOutputFault07
    property bool backOutputFault08: CarMsg.backOutputFault08
    property bool backOutputFault09: CarMsg.backOutputFault09
    property bool backOutputFault10: CarMsg.backOutputFault10
    property bool backOutputFault11: CarMsg.backOutputFault11
    property bool backOutputFault12: CarMsg.backOutputFault12
    property bool backOutputFault13: CarMsg.backOutputFault13
    property bool backOutputFault14: CarMsg.backOutputFault14
    property bool backOutputFault15: CarMsg.backOutputFault15

    property bool backSwitch01: CarMsg.backSwitch01
    property bool backSwitch02: CarMsg.backSwitch02
    property bool backSwitch03: CarMsg.backSwitch03
    property bool backSwitch04: CarMsg.backSwitch04
    property bool backSwitch05: CarMsg.backSwitch05
    property bool backSwitch06: CarMsg.backSwitch06
    property bool backSwitch07: CarMsg.backSwitch07
    property bool backSwitch08: CarMsg.backSwitch08
    property bool backSwitch09: CarMsg.backSwitch09
    property bool backSwitch10: CarMsg.backSwitch10
    property bool backSwitch11: CarMsg.backSwitch11
    property bool backSwitch12: CarMsg.backSwitch12
    property bool backSwitch13: CarMsg.backSwitch13
    property bool backSwitch14: CarMsg.backSwitch14
    property bool backSwitch15: CarMsg.backSwitch15
    property bool backSwitch16: CarMsg.backSwitch16

    Timer {
        id: update_model_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            if (instrumentCurrentIndex === 0) {
                //
            } else if (instrumentCurrentIndex === 1) {
                listmodel_one.setProperty(0, "value", frontOutputCurrent01);
                listmodel_one.setProperty(1, "value", frontOutputCurrent02);
                listmodel_one.setProperty(2, "value", frontOutputCurrent03);
                listmodel_one.setProperty(3, "value", frontOutputCurrent04);
                listmodel_one.setProperty(4, "value", frontOutputCurrent05);
                listmodel_one.setProperty(5, "value", frontOutputCurrent06);
                listmodel_one.setProperty(6, "value", frontOutputCurrent07);
                listmodel_one.setProperty(7, "value", frontOutputCurrent08);
                listmodel_two.setProperty(0, "value", frontOutputCurrent09);
                listmodel_two.setProperty(1, "value", frontOutputCurrent10);
                listmodel_two.setProperty(2, "value", frontOutputCurrent11);
                listmodel_two.setProperty(3, "value", frontOutputCurrent12);
                listmodel_two.setProperty(4, "value", frontOutputCurrent13);
                listmodel_two.setProperty(5, "value", frontOutputCurrent14);
                listmodel_two.setProperty(6, "value", frontOutputCurrent15);
                listmodel_one.setProperty(0, "checkstatus", frontOutputFault01);
                listmodel_one.setProperty(1, "checkstatus", frontOutputFault02);
                listmodel_one.setProperty(2, "checkstatus", frontOutputFault03);
                listmodel_one.setProperty(3, "checkstatus", frontOutputFault04);
                listmodel_one.setProperty(4, "checkstatus", frontOutputFault05);
                listmodel_one.setProperty(5, "checkstatus", frontOutputFault06);
                listmodel_one.setProperty(6, "checkstatus", frontOutputFault07);
                listmodel_one.setProperty(7, "checkstatus", frontOutputFault08);
                listmodel_two.setProperty(0, "checkstatus", frontOutputFault09);
                listmodel_two.setProperty(1, "checkstatus", frontOutputFault10);
                listmodel_two.setProperty(2, "checkstatus", frontOutputFault11);
                listmodel_two.setProperty(3, "checkstatus", frontOutputFault12);
                listmodel_two.setProperty(4, "checkstatus", frontOutputFault13);
                listmodel_two.setProperty(5, "checkstatus", frontOutputFault14);
                listmodel_two.setProperty(6, "checkstatus", frontOutputFault15);
                listmodel_three.setProperty(0, "checkstatus", frontSwitch01);
                listmodel_three.setProperty(1, "checkstatus", frontSwitch02);
                listmodel_three.setProperty(2, "checkstatus", frontSwitch03);
                listmodel_three.setProperty(3, "checkstatus", frontSwitch04);
                listmodel_three.setProperty(4, "checkstatus", frontSwitch05);
                listmodel_three.setProperty(5, "checkstatus", frontSwitch06);
                listmodel_three.setProperty(6, "checkstatus", frontSwitch07);
                listmodel_three.setProperty(7, "checkstatus", frontSwitch08);
                listmodel_four.setProperty(0, "checkstatus", frontSwitch09);
                listmodel_four.setProperty(1, "checkstatus", frontSwitch10);
                listmodel_four.setProperty(2, "checkstatus", frontSwitch11);
                listmodel_four.setProperty(3, "checkstatus", frontSwitch12);
                listmodel_four.setProperty(4, "checkstatus", frontSwitch13);
                listmodel_four.setProperty(5, "checkstatus", frontSwitch14);
                listmodel_four.setProperty(6, "checkstatus", frontSwitch15);
                listmodel_four.setProperty(7, "checkstatus", frontSwitch16);

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
                listmodel_one.setProperty(0, "value", middleOutputCurrent01);
                listmodel_one.setProperty(1, "value", middleOutputCurrent02);
                listmodel_one.setProperty(2, "value", middleOutputCurrent03);
                listmodel_one.setProperty(3, "value", middleOutputCurrent04);
                listmodel_one.setProperty(4, "value", middleOutputCurrent05);
                listmodel_one.setProperty(5, "value", middleOutputCurrent06);
                listmodel_one.setProperty(6, "value", middleOutputCurrent07);
                listmodel_one.setProperty(7, "value", middleOutputCurrent08);
                listmodel_two.setProperty(0, "value", middleOutputCurrent09);
                listmodel_two.setProperty(1, "value", middleOutputCurrent10);
                listmodel_two.setProperty(2, "value", middleOutputCurrent11);
                listmodel_two.setProperty(3, "value", middleOutputCurrent12);
                listmodel_two.setProperty(4, "value", middleOutputCurrent13);
                listmodel_two.setProperty(5, "value", middleOutputCurrent14);
                listmodel_two.setProperty(6, "value", middleOutputCurrent15);
                listmodel_one.setProperty(0, "checkstatus", middleOutputFault01);
                listmodel_one.setProperty(1, "checkstatus", middleOutputFault02);
                listmodel_one.setProperty(2, "checkstatus", middleOutputFault03);
                listmodel_one.setProperty(3, "checkstatus", middleOutputFault04);
                listmodel_one.setProperty(4, "checkstatus", middleOutputFault05);
                listmodel_one.setProperty(5, "checkstatus", middleOutputFault06);
                listmodel_one.setProperty(6, "checkstatus", middleOutputFault07);
                listmodel_one.setProperty(7, "checkstatus", middleOutputFault08);
                listmodel_two.setProperty(0, "checkstatus", middleOutputFault09);
                listmodel_two.setProperty(1, "checkstatus", middleOutputFault10);
                listmodel_two.setProperty(2, "checkstatus", middleOutputFault11);
                listmodel_two.setProperty(3, "checkstatus", middleOutputFault12);
                listmodel_two.setProperty(4, "checkstatus", middleOutputFault13);
                listmodel_two.setProperty(5, "checkstatus", middleOutputFault14);
                listmodel_two.setProperty(6, "checkstatus", middleOutputFault15);
                listmodel_three.setProperty(0, "checkstatus", middleSwitch01);
                listmodel_three.setProperty(1, "checkstatus", middleSwitch02);
                listmodel_three.setProperty(2, "checkstatus", middleSwitch03);
                listmodel_three.setProperty(3, "checkstatus", middleSwitch04);
                listmodel_three.setProperty(4, "checkstatus", middleSwitch05);
                listmodel_three.setProperty(5, "checkstatus", middleSwitch06);
                listmodel_three.setProperty(6, "checkstatus", middleSwitch07);
                listmodel_three.setProperty(7, "checkstatus", middleSwitch08);
                listmodel_four.setProperty(0, "checkstatus", middleSwitch09);
                listmodel_four.setProperty(1, "checkstatus", middleSwitch10);
                listmodel_four.setProperty(2, "checkstatus", middleSwitch11);
                listmodel_four.setProperty(3, "checkstatus", middleSwitch12);
                listmodel_four.setProperty(4, "checkstatus", middleSwitch13);
                listmodel_four.setProperty(5, "checkstatus", middleSwitch14);
                listmodel_four.setProperty(6, "checkstatus", middleSwitch15);
                listmodel_four.setProperty(7, "checkstatus", middleSwitch16);

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
                listmodel_one.setProperty(0, "value", backOutputCurrent01);
                listmodel_one.setProperty(1, "value", backOutputCurrent02);
                listmodel_one.setProperty(2, "value", backOutputCurrent03);
                listmodel_one.setProperty(3, "value", backOutputCurrent04);
                listmodel_one.setProperty(4, "value", backOutputCurrent05);
                listmodel_one.setProperty(5, "value", backOutputCurrent06);
                listmodel_one.setProperty(6, "value", backOutputCurrent07);
                listmodel_one.setProperty(7, "value", backOutputCurrent08);
                listmodel_two.setProperty(0, "value", backOutputCurrent09);
                listmodel_two.setProperty(1, "value", backOutputCurrent10);
                listmodel_two.setProperty(2, "value", backOutputCurrent11);
                listmodel_two.setProperty(3, "value", backOutputCurrent12);
                listmodel_two.setProperty(4, "value", backOutputCurrent13);
                listmodel_two.setProperty(5, "value", backOutputCurrent14);
                listmodel_two.setProperty(6, "value", backOutputCurrent15);
                listmodel_one.setProperty(0, "checkstatus", backOutputFault01);
                listmodel_one.setProperty(1, "checkstatus", backOutputFault02);
                listmodel_one.setProperty(2, "checkstatus", backOutputFault03);
                listmodel_one.setProperty(3, "checkstatus", backOutputFault04);
                listmodel_one.setProperty(4, "checkstatus", backOutputFault05);
                listmodel_one.setProperty(5, "checkstatus", backOutputFault06);
                listmodel_one.setProperty(6, "checkstatus", backOutputFault07);
                listmodel_one.setProperty(7, "checkstatus", backOutputFault08);
                listmodel_two.setProperty(0, "checkstatus", backOutputFault09);
                listmodel_two.setProperty(1, "checkstatus", backOutputFault10);
                listmodel_two.setProperty(2, "checkstatus", backOutputFault11);
                listmodel_two.setProperty(3, "checkstatus", backOutputFault12);
                listmodel_two.setProperty(4, "checkstatus", backOutputFault13);
                listmodel_two.setProperty(5, "checkstatus", backOutputFault14);
                listmodel_two.setProperty(6, "checkstatus", backOutputFault15);
                listmodel_three.setProperty(0, "checkstatus", backSwitch01);
                listmodel_three.setProperty(1, "checkstatus", backSwitch02);
                listmodel_three.setProperty(2, "checkstatus", backSwitch03);
                listmodel_three.setProperty(3, "checkstatus", backSwitch04);
                listmodel_three.setProperty(4, "checkstatus", backSwitch05);
                listmodel_three.setProperty(5, "checkstatus", backSwitch06);
                listmodel_three.setProperty(6, "checkstatus", backSwitch07);
                listmodel_three.setProperty(7, "checkstatus", backSwitch08);
                listmodel_four.setProperty(0, "checkstatus", backSwitch09);
                listmodel_four.setProperty(1, "checkstatus", backSwitch10);
                listmodel_four.setProperty(2, "checkstatus", backSwitch11);
                listmodel_four.setProperty(3, "checkstatus", backSwitch12);
                listmodel_four.setProperty(4, "checkstatus", backSwitch13);
                listmodel_four.setProperty(5, "checkstatus", backSwitch14);
                listmodel_four.setProperty(6, "checkstatus", backSwitch15);
                listmodel_four.setProperty(7, "checkstatus", backSwitch16);

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
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        Rectangle {
            width: 450
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
                    fontSize: 12
                }
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                listModel: listmodel_one
                width: parent.width/3
                height: parent.height
                widthListView: parent.width/3
                fontSizeList: 12
                textWidthList: 280
                unitWidthList: 15
                listRadioType: 2
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 220
                listModel: listmodel_two
                width: parent.width/3
                height: parent.height
                widthListView: parent.width/3
                fontSizeList: 12
                textWidthList: 280
                unitWidthList: 15
                listRadioType: 2
            }
        }
        Rectangle {
            width: 350
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
                    fontSize: 12
                }
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 5
                listModel: listmodel_three
                width: parent.width/4-40
                height: parent.height
                widthListView: parent.width/4-60
                fontSizeList: 12
                unitWidthList: 15
                listRadioType: 1
            }
            ListViewRadioWeir {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 200
                listModel: listmodel_four
                width: parent.width/4-40
                height: parent.height
                widthListView: parent.width/4-60
                fontSizeList: 12
                unitWidthList: 15
                listRadioType: 1
            }
        }
    }

    ColumnLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
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
                fontSize: 12
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
                fontSize: 12
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
                fontSize: 12
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
                fontSize: 12
                unitWidth: 60
            }
        }
    }

    Image {
        x: 8
        y: 2
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/more_before.png"
    }

    Image {
        x: 775
        y: 2
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/more.png"
    }

    enterMenu: function() {
        // default
    }

    hideMenu: function() {
        // default
    }

    previousMenu: function() {
        // default

    }

    nextMenu: function() {
        // default
        instrumentCurrentIndex ++
    }

    onVisibleChanged: {
        if(visible){
            instrumentCurrentIndex = 1
            update_model_timer.running = true;
        } else {
            update_model_timer.running = false;
        }
    }

    Component.onCompleted: {

    }
}

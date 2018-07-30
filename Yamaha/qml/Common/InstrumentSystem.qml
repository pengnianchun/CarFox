import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Component/Component"
import "qrc:/Common/JS/InstrumentInfo.js" as InstrumentInfo
//import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
//import "../../JS/InstrumentController.js" as InstrumentController

MenuItem {
    width: 800
    height: 410

    menuLayerId: "InstrumentSystem"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        // default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        //MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
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
    property var listModelIdArray: [listmodel_one, listmodel_two, listmodel_three, listmodel_four] // 仪表信息

    Component.onCompleted: {
        //初始化仪表模块配置信息
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        InstrumentController.initializeInstrumentModel(listModelIdArray, instrumentInfoResource);
        //请求数据
        CarMsg.sendMenuInfo(5, 0);
    }

    Timer {
        id: update_model_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            if(instrumentCurrentIndex === 0){
                listmodel_one.setProperty(0, "checkstatus", CarMsg.inputCtrl01);
                listmodel_one.setProperty(1, "checkstatus", CarMsg.inputCtrl02);
                listmodel_one.setProperty(2, "checkstatus", CarMsg.inputCtrl03);
                listmodel_one.setProperty(3, "checkstatus", CarMsg.inputCtrl04);
                listmodel_one.setProperty(4, "checkstatus", CarMsg.inputCtrl05);
                listmodel_one.setProperty(5, "checkstatus", CarMsg.inputCtrl06);
                listmodel_one.setProperty(6, "checkstatus", CarMsg.inputCtrl07);
                listmodel_one.setProperty(7, "checkstatus", CarMsg.inputCtrl08);
                listmodel_one.setProperty(8, "checkstatus", CarMsg.inputCtrl09);
                listmodel_one.setProperty(9, "checkstatus", CarMsg.inputCtrl10);
                listmodel_two.setProperty(0, "checkstatus", CarMsg.inputCtrl11);
                listmodel_two.setProperty(1, "checkstatus", CarMsg.inputCtrl12);
                listmodel_two.setProperty(2, "checkstatus", CarMsg.inputCtrl13);
                listmodel_two.setProperty(3, "checkstatus", CarMsg.inputCtrl14);
                listmodel_two.setProperty(4, "checkstatus", CarMsg.inputCtrl15);
                listmodel_two.setProperty(5, "checkstatus", CarMsg.inputCtrl16);
                listmodel_two.setProperty(6, "checkstatus", CarMsg.inputCtrl17);
                listmodel_two.setProperty(7, "checkstatus", CarMsg.inputCtrl18);
                listmodel_two.setProperty(8, "checkstatus", CarMsg.inputCtrl19);
                listmodel_two.setProperty(9, "checkstatus", CarMsg.inputCtrl20);
                listmodel_three.setProperty(0, "checkstatus", CarMsg.inputCtrl21);
                listmodel_three.setProperty(1, "checkstatus", CarMsg.inputCtrl22);
                listmodel_three.setProperty(2, "checkstatus", CarMsg.inputCtrl23);
                listmodel_three.setProperty(3, "checkstatus", CarMsg.inputCtrl24);
                listmodel_three.setProperty(4, "checkstatus", CarMsg.inputCtrl25);
                listmodel_three.setProperty(5, "checkstatus", CarMsg.inputCtrl26);
                listmodel_three.setProperty(6, "checkstatus", CarMsg.inputCtrl27);
                listmodel_three.setProperty(7, "checkstatus", CarMsg.inputCtrl28);
                listmodel_three.setProperty(8, "checkstatus", CarMsg.inputCtrl29);
                listmodel_three.setProperty(9, "checkstatus", CarMsg.inputCtrl30);
                listmodel_four.setProperty(0, "checkstatus", CarMsg.inputCtrl31);
                listmodel_four.setProperty(1, "checkstatus", CarMsg.inputCtrl32);
                listmodel_four.setProperty(2, "checkstatus", CarMsg.inputCtrl33);
                listmodel_four.setProperty(3, "checkstatus", CarMsg.inputCtrl34);
                listmodel_four.setProperty(4, "checkstatus", CarMsg.inputCtrl35);
            }
        }
    }

    ListModel {
        id: listmodel_one
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
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
        id: listmodel_two
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
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
        id: listmodel_three
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
        ListElement { name: ""; value: ""; unit: ""; checkstatus: false }
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
    }

    RowLayout {
        anchors.fill: parent
        spacing: 20

        ListViewRadioWeir {
            listModel: listmodel_one
            width: parent.width/4-50
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
        }
        ListViewRadioWeir {
            listModel: listmodel_two
            width: parent.width/4-60
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
            unitWidthList: 40
        }
        ListViewRadioWeir {
            listModel: listmodel_three
            width: parent.width/4-60
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
            unitWidthList: 40
        }
        ListViewRadioWeir {
            listModel: listmodel_four
            width: parent.width/4-60
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
            unitWidthList: 40
        }
    }
}

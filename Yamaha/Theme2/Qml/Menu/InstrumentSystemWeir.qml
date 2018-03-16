import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "qrc:/Common/JS/InstrumentInfo.js" as InstrumentInfo
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "../../JS/InstrumentController.js" as InstrumentController

MenuItem {
    menuLayerId: "InstrumentSystem"
    parentMenuId: "MenuMainDetail"
    width: 900
    height: 350
    x: 330
    y: 130
    property var listModelIdArray: [listmodel_one,listmodel_two,listmodel_three,listmodel_four]

    Component.onCompleted: {
        //初始化仪表模块配置信息
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        InstrumentController.initializeInstrumentModel(listModelIdArray,instrumentInfoResource);
    }

    enterMenu: function(){}
    hideMenu: function(){
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){}
    nextMenu: function(){}

    ListModel {
        id: listmodel_one
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodel_two
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodel_three
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_four
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        /*
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        */
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

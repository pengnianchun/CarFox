import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "qrc:/Common/JS/InstrumentInfo.js" as InstrumentInfo
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "../../JS/InstrumentController.js" as InstrumentController

MenuItem {
    menuLayerId: "AfterModule"
    parentMenuId: "MenuMainDetail"
    width: 900
    height: 350
    x: 280
    y: 130
    property var listModelIdArray: [listmodel_one,listmodel_two,listmodel_three,listmodel_four]

    Component.onCompleted: {
        var instrumentInfoResource = InstrumentInfo.getInsteumentInfo();
        InstrumentController.initializeAfterModule(listModelIdArray,instrumentInfoResource);
    }

    enterMenu: function(){}
    hideMenu: function(){
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){}
    nextMenu: function(){}

    ListModel {
        id: listmodel_one
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_two
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_three
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodel_four
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:true }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
        ListElement { name: "";value: "";unit: "";checkstatus:false }
    }
    RowLayout {
        anchors.fill: parent
        spacing: 120
        ListViewRadioWeir {
            listModel: listmodel_one
            width: parent.width/4-70
            height: parent.height
            widthListView: parent.width/4-100
            fontSizeList: 15
            listRadioType: 2
        }
        ListViewRadioWeir {
            listModel: listmodel_two
            width: parent.width/4-70
            height: parent.height
            widthListView: parent.width/4-100
            fontSizeList: 15
            unitWidthList: 40
            listRadioType: 2
        }
        ListViewRadioWeir {
            listModel: listmodel_three
            width: parent.width/4-130
            height: parent.height
            widthListView: parent.width/4-150
            fontSizeList: 15
            unitWidthList: 40
            listRadioType: 1
        }
        ListViewRadioWeir {
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

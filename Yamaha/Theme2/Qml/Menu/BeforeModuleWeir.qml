import QtQuick 2.6
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    menuLayerId: "BeforeModule"
    parentMenuId: "MenuMainDetail"
    width: 900
    height: 350
    x: 280
    y: 130

    enterMenu: function(){}
    hideMenu: function(){
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function(){}
    nextMenu: function(){}

    ListModel {
        id: listmodelone
        ListElement { name: "雨刮快档电机";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "雨刮慢档点击";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "喷水电机";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "左前雾灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "倒车灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "右转向灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "左转向灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "液位显示电源";value: "0.0";unit: "A";checkstatus:true }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "左远光灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "右前雾灯";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "右远光灯";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "行车记录仪电源";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "左近光灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "位置灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "右近光灯";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodelthree
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "左前摩擦片报警开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "右前摩擦片报警开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "制动灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodelfour
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "地址选择 1";value: "";unit: "";checkstatus:true }
        ListElement { name: "地址选择 2";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "倒车灯开关";value: "";unit: "";checkstatus:true }
    }
    RowLayout {
        anchors.fill: parent
        spacing: 120
        ListViewRadioWeir {
            listModel: listmodelone
            width: parent.width/4-70
            height: parent.height
            widthListView: parent.width/4-100
            fontSizeList: 15
            listRadioType: 2
        }
        ListViewRadioWeir {
            listModel: listmodeltwo
            width: parent.width/4-70
            height: parent.height
            widthListView: parent.width/4-100
            fontSizeList: 15
            unitWidthList: 40
            listRadioType: 2
        }
        ListViewRadioWeir {
            listModel: listmodelthree
            width: parent.width/4-130
            height: parent.height
            widthListView: parent.width/4-150
            fontSizeList: 15
            unitWidthList: 40
            listRadioType: 1
        }
        ListViewRadioWeir {
            listModel: listmodelfour
            width: parent.width/4-70
            height: parent.height
            widthListView: parent.width/4-100
            fontSizeList: 15
            unitWidthList: 40
            listRadioType: 1
        }
    }
}

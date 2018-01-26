import QtQuick 2.6
import QtQuick.Layouts 1.1
//import "../../Common/"
import "qrc:/Common/Qml/Common"

Item {
    width: 1200
    height: 350

    ListModel {
        id: listmodelone
        ListElement { name: "广告灯箱";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "右转向灯";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "车内指示灯电源";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "制动灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "前门开门电磁阀";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "前路牌";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "前门关门电磁阀";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "侧路牌";value: "0.0";unit: "A";checkstatus:true }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "中门开门电磁阀";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "后路牌";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "中门关门电磁阀";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "电子滚动屏";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "小灯电源";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "后广告屏";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "左转向灯";value: "0.0";unit: "A";checkstatus:false }
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
        ListElement { name: "前门踏步灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "中门踏步灯开关";value: "";unit: "";checkstatus:true }
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

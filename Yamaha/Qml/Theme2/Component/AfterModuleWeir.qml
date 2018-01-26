import QtQuick 2.6
import QtQuick.Layouts 1.1
//import "../../Common/"
import "qrc:/Common/Qml/Common"

Item {
    width: 1200
    height: 350

    ListModel {
        id: listmodelone
        ListElement { name: "制动灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "备用";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "后雾灯";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "备用";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "左转向灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "备用";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "右转向灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "干燥器电源";value: "0.0";unit: "A";checkstatus:true }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "倒车灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "备用";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "前门踏步灯";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "位置灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "中门踏步灯";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "备用";value: "0.0";unit: "A";checkstatus:true }
        ListElement { name: "备用";value: "0.0";unit: "A";checkstatus:false }
        ListElement { name: "水位传感器开关";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodelthree
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "空滤阻塞报警开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "制动灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "驻车制动开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "水温报警开关";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodelfour
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "地址开关 1";value: "";unit: "";checkstatus:true }
        ListElement { name: "地址开关 2";value: "";unit: "";checkstatus:true }
        ListElement { name: "低气压 1 报警开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "低气压 2 报警开关";value: "";unit: "";checkstatus:false }
        ListElement { name: "后舱门开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
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

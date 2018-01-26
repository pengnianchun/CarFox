import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
//import "../../Common/"
import "qrc:/Common/Qml/Common"

Item {
    width: 900
    height: 350

    ListModel {
        id: listmodelone
        ListElement { name: "左转向开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "钥匙ST开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "右转向开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "小灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "远光灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "近光灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "前雾灯开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "后雾灯开关";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "广告灯开关";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "雨刷低档开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "雨刷间歇当开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "雨刷高档开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "路牌开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "前门开开关";value: "";unit: "";checkstatus:true }
    }
    ListModel {
        id: listmodelthree
        ListElement { name: "雨刷喷水开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "中门关开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "中门开开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "前门关开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
    }
    ListModel {
        id: listmodelfour
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:false }
        ListElement { name: "燃油量过低报警";value: "";unit: "";checkstatus:false }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "备用";value: "";unit: "";checkstatus:true }
        ListElement { name: "危险警告开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "电源唤醒开关";value: "";unit: "";checkstatus:true }
        ListElement { name: "钥匙ON开关";value: "";unit: "";checkstatus:true }
    }
    RowLayout {
        anchors.fill: parent
        spacing: 20
        ListViewRadioWeir {
            listModel: listmodelone
            width: parent.width/4-50
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
        }
        ListViewRadioWeir {
            listModel: listmodeltwo
            width: parent.width/4-60
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
            unitWidthList: 40
        }
        ListViewRadioWeir {
            listModel: listmodelthree
            width: parent.width/4-60
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
            unitWidthList: 40
        }
        ListViewRadioWeir {
            listModel: listmodelfour
            width: parent.width/4-60
            height: parent.height
            widthListView: parent.width/4-50
            fontSizeList: 15
            unitWidthList: 40
        }
    }
}

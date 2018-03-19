import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "VcuSystemMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property var carLoadTitleArray: ["整车控制系统","整车控制系统诊断页面"]
    property int carLoadCurrentIndex: 0
    property bool bKeyEnable: false

    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId)
            bKeyEnable = false;
            carLoadCurrentIndex = 0;
        }
    }
    previousMenu: function(){
        if(bKeyEnable){
            if(carLoadCurrentIndex === 0){
                carLoadCurrentIndex = carLoadTitleArray.length-1;
            }else{
                carLoadCurrentIndex--;
            }
        }else{}
    }
    nextMenu: function(){
        if(bKeyEnable){
            if(carLoadCurrentIndex === carLoadTitleArray.length-1){
                carLoadCurrentIndex = 0;
            }else{
                carLoadCurrentIndex++;
            }
        }else{}
    }
    TextFieldWeir {
        id: title
        textValue: carLoadTitleArray[carLoadCurrentIndex]
        width: 150
        height: 30
        fontSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 110
    }
    TurnPageWeir {
        id: turn_page
        width: 100
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 360
        anchors.top: parent.top
        anchors.topMargin: 110
        fontSize: 15
        currentPageIndex: (carLoadCurrentIndex+1)//"1"
        totalPageCount: carLoadTitleArray.length
    }
    ListModel {
        id: listmodelone
        //脚刹 无 手刹 无
        ListElement { name: "驱动系统状态";value: "ready";unit: "" }
        //正常工作 非回收 非零锁 非定速
        ListElement { name: "驱动电机状态";value: "正常工作";unit: "" }
        ListElement { name: "钥匙acc档";value: "关闭";unit: "" }
        ListElement { name: "高压互锁状态";value: "互锁";unit: "" }
        ListElement { name: "空压机工作状态";value: "停止";unit: "" }
        ListElement { name: "空压机电机转速";value: "26.9";unit: "r/min" }
        ListElement { name: "空压机电机温度";value: "000";unit: "℃" }
        ListElement { name: "空压控制器温度";value: "000";unit: "℃" }
        ListElement { name: "气压3";value: "0.00";unit: "mpa" }
        ListElement { name: "气压4";value: "0.00";unit: "mpa" }
        ListElement { name: "气压5";value: "0.00";unit: "mpa" }
    }
    ListModel {
        id: listmodeltwo
        ListElement { name: "钥匙on档";value: "关闭";unit: "" }
        ListElement { name: "高压上电状态";value: "下电";unit: "" }
        ListElement { name: "助力泵工作状态";value: "停止";unit: "" }
        ListElement { name: "转向助力电机转速";value: "0000";unit: "r/min" }
        ListElement { name: "转向助力电机温度";value: "000";unit: "℃" }
        ListElement { name: "转向控制器温度";value: "000";unit: "℃" }
        ListElement { name: "最高报警等级";value: "无故障";unit: "" }
        ListElement { name: "故障报警形式";value: "正常";unit: "" }
        ListElement { name: "档位驱动模式";value: "直驱模式";unit: "" }
    }
    ListModel {
        id: listmodelthree
        ListElement { name: "驱动系统故障报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动控制器过压报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动控制器欠压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器编码器故障";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动控制器高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动控制器高温截止报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动控制器主接触器故障";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动控制器过流报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动电机高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "驱动电机高温截止报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动电机旋转故障报警";value: "";unit: "";checkstatus: true }
    }
    ListModel {
        id: listmodelfour
        ListElement { name: "驱动电机功率受限报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动电机转矩首先报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "驱动电机水温过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "加速踏板信号值异常报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "刹车踏板信号值异常报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "安全带报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "座椅开关报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "右侧舱门开启报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "左侧舱门开启报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "司机门未关报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "高压开关门开启报警";value: "";unit: "";checkstatus: true }
    }
    ListModel {
        id: listmodelfive
        ListElement { name: "充电门开启报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "安全门开启报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "低压开关门开启报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "ABS系统故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "空压机控制器高温报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "空压机电机高温报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "助力泵控制器高温报警";value: "";unit: "";checkstatus: true }
        ListElement { name: "助力泵电机高温报警";value: "";unit: "";checkstatus: true }
    }
    //整车控制系统
    RowLayout {
        width: 560
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 50
        visible: carLoadCurrentIndex === 0 ? true : false
        ListViewWeir {
            listModel: listmodelone
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 12
            titleColorList: "#00a7f5"
            listViewSpacing: 25
        }
        ListViewWeir {
            listModel: listmodeltwo
            width: parent.width/2-70
            height: parent.height
            widthListView: parent.width/2-70
            textWidthList: parent.width/2-70
            fontSizeList: 12
            titleColorList: "#00a7f5"
            listViewSpacing: 25
            unitWidthList: 40
        }
    }
    //整车控制诊断信息
    RowLayout {
        width: 560
        height: 360
        visible: carLoadCurrentIndex === 1 ? true : false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -20
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 20
        ColumnLayout {
            width: parent.width/3
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodelthree
                delegate: TextRadioWeir {
                    width: 180
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/3
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodelfour
                delegate: TextRadioWeir {
                    width: 180
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/3
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodelfive
                delegate: TextRadioWeir {
                    width: 180
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
            ColumnLayout{
                anchors.top: parent.top
                anchors.topMargin: 200
                anchors.right: parent.right
                spacing: -5
                TextValueWeir {
                    width: 180
                    height: 30
                    textTitle: "VCU程序版本号"
                    textValue: "00.00"
                    unitValue: ""
                    titleColor: "#00a7f5"
                    textWidth: 180
                    fontSize: 12
                }
                TextValueWeir {
                    width: 180
                    height: 30
                    textTitle: "VCU系统Life值"
                    textValue: "000"
                    unitValue: ""
                    titleColor: "#00a7f5"
                    textWidth: 180
                    fontSize: 12
                }
                TextValueWeir {
                    width: 180
                    height: 30
                    textTitle: "沂星CAN通信协议"
                    textValue: "5.2"
                    unitValue: ""
                    titleColor: "#00a7f5"
                    textWidth: 180
                    fontSize: 12
                }
            }
        }
    }
}

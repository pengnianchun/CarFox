import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController
import "qrc:/Common/Component"

MenuItem {
    id: menuPanelIndex
    width: 1440
    height: 544
    menuLayerId: "MoterBatteryMenu"
    parentMenuId: "MenuPanel"
    visible: false

    property bool bKeyEnable: false
    property int boxNumberVoltage: CarMsg.boxNumberVoltage
    property var voltageInfo: CarMsg.voltageInfo
    property var carLoadTitleArray: ["电池管理系统信息","单体电池信息（电池箱1）","单体电池信息（电池箱2）",
        "单体电池信息（电池箱3）","单体电池信息（电池箱4）","单体电池信息（电池箱5）","单体电池信息（电池箱6）","单体电池信息（电池箱7）"
        ,"单体电池信息（电池箱8）","单体电池信息（电池箱9）","单体电池信息（电池箱10）","电池诊断信息1","电池诊断信息2"]
    property int carLoadCurrentIndex: 0

    onVoltageInfoChanged: {
        console.log("=============0000=================" + boxNumberVoltage);
        console.log("=============1111=================" + voltageInfo);
        console.log("=============2222=================" + voltageInfo.toString());
        console.log("=============3333=================" + JSON.stringify(voltageInfo));
        console.log("=============4444=================" + voltageInfo.toString().split(","));
    }
    onVisibleChanged: {
        if(visible){
            update_model_timer.running = true;
        }else{
            update_model_timer.running = false;
        }
    }
    Timer {
        id: update_model_timer
        running: false
        repeat: true
        interval: 1000
        onTriggered: {}
    }
    onCarLoadCurrentIndexChanged: {
        if(carLoadCurrentIndex === 0){
            CarMsg.sendMenuInfo(23,0);
        }else if(instrumentCurrentIndex === 1){
            CarMsg.sendMenuInfo(25,0);
        }else if(instrumentCurrentIndex === 2){
        }else if(instrumentCurrentIndex === 3){
        }else if(instrumentCurrentIndex === 4){
        }else if(instrumentCurrentIndex === 5){
        }else if(instrumentCurrentIndex === 6){
        }else if(instrumentCurrentIndex === 7){
        }else if(instrumentCurrentIndex === 8){
        }else if(instrumentCurrentIndex === 9){
        }else if(instrumentCurrentIndex === 10){
        }else if(instrumentCurrentIndex === 11){
            CarMsg.sendMenuInfo(24,0);
        }else{}
    }
    hideMenu: function(){
        if(bKeyEnable){
            MenuMainDetailController.returnMenuPanel(menuLayerId, parentMenuId);
            bKeyEnable = false;
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
    ListModel {
        id: listmodel1
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel2
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel3
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel4
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel5
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel6
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel7
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel8
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
        ListElement { name: "";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel9
        ListElement { name: "bms程序版本号";value: "0.000";unit: "" }
        ListElement { name: "bms模块总数量";value: "0.000";unit: "" }
        ListElement { name: "动力电池类型";value: "0.000";unit: "" }
        ListElement { name: "单体电池最高电圧";value: "0.000";unit: "V" }
        ListElement { name: "电池组最高温度";value: "0.000";unit: "℃" }
        ListElement { name: "电池组当前电量";value: "0.000";unit: "kwh" }
        ListElement { name: "正极绝缘电阻阻值";value: "0.000";unit: "kΩ" }
        ListElement { name: "单体电池总数";value: "0.000";unit: "" }
        ListElement { name: "可充电储能系统温度探针个数";value: "0.000";unit: "" }
        ListElement { name: "充电插座直流电源正极温度";value: "0.000";unit: "℃" }
        ListElement { name: "充电插座直流电源负极温度";value: "0.000";unit: "℃" }
    }
    ListModel {
        id: listmodel10
        ListElement { name: "动力电池充电次数";value: "0.000";unit: "" }
        ListElement { name: "bms的life值";value: "0.000";unit: "" }
        ListElement { name: "电池组最低温度";value: "0.000";unit: "℃" }
        ListElement { name: "bms管控状态";value: "0.000";unit: "" }
        ListElement { name: "负极绝缘电阻阻值";value: "0.000";unit: "kΩ" }
        ListElement { name: "充电状态";value: "0.000";unit: "" }
    }
    ListModel {
        id: listmodel11
        ListElement { name: "单体电压过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压过高截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压过低截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "峰值充电电流过大";value: "";unit: "";checkstatus: false }
        ListElement { name: "峰值放电电流过大";value: "";unit: "";checkstatus: false }
        ListElement { name: "峰值放电电流过大截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池放电温度过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池放电温度过低截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电温度过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电温度过高截止报警";value: "";unit: "";checkstatus: false }
    }
    ListModel {
        id: listmodel12
        ListElement { name: "电池温度过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池温度过高截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压压差过大报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "单体电压压差过大截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电电压过高";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池温度差异报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "电池充电温度过低截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池充电温度过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池SOC过低报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池SOC过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力电池模块通讯失效";value: "";unit: "";checkstatus: false }
    }
    ListModel {
        id: listmodel13
        ListElement { name: "BMS系统故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "动力蓄电池故障";value: "";unit: "";checkstatus: false }
        ListElement { name: "制动能量回收电流过大报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "制动能量回收单体电压过高报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "制动能量回收单体电压过高截止报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "取消制动能量回收功能";value: "";unit: "";checkstatus: false }
        ListElement { name: "SOC跳变报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "可充电储能系统不匹配报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "车载储能装置类型过压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "车载储能装置类型欠压报警";value: "";unit: "";checkstatus: false }
        ListElement { name: "车载储能装置类型过充";value: "";unit: "";checkstatus: false }
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
        currentPageIndex: (carLoadCurrentIndex+1)
        totalPageCount: carLoadTitleArray.length
    }
    TextFieldWeir {
        x: 940
        y: 160
        visible: (carLoadCurrentIndex<=10)&&(carLoadCurrentIndex>0) ? true : false
        textValue: "(单位：V)"
        width: 50
        height: 30
        textHeight: 30
        fontSize: 12
        fontColor: "#00a7f5"
    }
    TextFieldWeir {
        x: 940
        y: 330
        z: 3
        visible: (carLoadCurrentIndex<=10)&&(carLoadCurrentIndex>0) ? true : false
        textValue: "(单位：℃)"
        width: 50
        height: 30
        textHeight: 30
        fontSize: 12
        fontColor: "#00a7f5"
    }
    //电池组信息
    ColumnLayout {
        z: 1
        visible: (carLoadCurrentIndex<=10)&&(carLoadCurrentIndex>0) ? true : false
        width: 650
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 120
        spacing: -150
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "01~10"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel1
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 0
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "11~20"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel2
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "21~30"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel3
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 1
                textValue: "31~40"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel4
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "41~50"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel5
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "51~60"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel6
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        Item { width: parent.width; height: 30 }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "01~10"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel7
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
        RowLayout {
            width: parent.width
            height: 30
            spacing: 0
            TextFieldWeir {
                z: 2
                textValue: "11~20"
                anchors.left: parent.left
                anchors.leftMargin: -40
                width: 50
                height: 30
                fontSize: 12
                fontColor: "#00a7f5"
            }
            Repeater {
                z: 1
                width: parent.width-50
                height: parent.height
                model: listmodel8
                delegate: TextValueWeir {
                    width: 60
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    titleColor: "#00a7f5"
                    textWidth: 60
                    fontSize: 12
                    unitWidth: 5
                    leftAlignStatus: true
                }
            }
        }
    }
    //电池管理系统
    RowLayout{
        visible: carLoadCurrentIndex === 0 ? true : false
        width: 600
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 30
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel9
                delegate: TextValueWeir {
                    width: 280
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    titleColor: "#00a7f5"
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel10
                delegate: TextValueWeir {
                    width: 280
                    height: 30
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    titleColor: "#00a7f5"
                    fontSize: 12
                }
            }
        }
    }
    //动力电池诊断系统
    RowLayout{
        visible: carLoadCurrentIndex === 11 ? true : false
        width: 600
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 40
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 10
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel11
                delegate: TextRadioWeir {
                    width: 280
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
        ColumnLayout {
            width: parent.width/2-20
            height: parent.height
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel12
                delegate: TextRadioWeir {
                    width: 280
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
    }
    RowLayout{
        visible: carLoadCurrentIndex === 12 ? true : false
        width: 600
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 40
        anchors.top: parent.top
        anchors.topMargin: 150
        spacing: 10
        ColumnLayout {
            width: parent.width
            height: parent.height
            anchors.left: parent.left
            spacing: -5
            Repeater {
                width: parent.width
                height: parent.height
                model: listmodel13
                delegate: TextRadioWeir {
                    width: 280
                    height: 30
                    radioType: 1
                    textTitle: name
                    textValue: value
                    unitValue: unit
                    textWidth: 280
                    checkRadioStatus: checkstatus
                    fontSize: 12
                }
            }
        }
    }
}

import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item{
    id:root
    anchors.fill: parent
    visible: false

    Image {
        id: powerBattery1_title
        x:254
        y:0
        width: 256
        height: 43
        source: "qrc:/Theme/Theme3/Image/1st/Text/VehicleCtrlSysDiagInterface.png"
    }
    Row{
        x:32
        y:48
        spacing: 20
        VehicleCtrlSysDiagInterfaceColumn{
            model: ListModel{
                id:column_1
                ListElement{name:"1.";value:"驱动系统故障报警"}
                ListElement{name:"2.";value:"驱动控制器过压报警"}
                ListElement{name:"3.";value:"驱动控制器欠压报警"}
                ListElement{name:"4.";value:"驱动控制器编码器报警"}
                ListElement{name:"5.";value:"驱动控制器高温报警"}
                ListElement{name:"6.";value:"驱动控制器高温截止报警"}
                ListElement{name:"7.";value:"驱动控制器主接触器故障"}
                ListElement{name:"8.";value:"驱动控制器过流报警"}
                ListElement{name:"9.";value:"驱动电机高温报警"}
                ListElement{name:"10.";value:"驱动电机高温截止报警"}
                ListElement{name:"11.";value:"驱动电机旋故障报警"}
            }
        }
        VehicleCtrlSysDiagInterfaceColumn{
            model: ListModel{
                id:column_2
                ListElement{name:"12.";value:"驱动电机功率受限报警"}
                ListElement{name:"13.";value:"驱动电机转矩受限报警"}
                ListElement{name:"14.";value:"驱动电机水温过高报警"}
                ListElement{name:"15.";value:"加速踏板信号值异常报警"}
                ListElement{name:"16.";value:"刹车踏板信号值异常报警"}
                ListElement{name:"17.";value:"安全带报警"}
                ListElement{name:"18.";value:"桌椅开关报警"}
                ListElement{name:"19.";value:"右侧舱门开启报警"}
                ListElement{name:"20.";value:"左侧舱门开启报警"}
                ListElement{name:"21.";value:"司机门未关报警"}
                ListElement{name:"22.";value:"高压开关门开启报警"}
            }
        }
        VehicleCtrlSysDiagInterfaceColumn{
            model: ListModel{
                id:column_3
                ListElement{name:"23.";value:"充电门开启报警"}
                ListElement{name:"24.";value:"安全门开启报警"}
                ListElement{name:"25.";value:"低压开关门开启报警"}
                ListElement{name:"26.";value:"ABS系统故障"}
                ListElement{name:"27.";value:"空压机控制器高温报警"}
                ListElement{name:"28.";value:"空压机点就高温报警"}
                ListElement{name:"29.";value:"助力汞控制器报警"}
                ListElement{name:"30.";value:"助力汞电机高温报警"}
                ListElement{name:"VCU程序版本号";value:"00.0"}
                ListElement{name:"VCU系统Life值";value:"000"}
                ListElement{name:"沂星CAN通讯协议";value:"5.2"}
            }

        }
    }
}





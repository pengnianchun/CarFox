import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item{
    id:root
    anchors.fill: parent
    visible: false
    Image{
        id:vcu_title
        x:307
        y:0
        width:164
        height:44
        source:"qrc:/Theme/Theme3/Image/1st/Text/VCU.png"
    }

    Row{
        x:95
        y:91
        spacing:20
        VCUColumn{
            id:column_1
            model:ListModel{
                ListElement{name:"钥匙acc档";value:"关闭"}
                ListElement{name:"高压胡锁状态";value:"胡锁状态"}
                ListElement{name:"空压机工作状态";value:"停止"}
                ListElement{name:"空压机电机转速";value:"0000r/min"}
                ListElement{name:"空压机电机温度";value:"关闭"}
                ListElement{name:"空压机控制器温度";value:"000℃"}
                ListElement{name:"气压3";value:"0.00mpa"}
                ListElement{name:"气压4";value:"0.00mpa"}
                ListElement{name:"气压5";value:"0.00mpa"}
            }
        }
        VCUColumn{
            id:column_2
            model:ListModel{
                ListElement{name:"钥匙on档";value:"关闭"}
                ListElement{name:"高压上电状态";value:"下电"}
                ListElement{name:"助力汞工作状态";value:"停止"}
                ListElement{name:"转向助力电机转速";value:"0000r/min"}
                ListElement{name:"转向助力电机温度";value:"000℃"}
                ListElement{name:"转向控制器温度";value:"000℃"}
                ListElement{name:"最高报警等级";value:"无故障"}
                ListElement{name:"故障报警形势";value:"正常"}
                ListElement{name:"档位驱动模式";value:"直驱模式"}
            }
        }
    }
}



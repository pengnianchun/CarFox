import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item{
    id:root
    anchors.fill: parent
    visible:false

    Image {
        id: powerBattery2_title
        x:271
        y:23
        width: 365
        height: 44
        source: "qrc:/Theme/Theme3/Image/1st/Text/PowerBattery2.png"
    }

    Row{
       x:80
       y:62
       spacing: 250

       PowerBattery2Column{
           id:colunm_1
           model:ListModel{
               ListElement{name:"1";value:"峰值放电电流过大截止报警"}
               ListElement{name:"2";value:"电池充电温度过高报警"}
               ListElement{name:"3";value:"电池充电温度过高截止报警"}
               ListElement{name:"4";value:"电池充电温度过低截止报警"}
               ListElement{name:"5";value:"动力电池soc过高报警"}
               ListElement{name:"6";value:"制动能量回收单体电压过高报警"}
               ListElement{name:"7";value:"制动能量回收单体电压过高截止报警"}
               ListElement{name:"8";value:"取消制动能力回收功能"}
           }
       }

       PowerBattery2Column{
           id:colunm_2
           model:ListModel{
               ListElement{name:"1";value:"soc跳变报警"}
               ListElement{name:"2";value:"可充电储能系统不匹配报警"}
               ListElement{name:"3";value:"车载储能装置类型过压报警"}
               ListElement{name:"4";value:"车载储能装置类型欠压报警"}
               ListElement{name:"5";value:"车载储能装置类型过充"}
            }
        }
    }
}


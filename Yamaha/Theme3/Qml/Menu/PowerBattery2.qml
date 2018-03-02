import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
Item{
    id:root
    x:377
    y:44
    visible:false

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string powerBattery2TitleImage:sourceImageUrl+"Image/MenuPanel/powerBattery2.png";

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onKeyShortPressed: {
            if(key === 1) //back键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("PowerBattery2");
                UiController.showLayer("MenuPanel");
            }
            if(key === 2) //next键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("PowerBattery2");
                UiController.showLayer("PowerBattery1");
            }
        }
    }

    Image {
        id: powerBattery2_title
        x:271
        y:23
        width: 365
        height: 44
        source: powerBattery2TitleImage
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


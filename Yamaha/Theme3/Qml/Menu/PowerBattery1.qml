import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
Item{
    id:root
    x:377
    y:44
    visible: false

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
                UiController.hideLayer("PowerBattery1");
                UiController.showLayer("MenuPanel");
            }
            if(key === 3) //next键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("PowerBattery1");
                UiController.showLayer("PowerBattery2");
            }
        }
    }

    Image {
        id: powerBattery1_title
        x:271
        y:23
        width: 363
        height: 44
        source: "qrc:/Theme/Theme3/Image/MenuPanel/powerBattery1.png"
    }

    Row{
        x:80     //第一列起始位置
        y:62
        spacing: 270    //列距

        PowerBattery1Column{
            id: column_1
            model:ListModel{
                ListElement{name:"1";value:""}
                ListElement{name:"2";value:"单体电压过高报警"}
                ListElement{name:"3";value:"单体电压过高截止报警"}
                ListElement{name:"4";value:"单体电压过低报警"}
                ListElement{name:"5";value:"单体电压过低截止报警"}
                ListElement{name:"6";value:"峰值放电电流过大"}
                ListElement{name:"7";value:"峰值充电电流过大"}
                ListElement{name:"8";value:"电池温度过高报警"}
                ListElement{name:"9";value:"电池放电温度过低报警"}
                ListElement{name:"10";value:"电池温度过高截止报警"}
                ListElement{name:"11";value:"电池放电温度过低报警"}
                ListElement{name:"12";value:"单体电压压差过大报警"}
            }
        }

        PowerBattery1Column{
            id: column_2
            model:ListModel{
                ListElement{name:"13";value:"单体电压压差过大截止报警"}
                ListElement{name:"14";value:"电池充电电流过高"}
                ListElement{name:"15";value:"动力电池温度差异报警"}
                ListElement{name:"16";value:"动力电池充电温度过低"}
                ListElement{name:"17";value:"动力电池soc过低报警"}
                ListElement{name:"18";value:""}
                ListElement{name:"19";value:""}
                ListElement{name:"20";value:"动力电池模块通讯失效"}
                ListElement{name:"21";value:"bms系统故障"}
                ListElement{name:"22";value:"动力蓄电池故障"}
                ListElement{name:"23";value:"制动能力回收电流过大报警"}
            }
        }
    }
}

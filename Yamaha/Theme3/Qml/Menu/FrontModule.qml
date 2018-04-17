import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

MenuItem{
    id:root
    x:377
    y:44
    visible:false
    menuLayerId: "FrontModule"
    parentMenuId: "MenuPanel"

    onVisibleChanged: {
        if(visible)
        {
            console.log("slllllllll")
            CarMsg.sendMenuInfo(1, 5)
        }
    }

    enterMenu: function(){
    }
    hideMenu: function(){
        UiController.hideLayer("FrontModule");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
    }
    nextMenu: function(){
        UiController.hideLayer("FrontModule");
        UiController.showLayer("MiddleModule");
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("FrontModule");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
    }

    Text{
        x:130
        y:68
        text:"输出"
        font.family: "PingFang SC Regular"
        font.pixelSize: 14; font.weight: Font.Black
        color: "#00ccff"
    }
    Text{
        x:463
        y:68
        text:"输入"
        font.family: "PingFang SC Regular"
        font.pixelSize: 14; font.weight: Font.Black
        color: "#00ccff"
    }
    Image{
        id:title
        x:300
        y:32
        width:138
        height:44
        source:"qrc:/Theme/Theme3/Image/MenuPanel/module_front_title.png";
    }
    Image{
        id:tableImage
        x:24
        y:66
        width:654
        height:309
        fillMode: Image.Stretch
        source:"qrc:/Theme/Theme3/Image/MenuPanel/table.png";
    }

    Row{
        x:38     //第一列起始位置
        y:90
        spacing: 40   //列距

        Column{
            spacing:4
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault01:0;pName:"雨刮快档";pValue:CarMsg?CarMsg.frontOutputCurrent01:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault02:0;pName:"雨刮慢档、间歇档";pValue:CarMsg?CarMsg.frontOutputCurrent02:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault03:0;pName:"喷水电机";pValue:CarMsg?CarMsg.frontOutputCurrent03:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault04:0;pName:"雨刮电机电源";pValue:CarMsg?CarMsg.frontOutputCurrent04:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault05:0;pName:"左远光灯";pValue:CarMsg?CarMsg.frontOutputCurrent05:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault06:0;pName:"右远光灯";pValue:CarMsg?CarMsg.frontOutputCurrent06:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault07:0;pName:"左近光灯";pValue:CarMsg?CarMsg.frontOutputCurrent07:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault08:0;pName:"右近光灯";pValue:CarMsg?CarMsg.frontOutputCurrent08:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault09:0;pName:"位置灯";pValue:CarMsg?CarMsg.frontOutputCurrent09:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault10:0;pName:"收放机电源";pValue:CarMsg?CarMsg.frontOutputCurrent10:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault11:0;pName:"ABS/ECAS启动电源";pValue:CarMsg?CarMsg.frontOutputCurrent11:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault12:0;pName:"投币机电源";pValue:CarMsg?CarMsg.frontOutputCurrent12:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault13:0;pName:"档位器电源/除霜器电源";pValue:CarMsg?CarMsg.frontOutputCurrent13:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault14:0;pName:"日间行车灯电源";pValue:CarMsg?CarMsg.frontOutputCurrent14:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.frontOutputFault15:0;pName:"后视镜电源";pValue:CarMsg?CarMsg.frontOutputCurrent15:0}
        }
        Row{
            x:0     //第一列起始位置
            y:0
            spacing: 30   //列距
            Column{
                spacing:4
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch01:false;pName:"左前蹄片磨损报警";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch02:false;pName:"右前蹄片磨损报警";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch03:false;pName:"行李仓灯开关";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch04:false;pName:"电子路牌开关";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch05:false;pName:"广告灯箱开关";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch06:false;pName:"电视机开关";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch07:false;pName:"通道灯开关1";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch08:false;pName:"通道灯开关2";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch09:false;pName:"换气扇开关1";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch10:false;pName:"换气扇开关2";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch11:false;pName:"备用";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch12:false;pName:"ABS指示";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch13:false;pName:"ADD1地址选择1";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch14:false;pName:"ADD2地址选择2";}
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch15:false;pName:"中门开到位信号";}
              }
            Column{
                spacing:4
                FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontSwitch16:0;pName:"前门开到位信号";}
            }
        }
    }
}

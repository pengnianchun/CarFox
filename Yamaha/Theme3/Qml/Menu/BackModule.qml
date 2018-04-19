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
            CarMsg.sendMenuInfo(8, 0);
        }
    }
    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("BackModule");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        UiController.hideLayer("BackModule");
        UiController.showLayer("MiddleModule");
    }
    nextMenu: function(){
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("BackModule");
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
        source:"qrc:/Theme/Theme3/Image/MenuPanel/module_back_title.png";
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
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault01:0;pName:"雨刮快档";pValue:CarMsg?CarMsg.backOutputCurrent01:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault02:0;pName:"雨刮慢档、间歇档";pValue:CarMsg?CarMsg.backOutputCurrent02:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault03:0;pName:"喷水电机";pValue:CarMsg?CarMsg.backOutputCurrent03:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault04:0;pName:"雨刮电机电源";pValue:CarMsg?CarMsg.backOutputCurrent04:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault05:0;pName:"左远光灯";pValue:CarMsg?CarMsg.backOutputCurrent05:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault06:0;pName:"右远光灯";pValue:CarMsg?CarMsg.backOutputCurrent06:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault07:0;pName:"左近光灯";pValue:CarMsg?CarMsg.backOutputCurrent07:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault08:0;pName:"右近光灯";pValue:CarMsg?CarMsg.backOutputCurrent08:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault09:0;pName:"位置灯";pValue:CarMsg?CarMsg.backOutputCurrent09:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault10:0;pName:"收放机电源";pValue:CarMsg?CarMsg.backOutputCurrent10:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault11:0;pName:"ABS/ECAS启动电源";pValue:CarMsg?CarMsg.backOutputCurrent11:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault12:0;pName:"投币机电源";pValue:CarMsg?CarMsg.backOutputCurrent12:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault13:0;pName:"档位器电源/除霜器电源";pValue:CarMsg?CarMsg.backOutputCurrent13:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault14:0;pName:"日间行车灯电源";pValue:CarMsg?CarMsg.backOutputCurrent14:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.backOutputFault15:0;pName:"后视镜电源";pValue:CarMsg?CarMsg.backOutputCurrent15:0}
        }
        Column{
            spacing:4
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch01:false;pName:"后舱灯开关";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch02:false;pName:"后舱门开报警";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch03:false;pName:"水位报警";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch04:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch05:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch06:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch07:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch08:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch09:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch10:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch11:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch12:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch13:false;pName:"地址选择1";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch14:false;pName:"地址选择2";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.backSwitch15:false;pName:"备用";}
        }
        Column{
            spacing:4
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.frontOutputFault01:0;pName:"备用";}
        }
    }
}

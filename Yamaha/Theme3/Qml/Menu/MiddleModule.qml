import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

MenuItem{
    id:root
    x:377
    y:44
    visible:false
    menuLayerId: "MiddleModule"
    parentMenuId: "MenuPanel"

    onVisibleChanged: {
        if(visible)
        {
            CarMsg.sendMenuInfo(7, 0);
        }
    }

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("MiddleModule");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        UiController.hideLayer("MiddleModule");
        UiController.showLayer("FrontModule");
    }
    nextMenu: function(){
        UiController.hideLayer("MiddleModule");
        UiController.showLayer("BackModule");
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("MiddleModule");
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
        source:"qrc:/Theme/Theme3/Image/MenuPanel/module_middle_title.png";
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
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault01:0;pName:"通道灯电源1";pValue:CarMsg?CarMsg.middleOutputCurrent01:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault02:0;pName:"通道灯电源2";pValue:CarMsg?CarMsg.middleOutputCurrent02:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault03:0;pName:"电视机电源";pValue:CarMsg?CarMsg.middleOutputCurrent03:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault04:0;pName:"司机风扇电源";pValue:CarMsg?CarMsg.middleOutputCurrent04:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault05:0;pName:"司机灯电源";pValue:CarMsg?CarMsg.middleOutputCurrent05:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault06:0;pName:"电子钟电源/集中润滑";pValue:CarMsg?CarMsg.middleOutputCurrent06:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault07:0;pName:"前门开电磁阀";pValue:CarMsg?CarMsg.middleOutputCurrent07:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault08:0;pName:"前门关电磁阀";pValue:CarMsg?CarMsg.middleOutputCurrent08:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault09:0;pName:"下客门铃电源";pValue:CarMsg?CarMsg.middleOutputCurrent09:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault10:0;pName:"中门开电磁阀";pValue:CarMsg?CarMsg.middleOutputCurrent10:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault11:0;pName:"中门关电磁阀";pValue:CarMsg?CarMsg.middleOutputCurrent11:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault12:0;pName:"电子路牌电源";pValue:CarMsg?CarMsg.middleOutputCurrent12:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault13:0;pName:"电子路牌电源";pValue:CarMsg?CarMsg.middleOutputCurrent13:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault14:0;pName:"广告灯箱电源";pValue:CarMsg?CarMsg.middleOutputCurrent14:0}
            FrontModuleColumn{pStatus:CarMsg?CarMsg.middleOutputFault15:0;pName:"行李仓灯电源";pValue:CarMsg?CarMsg.middleOutputCurrent15:0}
        }
        Column{
            spacing:4
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch01:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch02:false;pName:"下客门铃";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch03:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch04:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch05:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch06:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch07:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch08:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch09:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch10:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch11:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch12:false;pName:"备用";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch13:false;pName:"地址选择1";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch14:false;pName:"地址选择2";}
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch15:false;pName:"中门应急控制器报警";}
        }
        Column{
            spacing:4
            FrontModuleColumn1{pStatus:CarMsg?CarMsg.middleSwitch16:0;pName:"前门应急控制器报警";}
        }
    }
}

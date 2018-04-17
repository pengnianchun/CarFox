import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"
MenuItem{
    id:root
    x:370
    y:85
    visible: false
    menuLayerId: "TPMS"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string tpmsTitleImage:sourceImageUrl+"Image/MenuPanel/TPMS.png";
    property string tpmsLuntaiImage:sourceImageUrl+"Image/MenuPanel/luntai.png";

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("TPMS");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
    }
    nextMenu: function(){
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("TPMS");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
//        UiController.setLayerProperty("MainPanel","busPanelVisible",true);
    }

//    Connections {
//        // 链接CarMsg信号
//        target: CarMsg
//        onKeyShortPressed: {
//            if(key === 1) //back键
//            {
//                if(root.visible == false)
//                {
//                    return;
//                }
//                UiController.hideLayer("TPMS");
//                UiController.showLayer("MenuPanel");
//            }
//        }
//    }

    Image{
        id:tpmsTitle
        x:281
        y:3
        width:163
        height:44
        source: tpmsTitleImage
    }
    Image{
        id:tpms_luntai  //大图标
        x:214
        y:58
        width:302
        height:285
        source: tpmsLuntaiImage
    }

    TPMSRow{
        id:row_1
        x:150
        y:113
        model:ListModel{
            ListElement{mpa:"0.89MPA";temp:"025℃"}
        }
    }

    TPMSRow{
        id:row_2
        x:515
        y:113
        model:ListModel{
            ListElement{mpa:"0.89MPA";temp:"025℃"}
        }
    }
    TPMSRow{
        id:row_3
        x:30
        y:255
        model:ListModel{
            ListElement{mpa:"0.89MPA";temp:"025℃"}
        }
    }
    TPMSRow{
        id:row_4
        x:125
        y:255
        model:ListModel{
            ListElement{mpa:"0.89MPA";temp:"025℃"}
        }
    }
    TPMSRow{
        id:row_5
        x:530
        y:255
        model:ListModel{
            ListElement{mpa:"0.89MPA";temp:"025℃"}
        }
    }
    TPMSRow{
        id:row_6
        x:623
        y:255
        model:ListModel{
            ListElement{mpa:"0.89MPA";temp:"025℃"}
        }
    }

    Text{
        id:state_text
        x:298
        y:175
        width: 156
        height:23
        text:"各轮胎状态正常"
        color:"#06fd00"   //绿
        font.family: "PingFang SC Regular"
        font.pixelSize: 22;font.weight: Font.Black
        horizontalAlignment: Text.AlignLeft
    }
    Text{
        id:study_text
        x:138
        y:175
        width:44
        height:21
        text:"学习"
        color:"#00cc99"
        font.family: "PingFang SC Regular"
        font.pixelSize: 22; font.weight: Font.Black
        horizontalAlignment: Text.AlignLeft
    }
    Text{
        id:ok_text
        x:550
        y:175
        width: 46
        height:21
        text:"确定"
        color:"#00cc99"
        font.family: "PingFang SC Regular"
        font.pixelSize: 22; font.weight: Font.Black
        horizontalAlignment: Text.AlignLeft
    }

}

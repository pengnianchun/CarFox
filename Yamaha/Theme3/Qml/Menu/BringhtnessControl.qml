import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

MenuItem{
    id:root
    x:552
    y:144
    menuLayerId: "BringhtnessControl"
    parentMenuId: "MenuPanel"

    property int briValue: 100
    property real eachValue: 331/10.0

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string brightTitleImage:sourceImageUrl+"Image/MenuPanel/bringhtnessControl.png";


    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("BringhtnessControl");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
        if(briValue <= 0)
        {
            briValue = 0;
            return;
        }
        brightinsideRect.width -= eachValue;
        briValue = briValue - 10;
        brightValue.text = briValue;
    }
    nextMenu: function(){
        if(briValue >= 100)
        {
            briValue = 100;
            return;
        }
        brightinsideRect.width += eachValue;
        briValue = briValue + 10;
        brightValue.text = briValue;
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("BringhtnessControl");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
        UiController.setLayerProperty("MainPanel","busPanelVisible",true);
    }

    Image{
        id:brightTitle
        x:123
        y:0
        width:114
        height:44
        source: brightTitleImage
    }

    Rectangle{
        id:brightBorderRect
        x:0
        y:62
        width:341
        height:96
        color:"transparent"
        border.color: "white"
        border.width: 2
        radius:11
        Rectangle{
            id:brightinsideRect
            x:5
            y:5
            width:331
            height:86
            color:"#00ccff"
            radius: 10
        }
        Text{
            id:brightValue
            z:1
            anchors.fill: parent
            width:105
            height:26
            text:"100 %"
            font.family: "PingFang SC Regular"
            font.bold: true
            font.pixelSize: 30;font.weight: Font.Black
            color:"white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}

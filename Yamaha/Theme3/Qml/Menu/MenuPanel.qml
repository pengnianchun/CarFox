import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

Item {
    id: root
    x:369
    y:30
    width:693
    height:457
//    property alias menuListExteral: menuList
    visible: false;

    function updateIcon()
    {
        console.log(menuList.currentIndex);
        if(menuList.currentIndex == 0)  //单体电池温度信息
        {
            menuIcon.source = "";
        }
        else if(menuList.currentIndex == 1)  //dc-dc
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_dc.png";
        }
        else if(menuList.currentIndex == 2)  //胎压监测系统
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_TPMS.png";
        }
        else if(menuList.currentIndex == 3)  //模块信息查询
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_module.png";
        }
        else if(menuList.currentIndex == 4)  //时间设置
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_timeSetting.png";
        }
        else if(menuList.currentIndex == 5)  //亮度调节
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_bringhtnessControl.png";
        }
        else if(menuList.currentIndex == 6)  //杂项信息查询
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_miscellaneousInforQuery.png";
        }
        else if(menuList.currentIndex == 7)  //整车系统状态
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_vehicle.png";
        }
        else if(menuList.currentIndex == 8)  //动力电池信息
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_powerBattery.png";
        }
        else if(menuList.currentIndex == 9)  //视频信息切换
        {
            menuIcon.source = "qrc:/Theme/Theme3/Image/MenuPanel/icon_videoSwitch.png";
        }
    }

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onKeyShortPressed: {
            if(key === 0) //enter键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("MenuPanel");
                if(menuList.currentIndex == 0)  //单体电池温度信息
                {
                    UiController.showLayer("SBatteryTempInfo");
                }
                else if(menuList.currentIndex == 1)  //dc-dc
                {
                    UiController.showLayer("DCDC");
                }
                else if(menuList.currentIndex == 2)  //胎压监测系统
                {
                    UiController.showLayer("TPMS");
                }
                else if(menuList.currentIndex == 3)  //模块信息查询
                {
                }
                else if(menuList.currentIndex == 4)  //时间设置
                {
                    UiController.showLayer("TimeSetting");
                }
                else if(menuList.currentIndex == 5)  //亮度调节
                {
                    UiController.showLayer("BringhtnessControl");
                }
                else if(menuList.currentIndex == 6)  //杂项信息查询
                {
                    UiController.showLayer("MiscellaneousInforQuery");
                }
                else if(menuList.currentIndex == 7)  //整车系统状态
                {
                    UiController.showLayer("VCU");
                }
                else if(menuList.currentIndex == 8)  //动力电池信息
                {
                    UiController.showLayer("PowerBattery1");
                }
                else if(menuList.currentIndex == 9)  //视频信息切换
                {

                }

            }
            else if(key === 1)   //back
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("MenuPanel");
            }
            else if(key === 2)  //pre
            {
                if(root.visible == false)
                {
                    return;
                }
                menuList.decrementCurrentIndex();
                updateIcon();
            }
            else if(key === 3)  //next
            {
                if(root.visible == false)
                {
                    return;
                }
                menuList.incrementCurrentIndex();
                updateIcon();
            }
         }
     }

    Image {
        id: menuIcon
        x:155
        y:176
        width: 100
        height: 100
        source: "qrc:/Theme/Theme3/Image/MenuPanel/icon_powerBattery.png"
    }
    Image {
        id: menuListBg
        x:318
        y:215
        width: 332
        height: 43
        source: "qrc:/Theme/Theme3/Image/MenuPanel/rect.png"
    }
    PathView {
        id: menuList
        x:318
        y:0
        width: 332
        height: 414
        delegate: name_card
        model: model
        //preferredHighlightBegin: 0.5;
        //preferredHighlightEnd: 0.5;
        path: Path {
            startX: 150;  startY: parent ? parent.height*0.175 : null
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemScale"; value: 0.6; }
            PathAttribute { name: "itemOpacity"; value: 0.4; }
            PathLine { x: 150; y: parent ? parent.height*0.475 : null; }
            PathPercent { value: 0.485; }
            PathLine { x: 150; y: parent ? parent.height*0.5 : null; }
            PathAttribute { name: "itemZ"; value: 100 }
            PathAttribute { name: "itemScale"; value: 1.0; }
            PathAttribute { name: "itemOpacity"; value: 1.0; }
            PathLine { x: 150; y: parent ? parent.height*0.525 : null; }
            PathPercent { value: 0.515; }
            PathLine { x: 150; y: parent ? parent.height*0.825 : null; }
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemScale"; value: 0.6; }
            PathAttribute { name: "itemOpacity"; value: 0.4; }
        }
        pathItemCount: 7
    }
    ListModel {
        id: model
        ListElement { textContent: "整 车 系 统 状 态"; }
//        ListElement { textContent: "整 车 控 制 系 统 诊 断 界 面"; }
        ListElement { textContent: "动 力 电 池 信 息"; }
//        ListElement { textContent: "动 力 电 池 信 息2"; }
        ListElement { textContent: "视 频 信 号 切 换"; }
        ListElement { textContent: "单 体 电 池 温 度 信 息"; }
        ListElement { textContent: "D C - D C 信 息"; }
        ListElement { textContent: "胎 压 监 测 系 统"; }
        ListElement { textContent: "模 块 信 息 查 询"; }
        ListElement { textContent: "时 间 设 置"; }
        ListElement { textContent: "亮 度 调 节"; }
        ListElement { textContent: "杂 项 信 息 查 询"; }
    }
    Component {
        id: name_card
        Rectangle {
            id: wrapper
            width: parent ? parent.width*0.8 : 0
            height: parent ? parent.height/11 : 0
            color: "transparent"
            opacity: PathView.itemOpacity
            visible: PathView.onPath
            scale: PathView.itemScale
            z: PathView.itemZ
            Text {
                text: textContent
                font.pixelSize: Math.round(parent.height)-10
                color: "white"
                font.family: "PingFang SC Regular"
                font.weight: Font.Black
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

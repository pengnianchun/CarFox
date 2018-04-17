import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

CommonItem {
    id: root
    x:369
    y:30
    width:693
    height:457
//    property alias menuListExteral: menuList

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string iconDcImage:sourceImageUrl+"Image/MenuPanel/icon_dc.png";
    property string iconTPMSImage:sourceImageUrl+"Image/MenuPanel/icon_TPMS.png";
    property string iconModuleImage:sourceImageUrl+"Image/MenuPanel/icon_module.png";
    property string iconTimeSettingImage:sourceImageUrl+"Image/MenuPanel/icon_timeSetting.png";
    property string iconBringhtnessControlImage:sourceImageUrl+"Image/MenuPanel/icon_bringhtnessControl.png";
    property string iconMiscellaneousInforQueryImage:sourceImageUrl+"Image/MenuPanel/icon_miscellaneousInforQuery.png";
    property string iconVehicleImage:sourceImageUrl+"Image/MenuPanel/icon_vehicle.png";
    property string iconPowerBatteryImage:sourceImageUrl+"Image/MenuPanel/icon_powerBattery.png";
    property string iconVideoSwitchImage:sourceImageUrl+"Image/MenuPanel/icon_videoSwitch.png";
    property string menuListBgImage:sourceImageUrl+"Image/MenuPanel/rect.png";

    visible: false;

    function updateIcon()
    {
        console.log(menuList.currentIndex);
        if(menuList.currentIndex == 0)  //dc-dc
        {
            menuIcon.source = iconDcImage;
        }
        else if(menuList.currentIndex == 1)  //胎压监测系统
        {
            menuIcon.source = iconTPMSImage;
        }
        else if(menuList.currentIndex == 2)  //模块信息查询
        {
            menuIcon.source = iconModuleImage;
        }
        else if(menuList.currentIndex == 3)  //时间设置
        {
            menuIcon.source = iconTimeSettingImage;
        }
        else if(menuList.currentIndex == 4)  //亮度调节
        {
            menuIcon.source = iconBringhtnessControlImage;
        }
        else if(menuList.currentIndex == 5)  //电池信息帧
        {
//            menuIcon.source = iconPowerBatteryImage;
        }
        else if(menuList.currentIndex == 6)  //杂项信息查询
        {
            menuIcon.source = iconMiscellaneousInforQueryImage;
        }
        else if(menuList.currentIndex == 7)  //整车系统状态
        {
            menuIcon.source = iconVehicleImage;
        }
        else if(menuList.currentIndex == 8)  //动力电池信息
        {
            menuIcon.source = iconPowerBatteryImage;
        }
        else if(menuList.currentIndex == 9)  //视频信息切换
        {
            menuIcon.source = iconVideoSwitchImage;
        }
    }

    onKeyEnter: function() {
        if(root.visible == false)
        {
            return;
        }
        UiController.hideLayer("MenuPanel");

        if(menuList.currentIndex == 0)  //dc-dc
        {
            UiController.showLayer("DCDC");
        }
        else if(menuList.currentIndex == 1)  //胎压监测系统
        {
            UiController.showLayer("TPMS");
        }
        else if(menuList.currentIndex == 2)  //模块信息查询
        {
            UiController.showLayer("FrontModule");
        }
        else if(menuList.currentIndex == 3)  //时间设置
        {
            UiController.showLayer("TimeSetting");
        }
        else if(menuList.currentIndex == 4)  //亮度调节
        {
            UiController.showLayer("BringhtnessControl");
        }
        else if(menuList.currentIndex == 5)  //单体电池温度信息
        {
            UiController.showLayer("SBatteryVolTempInfo1");
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
            UiController.showLayer("BatteryManageSysInfo");
        }
        else if(menuList.currentIndex == 9)  //视频信息切换
        {

        }
    }

    onKeyBack: function() {
        if(root.visible == false)
        {
            return;
        }
        UiController.hideLayer("MenuPanel");
//        nPanelVisible = true;
//        busPanelVisible = true;
    }

    onKeyUp: function() {
        if(root.visible == false)
        {
            return;
        }
        menuList.decrementCurrentIndex();
        updateIcon();
    }

    onKeyDown: function() {
        if(root.visible == false)
        {
            return;
        }
        menuList.incrementCurrentIndex();
        updateIcon();
    }

    Image {
        id: menuIcon
        x:155
        y:176
        width: 100
        height: 100
        source: iconPowerBatteryImage
    }
    Image {
        id: menuListBg
        x:318
        y:215
        width: 332
        height: 43
        source: menuListBgImage
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
        ListElement { textContent: "D C - D C 状 态 信 息"; }
        ListElement { textContent: "胎 压 监 测 系 统"; }
        ListElement { textContent: "模 块 信 息 查 询"; }
        ListElement { textContent: "时 间 校 准"; }
        ListElement { textContent: "亮 度 调 节"; }
        ListElement { textContent: "电 池 信 息 帧"; }
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

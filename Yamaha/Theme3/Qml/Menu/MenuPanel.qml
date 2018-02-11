import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item {
    id: root
    anchors.fill: parent
    property alias menuListExteral: menuList
//    property alias menuListVisible: root.visible
    visible: false;

    Image {
        id: menuIcon
        x:57
        y:43
        width: 300
        height: 300
        source: "qrc:/Theme/Theme3/Image/2ed/icon/batterySystem.png"
    }
    Image {
        id: menuListBg
        x:320
        y:180
        width: 332
        height: 43
        source: "qrc:/Theme/Theme3/Image/2ed/icon/rect.png"
    }
    PathView {
        id: menuList
        x:320
        y:0
        width: 332
        height: 400
        delegate: name_card
        model: model
        //preferredHighlightBegin: 0.5;
        //preferredHighlightEnd: 0.5;
        path: Path {
            startX: 150;  startY: parent.height*0.175
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemScale"; value: 0.6; }
            PathAttribute { name: "itemOpacity"; value: 0.4; }
            PathLine { x: 150; y: parent.height*0.475; }
            PathPercent { value: 0.485; }
            PathLine { x: 150; y: parent.height*0.5; }
            PathAttribute { name: "itemZ"; value: 100 }
            PathAttribute { name: "itemScale"; value: 1.0; }
            PathAttribute { name: "itemOpacity"; value: 1.0; }
            PathLine { x: 150; y: parent.height*0.525; }
            PathPercent { value: 0.515; }
            PathLine { x: 150; y: parent.height*0.825; }
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemScale"; value: 0.6; }
            PathAttribute { name: "itemOpacity"; value: 0.4; }
        }
        pathItemCount: 7
    }
    ListModel {
        id: model
        ListElement { textContent: "整 车 系 统 状 态"; }
        ListElement { textContent: "整 车 控 制 系 统 诊 断 界 面"; }
        ListElement { textContent: "动 力 电 池 信 息1"; }
        ListElement { textContent: "动 力 电 池 信 息2"; }
        ListElement { textContent: "单 体 电 池 温 度 信 息"; }
        ListElement { textContent: "D C - D C 信 息"; }
        ListElement { textContent: "胎 压 监 测 系 统"; }
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

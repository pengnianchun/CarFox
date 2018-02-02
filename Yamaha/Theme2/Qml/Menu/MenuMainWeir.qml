import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Common/Component"

MenuItem {
    width: 1440
    height: 544
    visible: false
    menuLayerId: "MenuMain"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string mainRingImage: sourceImageUrl + "DialPanel/mainRing.png";
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png";
    property string centerBackGroundImage: sourceImageUrl + "SubMenu/centerBg.png";
    property string arrowUpImage: sourceImageUrl + "SubMenu/arrowUp.png";
    property string arrowDownImage: sourceImageUrl + "SubMenu/arrowDown.png";
    property var menuInfoIconArray: ["icon1.png","icon2.png","icon3.png","icon4.png","icon5.png","icon6.png","icon7.png","icon8.png","icon9.png"]
    property var menuInfoTitleArray: ["控制","发动机","辅助","TCU","电池管理","电池状态","空调","仪表","设置"]
    property int menuCurrentIndex: 0
    property bool mainRingStatus: false

    property bool keyBoardStatus: true

    enterMenu: function(){
        if(keyBoardStatus){
            UiController.setLayerProperty("MenuPanel","animationAction",1);
            UiController.setLayerProperty("MenuPanel","menuCurrentIndex",menuCurrentIndex);
            keyBoardStatus = false;
        }else{}
    }
    hideMenu: function(){
        if(keyBoardStatus){
            UiController.setLayerProperty("MenuPanel","keyBoardStatus",true);
            UiController.setLayerProperty("MenuPanel","mainRingStatus",true);
            UiController.hideRootMenu();
            keyBoardStatus = false;
        }else{}
    }
    nextMenu: function() {
        if(keyBoardStatus){
            if((menuCurrentIndex >= 0)&&(menuCurrentIndex < 8)){
                menuCurrentIndex += 1;
            }else{
                menuCurrentIndex = 0;
            }
        }else{}
    }
    previousMenu: function() {
        if(keyBoardStatus){
            if((menuCurrentIndex > 0)&&(menuCurrentIndex <= 8)){
                menuCurrentIndex -= 1;
            }else{
                menuCurrentIndex = 8;
            }
        }else{}
    }

    Image {
        id: main_ring
        x: 435
        y: 0
        z: mainRingStatus ? 2 : 1
        source: mainRingImage
    }
    Image {
        id: center_light
        opacity: 1.0
        anchors.top: main_ring.top
        anchors.topMargin: 18
        anchors.left: main_ring.left
        anchors.leftMargin: 30
        z: 4
        source: centerLightImage
    }
    Item {
        x: 435
        y: 0
        z: mainRingStatus ? 1 : 3
        width: 560
        height: 540
        Image {
            id: center_background
            anchors.centerIn: parent
            source: centerBackGroundImage
        }
        Image {
            id: arrow_up
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 110
            source: arrowUpImage
        }
        Image {
            id: arrow_down
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 110
            source: arrowDownImage
        }
        Image {
            id: menu_info
            anchors.centerIn: parent
            source: sourceImageUrl + "SubMenu/" + menuInfoIconArray[menuCurrentIndex]
        }
        TextFieldWeir {
            id: menu_info_title
            width: 200
            height: 20
            textWidth: 200
            textHeight: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 180
            textValue: qsTr(menuInfoTitleArray[menuCurrentIndex]) + "系统信息"
        }
    }

    /*
    ListModel {
        id: myModel
        ListElement { name: "ControlSystem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon1.png"; menuText: "控制系统信息" }
        ListElement { name: "EngineSystem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon2.png"; menuText: "发动机系统信息" }
        ListElement { name: "AuxiliarySystem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon3.png"; menuText: "辅助系统信息" }
        ListElement { name: "TcuSysytem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon4.png"; menuText: "TCU系统信息" }
        ListElement { name: "BatterySystem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon5.png"; menuText: "电池管理系统信息" }
        ListElement { name: "BatteryStatus"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon6.png"; menuText: "电池状态系统信息" }
        ListElement { name: "AirCondition"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon7.png"; menuText: "空调系统信息" }
        ListElement { name: "InstrumentSystem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon8.png"; menuText: "仪表系统信息" }
        ListElement { name: "SettingSystem"; icon: "qrc:/Theme/Theme2/Image/SubMenu/icon9.png"; menuText: "系统信息设置" }
    }
    PathView {
        id: pathView
        model: myModel
        delegate: myDelegate
        width: 600
        height: 600
        anchors.centerIn: parent
        //anchors.fill: parent
        pathItemCount: 5
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightMoveDuration: 200
        path: Path {
            startX: 0; startY: 140
            PathAttribute { name: "transformX"; value: 252 }
            PathAttribute { name: "rotateY"; value: 40.0 }
            PathAttribute { name: "scaleZ"; value: 0.6 }
            PathAttribute { name: "opacityZ"; value: 0.6 }

            PathLine { x: 195; y: 140 }   //180
            PathPercent { value: 0.44 }
            PathAttribute { name: "transformX"; value: 252 }
            PathAttribute { name: "rotateY"; value: 50.0 }
            PathAttribute { name: "scaleZ"; value: 0.8 }
            PathAttribute { name: "opacityZ"; value: 0.9 }

            PathLine { x: 280; y: 150 }//140
            PathPercent { value: 0.50 }
            PathAttribute { name: "transformX"; value: 170 }
            PathAttribute { name: "rotateY"; value: 0.0 }
            PathAttribute { name: "scaleZ"; value: 1.0 }
            PathAttribute { name: "opacityZ"; value: 1.0 }

            PathLine { x: 365; y: 150 }//140
            PathPercent { value: 0.56 }
            PathAttribute { name: "transformX"; value: 88 }
            PathAttribute { name: "rotateY"; value: -50.0}
            PathAttribute { name: "scaleZ"; value: 0.8 }
            PathAttribute { name: "opacityZ"; value: 0.9 }

            PathLine { x: 560; y: 140 }//180
            PathPercent { value: 1.00 }
            PathAttribute { name: "transformX"; value: 88 }
            PathAttribute { name: "rotateY"; value: -40.0 }
            PathAttribute { name: "scaleZ"; value: 0.6 }
            PathAttribute { name: "opacityZ"; value: 0.6 }
        }
    }
    Component {
        id: myDelegate
        Item{
            // 菜单图片翻转角度
            property real tmpAngle : typeof PathView.rotateY === "undefined" ? 0.0 : PathView.rotateY
            // 翻转中心
            property int transformX: typeof PathView.transformX === "undefined" ? 0 : PathView.transformX
            width: 340
            height: 260
            scale: typeof PathView.scaleZ === "undefined" ? 1.0 : PathView.scaleZ
            opacity: typeof PathView.opacityZ === "undefined" ? 1.0 : PathView.opacityZ
            transform: Rotation{ angle: tmpAngle; origin.x: transformX; origin.y: 90; axis { x: 0; y: 1; z: 0 } }
            Image {
                id: center_light
                z: 3
                anchors.centerIn: parent
                source: centerLightImage
            }
            Image {
                id: center_background
                z: 1
                anchors.centerIn: parent
                source: centerBackGroundImage
            }
            Image {
                id: arrow_up
                z: 2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 120
                source: arrowUpImage
            }
            Image {
                id: arrow_down
                z: 2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 130
                source: arrowDownImage
            }
            Image {
                id: menu_info
                z: 2
                anchors.centerIn: parent
                source: icon
            }
            TextFieldWeir {
                id: menu_info_title
                z: 2
                width: 200
                height: 20
                textWidth: 200
                textHeight: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 190
                textValue: menuText
            }
        }
    }
    */
}

import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: systemSettingsMenu
    width: 1440
    height: 544
    opacity: 0.0

    property int currentSettingsSelect: CarStatus.menu_SettingsSelect

    onCurrentSettingsSelectChanged: {
        if((currentSettingsSelect == 0)||(currentSettingsSelect == 1)) {
            menuSelect.y = -66
            timeSettingItem.color = "white"
            themeSettingItem.color = "gray"
        } else if(currentSettingsSelect == 2) {
            menuSelect.y = 35
            timeSettingItem.color = "gray"
            themeSettingItem.color = "white"
        }
        //console.log(" --- currentSettingsSelect = ", currentSettingsSelect)
    }

    Rectangle {
        id: menuBgFog
        anchors.fill: parent
        color: "black"
        opacity: 0.7
        visible: false
    }

    Rectangle {
        id: centerImageRect
        x: 720 //350
        y: 24
        width: 0 //750
        height: 506
        color: "transparent"
        clip: true
        Image {
            id: centerImageBg
            x: -370
            width: 750
            source: "qrc:/images/theme2/images/themeTwo/SubMenu/centerBlockBg.png"
        }
    }

    Image {
        id: ringBg1
        x: 280//-86
        y: -27
        source: "qrc:/images/theme2/images/themeTwo/SubMenu/swingsLeft.png"
    }
    Image {
        id: ringBg2
        x: 558//936
        y: -27
        source: "qrc:/images/theme2/images/themeTwo/SubMenu/swingsRight.png"
    }

    Item {
        id: contentId
        x: 600
        y: 200
        width:  880
        height: 410

        Image {
            id: menuSelect
            x: -120
            y: 35    //y: -66
            source: "qrc:/images/theme2/images/themeTwo/SubMenu/menutips.png"
        }

        Text {
            id: timeSettingItem
            width: 240
            text: qsTr("时间设置")
            font.family:FontName.fontCurrentFzLt
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 21
            color: "gray"
        }

        Text {
            id: themeSettingItem
            y: 100
            width: 240
            text: qsTr("主题设置")
            font.family:FontName.fontCurrentFzLt
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 21
            color: "white"
        }
    }

    Text {
        id: infoTitle
        x: 570
        y: 75
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("系统设置")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "#00D1FF"
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: systemSettingsMenu; opacity: 0.0 }
            PropertyChanges { target: ringBg1; x: 280 }
            PropertyChanges { target: ringBg2; x: 558 }
            PropertyChanges { target: centerImageRect; x: 720 }
            PropertyChanges { target: centerImageRect; width: 0 }
            PropertyChanges { target: centerImageBg; x: -370 }
            PropertyChanges { target: menuBgFog; visible: false }
        },
        State {
            name: "show"
            PropertyChanges { target: systemSettingsMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            ParallelAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: ringBg1
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: ringBg2
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "width"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageBg
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
        }
    ]

}

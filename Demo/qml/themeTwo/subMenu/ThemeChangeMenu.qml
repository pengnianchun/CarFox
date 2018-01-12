import QtQuick 2.0

Item {
    id: themeSetMenu
    width: 1440
    height: 544

    signal resetMessage()

    property int currentTheme: 0
    property int currentThemeSelect:  (menuBg.visible === false) ? -3 : CarStatus.menu_ThemeSelect

    function themeChange() {
        //currentTheme = ThemeStyle.getCurrentTheme()
        //currentThemeSelect = 1
        ThemeStyle.setTheme(currentThemeSelect)
        //if(currentTheme!==currentThemeSelect) {
            setThemeOKTips.opacity = 1.0
            flashDisplay.running = true
            CarStatus.themeChanged()
            emit: resetMessage()
        //} else {
        //    setThemeUsedTips.opacity = 1.0
        //    flashDisplay.running = true
        //}
    }

    onCurrentThemeSelectChanged: {
        if(currentThemeSelect === 0) {
            themeArea.y = -12
            themeOneDisplay.color = "white"
            themeTwoDisplay.color = "gray"
        } else if(currentThemeSelect === 1) {
            themeArea.y = 88
            themeOneDisplay.color = "gray"
            themeTwoDisplay.color = "white"
        }
        console.log(" --- currentThemeSelect = ", currentThemeSelect+1)
    }

    Rectangle {
        id: menuBg
        x: 490
        y: 42
        width: 460
        height: 460
        radius: 230
        color: "black"
        visible: false
        onVisibleChanged: {
            console.log("================theme two  menubg visible:" , visible);
        }
    }

    Item {
        id: detailContent
        x: 600
        y: 200
        width:  880
        height: 410
        opacity: 0.0

        Rectangle {
            id: themeArea
            x: 4
            y: -12 //y: 88
            width:  240
            height: 50
            color: "transparent"
            border.color: "white"
            radius: 10
        }

        Text {
            id: themeOneDisplay
            x: 100
            width: 240
            opacity: 1.0
            text: qsTr("主题一")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: themeTwoDisplay
            width: 240
            x: 100
            y: 100
            opacity: 1.0
            text: qsTr("主题二")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "gray"
        }

        Text {
            id: setThemeOKTips
            x: 10
            y: 264
            width: 220
            horizontalAlignment: Text.AlignHCenter
            opacity: 0.0
            text:qsTr("设置主题成功")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "green"
        }

        Text {
            id: setThemeUsedTips
            x: 10
            y: 264
            width: 220
            horizontalAlignment: Text.AlignHCenter
            opacity: 0.0
            text:qsTr("当前主题正在使用")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "green"
        }
    }

    Text {
        id: infoTitle
        x: 570
        y: 75
        width: 300
        height: 45
        visible: false
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("主题选择设置")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "#00D1FF"
        //style: Text.Raised;
        //styleColor: "white"
    }

    Timer {
        id: flashDisplay
        interval: 850;
        running: false;
        repeat: false
        onTriggered: {
            setThemeOKTips.opacity = 0.0
            setThemeUsedTips.opacity = 0.0
        }
    }

    Connections {
        target:CarStatus
        onMenu_set_theme: {
            themeChange()
        }
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: menuBg; visible: false }
            PropertyChanges { target: infoTitle; visible: false }
            PropertyChanges { target: detailContent; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: menuBg; visible: true }
            PropertyChanges { target: infoTitle; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"

            ScriptAction {
                script: {
                    console.log("-------------------: " , menuBg.visible)
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
            ScriptAction {
                script: {
                    console.log("---========----------------: " , menuBg.visible)
                }
            }
        }
    ]
}

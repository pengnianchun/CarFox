import QtQuick 2.0

Item {
    id: themeSetMenu
    x: 295
    y: 30
    opacity: 0.0
    property int currentTheme: 0
    property int currentThemeSelect:  (themeSetMenu.opacity === 0) ? -2 : CarStatus.menu_ThemeSelect

    function themeChange() {
        //currentTheme = ThemeStyle.getCurrentTheme()
        ThemeStyle.setTheme(currentThemeSelect)
        //if(currentTheme!==currentThemeSelect) {
            setThemeOKTips.opacity = 1.0
            flashDisplay.running = true
            CarStatus.themeChanged()
        //} else {
        //    setThemeUsedTips.opacity = 1.0
        //    flashDisplay.running = true
        //}
    }

    onCurrentThemeSelectChanged: {
        if(currentThemeSelect === 0) {
            themeOneDisplay.color = "white" //"gold"
            themeTwoDisplay.color = "gray"  //"white"
        } else if(currentThemeSelect === 1) {
            themeOneDisplay.color = "gray"  //"white"
            themeTwoDisplay.color = "white" //"gold"
        }
        console.log(" --- currentThemeSelect = ", currentThemeSelect+1)
    }

    Image {
        id: menuBg
        x: 0
        y: 15
        width:  880
        height: 410
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/SubMenu/submenutips.png"

        Rectangle {
            id: displayBox
            x: 93
            y: 40
            width:  660
            height: 0
            color: "MidnightBlue"
            radius: 10
            opacity: 0.3
        }
    }

    Item {
        id: detailContent
        x: 300
        y: 81
        opacity: 0.0

        Rectangle {
            id: theme1Area
            y: 80
            width:  240
            height: 50
            color: "#09061F"
            radius: 10

            Text {
                id: themeOneDisplay
                anchors.centerIn: parent
                opacity: 1.0
                text: qsTr("主题一")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 18
                color: "white" //"gold"
                style: Text.Raised;
                styleColor: "black"
            }
        }

        Rectangle {
            id: theme2Area
            y: 160
            width:  240
            height: 50
            color: "#09061F"
            radius: 10

            Text {
                id: themeTwoDisplay
                anchors.centerIn: parent
                opacity: 1.0
                text: qsTr("主题二")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 18
                color: "gray" // "white"
                style: Text.Raised;
                styleColor: "black"
            }
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
        x: 270
        y: 398
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("主题选择设置")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "gold"
        style: Text.Raised;
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
            PropertyChanges { target: themeSetMenu; opacity: 0.0 }
            PropertyChanges { target: menuBg; visible: false }
            PropertyChanges { target: displayBox; height: 0 }
            PropertyChanges { target: detailContent; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: themeSetMenu; opacity: 1.0 }
            PropertyChanges { target: menuBg; visible: true }
            PropertyChanges { target: displayBox; height: 335 }
            PropertyChanges { target: detailContent; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: themeSetMenu; property: "opacity"; duration: 600;}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
        }
    ]
}

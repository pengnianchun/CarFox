import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: systemSettingsMenu
    x: 295
    y: 30
    opacity: 0.0

    property int currentSettingsSelect: CarStatus.menu_SettingsSelect

    onCurrentSettingsSelectChanged: {
        if((currentSettingsSelect == 0)||(currentSettingsSelect == 1)) {
            effect1.color = "#388E8E"
            effect2.color = "transparent"
        } else if(currentSettingsSelect == 2) {
            effect1.color = "transparent"
            effect2.color = "#388E8E"
        }
        //console.log(" --- currentSettingsSelect = ", currentSettingsSelect)
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
            //anchors.centerIn: parent
            //anchors.baselineOffset: 40
            width:  660
            height: 0 //height: 335;
            //border.color: "red"
            color: "MidnightBlue"
            radius: 10
            opacity: 0.0
        }

        RectangularGlow {
              id: effect1
              x: 720-width/2-295
              y:128
              width:220
              height: 50
              glowRadius: 10
              spread: 0.2
              color: "#388E8E"
              cornerRadius: 10

              Rectangle {
                  id: rect1
                  x:6
                  y:6
                  width: effect1.width-12
                  height: effect1.height-12
                  color: "darkblue"
                  radius: 6

                  Text {
                      id: timeSettings
                      anchors.centerIn: parent
                      horizontalAlignment: Text.AlignHCenter
                      text: qsTr("系统时间设置")
                      font.family:FontName.fontCurrentFzLt
                      font.pixelSize: 21
                      color: "white"
                      style: Text.Raised;
                  }
              }
        }

        RectangularGlow {
              id: effect2
              x: 720-width/2-295
              y:220
              width:220
              height: 50
              glowRadius: 10
              spread: 0.2
              color: "transparent"  //color: "#388E8E"
              cornerRadius: 10

              Rectangle {
                  id: rect2
                  x:6
                  y:6
                  width: effect2.width-12
                  height: effect2.height-12
                  color: "darkblue"
                  radius: 6

                  Text {
                      id: themeSettings
                      anchors.centerIn: parent
                      horizontalAlignment: Text.AlignHCenter
                      text: qsTr("系统主题设置")
                      font.family:FontName.fontCurrentFzLt
                      font.pixelSize: 21
                      color: "white"
                      style: Text.Raised;
                  }
              }
        }
    }

    Text {
        id: infoTitle
        x: 270
        y: 398
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("系统设置信息")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "gold"
        style: Text.Raised;
        //styleColor: "white"
    }

    function translate() {
        timeSettings.text = qsTr("Time settings")
        themeSettings.text = qsTr("Theme settings")
        infoTitle.text = qsTr("System Info Settings")
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: systemSettingsMenu; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: systemSettingsMenu; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: systemSettingsMenu; property: "opacity"; duration: 600;}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
        }
    ]

    Component.onCompleted: {

    }
}

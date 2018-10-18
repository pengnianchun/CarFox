/*******************************************
 *
 *  IGN OFF屏幕变黑后，如果有信号，某些灯需要亮着
 *
 *****************************************/

import QtQuick 2.6
import CustomEnum 1.0
import "qrc:/Component/Component"

Item {
    id: dormancyPanel
    z: 1
    visible: false
    state: ""
    opacity: 0.0
    width: 1440
    height: 540

    onVisibleChanged: {
        if (visible) {
            dormancyPanel.state = "show";
        }
    }

    Connections {
        target: visible ? CarMsg : null
        ignoreUnknownSignals: true

        onCarModeChanged: {
            console.log("---------: mode:", CarMsg.carMode);
            if (CarMsg.carMode === CustomEnum.IgOnMode && visible) {
                console.log("Dormancy panel ign off");
                dormancyPanel.state = "";
            }
        }
    }

    // Note: 测试使用
    Text {
        anchors.centerIn: parent
        text: "Dormancy"
        color: "white"
        font.pixelSize: 100
    }

    states: [
        State {
            name: ""
        },
        State {
            name: "show"
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation {
                ScriptAction { script: { UiController.requestSystemShutdown(); } }
                PauseAnimation { duration: 100 }
                ScriptAction {
                    script: {
                        CarMsg.sendEnableKeys(false);
                    }
                }
                PauseAnimation { duration: 150 }
                NumberAnimation { target: dormancyPanel; property: "opacity"; from: 0.0; to: 1.0; duration: 200 }
            }
        },
        Transition {
            from: "show"
            to: ""
            SequentialAnimation {
                ScriptAction { script: { dormancyPanel.opacity = 0.0; } }
                PauseAnimation { duration: 200 }
                ScriptAction {
                    script: {
                        UiController.hideLayer("DormancyPanel");
                        UiController.requestSystemWakeup();
                        UiController.loadCurrentTheme();
                    }
                }
            }
        }
    ]
}

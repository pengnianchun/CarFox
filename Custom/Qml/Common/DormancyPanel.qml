import QtQuick 2.6
import "qrc:/Common/Qml/Common"

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

    Text {
        anchors.centerIn: parent
        text: "Dormancy"
        color: "white"
        font.pixelSize: 100
    }

    Connections {
        target: visible ? CarMsg : null
        ignoreUnknownSignals: true

        onIgOnChanged: {
            if (CarMsg.igOn && visible) {
                console.log("Dormancy panel ign off");
                dormancyPanel.state = "";
            }
        }
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
                ScriptAction {
                    script: {
                        CarMsg.sendEnableKeys(false);
                        UiController.requestSystemShutdown();
                    }
                }
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

import QtQuick 2.6
import CustomEnum 1.0

Rectangle {
    id: mainPanel
    width: 1440
    height: 540
    opacity: 0.0
    color: "yellow"
    visible: false
    z: 0

    onVisibleChanged: {
        if(visible) {
            state = "show";
        }
        else state = "";
    }

    Connections {
        // 链接CarMsg信号
        target: CarMsg

        onKeyShortPressed: {
            if (key === 1) {
                // 显示可触发Qml
                UiController.showLayer("Theme4TriggerPanel");
            }
        }

        onKeyLongPressed: {
            if (key === 3) {
                // 切换主题
                CarMsg.themeSetChanged(CustomEnum.Theme3Mode);
            } else if (key === 4){
                CarMsg.themeSetChanged(CustomEnum.Theme4Mode);
            }
        }

        onCarModeChanged: {
            console.log("---------: mode:", CarMsg.carMode);
            if (CarMsg.carMode === CustomEnum.IgOffMode) state = "shutdown";
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Theme4"
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        font.pixelSize: 80
    }

    states: [
        State {
            name: ""
        },
        State {
            name: "show"
        },
        State {
            name: "shutdown"
        }

    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation {
                NumberAnimation { target: mainPanel; property: "opacity"; from: 0.0; to: 1.0; duration: 3000 }
                ScriptAction {
                    script: {
                        // 信号触发
                        CarMsg.activate();
                        // 按键触发
                        CarMsg.enableKeys(true);
                    }
                }
            }
        },
        Transition {
            from: "show"
            to: ""
            SequentialAnimation {
                NumberAnimation { target: mainPanel; property: "opacity"; from: 0.0; to: 1.0; duration: 0 }
            }
        },
        Transition {
            from: "show"
            to: "shutdown"
            SequentialAnimation {
                ScriptAction {
                    script: {
                        // 信号触发
                        CarMsg.deactivate();
                        // 按键触发
                        CarMsg.enableKeys(false);
                    }
                }
                NumberAnimation { target: mainPanel; property: "opacity"; from: 1.0; to: 0.0; duration: 3000 }
                ScriptAction {
                    script: {
                        // 进入休眠界面
                        UiController.showLayer("DormancyPanel");
                        // 隐藏主题
                        UiController.hideCurrentTheme();
                    }
                }
            }
        }

    ]
}

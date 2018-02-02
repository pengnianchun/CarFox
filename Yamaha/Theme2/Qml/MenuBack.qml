import QtQuick 2.6
import CustomEnum 1.0
import "qrc:/Common/Component"

RootMenu {
    visible: false
    rootMenu: true
    level1: "MenuMain"      // 一级菜单的ID

    onShutdown: function() {
        //JS_Menu.exitWarning(me);
    }

    onVisibleChanged: {
        if (visible) {
            state = "show";
        }
        else state = "shutdown";
    }


    states: [
        State {
            name: "hide"
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
            onRunningChanged: {
                if(!running) {
                    CarMsg.sendEnableKeys(true);
                    UiController.showLayer(level1);
                    console.log("-------------show----------------" + state)
                }
            }
        },
        Transition {
            from: "show"
            to: ""
            onRunningChanged: {
                if(!running && state === "") {
                    console.log("-------------null----------------" + state)
                    CarMsg.sendEnableKeys(true);
                    UiController.hideRootMenu();
                }
            }
        },

        Transition {
            to: "shutdown"
            onRunningChanged: {
                if(!running && state === "shutdown") {
                    console.log("-------------shutdown---------------" + state);
                    UiController.hideLayer(level1);
                    state = "";
                }
            }
        }
    ]
}

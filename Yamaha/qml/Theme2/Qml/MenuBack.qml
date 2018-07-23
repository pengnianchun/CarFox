import QtQuick 2.6
import CustomEnum 1.0
import "qrc:/Common/Component"

RootMenu {
    rootMenu: true
    level1: "MenuMain"        // 一级菜单的ID
    visible: false

    onVisibleChanged: {
        if (visible) {
            state = "show";
        } else {
            state = "shutdown";
        }
    }

    onShutdown: function() {
        //JS_Menu.exitWarning(me);
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
                    console.log("MenuMain State: " + state + " Transition: \"\" -> show")
                }
            }
        },
        Transition {
            from: "show"
            to: ""
            onRunningChanged: {
                if(!running && state === "") {
                    console.log("MenuMain State: " + state + " Transition: show -> \"\"")
                    CarMsg.sendEnableKeys(true);
                    UiController.hideRootMenu();
                }
            }
        },
        Transition {
            to: "shutdown"
            onRunningChanged: {
                if(!running && state === "shutdown") {
                    console.log("MenuMain State: " + state + " Transition: ANY -> shutdown");
                    UiController.hideLayer(level1);
                    state = "";
                }
            }
        }
    ]
}

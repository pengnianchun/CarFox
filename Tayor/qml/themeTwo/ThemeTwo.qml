import QtQuick 2.0

Item {
    id: theme2
    width: 1440
    height: 544
    opacity: 0.0
    state: ThemeStyle.themeIndex === 1 ? "auto":""

    DashBoard {
        id: dashboardIndex
        state: ""
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: theme2; opacity: 0.0}
            PropertyChanges { target: dashboardIndex; state: "" }
        },
        State {
            name: "auto"
            PropertyChanges { target: theme2; opacity: 1.0}
            PropertyChanges { target: dashboardIndex; state: "normal" }
        },
        State {
            name: "show"
            PropertyChanges { target: theme2; opacity: 1.0}
            PropertyChanges { target: dashboardIndex; state: "normal" }
        }
    ]
    onStateChanged: {
        console.log("============theme2 state: " , state)
    }

}

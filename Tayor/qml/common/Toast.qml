import QtQuick 2.6

Item {
    id: tipsInfo
    opacity: 0.0
    y:-7

    Image {
        id: warningRectangle
        x: 510
        y: 172
        width: 420
        height: 120
        opacity: 0.9
        source: "qrc:/images/theme1/images/themeOne/HomePanel/warningTextBox.png"
    }

    Image {
        id: symbol1
        x: 686
        y: 90
        opacity: 1.0
        source: "qrc:/images/theme1/images/themeOne/HomePanel/warningIcon.png"

        SequentialAnimation{
            running: tipsInfo.state === "show"
            NumberAnimation {
                target: symbol1
                property: "opacity"
                duration: 500
                from:1.0
                to:0.0
            }
            NumberAnimation {
                target: symbol1
                property: "opacity"
                duration: 500
                from:0.0
                to:1.0
            }
            loops:Animation.Infinite
        }
    }

    property alias tipsCounts: menuMainModel.count

    ListModel {
        id: menuMainModel
    }

    PathView {
        id: menuMainView
        anchors.fill: warningRectangle
        clip:true
        delegate: menuMainDelegate
        model: menuMainModel
        path: Path {
            startX: warningRectangle.width/2
            startY: warningRectangle.height*0.2
            PathLine { x: warningRectangle.width/2; y: warningRectangle.height*0.5; }
            PathLine { x: warningRectangle.width/2; y: warningRectangle.height*0.8; }
        }
        pathItemCount: 1
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
    }
    Component {
        id: menuMainDelegate

        Item {
            id: wrapper
            Text {
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: 0
                text: name
                color: "green" //"#f9fea4"
                font.pixelSize: 22
                lineHeight: 1.2
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Timer{
        interval: 3000;
        running: tipsInfo.state === "show"
        repeat: true
        onTriggered: {menuMainView.incrementCurrentIndex();}
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: tipsInfo; opacity:0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: tipsInfo; opacity:1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            SequentialAnimation{
                NumberAnimation {target: tipsInfo;property: "opacity";duration: 500;}
            }
        },
        Transition {
            from: "show"
            to: ""
            SequentialAnimation{
                NumberAnimation {target: tipsInfo;property: "opacity";duration: 500;}
            }
        }
    ]

    Component.onCompleted: {
        menuMainModel.append({"name": "当前已检测到升级文件，请确认是否升级"})
    }
}

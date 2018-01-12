import QtQuick 2.0

Item {
    id: airControlSystemMenu
    x: 295
    y: 30
    opacity: 0.0

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

            Rectangle {
                id: line
                x: 24
                y: 50
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }

            Rectangle {
                id: line1
                x: 24
                y: 90
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }

            Rectangle {
                id: line2
                x: 24
                y: 130
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }

            Rectangle {
                id: line3
                x: 24
                y: 170
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }

            Rectangle {
                id: line4
                x: 24
                y: 210
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }

            Rectangle {
                id: line5
                x: 24
                y: 250
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }

            Rectangle {
                id: line6
                x: 24
                y: 290
                width:  610
                height: 1
                color: "white"
                radius: 10
                opacity: 1.0
            }
        }
    }

    Item {
        id: detailContent
        x: 0
        y: 4
        opacity: 0.0

        Rectangle {
            id: bat
            Item {
                id: leftContent

                Item {
                    id: leftIndex
                    Text{
                        id: leftText1
                        x: 120
                        y: 70
                        text: qsTr("空调故障代码")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText2
                        x: 120
                        y: 110
                        text: qsTr("空调风电状态")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText3
                        x: 120
                        y: 150
                        text: qsTr("空调工作状态")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText4
                        x: 120
                        y: 190
                        text: qsTr("空调Life")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText5
                        x: 120
                        y: 230
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText6
                        x: 120
                        y: 270
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText7
                        x: 120
                        y: 310
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: leftText8
                        x: 120
                        y: 350
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                }

                Item {
                    id: leftValue
                    Text{
                        x: 120
                        y: 72
                        width: 286
                        text: setTextDisplayBits(CarStatus.ac_fault_code)
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 112
                        width: 286
                        text: setTextDisplayBits(CarStatus.ac_fan_status)
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 152
                        width: 286
                        text: setTextDisplayBits(CarStatus.ac_work_status)
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 192
                        width: 286
                        text: CarStatus.ac_Life
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 232
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 272
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 312
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 120
                        y: 352
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                }
            }

            Item {
                id: rightContent

                Item {
                    id: rightIndex
                    Text{
                        id: rightText1
                        x: 436
                        y: 70
                        text: qsTr("车外实际温度")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText2
                        x: 436
                        y: 110
                        text: qsTr("车内实际温度")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText3
                        x: 436
                        y: 150
                        text: qsTr("设定温度")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText4
                        x: 436
                        y: 190
                        text: qsTr("空调制冷请求")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText5
                        x: 436
                        y: 230
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText6
                        x: 436
                        y: 270
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText7
                        x: 436
                        y: 310
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }

                    Text{
                        id: rightText8
                        x: 436
                        y: 350
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }

                Item {
                    id: rightValue
                    Row{
                        x: 436
                        y: 72
                        width: 286
                        spacing: 2
                        layoutDirection: Qt.RightToLeft
                        Text{
                            text: qsTr("℃")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                        Text{
                            text: CarStatus.ac_out_temp
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }

                    Row{
                        x: 436
                        y: 112
                        width: 286
                        spacing: 2
                        layoutDirection: Qt.RightToLeft
                        Text{
                            text: qsTr("℃")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                        Text{
                            text: CarStatus.ac_in_temp
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }

                    Row{
                        x: 436
                        y: 152
                        width: 286
                        spacing: 2
                        layoutDirection: Qt.RightToLeft
                        Text{
                            text: qsTr("℃")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                        Text{
                            text: CarStatus.ac_set_temp
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }

                    Text{
                        x: 436
                        y: 192
                        width: 286
                        text: setTextDisplayBits(CarStatus.ac_refrigere_req)
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 436
                        y: 232
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 436
                        y: 272
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 436
                        y: 312
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }

                    Text{
                        x: 436
                        y: 352
                        width: 286
                        text: qsTr("")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                }
            }
        }
    }

    function setTextDisplayBits(currentValue) {
        var value = currentValue.toString(2)
        value = leftZeroPad(value, 8)
        return value
    }

    function leftZeroPad(val, minLength) {
        var MANY_ZEROS = "00000000";
        if (typeof(val) != "string")
            val = String(val);
        return (MANY_ZEROS.substring(0, minLength - val.length)) + val;
    }

    Text {
        x: 270
        y: 398
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("空调系统信息")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "gold"
        style: Text.Raised;
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: airControlSystemMenu; opacity: 0.0 }
            PropertyChanges { target: menuBg; visible: false }
            PropertyChanges { target: displayBox; height: 0 }
            PropertyChanges { target: detailContent; opacity: 0.0 }
            PropertyChanges { target: bat;  opacity: 0.0; visible: true}
        },
        State {
            name: "show"
            PropertyChanges { target: airControlSystemMenu; opacity: 1.0 }
            PropertyChanges { target: menuBg; visible: true }
            PropertyChanges { target: displayBox; height: 335 }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat;  opacity: 1.0; visible: true}
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: airControlSystemMenu; property: "opacity"; duration: 200;}
                    NumberAnimation {target: displayBox; property: "height"; duration: 200; easing.type: Easing.OutBounce}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 200;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 200;}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: airControlSystemMenu; property: "opacity"; duration: 100;}
                    NumberAnimation {target: displayBox; property: "height"; duration: 100; easing.type: Easing.OutBounce}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 100;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 100;}
                }
            }
        }
    ]
}

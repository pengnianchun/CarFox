import QtQuick 2.0

Item {
    id: airControlSystemMenu
    x: 0
    y: 0
    opacity: 0.0

    property real verticalSpace: 40

    Rectangle {
        id: menuBgFog
        anchors.fill: parent
        color: "black"
        opacity: 0.7
        visible: false
    }

    Rectangle {
        id: centerImageRect
        x: 720 //350
        y: 24
        width: 0 //750
        height: 506
        color: "transparent"
        clip: true
        Image {
            id: centerImageBg
            x: -370
            width: 750
            source: "qrc:/images/theme2/images/themeTwo/SubMenu/centerBlockBg.png"
        }
    }

    Image {
        id: ringBg1
        x: 280//-86
        y: -27
        source: "qrc:/images/theme2/images/themeTwo/SubMenu/swingsLeft.png"
    }
    Image {
        id: ringBg2
        x: 558//936
        y: -27
        source: "qrc:/images/theme2/images/themeTwo/SubMenu/swingsRight.png"
    }

    Rectangle {
        id: displayBox
        x: 330
        y: 108
        width:  745
        height: 0
        color: "MidnightBlue"
        radius: 10
        opacity: 0.2

        Rectangle {
            id: line1
            x: 24
            y: 50
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line2
            x: 24
            y: line1.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line3
            x: 24
            y: line2.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line4
            x: 24
            y: line3.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line5
            x: 24
            y: line4.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line6
            x: 24
            y: line5.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line7
            x: 24
            y: line6.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line8
            x: 24
            y: line7.y + airControlSystemMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }
    }

    Item {
        id: detailContent
        x: 295
        y: 54
        opacity: 0.0

        Rectangle {
            id: bat
            Item {
                id: leftContent
                x: -20
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
                x: 25
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
        x: 570
        y: 75
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("空调系统信息")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "#00D1FF"
        style: Text.Raised;
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: airControlSystemMenu; opacity: 0.0 }
            PropertyChanges { target: menuBgFog; visible: false }
            PropertyChanges { target: ringBg1; x: 280 }
            PropertyChanges { target: ringBg2; x: 558 }
            PropertyChanges { target: centerImageRect; x: 720 }
            PropertyChanges { target: centerImageRect; width: 0 }
            PropertyChanges { target: centerImageBg; x: -370 }
            PropertyChanges { target: detailContent; opacity: 0.0 }
            PropertyChanges { target: bat;  opacity: 0.0; visible: true}
        },
        State {
            name: "show"
            PropertyChanges { target: airControlSystemMenu; opacity: 1.0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat;  opacity: 1.0; visible: true}
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            ParallelAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: ringBg1
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: ringBg2
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "width"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageBg
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                }
                ParallelAnimation{
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 800}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
            ParallelAnimation{
                ParallelAnimation{
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 10}
                }
                ParallelAnimation{
                    NumberAnimation {
                        target: ringBg1
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: ringBg2
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                }
                ParallelAnimation{
                    NumberAnimation {target: airControlSystemMenu; property: "opacity"; duration: 10}
                }
            }
        }
    ]
}

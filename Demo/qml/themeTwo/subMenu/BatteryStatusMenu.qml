import QtQuick 2.0

Item {
    id: batteryStatusMenu
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
            y: line1.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line3
            x: 24
            y: line2.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line4
            x: 24
            y: line3.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line5
            x: 24
            y: line4.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line6
            x: 24
            y: line5.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line7
            x: 24
            y: line6.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line8
            x: 24
            y: line7.y + batteryStatusMenu.verticalSpace
            width:  displayBox.width
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }
    }

    Item {
        id: detailContent
        x: 0
        y: -45
        opacity: 0.0

        Rectangle {
            id: bat

            Text{
                x: 435
                y: 208
                text: qsTr("电池")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 440
                y: 248
                text: qsTr("01")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 440
                y: 288
                text: qsTr("02")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 440
                y: 328
                text: qsTr("03")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 440
                y: 368
                text: qsTr("04")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 440
                y: 408
                text: qsTr("05")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }

            Text{
                x: 505
                y: 208
                text: qsTr("电压")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Row{
                x: 506
                y: 249
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage1 <= 99) ? CarStatus.bat_voltage1.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 506
                y: 289
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage2 <= 99) ? CarStatus.bat_voltage2.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 506
                y: 329
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage3 <= 99) ? CarStatus.bat_voltage3.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 506
                y: 369
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage4 <= 99) ? CarStatus.bat_voltage4.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 506
                y: 409
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage5 <= 99) ? CarStatus.bat_voltage5.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Text{
                x: 585
                y: 208
                text: qsTr("电池")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 591
                y: 248
                text: qsTr("06")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 591
                y: 288
                text: qsTr("07")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 591
                y: 328
                text: qsTr("08")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 591
                y: 368
                text: qsTr("09")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 591
                y: 408
                text: qsTr("10")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }

            Text{
                x: 655
                y: 208
                text: qsTr("电压")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Row{
                x: 656
                y: 249
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage6 <= 99) ? CarStatus.bat_voltage6.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 656
                y: 289
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage7 <= 99) ? CarStatus.bat_voltage7.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 656
                y: 329
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage8 <= 99) ? CarStatus.bat_voltage8.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 656
                y: 369
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage9 <= 99) ? CarStatus.bat_voltage9.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 656
                y: 409
                spacing: 2
                width: 60
                layoutDirection: Qt.RightToLeft
                Text{
                    text: qsTr("V")
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "#808080"
                    style: Text.Raised;
                    styleColor: "black"
                }
                Text{
                    text: (CarStatus.bat_voltage10 <= 99) ? CarStatus.bat_voltage10.toFixed(3) : 99.999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Text{
                x: 735
                y: 208
                text: qsTr("探针")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 743
                y: 248
                text: qsTr("01")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 743
                y: 288
                text: qsTr("02")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 743
                y: 328
                text: qsTr("03")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 743
                y: 368
                text: qsTr("04")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 743
                y: 408
                text: qsTr("05")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }

            Text{
                x: 805
                y: 208
                text: qsTr("温度")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Row{
                x: 795
                y: 249
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp1 <= 999) ? CarStatus.bat_temp1.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 795
                y: 289
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp2 <= 999) ? CarStatus.bat_temp2.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 795
                y: 329
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp3 <= 999) ? CarStatus.bat_temp3.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 795
                y: 369
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp4 <= 999) ? CarStatus.bat_temp4.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 795
                y: 409
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp5 <= 999) ? CarStatus.bat_temp5.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }

            Text{
                x: 885
                y: 208
                text: qsTr("探针")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 891
                y: 248
                text: qsTr("06")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 891
                y: 288
                text: qsTr("07")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 891
                y: 328
                text: qsTr("08")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 891
                y: 368
                text: qsTr("09")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Text{
                x: 891
                y: 408
                text: qsTr("10")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }

            Text{
                x: 954
                y: 208
                text: qsTr("温度")
                font.family:FontName.fontCurrentFzLt
                font.pixelSize: 21
                color: "#4e75ac"
                style: Text.Raised;
                styleColor: "black"
            }
            Row{
                x: 945
                y: 249
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp6 <= 999) ? CarStatus.bat_temp6.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 945
                y: 289
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp7 <= 999) ? CarStatus.bat_temp7.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 945
                y: 329
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp8 <= 999) ? CarStatus.bat_temp8.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 945
                y: 369
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp9 <= 999) ? CarStatus.bat_temp9.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
            Row{
                x: 945
                y: 409
                spacing: 2
                width: 60
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
                    text: (CarStatus.bat_temp10 <= 999) ? CarStatus.bat_temp10.toFixed(0) : 999
                    font.family:FontName.fontCurrentFzLt
                    font.pixelSize: 21
                    color: "white"
                    style: Text.Raised;
                    styleColor: "black"
                }
            }
        }

    }

    Text {
        x: 570
        y: 75
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("电池状态信息")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "#00D1FF"
        style: Text.Raised;
        //styleColor: "white"
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: batteryStatusMenu; opacity: 0.0 }
            PropertyChanges { target: ringBg1; x: 280 }
            PropertyChanges { target: ringBg2; x: 558 }
            PropertyChanges { target: centerImageRect; x: 720 }
            PropertyChanges { target: centerImageRect; width: 0 }
            PropertyChanges { target: centerImageBg; x: -370 }
            PropertyChanges { target: menuBgFog; visible: false }
            PropertyChanges { target: detailContent; opacity: 0.0 }
            PropertyChanges { target: bat;  opacity: 0.0; visible: false}
        },
        State {
            name: "show"
            PropertyChanges { target: batteryStatusMenu; opacity: 1.0 }
            PropertyChanges { target: bat;  opacity: 1.0; visible: true}
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
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
            from: ""
            to:   "*"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: batteryStatusMenu; property: "opacity"; duration: 100;}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 100;}
                    NumberAnimation {target: menuBgFog; property: "visible"; duration: 100;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 100;}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: batteryStatusMenu; property: "opacity"; duration: 100;}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 100;}
                    NumberAnimation {target: menuBgFog; property: "visible"; duration: 100;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 100;}
                }
            }
        }
    ]

}

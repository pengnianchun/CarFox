import QtQuick 2.0

Item {
    id: centerPanel
    opacity: 0.0
    y: -22

    Rectangle {
        id: borderDisplay
        x: 518
        y: 215
        width: 400
        height: 207
        border.width: 3
        border.color: "green"
        radius: 15
        opacity: 0.0//opacity: 0.2

    }

    Rectangle {
        id: displayBox
        x: 518
        y: 215
        width:  400
        height: 0
        radius: 10
        opacity: 0.0//opacity: 0.3

        Rectangle {
            id: line
            x: 25
            y: 45
            width:  350
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line1
            x: 25
            y: 85
            width:  350
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line2
            x: 25
            y: 125
            width:  350
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }

        Rectangle {
            id: line3
            x: 25
            y: 165
            width:  350
            height: 1
            color: "white"
            radius: 10
            opacity: 1.0
        }
    }

    Image {
        id: centerBg
        x:  540
        y:  260
        width: 340
        rotation: 0
        opacity: 1.0
        scale: 1.0
        source: "qrc:/images/theme1/images/themeOne/HomePanel/centerBg.png"
    }

    Row{
        id: row1
        x: 543
        y: 228
        spacing: 2

        Text{
            text: qsTr("高压电池电压电流")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{ text: ""; width: 28 }

        Text{
            text: CarStatus.totalVoltage.toFixed(0)
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("V")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("/")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: CarStatus.totalCurrent.toFixed(0)
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("A")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }
    }

    Row{
        id: row2
        x: 543
        y: 268
        spacing: 2

        Text{
            text: qsTr("电机与控制器温度")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{ text: ""; width: 28 }

        Text{
            text: CarStatus.moter_temp
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("℃")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("/")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: CarStatus.moter_control_temp
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("℃")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }
    }

    Row{
        id: row3
        x: 543
        y: 308
        spacing: 2

        Text{
            text: qsTr("SPN值与系统代码")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{ text: ""; width: 25 }

        Text{
            text: setTextDisplay(CarStatus.SPN)
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("/")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: CarStatus.fault_code
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }
    }

    Row{
        id: row4
        x: 543
        y: 348
        spacing: 2

        Text{
            text: qsTr("SOC值与尿素液位")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{ text: ""; width: 22 }

        Text{
            text: CarStatus.soc
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("%")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("/")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#53C7DF"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: CarStatus.urea_level.toFixed(1)
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            style: Text.Raised;
            styleColor: "black"
        }

        Text{
            text: qsTr("%")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#808080"
            style: Text.Raised;
            styleColor: "black"
        }
    }

    Item {
        id: oilPressValue
        x: 560
        y: 422
        Image {
            id: oilPress
            opacity: 1.0
            source: "qrc:/images/common/images/common/Indicator/oilPressureValue.png"
        }
        Text{
            x: 60
            text: qsTr(" %1 KPa").arg(CarStatus.engine_oil_pressure.toFixed(0))
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
        }
    }

    Item {
        id: waterTempValue
        x: 760
        y: 422
        Image {
            id: waterTemp
            y: -10
            opacity: 1.0
            source: "qrc:/images/common/images/common/Indicator/waterTempValue.png"
        }
        Text{
            x: 60
            text: qsTr(" %1 ℃").arg(CarStatus.engine_water_temp.toFixed(0))
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
        }
    }

    function setTextDisplay(currentValue) {
        var value = currentValue.toString(16).toLocaleUpperCase()
        return value
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: centerPanel; opacity: 0.0;}
        },
        State {
            name: "show"
            PropertyChanges { target: centerPanel; opacity: 1.0;}
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
            NumberAnimation {
                target: centerPanel
                properties: "opacity"
                duration: 20
                easing.type: Easing.OutBounce
            }
        },
        Transition {
            from: "show"
            to: ""
            NumberAnimation {
                target: centerPanel
                properties: "opacity"
                duration: 10
                easing.type: Easing.OutBounce
            }
        }
    ]

}

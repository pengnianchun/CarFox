import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQml 2.0

Item {
    property int carSpeedRotation: -120
    property int remainTime: 10

    property real carTrip: 1.0
    property date currentDate: new Date()
    property string dateString
    property real carOdo: 1000

    layer.enabled: true

    FontLoader {
        id: msyh
        source: "qrc:/Fonts/Font/msyh.ttc"
    }

    FontLoader {
        id: msyhl
        source: "qrc:/Fonts/Font/msyhl.ttc"
    }

    Rectangle {
        id: blackbg
        anchors.fill: parent
        color: "black"
    }

    Image {
        id: line_up
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 61
        source: "qrc:/theme2/symbol/Theme2/Symbol/line_up.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_left
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_left.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_right
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_right.png"
        asynchronous: true
        cache: true
    }

    Image {
        id: line_down
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        source: "qrc:/theme2/symbol/Theme2/Symbol//line_down.png"
        asynchronous: true
        cache: true
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 550
        visible: homepanel_visible

        Image {
            id: speed_left
            source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
            asynchronous: true
            cache: true

            Image {
                id: circle_lineLeft
                x: 185
                y: -5
                source: "qrc:/theme2/symbol/Theme2/Symbol/circle.png"
                asynchronous: true
                cache: true

                transform: Rotation {
                    id: minuteRotation
                    origin.x: 0; origin.y: 190;
                    angle: carSpeedRotation * 6
                    Behavior on angle {
                        SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                    }
                }
            }
        }

        Image {
            id: speed_right
            source: "qrc:/theme2/symbol/Theme2/Symbol/speed.png"
            asynchronous: true
            cache: true

            Rectangle {
                x: 185
                y: -5
                width: 20
                height: 20
                radius: 10
                color: "lightblue"

                transform: Rotation {
                    origin.x: 0; origin.y: 190;
                    angle: carSpeedRotation * 6
                    Behavior on angle {
                        SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
                    }
                }

            }

//            Image {
//                id: circle_lineRight
//                x: 185
//                y: -5
//                source: "qrc:/theme2/symbol/Theme2/Symbol/circle.png"
//                asynchronous: true
//                cache: true

//                transform: Rotation {
//                    origin.x: 0; origin.y: 190;
//                    angle: carSpeedRotation * 6
//                    Behavior on angle {
//                        SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//                    }
//                }
//            }
        }
    }

    // 发车倒计时
    Rectangle {
        anchors.centerIn: parent
        width: homepanel_visible ? 500 : 800
        height: homepanel_visible ? 300 : 410
        color: "#111111"
        radius: 10

        ColumnLayout{
            anchors.fill: parent
            visible: homepanel_visible

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Image {
                    source: "qrc:/theme2/symbol/Theme2/Symbol/Countdown.png"
                    asynchronous: true
                    cache: true
                }

                Text {
                    text: qsTr("发车倒计时")
                    color: "#0088ff"
                    font.family: msyh.name
                    font.pixelSize: 30
                }
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("00:00")
                color: "white"
                font.family: msyh.name
                font.pixelSize: 50
            }
        }
    }

    // 车速
    Item {
        id: carSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: homepanel_visible ? 150 : 80
        width: 200
        height: 110

        Text {
            anchors.centerIn: parent
            text: carSpeedValue
            color: "white"
            font.family: msyh.name
            font.pixelSize: 135
        }
    }

    // 车速单位
    Text {
        anchors.left: carSpeed.right
        anchors.leftMargin: -20
        anchors.bottom: carSpeed.bottom
        text: qsTr("km/h")
        color: "#666666"
        font.family: msyh.name
        font.pixelSize: 16
    }

    // 续航里程 & SOC
    Rectangle {
        id: rectLeft
        anchors.top: carSpeed.bottom
        anchors.topMargin: 20
        anchors.left: carSpeed.left
        width: 220
        height: 120
        radius: 10
        color: "#111111"

        ColumnLayout {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: qsTr("续航里程：") + carVoyage + qsTr(" km")
                color: "#666666"
                font.family: msyhl.name
                font.pixelSize: 16
            }
            Text {
                text: qsTr("SOC：") + carSoc + qsTr(" %")
                color: "#666666"
                font.family: msyhl.name
                font.pixelSize: 16
            }
        }

        // SOC  图片
        Image {
            id: socImage
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/theme2/symbol/Theme2/Symbol/soc.png"
        }

        Row {
            anchors.left: socImage.left
            anchors.leftMargin: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            spacing: 3
            Repeater {
                model: 10
                Image { source: "qrc:/theme2/symbol/Theme2/Symbol/soc_progress.png" }
            }
        }
    }

    // 水温告警
    RowLayout {
        anchors.top: rectLeft.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: rectLeft.horizontalCenter
        visible: homepanel_visible

        Image {
            source: "qrc:/theme2/symbol/Theme2/Symbol/StopWL.png"
        }
        Text {
            text: qsTr("水温高于105度")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
    }

    // 转速
    Item {
        id: engineSpeed
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.right: parent.right
        anchors.rightMargin: homepanel_visible ? 170 : 100
        width: 200
        height: 110

        Text {
            anchors.centerIn: parent
            text: engineSpeedValue
            color: "white"
            font.family: msyh.name
            font.pixelSize: 135
        }
    }

    // 转速单位
    Text {
        anchors.left: engineSpeed.right
        anchors.leftMargin: -20
        anchors.bottom: engineSpeed.bottom
        text: qsTr("x1000\r\nr/min")
        color: "#666666"
        font.family: msyh.name
        font.pixelSize: 16
    }

    // 制动气压 & 蓄电池电压
    Rectangle {
        id: rectRight
        anchors.top: engineSpeed.bottom
        anchors.topMargin: 20
        anchors.left: engineSpeed.left
        width: 220
        height: 120
        radius: 10
        color: "#111111"

        ColumnLayout {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: qsTr("制动气压： ") + carBreakPressure + qsTr(" Mpa")
                color: "#666666"
                font.family: msyhl.name
                font.pixelSize: 16
            }
            Text {
                text: qsTr("蓄电池电压： ") + carBattery + qsTr(" V")
                color: "#666666"
                font.family: msyhl.name
                font.pixelSize: 16
            }
        }

        // 档位
        RowLayout {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            Image {
                id: gearN
                source: "qrc:/theme2/symbol/Theme2/Symbol/gear-N.png"
            }
            Image {
                id: gearD
                source: "qrc:/theme2/symbol/Theme2/Symbol/gear_D.png"
            }
            Image {
                id: gearP
                source: "qrc:/theme2/symbol/Theme2/Symbol/gear_R.png"
            }
        }
    }

    // 爬坡模式
    Image {
        id: modePP
        anchors.top: rectRight.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: rectRight.horizontalCenter
        source: "qrc:/theme2/symbol/Theme2/Symbol/climbingmode.png"
        visible: homepanel_visible
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        spacing: 100

        Text {
            text: qsTr("TRIP: ") + carTrip + qsTr(" km")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
        Text {
            text: qsTr(dateString)
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
        Text {
            text: qsTr("ODO： ") + carOdo + qsTr(" km")
            color: "white"
            font.family: msyh.name
            font.pixelSize: 20
        }
    }

    Component.onCompleted: {
        dateString = currentDate.toLocaleDateString();
    }

    // Demo
    MouseArea {
        anchors.fill: parent
        onClicked: {
            homepanel_visible = !homepanel_visible
        }
    }
}

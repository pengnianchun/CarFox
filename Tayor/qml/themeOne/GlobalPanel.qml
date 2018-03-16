import QtQuick 2.0

Item {
    id:globalPanel
    width: 1440
    height: 544
    opacity:0.0

//	property int odo: CarStatus.odo
//	property int gear: CarStatus.gear
    property int odo: 13800
    property int gear: 2
//	property int totalVoltage: CarStatus.totalVoltage
//	property int totalcurrent: CarStatus.totalcurrent
    property int totalVoltage: 380
    property int totalCurrent: 30
//	property real trip: CarStatus.trip
//	property int carTemp: CarStatus.carTemp
    property real trip: 1350
    property int carTemp: 28
//	property real airPressure1: CarStatus.airPressure1
//	property real airPressure2: CarStatus.airPressure2
//	property int batteryTH: CarStatus.batteryTH
//	property int batteryTL: CarStatus.batteryTL
//	property int batteryVH: CarStatus.batteryVH
//	property int batteryVL: CarStatus.batteryVL
    property real airPressure1: 2000
    property real airPressure2: 1800
    property int batteryTH: 90
    property int batteryTL: 80
    property int batteryVH: 70
    property int batteryVL: 60

//    Image {
//        id: odoTitle
//        x: 17
//        y: 477
//        opacity: 1.0
//        source: "qrc:/image/images/globalPanel/odoTitle.png"
//    }
//    Image {
//        id: odoUint
//        x: 129
//        y: 505
//        opacity: 1.0
//        source: "qrc:/image/images/globalPanel/odoUint.png"
//    }
//    Image {
//        id: tripTitle
//        x: 1338
//        y: 477
//        opacity: 1.0
//        source: "qrc:/image/images/globalPanel/tripTitle.png"
//    }
//    Image {
//        id: tripUint
//        x: 1395
//        y: 505
//        opacity: 1.0
//        source: "qrc:/image/images/globalPanel/tripUint.png"
//    }

//    Item{
//        id: airPressure1
//        x: 0
//        width: 1440
//        height: 540
//        Image {
//            id: airPressure1Uint
//            x: 605
//            y: 475
//            opacity: 1.0
//            source: "qrc:/image/images/globalPanel/airPressure1Uint.png"
//        }
//        Image {
//            id: airPressure1Title
//            x: 470
//            y: 457
//            opacity: 1.0
//            source: "qrc:/image/images/globalPanel/airPressure1Title.png"
//        }

////        BarLine{
////            id: airPressure1Bar
////            x: 466
////            y: 482
////            curValue: globalPanel.airPressure1*100
////        }

//        Text {
//            id: airPressure1Value
//            anchors.right: airPressure1.right
//            anchors.rightMargin: 795
//            y: 450
//            text: (globalPanel.airPressure1).toFixed(2)
//            font.family:FontName.fontCurrentMetroDF
//            font.pixelSize: 20
//            color: "#5885c5"
//        }
//    }

//    Item{
//        id: airPressure2
//        x: 0
//        width: 1440
//        height: 540
//        Image {
//            id: airPressure2Title
//            x: 785
//            y: 457
//            opacity: 1.0
//            source: "qrc:/image/images/globalPanel/airPressure2Title.png"
//        }
//        Image {
//            id: airPressure2Uint
//            x: 923
//            y: 475
//            opacity: 1.0
//            source: "qrc:/image/images/globalPanel/airPressure2Uint.png"
//        }
//        BarLine{
//            id: airPressure2Bar
//            x: 783
//            y: 482
//            curValue: globalPanel.airPressure2 * 100
//        }

//        Text {
//            id: airPressure2Value
//            anchors.right: airPressure2.right
//            anchors.rightMargin: 477
//            y: 450
//            text: (globalPanel.airPressure2).toFixed(2)
//            font.family:FontName.fontCurrentMetroDF
//            font.pixelSize: 20
//            color: "#5885c5"
//        }
//    }



//    Row{
//        id: odoShow
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 1317
//        y: 501
//        Text {
//            id: odoZero
//            text: ""//CarStatus.odoZero
//            font.family:FontName.fontCurrentMetroDF
//            font.pixelSize: 20
//            color: "#808080"
//        }
//        Text {
//            id: odoValue
//            text: globalPanel.odo
//            font.family:FontName.fontCurrentMetroDF
//            font.pixelSize: 20
//            color: "white"
//        }
//    }

//    Text {
//        id: tripShow
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 51
//        y: 501
//        text: (globalPanel.trip).toFixed(1)
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 20
//        color: "white"
//    }


//    Text {
//        id: tH
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 839
//        y: 18
//        text: globalPanel.batteryTH
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 18
//        color: "#cccccc"
//    }

//    Text {
//        id: tL
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 736
//        y: 18
//        text: globalPanel.batteryTL
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 18
//        color: "#cccccc"
//    }

//    Text {
//        id: vH
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 630
//        y: 18
//        text: globalPanel.batteryVH
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 18
//        color: "#cccccc"
//    }

//    Text {
//        id: vL
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 529
//        y: 18
//        text: globalPanel.batteryVL
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 18
//        color: "#cccccc"
//    }

//    Text {
//        id: temperature
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 868
//        y: 61
//        text: globalPanel.carTemp
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 20
//        color: "#cccccc"
//    }

//    Text {
//        id: totalVoltageShow
//        anchors.right: globalPanel.right
//        anchors.rightMargin: 484
//        y: 61
//        text: globalPanel.totalVoltage
//        font.family:FontName.fontCurrentMetroDF
//        font.pixelSize: 20
//        color: "#cccccc"
//    }

    Image {
        id: gearD
        anchors.horizontalCenter: globalPanel.horizontalCenter
        y: 478
        source: "qrc:/image/images/globalPanel/gearD.png"
        //visible: globalPanel.gear === 3
        opacity: 0.0
    }

    Image {
        id: gearN
        anchors.horizontalCenter: globalPanel.horizontalCenter
        y: 478
        source: "qrc:/image/images/globalPanel/gearN.png"
        //visible: false  //visible: globalPanel.gear === 2
        opacity: 0.0
    }

    Image {
        id: gearP
        anchors.horizontalCenter: globalPanel.horizontalCenter
        y: 478
        source: "qrc:/image/images/globalPanel/gearP.png"
        //visible: globalPanel.gear === 0
        opacity: 1.0
    }

    Image {
        id: gearR
        anchors.horizontalCenter: globalPanel.horizontalCenter
        y: 478
        source: "qrc:/image/images/globalPanel/gearR.png"
        //visible: globalPanel.gear === 1
        opacity: 0.0
    }

//    Item{
//        visible: false
//        id: warning

////        TipsInfo{
////            id: tipsInfo
////            state: ""

////            onTipsCountsChanged: {
////                if(tipsCounts >= 1 && tipsInfo.state != "show")
////                    tipsInfo.state = "show";
////                else
////                    tipsInfo.state = "";
////            }
////        }

//        Image {
//            id: midDoor
//            x: 614
//            y: 331
//            visible: true //CarStatus.rightMidDoor
//            source: "qrc:/image/images/globalPanel/midDoor.png"
//        }
//        Image {
//            id: frontDoor
//            x: 718
//            y: 277
//            visible: true //CarStatus.rightFrontDoor
//            source: "qrc:/image/images/globalPanel/frontDoor.png"
//        }
//    }

    Item{
            visible: true
            id: warning

            TipsInfo{
                id: tipsInfo
                state: ""

                onTipsCountsChanged: {
                    if(tipsCounts >= 1 && tipsInfo.state != "show")
                        tipsInfo.state = "show";
                    else
                        tipsInfo.state = "";
                }
            }

            Image {
                id: midDoor
                x: 614
                y: 331
                visible: CarStatus.rightMidDoor
                source: "qrc:/globalPanel/images/globalPanel/midDoor.png"
            }
            Image {
                id: frontDoor
                x: 718
                y: 277
                visible: CarStatus.rightFrontDoor
                source: "qrc:/globalPanel/images/globalPanel/frontDoor.png"
            }
        }

    IndicatorLamp{
        id: indicatorLamp
        state: ""
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: globalPanel; opacity: 0.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
            //PropertyChanges { target: warning; visible: false }
            PropertyChanges { target: airPressure1; x: 0 }
            PropertyChanges { target: airPressure2; x: 0 }
            PropertyChanges { target: indicatorLamp; state: "" }
        },
        State {
            name: "normal"
            PropertyChanges { target: globalPanel; opacity: 1.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
            //PropertyChanges { target: warning; visible: true }
            //PropertyChanges { target: airPressure1; x: 0 }
            //PropertyChanges { target: airPressure2; x: 0 }
            PropertyChanges { target: indicatorLamp; state: "show" }
        },
        State {
            name: "menu"
            PropertyChanges { target: globalPanel; opacity: 1.0 }
            PropertyChanges { target: gearP; opacity: 0.0 }
            //PropertyChanges { target: warning; visible: false }
            //PropertyChanges { target: airPressure1; x: -95 }
            //PropertyChanges { target: airPressure2; x: 95 }
            PropertyChanges { target: indicatorLamp; state: "show" }
        },
        State {
            name: "test"
            PropertyChanges { target: globalPanel; opacity: 1.0 }
            PropertyChanges { target: gearP; opacity: 1.0 }
            //PropertyChanges { target: warning; visible: false }
            ///PropertyChanges { target: airPressure1; x: -95 }
            //PropertyChanges { target: airPressure2; x: 95 }
            PropertyChanges { target: indicatorLamp; state: "" }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
        },
        Transition {
            from: "normal"
            to: "test"
            SequentialAnimation {
                id: seqAnimation
                loops:  Animation.Infinite
                ParallelAnimation {
                    NumberAnimation {
                        target: gearP
                        properties: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearP
                        properties: "height"
                        from: 0
                        to: 60
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                }
                PauseAnimation {
                    duration: 5000
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: gearP
                        properties: "height"
                        from: gearP.height
                        to: 0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearR
                        properties: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearR
                        properties: "height"
                        from: 0
                        to: 60
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                }

                PauseAnimation {
                    duration: 3000
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: gearR
                        properties: "height"
                        from: gearR.height
                        to: 0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearN
                        properties: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearN
                        properties: "height"
                        from: 0
                        to: 60
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                }

                PauseAnimation {
                    duration: 8000
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: gearN
                        properties: "height"
                        from: gearN.height
                        to: 0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearD
                        properties: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearD
                        properties: "height"
                        from: 0
                        to: 60
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                }

                PauseAnimation {
                    duration: 5000
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: gearD
                        properties: "height"
                        from: gearD.height
                        to: 0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearN
                        properties: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearN
                        properties: "height"
                        from: 0
                        to: 60
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                }
                PauseAnimation {
                    duration: 5000
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: gearN
                        properties: "height"
                        from: gearN.height
                        to: 0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearP
                        properties: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 800
                        //easing.type: Easing.OutBounce
                    }
                    NumberAnimation {
                        target: gearP
                        properties: "height"
                        from: 0
                        to: 60
                        duration: 10
                        //easing.type: Easing.OutBounce
                    }
                }
            }
        }
    ]
}

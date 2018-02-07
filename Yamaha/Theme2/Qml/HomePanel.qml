import QtQuick 2.6
import QtQuick.Layouts 1.0
import CustomEnum 1.0
import "qrc:/Common/JS/AlarmCode.js" as AlarmCode
import "qrc:/Common/Component"

CommonItem {
    visible: false
    width: 1440
    height: 544
    property real screenWidth: 1440;
    property real screenHeight: 544;
    property real topPanelHeight: 80;
    property real bottomPanelHeight: 80;
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string sourceCommonImageUrl: "qrc:/Common/CommonImage/"
    property string backgroundImage: sourceImageUrl + "HomePanel/background.png";
    property string topBarImage: sourceImageUrl + "HomePanel/topBar.png";
    property string bottomBarImage: sourceImageUrl + "HomePanel/bottomBar.png";
    property string oilPressureImage: sourceCommonImageUrl + "Indicator/oilPressureValue.png";//oilPressLow
    property string waterTempImage: sourceCommonImageUrl + "Indicator/waterTempValue.png"
    property string oilImage: sourceImageUrl + "DialPanel/oil.png"
    property string mpaLeftImage: sourceImageUrl + "HomePanel/mpaLeft.png"
    property string mpaRightImage: sourceImageUrl + "HomePanel/mpaRight.png"
    property bool bDisplay: true

    //HomePanel遮罩效果信号监测
    property string maskBackGroundStatus: "";

    onMaskBackGroundStatusChanged: {
        console.log("maskBackGroundStatus:::::::::::::::::::::::::::" + maskBackGroundStatus);
        if(maskBackGroundStatus === "show"){
            mask_background.state = "";
            mask_background.state = "show";
        }else if(maskBackGroundStatus === "hide"){
            mask_background.state = "";
            mask_background.state = "hide";
        }else{}
        maskBackGroundStatus = "";
    }

    onVisibleChanged: {
        if(visible){
            // 按键触发
            CarMsg.sendEnableKeys(true);
            for(var i=0;i<10;i++){
                mpaLeftModel.append({"mpa":true});
                mpaRightModel.append({"mpa":true});
            }
            //UiController.showLayer("MenuPanel");
        }
    }
    Component.onCompleted: {
        console.log("=================================" + AlarmCode.getInfo());
    }
    Timer {//test image url is changed
        repeat: true
        interval: 1000
        running: true
        onTriggered: {
            if(bDisplay){
                oilPressureImage = sourceCommonImageUrl + "Indicator/oilPressLow.png";
            }else{
                oilPressureImage = sourceCommonImageUrl + "Indicator/oilPressureValue.png";
            }

        }
    }
    Item {
        id: home
        anchors.fill: parent
        Rectangle {
            id: mask_background;
            z: 2;
            state: ""
            anchors.fill: parent;
            color: "lightgray";
            opacity: 0
            states: [
                State {
                    name: "show"
                    PropertyChanges { target: mask_background; opacity: 0.5 }
                },
                State {
                    name: "hide"
                    PropertyChanges { target: mask_background; opacity: 0 }
                }
            ]
            transitions: [
                Transition {
                    from: ""
                    to: "show"
                    SequentialAnimation {
                        PropertyAnimation {
                            target: mask_background
                            duration: 280
                        }
                    }
                },
                Transition {
                    from: ""
                    to: "hide"
                    SequentialAnimation {
                        PropertyAnimation {
                            target: mask_background
                            duration: 500
                        }
                    }
                }
            ]
        }
        Image {
            id: background
            anchors.fill: parent
            fillMode: Image.TileHorizontally
            smooth: true
            opacity: 1.0
            source: backgroundImage
        }
        Row {
            id: navPanel
            z: 1
            width: screenWidth
            height: topPanelHeight
            anchors.top: parent.top
            spacing: 0
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: spnDisplay
                    //textOpacity: 0.0
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("SPN  %1 ").arg(0)//setTextDisplay(CarStatus.SPN)
                }
                TextIconWeir {
                    id: oilPressValue
                    anchors.right: parent.right
                    anchors.rightMargin: 350
                    anchors.verticalCenter: parent.verticalCenter
                    textIconValue: qsTr(" %1 KPa").arg(0)//CarStatus.engine_oil_pressure.toFixed(0)
                    iconSource: oilPressureImage
                }
                TextFieldWeir {
                    id: weekDisplay
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 400
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: "week"
                }
                TimeHMSWeir {
                    id: hmsDisplay
                    anchors.right: parent.right
                    anchors.rightMargin: 120
                    anchors.verticalCenter: parent.verticalCenter
                    hourValue: "00"
                    spaceValue: ":"
                    minuteValue: "00"
                }
            }
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TimeInfoWeir {
                    id: timeInfo
                    anchors.left: parent.left
                    anchors.leftMargin: 200
                    anchors.verticalCenter: parent.verticalCenter
                    visible: true
                    onHourChanged: {
                        hmsDisplay.hourValue = qsTr("%1").arg(hour)
                    }
                    onMinuteChanged: {
                        hmsDisplay.minuteValue = qsTr("%1").arg(minute);
                    }
                    onSecondChanged: {
                        if(bDisplay) {
                            hmsDisplay.spaceValue = ":";
                        } else {
                            hmsDisplay.spaceValue = " ";
                        }
                        bDisplay = !bDisplay
                    }
                    onWeekChanged: {
                        weekDisplay.textValue = qsTr("%1").arg(week);
                    }
                }
                TextIconWeir {
                    id: waterTempValue
                    anchors.left: parent.left
                    anchors.leftMargin: 390
                    anchors.verticalCenter: parent.verticalCenter
                    imageTopMargin: -5
                    spaceWidth: -20
                    textIconValue: qsTr(" %1 ℃").arg(0)//(CarStatus.engine_water_temp.toFixed(0))
                    iconSource: waterTempImage
                }
                TextFieldWeir {
                    id: systemCode
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 160
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("系统代码  %1").arg(0)//(CarStatus.fault_code)
                }
            }
        }
        Item {
            id: centerPanel
            z: 1
            anchors.top: navPanel.bottom
            width: screenWidth
            height: screenHeight - topPanelHeight - bottomPanelHeight
            Image {
                id: mpaLeftPanel
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20
                opacity: 1.0
                source: mpaLeftImage
            }
            ListModel {
                id: mpaLeftModel
            }
            MpaListView {
                id: leftMpaListView
                width: 50
                height: 280
                mpaListModel: mpaLeftModel
                anchors.left: mpaLeftPanel.left
                anchors.leftMargin: 40
                anchors.bottom: mpaLeftPanel.bottom
                anchors.bottomMargin: 23
            }
            Image {
                id: mpaRightPanel
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20
                opacity: 1.0
                source: mpaRightImage
            }
            ListModel {
                id: mpaRightModel
            }
            MpaListView {
                id: rightMpaListView
                width: 50
                height: 280
                mpaListModel: mpaRightModel
                anchors.right: mpaRightPanel.right
                anchors.rightMargin: 49
                anchors.bottom: mpaLeftPanel.bottom
                anchors.bottomMargin: 23
            }
        }
        Row {
            id: booterPanel
            z: 1
            anchors.top: centerPanel.bottom
            anchors.topMargin: -10
            width: screenWidth
            height: bottomPanelHeight
            spacing: 0
            Row {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: odoDisplay
                    //textOpacity: 0.0
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("总里程  %1 Km").arg(0)//(CarStatus.odo.toFixed(0))
                }
                TextFieldWeir {
                    id: motorCtlTemp
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 330
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("电机/控制器 %1℃/%2℃ ").arg(0).arg(0)//(CarStatus.moter_temp.toFixed(0)).arg(CarStatus.moter_control_temp.toFixed(0))
                }
            }
            Item {
                width: screenWidth/2
                height: topPanelHeight
                TextFieldWeir {
                    id: levelDisplay
                    //textOpacity: 0.0
                    anchors.left: parent.left
                    anchors.leftMargin: 180
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("尿素液位 %1% ").arg(0)//(CarStatus.urea_level.toFixed(1))
                }
                TextIconWeir {
                    id: oilfuelValue
                    anchors.right: parent.right
                    anchors.rightMargin: 160
                    anchors.verticalCenter: parent.verticalCenter
                    imageTopMargin: 0
                    spaceWidth: -30
                    textIconValue: qsTr("%1%").arg(0)//(CarStatus.oil_level.toFixed(0))
                    iconSource: oilImage
                }
                TextFieldWeir {
                    id: tripDisplay
                    //textOpacity: 0.0
                    anchors.right: parent.right
                    anchors.rightMargin: 180
                    anchors.verticalCenter: parent.verticalCenter
                    textValue: qsTr("小计里程  %1 Km").arg(0)//(CarStatus.trip.toFixed(1))
                }
            }
        }
        Image {
            id: topBar
            z: 1
            anchors.bottom: centerPanel.top
            opacity: 1.0
            source: topBarImage
        }
        Image {
            id: bottomBar
            z: 1
            anchors.top: centerPanel.bottom
            opacity: 1.0
            source: bottomBarImage
        }
    /*
        Text {
            id: slopeDisplay
            opacity: CarStatus.climbing_mode
            x: 910
            y: 380
            width: 120
            height: 320
            text: qsTr("爬坡模式")
            horizontalAlignment: Text.AlignHCenter
            font.family:FontName.fontCurrentFzLt
            font.italic: true
            font.pointSize: 15
            color: "red"
        }

        Text {
            id: diagDisplay
            opacity: CarStatus.diagnostic_mode
            x: 880
            y: 420
            width: 120
            height: 320
            text: qsTr("诊断模式")
            horizontalAlignment: Text.AlignHCenter
            font.family:FontName.fontCurrentFzLt
            font.italic: true
            font.pointSize: 15
            color: "red"
        }

        Text {
            id: modeDisplay
            opacity: 1.0
            x: 1070
            y: 400
            width: 120
            height: 320
            text: CarStatus.power_supply
            horizontalAlignment: Text.AlignHCenter
            font.family:FontName.fontCurrentFzLt
            font.pointSize: 25
            color: "#00FF00"
        }
        */
    }
}
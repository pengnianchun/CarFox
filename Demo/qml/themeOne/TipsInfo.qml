import QtQuick 2.2

Item {
    id: tipsInfoNotify
	opacity: 0.0
    y:-7

    property int bus_comm_fault: CarStatus.bus_comm_fault;
    property int water_temp_miss: CarStatus.water_temp_miss;
    property int oil_pressure_data_miss: CarStatus.oil_pressure_data_miss;

    property int status_Flag1_bit1: CarStatus.status_Flag1_bit1
    property int status_Flag1_bit2: CarStatus.status_Flag1_bit2
    property int status_Flag1_bit3: CarStatus.status_Flag1_bit3
    property int status_Flag1_bit4: CarStatus.status_Flag1_bit4
    property int status_Flag1_bit5: CarStatus.status_Flag1_bit5
    property int status_Flag1_bit6: CarStatus.status_Flag1_bit6
    property int status_Flag1_bit7: CarStatus.status_Flag1_bit7
    property int status_Flag1_bit8: CarStatus.status_Flag1_bit8
    property int status_Flag2_bit1: CarStatus.status_Flag2_bit1
    property int status_Flag2_bit2: CarStatus.status_Flag2_bit2
    property int status_Flag2_bit3: CarStatus.status_Flag2_bit3
    property int status_Flag2_bit4: CarStatus.status_Flag2_bit4
    property int status_Flag2_bit5: CarStatus.status_Flag2_bit5
    property int status_Flag2_bit6: CarStatus.status_Flag2_bit6
    property int status_Flag2_bit7: CarStatus.status_Flag2_bit7
    property int status_Flag2_bit8: CarStatus.status_Flag2_bit8
    property int status_Flag3_bit1: CarStatus.status_Flag3_bit1
    property int status_Flag3_bit2: CarStatus.status_Flag3_bit2
    property int status_Flag3_bit3: CarStatus.status_Flag3_bit3
    property int status_Flag3_bit4: CarStatus.status_Flag3_bit4

    onBus_comm_faultChanged: {
        updateTipsInfo("总线通信故障", bus_comm_fault)
    }

    onWater_temp_missChanged: {
        updateTipsInfo("水温信息丢失", water_temp_miss)
    }

    onOil_pressure_data_missChanged: {
        updateTipsInfo("机油压力数据丢失", oil_pressure_data_miss)
    }

    onStatus_Flag1_bit1Changed: {
        updateTipsInfo("单体模块电压过高", status_Flag1_bit1)
    }

    onStatus_Flag1_bit2Changed: {
        updateTipsInfo("单体模块电压过低", status_Flag1_bit2)
    }

    onStatus_Flag1_bit3Changed: {
        updateTipsInfo("SOC过高", status_Flag1_bit3)
    }

    onStatus_Flag1_bit4Changed: {
        updateTipsInfo("SOC过低", status_Flag1_bit4)
    }

    onStatus_Flag1_bit5Changed: {
        updateTipsInfo("内部通讯失败", status_Flag1_bit5)
    }

    onStatus_Flag1_bit6Changed: {
        updateTipsInfo("总电压欠压", status_Flag1_bit6)
    }

    onStatus_Flag1_bit7Changed: {
        updateTipsInfo("总电压过压", status_Flag1_bit7)
    }

    onStatus_Flag1_bit8Changed: {
        updateTipsInfo("电池不均衡故障", status_Flag1_bit8)
    }

    onStatus_Flag2_bit1Changed: {
        updateTipsInfo("电池热失控", status_Flag2_bit1)
    }

    onStatus_Flag2_bit2Changed: {
        updateTipsInfo("DCDC故障报警", status_Flag2_bit2)
    }

    onStatus_Flag2_bit3Changed: {
        updateTipsInfo("绝缘报警", status_Flag2_bit3)
    }

    onStatus_Flag2_bit4Changed: {
        updateTipsInfo("放电电流过大", status_Flag2_bit4)
    }

    onStatus_Flag2_bit5Changed: {
        updateTipsInfo("充电电流过大", status_Flag2_bit5)
    }

    onStatus_Flag2_bit6Changed: {
        updateTipsInfo("温度过高", status_Flag2_bit6)
    }

    onStatus_Flag2_bit7Changed: {
        updateTipsInfo("温度报警", status_Flag2_bit7)
    }

    onStatus_Flag2_bit8Changed: {
        updateTipsInfo("温度差过大", status_Flag2_bit8)
    }

    onStatus_Flag3_bit1Changed: {
        updateTipsInfo("保留", status_Flag3_bit1)
    }

    onStatus_Flag3_bit2Changed: {
        updateTipsInfo("内部接触器信号", status_Flag3_bit2)
    }

    onStatus_Flag3_bit3Changed: {
        updateTipsInfo("有内阻偏大电池", status_Flag3_bit3)
    }

    onStatus_Flag3_bit4Changed: {
        updateTipsInfo("有容量偏小电池", status_Flag3_bit4)
    }

	Image {
		id: warningRectangle
        x: 548
        y: 372
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
            running: tipsInfoNotify.state === "show"
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
                color: "red" //"#f9fea4"
                font.pixelSize: 22
                lineHeight: 1.2
                horizontalAlignment: Text.AlignHCenter
			}
		}
	}

	Timer{
		interval: 3000;
        running: tipsInfoNotify.state === "show"
		repeat: true
		onTriggered: {menuMainView.incrementCurrentIndex();}
	}

	function addTipsInfo(tipsInfo) {
        menuMainModel.append({"name": tipsInfo})
	}

	function delTipsInfo(tipsInfo) {
		for(var i = 0; i < menuMainModel.count; i++ ){
			if(menuMainModel.get(i).name === tipsInfo){
                menuMainModel.remove(i);
				return;
			}
		}
	}

    function updateTipsInfo(tipsInfo, bOperate) {
        if(1 === bOperate) {
            addTipsInfo(tipsInfo);
        } else {
            delTipsInfo(tipsInfo);
        }
    }

	states: [
		State {
			name: ""
            PropertyChanges { target: tipsInfoNotify; opacity:0.0 }
		},
		State {
			name: "show"
            PropertyChanges { target: tipsInfoNotify; opacity:1.0 }
		}
	]

	transitions: [
		Transition {
			from: ""
			to: "show"
			SequentialAnimation{
                NumberAnimation {target: tipsInfoNotify;property: "opacity";duration: 500;}
			}
		},
		Transition {
			from: "show"
			to: ""
			SequentialAnimation{
                NumberAnimation {target: tipsInfoNotify;property: "opacity";duration: 500;}
			}
		}
	]

    Connections {
        target:CarStatus
        onFaultChanged: {
            updateTipsInfo(fault, value)
        }
    }

	Component.onCompleted: {
        //CarStatus.faultChanged.connect(updateTipsInfo);
	}
}

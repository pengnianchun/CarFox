import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    //#CANVAS START
    //信息
    property int rangeValue: 100;
    property int nowRange: 70;

    //画布
    property int mW: 180;
    property int mH: 180;
    property int lineWidth: 2;

    //圆
    property double r: mH / 2; //圆心
    property double cR: r - 16 * lineWidth; //圆半径

    //Sin曲线
    property int sX: 0;
    property int sY: mH / 2;
    property int axisLength: mW;        //轴长
    property double waveWidth: 0.115;   //波浪宽度,数越小越宽
    property double waveHeight: 6;      //波浪高度,数越大越高
    property double speed: 0.09;        //波浪速度，数越大速度越快
    property double xOffset: 0;         //波浪x偏移量

    Canvas{
        id: canvas
        height: mH
        width: mW

        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        onPaint: {
            var ctx = getContext("2d");

            ctx.clearRect(0, 0, mW, mH);

            //显示外圈
            ctx.beginPath();
            ctx.strokeStyle = '#148014';
            ctx.arc(r, r, cR+5, 0, 2*Math.PI);
            ctx.stroke();
            ctx.beginPath();
            ctx.arc(r, r, cR, 0, 2*Math.PI);
            ctx.clip();

            //显示sin曲线
            ctx.save();
            var points=[];
            ctx.beginPath();
            for(var x = sX; x < sX + axisLength; x += 20 / axisLength){
                var y = -Math.sin((sX + x) * waveWidth + xOffset);
                var dY = mH * (1 - nowRange / 100 );
                points.push([x, dY + y * waveHeight]);
                ctx.lineTo(x, dY + y * waveHeight);
            }

            //显示波浪
            ctx.lineTo(axisLength, mH);
            ctx.lineTo(sX, mH);
            ctx.lineTo(points[0][0],points[0][1]);
            ctx.fillStyle = '#1c86d1';
            ctx.fill();
            ctx.restore();

            //显示百分数
            ctx.save();
            var size = 0.4*cR;
//            ctx.font = size + 'px Arial';
            ctx.textAlign = 'center';
            ctx.fillStyle = "rgba(14, 80, 14, 0.8)";
            ctx.fillText(~~nowRange + '分', r, r + size / 2);
            ctx.restore();

            if(nowRange <= rangeValue){
                nowRange += 1;
            }

            if(nowRange > rangeValue){
                nowRange -= 1;
            }
            xOffset += speed;
        }

//        Timer{
//            id: timer
//            running: false
//            repeat: true
//            interval: 100
//            onTriggered:{
//                parent.requestPaint();
//            }
//        }
    }
    //#CANVAS END

    // 车
    Image {

    }

    Image {
        x: 350
        y: 49
        source: "qrc:/theme2/symbol/Theme2/Modules/diagnosticInfo/scanning.png"
    }
    Image {
        x: 562
        y: 55
        source: "qrc:/theme2/symbol/Theme2/Modules/diagnosticInfo/scanning.png"
    }

    Image {
        x: 344
        y: 139
        source: "qrc:/theme2/symbol/Theme2/Modules/diagnosticInfo/scanning.png"
    }

    Image {
        x: 490
        y: 189
        source: "qrc:/theme2/symbol/Theme2/Modules/diagnosticInfo/scanning01.png"

        Text {
            id: text1
            x: 12
            y: 27
            text: qsTr("正在扫描")
            color: "white"
            font.pixelSize: 16
        }
    }
    //线
    Image {

    }

    RowLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter

        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: qsTr("车身系统")
                color: "white"
                font.pixelSize: 16
            }
            Text {
                text: qsTr("124 项")
                color: "white"
                font.pixelSize: 16
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: qsTr("底盘系统")
                color: "white"
                font.pixelSize: 16
            }
            Text {
                text: qsTr("124 项")
                color: "white"
                font.pixelSize: 16
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: qsTr("动力系统")
                color: "white"
                font.pixelSize: 16
            }
            Text {
                text: qsTr("124 项")
                color: "white"
                font.pixelSize: 16
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: qsTr("网络通讯系统")
                color: "white"
                font.pixelSize: 16
            }
            Text {
                text: qsTr("124 项")
                color: "white"
                font.pixelSize: 16
            }
        }
    }
}

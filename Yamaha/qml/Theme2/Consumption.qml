import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property string textBlue: "#0088ff"

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

        Timer{
            id: timer
            running: nowRange !== rangeValue
            repeat: true
            interval: 100
            onTriggered:{
                parent.requestPaint();
            }
        }
    }
    //#CANVAS END

    Text {
        x: 238
        y: 37
        font.pixelSize: 14
        color: "#0088ff"
        text: "电驱系统"
    }
    Rectangle {
        x: 323
        y: 39
        width: 300
        height: 18
        color: "#666666"
        Rectangle {
            width: 250
            height: 18
            color: "#006cca"
        }
    }

    Text {
        x: 238
        y: 89
        width: 56
        height: 22
        font.pixelSize: 14
        color: "white"
        text: "储能系统"
    }
    Rectangle {
        x: 323
        y: 91
        width: 300
        height: 18
        color: "#666666"
        Rectangle {
            width: 250
            height: 18
            color: "#006cca"
        }
    }

    Chart {
        id: chart
        width: 600
        height: 200

        anchors.top: parent.top
        anchors.topMargin: 170
        anchors.left: parent.left
        anchors.leftMargin: 10

        onPaint: {
            line({
                     labels : ["January","February","March","April","May","June","July"],
                     datasets : [
                         {
                             fillColor : "rgba(00,136,255,0.5)",
                             strokeColor : "rgba(220,220,220,1)",
                             pointColor : "rgba(00,136,255,1)",
                             pointStrokeColor : "#fff",
                             data : [65,59,90,81,56,55,40]
                         },
                         {
                             fillColor : "rgba(151,187,205,0.5)",
                             strokeColor : "rgba(151,187,205,1)",
                             pointColor : "white",
                             pointStrokeColor : "#fff",
                             data : [28,48,40,19,96,27,100]
                         }
                     ]
                 });
        }
    }

    Text {
        id: suggest
        anchors.left: chart.right
        anchors.top: chart.top

        font.pixelSize: 14
        color: "white"
        text: qsTr("保养建议")
    }

    ColumnLayout {
        anchors.left: chart.right
        anchors.top: suggest.bottom

        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "加油"
                font.pixelSize: 14
                color: textBlue
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "更换机油"
                font.pixelSize: 14
                color: textBlue
            }
        }
    }

    Component.onCompleted: {

    }
}

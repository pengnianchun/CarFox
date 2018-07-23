import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    property string textBlue: "#0088ff"

    //#CANVAS START
    //信息
    property int rangeValue: 80;
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
            ctx.font = size + 'px Arial';
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
    }
    //#CANVAS END

    RowLayout {
        anchors.left: canvas.right
        anchors.top: canvas.top
        anchors.topMargin: 30
        spacing: 20

        ColumnLayout {
            RowLayout {
                Text { text: "12:00"; color: textBlue; font.pixelSize: 14; }
                Text { text: qsTr("min"); color: "white"; font.pixelSize: 14; }
            }
            Text { text: qsTr("驾驶时间"); color: "white"; font.pixelSize: 14; }
        }
        ColumnLayout {
            RowLayout {
                Text { text: "12.0"; color: textBlue; font.pixelSize: 14; }
                Text { text: qsTr("km"); color: "white"; font.pixelSize: 14; }
            }
            Text { text: qsTr("行驶距离"); color: "white"; font.pixelSize: 14; }
        }
        ColumnLayout {
            RowLayout {
                Text { text: "12"; color: textBlue; font.pixelSize: 14; }
                Text { text: qsTr("kWh"); color: "white"; font.pixelSize: 14; }
            }
            Text { text: qsTr("使用电耗"); color: "white"; font.pixelSize: 14; }
        }
        ColumnLayout {
            RowLayout {
                Text { text: "30"; color: textBlue; font.pixelSize: 14; }
                Text { text: qsTr("km/h"); color: "white"; font.pixelSize: 14; }
            }
            Text { text: qsTr("平均时速"); color: "white"; font.pixelSize: 14; }
        }
        ColumnLayout {
            RowLayout {
                Text { text: "30"; color: textBlue; font.pixelSize: 14; }
                Text { text: qsTr("km/h"); color: "white"; font.pixelSize: 14; }
            }
            Text { text: qsTr("最高时速"); color: "white"; font.pixelSize: 14; }
        }
    }

    Rectangle {
        width: 400
        height: 2
        anchors.left: canvas.right
        anchors.top: canvas.top
        anchors.topMargin: 80
        color: "white"
    }

    RowLayout {
        anchors.left: canvas.right
        anchors.top: canvas.top
        anchors.topMargin: 90
        spacing: 20

        RowLayout {
            spacing: 15
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/rapidAcceleration.png"
            }
            ColumnLayout {
                spacing: -5
                RowLayout {
                    Text { text: "3"; color: textBlue; font.pixelSize: 14; }
                    Text { text: qsTr("次"); color: "white"; font.pixelSize: 14; }
                }
                Text { text: qsTr("急加速"); color: "white"; font.pixelSize: 14; }
            }
        }
        RowLayout {
            spacing: 15
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/fatigueDriving.png"
            }
            ColumnLayout {
                spacing: -5
                RowLayout {
                    Text { text: "3"; color: textBlue; font.pixelSize: 14; }
                    Text { text: qsTr("次"); color: "white"; font.pixelSize: 14; }
                }
                Text { text: qsTr("疲劳驾驶"); color: "white"; font.pixelSize: 14; }
            }
        }
        RowLayout {
            spacing: 15
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/calling.png"
            }
            ColumnLayout {
                spacing: -5
                RowLayout {
                    Text { text: "3"; color: textBlue; font.pixelSize: 14; }
                    Text { text: qsTr("次"); color: "white"; font.pixelSize: 14; }
                }
                Text { text: qsTr("打电话"); color: "white"; font.pixelSize: 14; }
            }
        }
        RowLayout {
            spacing: 15
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/changeLane.png"
            }
            ColumnLayout {
                spacing: -5
                RowLayout {
                    Text { text: "3"; color: textBlue; font.pixelSize: 14; }
                    Text { text: qsTr("次"); color: "white"; font.pixelSize: 14; }
                }
                Text { text: qsTr("急变道"); color: "white"; font.pixelSize: 14; }
            }
        }
        RowLayout {
            spacing: 15
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/speeding.png"
            }
            ColumnLayout {
                spacing: -5
                RowLayout {
                    Text { text: "3"; color: textBlue; font.pixelSize: 14; }
                    Text { text: qsTr("次"); color: "white"; font.pixelSize: 14; }
                }
                Text { text: qsTr("超速驾驶"); color: "white"; font.pixelSize: 14; }
            }
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
                             fillColor : "rgba(220,220,220,0.5)",
                             strokeColor : "rgba(220,220,220,1)",
                             pointColor : "rgba(220,220,220,1)",
                             pointStrokeColor : "#fff",
                             data : [65,59,90,81,56,55,40]
                         },
                         {
                             fillColor : "rgba(151,187,205,0.5)",
                             strokeColor : "rgba(151,187,205,1)",
                             pointColor : "rgba(151,187,205,1)",
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
        color: textBlue
        text: qsTr("驾驶行为建议")
    }

    ColumnLayout {
        anchors.left: chart.right
        anchors.top: suggest.bottom

        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "轻打方向"
                font.pixelSize: 14
                color: textBlue
            }
        }
        RowLayout {
            Image {
                source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
            }
            Text {
                text: "缓踩刹车"
                font.pixelSize: 14
                color: textBlue
            }
        }
    }

    Component.onCompleted: {

    }
}

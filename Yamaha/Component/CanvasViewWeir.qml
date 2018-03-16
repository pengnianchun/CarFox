import QtQuick 2.6

Canvas {
    id: canvas
    width: 500; height: 500 //画布需要定义面积
    property real startAngle: Math.PI/4
    property real endAngle: Math.PI*3/4
    property real coordX: 249
    property real coordY: 270
    property real rLength: 170
    property real lineWidth: 78
    property var ctx;
    property real angleValue: 0
    property string canvasColor: "#ffffff"//transparent
    transform: Rotation { origin.x: 249; origin.y: 270; axis { x: 0; y: 0; z: 1 } angle: angleValue }
    //再次函数中绘制图形
    onPaint: {
        ctx = canvas.getContext("2d");
        //ctx.strokeStyle = canvasColor;
        ctx.lineWidth = lineWidth;
        ctx.arc(coordX, coordY, rLength, startAngle, endAngle, false);
        ctx.stroke();
        //ctx.clearRect(0, 0, canvas.width, canvas.height);
    }
}

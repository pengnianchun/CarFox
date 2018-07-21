import QtQuick 2.0
import QtQuick.Layouts 1.1
import "JS/QChart.js" as Charts

Item {
    width: 800
    height: 410

    QChart {
        id: chart1
        width: 700
        height: 150

        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        chartAnimated: true;
        chartAnimationEasing: Easing.OutBounce;
        chartAnimationDuration: 2000;
        chartType: Charts.ChartType.LINE;
        Component.onCompleted: {
            chartData = {
                labels: ["January","February","March","April","May","June","July"],
                datasets: [{
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#ffffff",
                        data: [65,59,90,81,56,55,40]
                    }, {
                        fillColor: "rgba(151,187,205,0.5)",
                        strokeColor: "rgba(151,187,205,1)",
                        pointColor: "rgba(151,187,205,1)",
                        pointStrokeColor: "#ffffff",
                        data: [28,48,40,19,96,27,100]
                    }]
            };
        }
    }

    QChart {
        id: chart2
        width: 400
        height: 160

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 10
        chartAnimated: true;
        chartAnimationEasing: Easing.OutBounce;
        chartAnimationDuration: 2000;
        chartType: Charts.ChartType.LINE;
        Component.onCompleted: {
            chartData = {
                labels: ["January","February","March","April","May","June","July"],
                datasets: [{
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        data: [65,59,90,81,56,55,40]
                    }, {
                        fillColor: "rgba(151,187,205,0.5)",
                        strokeColor: "rgba(151,187,205,1)",
                        data: [28,48,40,19,96,27,100]
                    }]
            };
        }
    }

    Text {
        id: text1
        x: 449
        y: 210
        text: qsTr("2018年呈现")
        font.pixelSize: 12
    }
}

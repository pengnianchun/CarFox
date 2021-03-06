import QtQuick 2.0
import QtQuick.Layouts 1.1
import "qrc:/Component/Component"

MenuItem {
    width: 800
    height: 410

    Chart {
        id: chart1
        x: 30
        y: 21
        width: 578
        height: 186

        onPaint: {
            line({
                     labels : ["1","3","5","7","9","11","13","15","17","19","21","23","25","27","29","31"],
                     datasets : [
                         {
                             fillColor : "rgba(220,220,220,0.5)",
                             strokeColor : "rgba(220,220,220,1)",
                             pointColor : "rgba(220,220,220,1)",
                             pointStrokeColor : "#fff",
                             data : [65,59,90,81,56,55,40,65,59,90,81,56,55,40,65,59]
                         }
                     ]
                 });
        }
    }

    Chart {
        id: chart2
        x: 10
        y: 213
        width: 782
        height: 157

        onPaint: {
            line({
                     labels : ["January","February","March","April","May","June","July"],
                     datasets : [
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
        id: text1
        x: 615
        y: 21
        text: qsTr("2018年呈现")
        color: "white"
        font.pixelSize: 32
    }

    Text {
        id: text2
        x: 648
        y: 96
        text: qsTr("日百公里能耗")
        color: "white"
        font.pixelSize: 24
    }

    Image {
        x: 713
        y: 198
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
        rotation: 90
    }

    Text {
        id: text3
        x: 648
        y: 156
        color: "#ffffff"
        text: qsTr("月百公里能耗")
        font.pixelSize: 24
    }

    Image {
        x: 628
        y: 107
        source: "qrc:/theme2/symbol/Theme2/Modules/driveAnalysis/bullet_blue.png"
        rotation: 180
    }
}

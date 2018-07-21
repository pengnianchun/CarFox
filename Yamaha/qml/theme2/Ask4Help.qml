import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 800
    height: 410

    ColumnLayout {
        anchors.centerIn: parent
        RowLayout {
            Image {
                source: ""
            }
            Text {
                text: "位置信息"
                color: "white"
                font.pixelSize: 40
            }
            Text {
                text: "北纬31°23′3.68″ 东经121°25′29.42″"
                color: "white"
                font.pixelSize: 40
            }
        }
    }

}

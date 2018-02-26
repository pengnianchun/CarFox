import QtQuick 2.6
import QtQuick.Layouts 1.0

Item {
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string minusImage: sourceImageUrl + "HomePanel/minus.png"
    property real widthProgressView: 200
    property real heightProgressView: 20
    property real progressValue: 0;

    onProgressValueChanged: {
        listmodel.clear();
        for(var i=0;i<progressValue;i++){
            listmodel.append({"value":i+1});
        }
    }
    ListModel { id: listmodel }
    ListView {
        width: widthProgressView
        height: heightProgressView
        model: listmodel
        spacing: -38
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        delegate: Image { source: minusImage }
    }
}

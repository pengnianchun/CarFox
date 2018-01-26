import QtQuick 2.6
import QtQuick.Layouts 1.0

Item {
    property string sourceImageUrl: "qrc:/Theme2/Qml/Theme2/Image/"
    property string mpaNoneImage: sourceImageUrl + "HomePanel/mpaValueNone.png"
    property string mpaValueImage: sourceImageUrl + "HomePanel/mpaValue.png"
    property real widthMpaListView: 50
    property real heightMpaListView: 280
    property var mpaListModel;

    ListView {
        width: widthMpaListView;
        height: heightMpaListView
        model: mpaListModel
        spacing: -2
        verticalLayoutDirection: ListView.BottomToTop
        delegate: Image {
            opacity: 1.0
            source: mpa ? mpaValueImage : mpaNoneImage
        }
    }
}

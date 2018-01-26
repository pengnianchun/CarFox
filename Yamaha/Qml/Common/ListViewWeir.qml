import QtQuick 2.5
import QtQuick.Layouts 1.1

Item {
    property real widthListView: 300
    property real heightListView: 350
    property var listModel;
    property int listRadioType: 1;//2
    property real fontSizeList: 18
    property real unitWidthList: 30
    property real textWidthList: 300

    ListView {
        width: widthListView;
        height: heightListView
        model: listModel
        spacing: 30
        verticalLayoutDirection: ListView.TopToBottom
        delegate: TextValueWeir {
            textTitle: name
            textValue: value
            unitValue: unit
            textWidth: textWidthList
            fontSize: fontSizeList
            unitWidth: unitWidthList
        }
    }
}

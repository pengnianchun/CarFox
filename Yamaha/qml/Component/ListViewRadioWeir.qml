import QtQuick 2.6
import QtQuick.Layouts 1.1

Item {
    property real widthListView: 300
    property real heightListView: 350
    property var listModel;
    property int listRadioType: 1;//2
    property real fontSizeList: 18
    property real unitWidthList: 30
    property real textWidthList: 300
    property real listViewSpacing: 30

    ListView {
        width: widthListView;
        height: heightListView
        model: listModel
        spacing: listViewSpacing
        verticalLayoutDirection: ListView.TopToBottom
        delegate: TextRadioWeir {
            radioType: listRadioType
            textTitle: name
            textValue: value
            unitValue: unit
            checkRadioStatus: checkstatus
            fontSize: fontSizeList
            textWidth: textWidthList
            unitWidth: unitWidthList
        }
    }
}

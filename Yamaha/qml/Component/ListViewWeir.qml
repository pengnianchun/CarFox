import QtQuick 2.6
import QtQuick.Layouts 1.1

Item {
    property real widthListView: 300
    property real heightListView: 350
    property var listModel;
    property int listRadioType: 1;//2
    property real fontSizeList: 18
    property string fontColorList: "#0088ff"
    property real unitWidthList: 30
    property real textWidthList: 300
    property string titleColorList: "#ffffff"
    property real listViewSpacing: 30

    ListView {
        width: widthListView;
        height: heightListView
        model: listModel
        spacing: listViewSpacing
        verticalLayoutDirection: ListView.TopToBottom
        delegate: TextValueWeir {
            textTitle: name
            textValue: value
            unitValue: unit
            textWidth: textWidthList
            fontSize: fontSizeList
            fontColor: fontColorList
            unitWidth: unitWidthList
            titleColor: titleColorList
        }
    }
}

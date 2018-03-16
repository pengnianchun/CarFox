import QtQuick 2.6

Row {
    property string value: ""
    property var imageSource: new Array[10]

    Repeater {
        model: value.length
        Image {
            source: value.length > index ? imageSource[value[index]] : ""
        }
    }
}

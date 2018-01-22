import QtQuick 2.5

Item {
    visible: false
    property bool isActive: false
    property bool depressed: false
    onIsActiveChanged: {
        if (isActive) {
            depressed = false;
        }
    }
}

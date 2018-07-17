import QtQuick 2.0

Item {
    property string src: ""

    Image {
        id: name
        source: src
        asynchronous: true
        cache: true
    }
}

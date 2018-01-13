import QtQuick 2.0

Item {
    id:lightDotIndex
    x: 500
    y: 80
    property int isWarning: 0
    property real value: -1

    Image {
        id: lightRing1
        x: 50-15
        y: 297-15
        visible: (CarStatus.speed >=0)
        source: (isWarning===0) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing2
        x: 17-15
        y: 183-15
        visible: (CarStatus.speed >=20)
        source: (isWarning===0) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing3
        x: 57-14
        y: 69-14
        visible: (CarStatus.speed >=40)
        source: (isWarning===0) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing4
        x: 156-14
        y: 0-13
        visible: (CarStatus.speed >=60)
        source: (isWarning===0) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing5
        x: 273-14
        y: 0-13
        visible: (CarStatus.speed >=80)
        source: (isWarning===0) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing6
        x: 371-11
        y: 71-17
        visible: (CarStatus.speed >=100)
        source: (isWarning===1) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing7
        x: 413-12
        y: 181-15
        visible: (CarStatus.speed >=120)
        source: (isWarning===1) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }

    Image {
        id: lightRing8
        x: 385-15
        y: 300-15
        visible: (CarStatus.speed >=140)
        source: (isWarning===1) ? "qrc:/images/theme2/images/themeTwo/DialPanel/lightBlue.png" : "qrc:/images/theme2/images/themeTwo/DialPanel/lightRed.png"
    }
}

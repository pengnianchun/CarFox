import QtQuick 2.0


Item {
    id: gridValue

    property real value: -1
    property real space: 4.6
    property int orignX: 0
    property int orignY: 0
    property string strNoneSource: "qrc:/images/theme2/images/themeTwo/HomePanel/mpaValueNone.png"
    property string strValueSource: "qrc:/images/theme2/images/themeTwo/HomePanel/mpaValue.png"

    Image {
        id: value1
        x:  orignX
        y:  orignY+0*(24+space)
        opacity: 1.0
    }

    Image {
        id: value2
        x:  orignX
        y:  orignY+1*(24+space)
        opacity: 1.0
    }

    Image {
        id: value3
        x:  orignX
        y:  orignY+2*(24+space)
        opacity: 1.0
    }

    Image {
        id: value4
        x:  orignX
        y:  orignY+3*(24+space)
        opacity: 1.0
    }

    Image {
        id: value5
        x:  orignX
        y:  orignY+4*(24+space)
        opacity: 1.0
    }

    Image {
        id: value6
        x:  orignX
        y:  orignY+5*(24+space)
        opacity: 1.0
    }

    Image {
        id: value7
        x:  orignX
        y:  orignY+6*(24+space)
        opacity: 1.0
    }

    Image {
        id: value8
        x:  orignX
        y:  orignY+7*(24+space)
        opacity: 1.0
    }

    Image {
        id: value9
        x:  orignX
        y:  orignY+8*(24+space)
        opacity: 1.0
    }

    Image {
        id: value10
        x:  orignX
        y:  orignY+9*(24+space)
        opacity: 1.0
    }

    onValueChanged: {
        value10.source = (value >= 0.1) ? strValueSource : strNoneSource
        value9.source  = (value >= 0.2) ? strValueSource : strNoneSource
        value8.source  = (value >= 0.3) ? strValueSource : strNoneSource
        value7.source  = (value >= 0.4) ? strValueSource : strNoneSource
        value6.source  = (value >= 0.5) ? strValueSource : strNoneSource
        value5.source  = (value >= 0.6) ? strValueSource : strNoneSource
        value4.source  = (value >= 0.7) ? strValueSource : strNoneSource
        value3.source  = (value >= 0.8) ? strValueSource : strNoneSource
        value2.source  = (value >= 0.9) ? strValueSource : strNoneSource
        value1.source  = (value >= 1.0) ? strValueSource : strNoneSource
    }

}

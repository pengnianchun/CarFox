/**********************************************
 *
 *  根菜单基类，每个主题必须有且仅有一个
 *
 *********************************************/
import QtQuick 2.6
import CustomEnum 1.0
import "qrc:/Common/Qml/Common"

CommonItem {
    visible: false
    property bool rootMenu: true
    property string level1: ""      // 一级菜单的ID

    states: [
        State {
            name: "hide"
        },
        State {
            name: "show"
        },
        State {
            name: "shutdown"
        }
    ]

}

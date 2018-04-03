import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

CommonItem {
    id: homeIndex
    width: 1440
    height: 544
    visible: false
    //升级提示窗口
    Rectangle { anchors.fill: parent; color: "#000000" }
    TextFieldWeir {
        id: title_popup
        x: 660
        y: 250
        textValue: "请手动重启设备，完成软件升级！"
        width: 550
        height: 50
        fontSize: 24
        fontColor: "red"
        fontBold: true
    }
    /*
    RowLayout {
        x: 660
        y: 340
        spacing: 100
        TextFieldWeir {
            id: submit
            textValue: "确认"
            width: 550
            height: 50
            fontSize: 24
            fontColor: "red"
            fontBold: true
        }
        TextFieldWeir {
            id: cancel
            textValue: "取消"
            width: 550
            height: 50
            fontSize: 24
            fontColor: "red"
            fontBold: true
        }
    }
    */
}

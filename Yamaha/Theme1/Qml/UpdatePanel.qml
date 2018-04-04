import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "../JS/MenuMainController.js" as MenuMainController
import "qrc:/Common/Component"

CommonItem {
    id: homeIndex
    width: 1440
    height: 544
    property int updateInfo: 0;
    visible: false
    //升级提示窗口
    Rectangle { anchors.fill: parent; color: "#000000" }
    onUpdateInfoChanged: {
        if(updateInfo === 1){
            title_popup.textValue = "U盘挂在成功，正在进行软件升级..."
            CarMsg.sendUpgradeStart();
        }else if(updateInfo === 5){
            title_popup.textValue = "U盘挂在失败，请重新插入U盘..."
        }else if(updateInfo === 2){
            title_popup.textValue = "请手动重启设备，完成软件升级！"
        }else{}
        updateInfo = 0;
    }
    TextFieldWeir {
        id: title_popup
        x: 660
        y: 250
        textValue: ""
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

import QtQuick 2.6
import QtQuick.Layouts 1.1
import CustomEnum 1.0
import "qrc:/Common/Component"
import "../../JS/MenuMainDetailController.js" as MenuMainDetailController

MenuItem {
    x: 360
    y: 130
    width: 750
    height: 350

    menuLayerId: "AuxiliarySystem"
    parentMenuId: "MenuMainDetail"

    enterMenu: function() {
        //default
    }
    hideMenu: function() {
        //调用关闭三层菜单通用函数
        MenuMainDetailController.returnMenuPanel(menuLayerId,parentMenuId);
    }
    previousMenu: function() {
        // default
    }
    nextMenu: function() {
        // default
    }

    //辅助系统信息
    property double oilPumpDcacWoutputCurrent: CarMsg.oilPumpDcacWoutputCurrent //油泵DC/AC W相输出电流
    property double oilPumpDcacVoutputCurrent: CarMsg.oilPumpDcacVoutputCurrent //油泵DC/AC V相输出电流
    property double oilPumpDcacUoutputCurrent: CarMsg.oilPumpDcacUoutputCurrent //油泵DC/AC U相输出电流
    property int radiatorTemperature: CarMsg.radiatorTemperature //散热器温度
    property int faultCode: CarMsg.faultCode //故障代码

    onOilPumpDcacWoutputCurrentChanged: { //油泵DC/AC W相输出电流
        listmodelone.setProperty(0, "value", oilPumpDcacWoutputCurrent);
    }
    onOilPumpDcacVoutputCurrentChanged: { //油泵DC/AC V相输出电流
        listmodelone.setProperty(1, "value", oilPumpDcacVoutputCurrent);
    }
    onOilPumpDcacUoutputCurrentChanged: { //油泵DC/AC U相输出电流
        listmodelone.setProperty(2, "value", oilPumpDcacUoutputCurrent);
    }
    onRadiatorTemperatureChanged: { //散热器温度
        listmodelone.setProperty(3, "value", radiatorTemperature);
    }
    onFaultCodeChanged: { //故障代码
        listmodelone.setProperty(4, "value", faultCode);
    }

    ListModel {
        id: listmodelone
        ListElement { name: "油泵DC/AC W相输出电流"; value: "0"; unit: "A" }
        ListElement { name: "油泵DC/AC V相输出电流"; value: "0"; unit: "A" }
        ListElement { name: "油泵DC/AC U相输出电流"; value: "0"; unit: "A" }
        ListElement { name: "散热器温度"; value: "0"; unit: "℃" }
        ListElement { name: "故障代码"; value: "0"; unit: "" }
    }

    ListViewWeir {
        listModel: listmodelone
        width: parent.width
        height: parent.height
        textWidthList: 500
        fontSizeList: 15
    }
}

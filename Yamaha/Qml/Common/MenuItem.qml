import QtQuick 2.6
import CustomEnum 1.0
import "qrc:/Common/Qml/Common"


CommonItem {
    id: menu
    property int stayTime: 10000    //超时时间，ms
    property string menuLayerId: ""     // 本层菜单的ID，由用户指定
    property string parentMenuId: ""    // 父菜单层的ID，由用户指定
    property bool defaultAction : true;   // =true时运行默认的动作，否则只运行用户自定义动作
    property bool idle: false           // =true时，不响应按键

    property alias menuTimer : stayTimer

    /* 用户层实现的属性，类似虚函数 */

    // 按下Back键时调用
    property var hideMenu: function() {
    }

    // 按下Down键时调用
    property var nextMenu: function() {
    }

    // 按下Up键时调用
    property var previousMenu: function() {

    }

    // 按下Enter键时调用
    property var enterMenu: function() {
        //console.log("enterMenu", menuLayerId);
    }

    // 超时退出
    property var timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer(menuLayerId);
        if (parentMenuId != "") UiController.hideLayer(parentMenuId);
        UiController.hideRootMenu();
        // 显示Stack view中优先级最大的图层
        UiController.showStackViewTop();
    }

    visible: false

    onVisibleChanged: {
        //console.log("MenuItem:onVisibleChanged", visible);
        visible ? stayTimer.start() : stayTimer.stop();
    }

    Timer {
        id: stayTimer
        interval: parent.stayTime
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            menu.timeoutMenu();
        }
    }

    // 默认的事件处理
    Connections {
        target: visible ? CarStatus : null

        onIgOnChanged:
        {
            onShutdown();
        }

        onKeyShortPressed: {
            //console.log("MenuItem Key: " + key);
            if (idle) return;   // idle=true时，即使菜单可见，也不会响应按键
            /******************************************************************

                快速按下enter/back键时，仍然会出现visible=false时响应了signal的情形
                这里用了个不好的方法来杜绝此情形

             *****************************************************************/
            if (!visible) return;

            switch (key) {
            case CustomEnum.KEY_ENTER:
                if (visible) stayTimer.restart();
                else stayTimer.stop();

                menu.enterMenu();
                if (defaultAction)
                    UiController.hideLayer(menuLayerId); // 必须在最后隐藏自己， 否则会收不到CarStatus的信号
                break;
            case CustomEnum.KEY_BACK: // BACK键
                if (visible) stayTimer.restart();
                else stayTimer.stop();

                menu.hideMenu();
                if (defaultAction)
                {
                    if (menuLayerId != "") UiController.hideLayer(menuLayerId);   // 隐藏本层菜单
                    if (parentMenuId != "") UiController.showLayer(parentMenuId);   // 显示父菜单
                    //console.log("Auto hide menu layer:", menuLayerId, ",show menu layer:", parentMenuId);
                }
                break;
            case CustomEnum.KEY_UP:
                stayTimer.restart();
                menu.previousMenu();
                break;
            case CustomEnum.KEY_DOWN:
                stayTimer.restart();
                menu.nextMenu();
                break;
            default:
                break;
            }
        }
    }
}


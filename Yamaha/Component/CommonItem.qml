import QtQuick 2.6
import CustomEnum 1.0
import QtQuick.Layouts 1.1

Item {
    visible: false
    property string me: "" // C++空间的ID, Fusion会自动赋值。QML中的代码可以直接引用此ID

    property var onKey: function(key) {
        //console.log("onKey", key, "Layer", me);
    }

    property var onKeyEnter: function() {
    }

    property var onKeyBack: function() {
    }

    property var onKeyUp: function() {
    }

    property var onKeyDown: function() {
    }
    // IGN OFF时调用，默认是直接隐藏本图层
    // 用户可以自行重载此函数
    property var onShutdown: function() {
        console.log("CommonItem onShutdown", me);
        //UiController.hideLayer(me);
    }

    Connections {
        target: visible ? CarMsg : null
        ignoreUnknownSignals: true
        // IGN OFF
        onCarModeChanged: {
            if (CarMsg.carMode === CustomEnum.IgOffMode) onShutdown();
        }

        // 按键
        onKeyShortPressed: {
            console.log("CommonItem Key", key, ", Layer:", me);
            onKey(key);
            switch (key)
            {
                case CustomEnum.EnterKey:
                    onKeyEnter();
                break;
                case CustomEnum.BackKey:
                    onKeyBack();
                break;
                case CustomEnum.PrevKey:
                    onKeyUp();
                break;
                case CustomEnum.NextKey:
                    onKeyDown();
                break;
            }
        }
        onKeyLongPressed: {
            console.log("long press trip miles clear !");
            CarMsg.sendTripMilesClear();
        }
    }
}

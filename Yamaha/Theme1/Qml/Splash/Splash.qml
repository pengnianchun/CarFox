import QtQuick 2.6
import CustomEnum 1.0

Item {
    width: 1440
    height: 544
    visible: false

    onVisibleChanged: {
        if(visible){
            startSplash.running = true;
        }else{
            startSplash.running = false;
        }
    }

    SequentialAnimation {
        id: startSplash
        ScriptAction {
            script: {
                UiController.hideLayer("Splash");
                UiController.showLayer("HomePanel");
            }
        }
    }

    Rectangle {
        id: splashId
        anchors.fill: parent
        color: "black"
    }
}

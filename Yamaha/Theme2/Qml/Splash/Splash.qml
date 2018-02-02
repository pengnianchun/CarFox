import QtQuick 2.6
import CustomEnum 1.0

Item {
    width: 1440
    height: 544
    visible: false
    property string animationUrl: "qrc:/Theme/Theme2/Image/Gif/wingsMotion.gif";

    onVisibleChanged: {
        if(visible){
            animated.playing = true;
        }else{
            animated.playing = false;
        }
    }
    AnimatedImage {
        id: animated
        source: animationUrl
        anchors.centerIn: parent
        playing: false
        onCurrentFrameChanged: {
            info.text = "%1/%2".arg(animated.currentFrame).arg(animated.frameCount).toString();
            if(animated.currentFrame === 99){
                animated.playing = false;
                UiController.hideLayer("Splash");
                UiController.showLayer("HomePanel");
                UiController.showLayer("MenuPanel");
            }else{}
        }
    }
    Rectangle {
        width: 120;
        height: 30;
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        Text {
            id: info
            anchors.centerIn: parent
            text: (animated.paused === true) ? "Play" : "Pause";
        }
        MouseArea {
            anchors.fill: parent
            onClicked: animated.paused = !animated.paused;
        }
    }
}

import QtQuick 2.6
import CustomEnum 1.0
import "qrc:/Common/Component"

Item {
    width: 1440
    height: 544
    visible: false

    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/"
    property string animationUrl: sourceImageUrl + "Gif/wingsMotion.gif"
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png"
    property real durationTime: 1500

    onVisibleChanged: {
        if (visible) {
            gmlGifImage.playing = true
            boot_animation.running = true;
        } else {
            gmlGifImage.playing = false
            boot_animation.running = false;
        }
    }

    QmlGifImage {
        id: gmlGifImage
        gifSource: animationUrl
        playing: false
        anchors.fill: parent
        onFinished: {
            gmlGifImage.visible = false;
            UiController.hideLayer("Splash");
        }
    }

    Image {
        x: 435
        y: 25
        scale: 0.1
        opacity: 0
        source: centerLightImage

        SequentialAnimation {
            id: boot_animation

            PauseAnimation { duration: durationTime }

            ScriptAction {
                script: {
                    // 等待开机Gif完成后关闭Splash层
                    // UiController.hideLayer("Splash");
                    UiController.showLayer("HomePanel");
                    UiController.showLayer("MenuPanel");
                    UiController.setLayerProperty("MenuPanel", "animationAction", 3);
                    // Demo Run
                    // UiController.showLayer("AutomaticRoutine");
                }
            }
        }
    }
}

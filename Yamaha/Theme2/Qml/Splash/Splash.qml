import QtQuick 2.6
import CustomEnum 1.0

Item {
    width: 1440
    height: 544
    visible: false
    property string animationUrl: "qrc:/Theme/Theme2/Image/Gif/wingsMotion.gif";
    property string sourceImageUrl: "qrc:/Theme/Theme2/Image/";
    property string centerLightImage: sourceImageUrl + "DialPanel/centerLight.png";
    property bool animationStatus: true;
    property real durationTime: 1000

    onVisibleChanged: {
        if(visible){
            boot_animation.running = true;
        }else{
            boot_animation.running = false;
        }
    }
    Image {
        id: center_light
        x: 435
        y: 25
        scale: 0.1
        opacity: 0
        source: centerLightImage
        SequentialAnimation {
            id: boot_animation
            PauseAnimation { duration: durationTime/2 }
            /*
            ParallelAnimation {
                NumberAnimation {
                    target: center_light
                    property: "scale";
                    to: 1.15;
                    duration: 200
                }
                NumberAnimation {
                    target: center_light
                    property: "opacity";
                    to: 1;
                    duration: 200
                }
            }
            PauseAnimation {
                duration: durationTime/20
            }
            NumberAnimation {
                target: center_light
                property: "scale";
                to: 1;
                duration: 200
            }
            */
            ScriptAction {
                script: {
                    UiController.hideLayer("Splash");
                    UiController.showLayer("HomePanel");
                    UiController.showLayer("MenuPanel");
                    UiController.setLayerProperty("MenuPanel","animationAction",3);
                }
            }
        }
    }
}

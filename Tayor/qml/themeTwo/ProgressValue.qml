import QtQuick 2.0

Item {
    id: progressValue

    property real value: -1
    property real length: 128
    property real maxValue: 100

    onValueChanged: {
        if((value>=0)&&(value<=maxValue)) {
            progressStep.width = value*(length/maxValue)
        }
    }

    SequentialAnimation{
        id:progressAnimation
        loops: Animation.Infinite
        running: false
        NumberAnimation {
            target: progressValue
            property: "value"
            duration: 5000
            from: 0
            to: 100
        }

        PauseAnimation {
            duration: 200
        }

        NumberAnimation {
            target: progressValue
            property: "value"
            duration: 5000
            from: 100
            to: 0
        }

        PauseAnimation {
            duration: 200
        }
    }

    Rectangle{
        id: stageRect
        width: length
        height: 13
        radius: 5
        color: "transparent"
        //border.color: "white"

        Rectangle{
            id: progressStep
            width:  0
            height: stageRect.height
            //color: "#FF7212"
            radius: 5
            gradient: Gradient{
                //GradientStop { position: 0.0; color: "lightsteelblue" }
                //GradientStop { position: 1.0; color: "blue" }
                GradientStop { position: 0.0; color: "#00D1FF" }
                GradientStop { position: 1.0; color: "#00617F" }
            }
        }
    }
}

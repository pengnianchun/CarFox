import QtQuick 2.0

Item {
    id: root_item;
    z: 0
    width: 1440
    height: 540

    Image {
        id: background;
        x: 0;
        y: 0;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/background.png";
    }
    Image {
        id: pointer;
        x: 120;
        y: 100;
        visible: true;
        source: "qrc:/theme1/slice/Theme1/Slice/Pointer.png";
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        onClicked: pathAnim.start()
    }

    PathAnimation {
      id: pathAnim
      target: pointer
      duration: 6000
      anchorPoint: "20, 20"
      orientationEntryDuration: 200
      orientationExitDuration: 200
      easing.type: Easing.InOutCubic

      path: Path {
          startX: 130;
          startY: 537;
          PathCurve { x: 130; y: 537 }
          PathCurve { x: 95;  y: 473 }
          PathCurve { x: 80;  y: 455 }
          PathCurve { x: 72;  y: 408 }
          PathCurve { x: 66;  y: 323 }
          PathCurve { x: 69;  y: 373 }
          PathCurve { x: 70;  y: 282 }
          PathCurve { x: 91;  y: 232 }
          PathCurve { x: 114; y: 196 }
          PathCurve { x: 166; y: 151 }
          PathCurve { x: 225; y: 124 }
          PathCurve { x: 282; y: 111 }
          PathCurve { x: 339; y: 104 }
          PathCurve {  }    //last element is empty with no end point specified
        }
    }
}

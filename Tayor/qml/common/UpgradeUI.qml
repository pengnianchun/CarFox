import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
     id: upgradeUIPage
      width: 1440
      height: 540
      opacity: 0.0

      property string tipMessage: CarStatus.upgradeTips
      property int progressValue: CarStatus.progressValue

      onProgressValueChanged: {
          if((progressValue>=0)&&(progressValue<=100)) {
              progressMove.x = upgradeUIPage.progressValue*10
              progressStep.width = upgradeUIPage.progressValue*10
          }
          if(progressValue===100) {
              indicatorWaitting.running = false
              indicatorWaitting.visible = false
              success.opacity = 1.0
          }
      }

      onTipMessageChanged: {
          tips.text = tipMessage
          if(isContains(tipMessage, "完成")) {
             indicatorWaitting.running = false
              indicatorWaitting.visible = false
              success.opacity = 1.0
          }
      }

      SequentialAnimation{
          id:progressAnimation
          loops: Animation.Infinite
          running: false
          NumberAnimation {
              target: progressStep
              property: "width"
              duration: 10000
              from: 0
              to: 1000
          }

          PauseAnimation {
              duration: 200
          }
      }

      Rectangle {
          id: background
          anchors.fill: parent
          color: "black"
      }

      RectangularGlow {
          id: effect
          anchors.fill: rect
          glowRadius: 10
          spread: 0.2
          color: "white"
          cornerRadius: rect.radius + glowRadius
      }

      Rectangle {
          id: rect
          color: "black"
          anchors.centerIn: parent
          width: Math.round(parent.width / 1.5)
          height: Math.round(parent.height / 2)
          radius: 25
      }

      BusyIndicator {
          id:indicatorWaitting
          running: true
          x: 700
          y: 180
      }

      Image {
          id: success
          anchors.horizontalCenter: upgradeUIPage.horizontalCenter
          y: 148
          source: "qrc:/images/common/images/common/Other/success.png"
          opacity: 0.0
      }

      Text {
          id: tips
          anchors.fill: parent
          font.family:FontName.fontCurrentFzLt
          font.pixelSize: 38
          text: "正在升级中,请耐心等待..." //qsTr("%1").arg(tipMessage)  //qsTr("Downloading ... No operate when Upgrade")
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          color: "white"

          onTextChanged: {
              if(isContains(tipMessage, "完成")) {
                 indicatorWaitting.running = false
                  indicatorWaitting.visible = false
                  success.opacity = 1.0
              }
          }
      }

      Rectangle{
          id: stageRect
          x:220
          y:460
          width: 1000
          height: 20
          radius: 5
          color: "transparent"
          border.color: "white"

          Rectangle{
              id: progressStep
              width:  0
              height: 20
              color: "#FF7212"
              radius: 5
          }
      }

      Rectangle{
          id: rectDisplay
          x:270
          y:320
          width: 900
          height: 50
          color: "transparent"
          visible: false

          Text {
              id: tipDisplay
              anchors.fill: parent
              font.family:FontName.fontCurrentFzLt
              font.pixelSize: 38
              text: qsTr("%1").arg(tipMessage)
              horizontalAlignment: Text.AlignHCenter
              color: "blue"
              visible: false
          }
      }

      Item {
          id: progressMove
          opacity: 1.0
          Image {
              id: ring
              x: 218
              y: 448
              source: "qrc:/images/common/images/common/Other/progress_arrow.png"
          }
          Text {
              id: dispTextProgress
              x: 218
              y: 428
              width: 10
              text: qsTr("%1%").arg(upgradeUIPage.progressValue.toFixed(0))
              font.family:FontName.fontCurrentFzLt
              font.pointSize: 10
              color: "white"
              horizontalAlignment: Text.Center
          }
      }

      states: [
          State {
              name: ""
              PropertyChanges { target: upgradeUIPage; opacity:0.0 }
          },
          State {
              name: "show"
              PropertyChanges { target: upgradeUIPage; opacity:1.0 }
          }
      ]

      transitions: [
          Transition {
              from: ""
              to: "show"
              SequentialAnimation{
                  NumberAnimation {target: upgradeUIPage;property: "opacity";duration: 500;}
              }
          },
          Transition {
              from: "show"
              to: ""
              SequentialAnimation{
                  NumberAnimation {target: upgradeUIPage;property: "opacity";duration: 500;}
              }
          }
      ]

      function isContains(str, substr) {
          return str.indexOf(substr) >= 0;
      }

      Component.onCompleted: {
          //upgradeUIPage.progressValue = 100
          //upgradeUIPage.tipMessage = "正在升级中,请耐心等待..."
      }
  }

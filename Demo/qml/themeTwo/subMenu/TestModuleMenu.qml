import QtQuick 2.0

Item {
    id: testModuleMenu
    opacity: 0.0

    property real verticalSpace: 40

   Rectangle {
       id: menuBgFog
       anchors.fill: parent
       color: "black"
       opacity: 0.7
       visible: false
   }

   Rectangle {
       id: centerImageRect
       x: 720 //350
       y: 24
       width: 0 //750
       height: 506
       color: "transparent"
       clip: true
       Image {
           id: centerImageBg
           x: -370
           width: 750
           source: "qrc:/images/theme2/images/themeTwo/SubMenu/centerBlockBg.png"
       }
   }

   Image {
       id: ringBg1
       x: 280//-86
       y: -27
       source: "qrc:/images/theme2/images/themeTwo/SubMenu/swingsLeft.png"
   }
   Image {
       id: ringBg2
       x: 558//936
       y: -27
       source: "qrc:/images/theme2/images/themeTwo/SubMenu/swingsRight.png"
   }

   Rectangle {
       id: displayBox
       x: 330
       y: 108
       width:  745
       height: 0
       color: "MidnightBlue"
       radius: 10
       opacity: 0.2

       Rectangle {
           id: line1
           x: 24
           y: 50
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line2
           x: 24
           y: line1.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line3
           x: 24
           y: line2.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line4
           x: 24
           y: line3.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line5
           x: 24
           y: line4.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line6
           x: 24
           y: line5.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line7
           x: 24
           y: line6.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }

       Rectangle {
           id: line8
           x: 24
           y: line7.y + testModuleMenu.verticalSpace
           width:  displayBox.width
           height: 1
           color: "white"
           radius: 10
           opacity: 1.0
       }
   }

    Item {
        id: detailContent
        x: -5
        y: -42
        opacity: 0.0

        property int  pageIndex: 0

        Text{
            id: titleDisplay
            x: 636
            y: 164
            width: 180
            text: qsTr("仪表信息")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "#4e75ac"
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            id: canCommunicateDisplay
            x: 438
            y: 451
            width: 180
            visible: false
            text: qsTr("当前CAN通信状态 ")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 18
            color: "gray"
            style: Text.Raised;
            styleColor: "black"
            horizontalAlignment: Text.AlignLeft
        }

        Text{
            id: canCommunicateState
            x: 610
            y: 450
            width: 180
            visible: false
            text: qsTr("离线") //正常  //故障
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 21
            color: "white"
            horizontalAlignment: Text.AlignLeft
        }

        Text{
            id: pageIndexDisplay
            x: 570
            y: 508
            width: 180
            text: qsTr("/13")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 24
            color: "white"
            horizontalAlignment: Text.AlignRight
        }

        Text{
            id: pageIndexD
            x: pageIndexDisplay.x + 44
            y: 508
            width: 100
            text: qsTr("1")
            font.family:FontName.fontCurrentFzLt
            font.pixelSize: 24
            color: "#00D1FF"
            horizontalAlignment: Text.AlignRight
        }

        onPageIndexChanged: {
            if(( pageIndex >= 1) && ( pageIndex <= 4)) {
                titleDisplay.text = qsTr("仪表信息")
            } else if(( pageIndex >= 5) && (pageIndex <= 7)) {
                titleDisplay.text = qsTr("前模块信息")
            } else if(( pageIndex >= 8) && (pageIndex <= 10)) {
                titleDisplay.text = qsTr("顶模块信息")
            } else if(( pageIndex >= 11) && (pageIndex <= 13)) {
                titleDisplay.text = qsTr("后模块信息")
            } else {
                titleDisplay.text = qsTr("")
            }
            //pageIndexDisplay.text = qsTr("第 %1/13 页").arg(pageIndex.toFixed(0))
            pageIndexD.text = qsTr("%1").arg(pageIndex.toFixed(0))
        }

        Rectangle {
            id: bat1

            Item {
                Row{
                    x: 368
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_01 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("左转向开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 368
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_02 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_03 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_04 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("钥匙ST开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 368
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_05 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("右转向开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 408
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_06 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("小灯开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_07 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("远光灯开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_08 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("近光灯开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_09 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("前雾灯开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_10 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("后雾灯开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 368
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_11 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 408
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_12 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("广告灯开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
        }

        Rectangle {
            id: bat2

            Item {
                Row{
                    x: 368
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_13 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 368
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_14 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("雨刮低档开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_15 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("雨刮间歇档开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_16 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("雨刮高档开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 368
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_17 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 408
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_18 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_19 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("路牌开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_20 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("前门开开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_21 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("雨刮喷水开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_22 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 368
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_23 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 678
                    y: 408
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_24 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
        }

        Rectangle {
            id: bat3

            Item {
                Row{
                    x: 368
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_25 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 368
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_26 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("中门关开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_27 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("中门开开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_28 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("前门关开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 368
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_29 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("燃油量过低报警")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
            Item {
                Row{
                    x: 368
                    y: 408
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_30 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_31 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_32 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_33 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("危险警报开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_34 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("电源唤醒开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 368
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_35 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("钥匙ON开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 678
                    y: 408
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
        }

        Rectangle {
            id: bat4
            Item {
                Row{
                    x: 368
                    y: 208
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("备用")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 368
                    y: 248
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_33 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("危险报警开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 368
                    y: 288
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_34 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("电源唤醒开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 368
                    y: 328
                    spacing: 2
                    Text{
                        width: 65
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Image {
                        y:-2
                        width: 28
                        height: width
                        opacity: 1.0
                        scale: 1.0
                        source: (CarStatus.input_ctrl_35 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                    }
                    Text{
                        text: qsTr("钥匙ON开关")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }

            Item {
                Row{
                    x: 344
                    y: 408
                    spacing: 2
                    Text{
                        width: 93
                        text: ""
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Text{
                        text: qsTr("版本号:　")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#4e75ac"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                    Text{
                        text: qsTr(CarStatus.versionStr)
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                    }
                }
            }
        }

        Rectangle {
            id: bat5

            Item {
                    id: leftIndex5

                    Item {
                        Row{
                            x: 420
                            y: 208
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.front_current01)
                            }
                            Text{
                                text: qsTr("雨刮快档电机")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 208
                            width: 15
                            text:  CarStatus.front_current01.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 208
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 248
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.front_current02)
                            }
                            Text{
                                text: qsTr("雨刮慢档电机")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 248
                            width: 15
                            text:  CarStatus.front_current02.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 248
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 288
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.front_current03)
                            }
                            Text{
                                text: qsTr("喷水电机")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 288
                            width: 15
                            text:  CarStatus.front_current03.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 288
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 328
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.front_current04)
                            }
                            Text{
                                text: qsTr("左前雾灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 328
                            width: 15
                            text:  CarStatus.front_current04.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 328
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 368
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.front_current05)
                            }
                            Text{
                                text: qsTr("倒车灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 368
                            width: 15
                            text:  CarStatus.front_current05.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 368
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 408
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.front_current06)
                            }
                            Text{
                                text: qsTr("右转向灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 408
                            width: 15
                            text:  CarStatus.front_current06.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 408
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }
                }

            Item {
                id: rightIndex5
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current07)
                        }
                        Text{
                            text: qsTr("左转向灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 208
                        width: 15
                        text: CarStatus.front_current07.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 208
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current08)
                        }
                        Text{
                            text: qsTr("液位显示电源")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 248
                        width: 15
                        text: CarStatus.front_current08.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 248
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current09)
                        }
                        Text{
                            text: qsTr("左远光灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 288
                        width: 15
                        text: CarStatus.front_current09.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 288
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current10)
                        }
                        Text{
                            text: qsTr("右前雾灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 328
                        width: 15
                        text: CarStatus.front_current10.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 328
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current11)
                        }
                        Text{
                            text: qsTr("右远光灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 368
                        width: 15
                        text: CarStatus.front_current11.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 368
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current12)
                        }
                        Text{
                            text: qsTr("行车记录仪电源")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 408
                        width: 15
                        text: CarStatus.front_current12.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 408
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }
        }

        Rectangle {
            id: bat6

            Item {
                id: leftIndex6

                Item {
                    Row{
                        x: 420
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current13)
                        }
                        Text{
                            text: qsTr("左近光灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 208
                        width: 15
                        text:  CarStatus.front_current13.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 208
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    Row{
                        x: 420
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current14)
                        }
                        Text{
                            text: qsTr("位置灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 248
                        width: 15
                        text:  CarStatus.front_current14.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 248
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    Row{
                        x: 420
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.front_current15)
                        }
                        Text{
                            text: qsTr("右近光灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 288
                        width: 15
                        text:  CarStatus.front_current15.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 288
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }

            Item {
                id: rightIndex6
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch16 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch17 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch18 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch19 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("左前摩擦片报警开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch20 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("右前摩擦片报警开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch21 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("制动灯开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bat7

            Item {
                id: leftIndex7

                Item {
                    Row{
                        x: 420
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch22 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch23 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch24 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch25 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch26 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch27 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }

            Item {
                id: rightIndex7
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch28 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("地址选择1")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch29 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("地址选择2")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch30 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.front_switch31 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("倒车灯开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bat8

            Item {
                    id: leftIndex8

                    Item {
                        Row{
                            x: 420
                            y: 208
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.middle_current01)
                            }
                            Text{
                                text: qsTr("广告灯箱")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 208
                            width: 15
                            text:  CarStatus.middle_current01.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 208
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 248
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.middle_current02)
                            }
                            Text{
                                text: qsTr("右转向灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 248
                            width: 15
                            text:  CarStatus.middle_current02.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 248
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 288
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.middle_current03)
                            }
                            Text{
                                text: qsTr("车内指示灯电源")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 288
                            width: 15
                            text:  CarStatus.middle_current03.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 288
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 328
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.middle_current04)
                            }
                            Text{
                                text: qsTr("制动灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 328
                            width: 15
                            text:  CarStatus.middle_current04.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 328
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 368
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.middle_current05)
                            }
                            Text{
                                text: qsTr("前门开门电磁阀")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 368
                            width: 15
                            text:  CarStatus.middle_current05.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 368
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 408
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.middle_current06)
                            }
                            Text{
                                text: qsTr("前路牌")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 408
                            width: 15
                            text:  CarStatus.middle_current06.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 408
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }
                }

            Item {
                id: rightIndex8
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current07)
                        }
                        Text{
                            text: qsTr("前门关门电磁阀")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 208
                        width: 15
                        text: CarStatus.middle_current07.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 208
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current08)
                        }
                        Text{
                            text: qsTr("侧路牌")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 248
                        width: 15
                        text: CarStatus.middle_current08.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 248
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current09)
                        }
                        Text{
                            text: qsTr("中门开门电磁阀")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 288
                        width: 15
                        text: CarStatus.middle_current09.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 288
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current10)
                        }
                        Text{
                            text: qsTr("后路牌")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 328
                        width: 15
                        text: CarStatus.middle_current10.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 328
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current11)
                        }
                        Text{
                            text: qsTr("中门关门电磁阀")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 368
                        width: 15
                        text: CarStatus.middle_current11.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 368
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current12)
                        }
                        Text{
                            text: qsTr("电子滚动屏")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 408
                        width: 15
                        text: CarStatus.middle_current12.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 408
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }
        }

        Rectangle {
            id: bat9

            Item {
                id: leftIndex9

                Item {
                    Row{
                        x: 420
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current13)
                        }
                        Text{
                            text: qsTr("小灯电源")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 208
                        width: 15
                        text:  CarStatus.middle_current13.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 208
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    Row{
                        x: 420
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current14)
                        }
                        Text{
                            text: qsTr("后广告屏")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 248
                        width: 15
                        text:  CarStatus.middle_current14.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 248
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    Row{
                        x: 420
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.middle_current15)
                        }
                        Text{
                            text: qsTr("左转向灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 288
                        width: 15
                        text:  CarStatus.middle_current15.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 288
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }

            Item {
                id: rightIndex9
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch16 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch17 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("门铃开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch18 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch19 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("应急阀开启报警")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch20 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch21 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bat10

            Item {
                id: leftIndex10

                Item {
                    Row{
                        x: 420
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch22 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch23 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch24 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch25 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch26 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch27 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }

            Item {
                id: rightIndex10
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch28 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("地址选择1")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch29 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("地址选择2")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch30 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("前门踏步灯开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.middle_switch31 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("中门踏步灯开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bat11

            Item {
                    id: leftIndex11

                    Item {
                        Row{
                            x: 420
                            y: 208
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.back_current01)
                            }
                            Text{
                                text: qsTr("制动灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 208
                            width: 15
                            text:  CarStatus.back_current01.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 208
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 248
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.back_current02)
                            }
                            Text{
                                text: qsTr("备用")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 248
                            width: 15
                            text:  CarStatus.back_current02.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 248
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 288
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.back_current03)
                            }
                            Text{
                                text: qsTr("后雾灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 288
                            width: 15
                            text:  CarStatus.back_current03.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 288
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 328
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.back_current04)
                            }
                            Text{
                                text: qsTr("备用")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 328
                            width: 15
                            text:  CarStatus.back_current04.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 328
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 368
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.back_current05)
                            }
                            Text{
                                text: qsTr("左转向灯")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 368
                            width: 15
                            text:  CarStatus.back_current05.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 368
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }

                    Item {
                        Row{
                            x: 420
                            y: 408
                            spacing: 2
                            Image {
                                y:-2
                                width: 28
                                height: width
                                opacity: 1.0
                                scale: 1.0
                                source: setOutputIcon(CarStatus.back_current06)
                            }
                            Text{
                                text: qsTr("备用")
                                font.family:FontName.fontCurrentFzLt
                                font.pixelSize: 21
                                color: "#4e75ac"
                                style: Text.Raised;
                                styleColor: "black"
                            }
                        }
                        Text{
                            x: 675
                            y: 408
                            width: 15
                            text:  CarStatus.back_current06.toFixed(1);
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "white"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignRight
                        }
                        Text{
                            x: 690
                            y: 408
                            width: 10
                            text: qsTr("A")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#808080"
                            style: Text.Raised;
                            styleColor: "black"
                            horizontalAlignment: Text.AlignLeft
                        }
                    }
                }

            Item {
                id: rightIndex11
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current07)
                        }
                        Text{
                            text: qsTr("右转向灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 208
                        width: 15
                        text: CarStatus.back_current07.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 208
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current08)
                        }
                        Text{
                            text: qsTr("干燥器电源")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 248
                        width: 15
                        text: CarStatus.back_current08.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 248
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current09)
                        }
                        Text{
                            text: qsTr("倒车灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 288
                        width: 15
                        text: CarStatus.back_current09.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 288
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current10)
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 328
                        width: 15
                        text: CarStatus.back_current10.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 328
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current11)
                        }
                        Text{
                            text: qsTr("前门踏步灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 368
                        width: 15
                        text: CarStatus.back_current11.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 368
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current12)
                        }
                        Text{
                            text: qsTr("位置灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 990
                        y: 408
                        width: 15
                        text: CarStatus.back_current12.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 1005
                        y: 408
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }
        }

        Rectangle {
            id: bat12

            Item {
                id: leftIndex12

                Item {
                    Row{
                        x: 420
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current13)
                        }
                        Text{
                            text: qsTr("中门踏步灯")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 208
                        width: 15
                        text:  CarStatus.back_current13.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 208
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    Row{
                        x: 420
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current14)
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 248
                        width: 15
                        text: CarStatus.back_current14.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 248
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                Item {
                    Row{
                        x: 420
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: setOutputIcon(CarStatus.back_current15)
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                    Text{
                        x: 675
                        y: 288
                        width: 15
                        text:  CarStatus.back_current15.toFixed(1);
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "white"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignRight
                    }
                    Text{
                        x: 690
                        y: 288
                        width: 10
                        text: qsTr("A")
                        font.family:FontName.fontCurrentFzLt
                        font.pixelSize: 21
                        color: "#808080"
                        style: Text.Raised;
                        styleColor: "black"
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }

            Item {
                id: rightIndex12
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch16 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("水位传感器开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch17 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch18 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch19 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch20 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("空滤阻塞报警开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch21 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("制动灯开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bat13

            Item {
                id: leftIndex13

                Item {
                    Row{
                        x: 420
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch22 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch23 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("驻车制动开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch24 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("水温报警开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch25 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("低气压1报警开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 368
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch26 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 420
                        y: 408
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch27 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("低气压2报警开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }

            Item {
                id: rightIndex13
                Item {
                    Row{
                        x: 740
                        y: 208
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch28 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("地址开关1")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 248
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch29 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("地址开关2")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 288
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch30 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("后舱门开关")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
                Item {
                    Row{
                        x: 740
                        y: 328
                        spacing: 2
                        Image {
                            y:-2
                            width: 28
                            height: width
                            opacity: 1.0
                            scale: 1.0
                            source: (CarStatus.back_switch31 === 1) ? "qrc:/images/common/images/common/Other/ring-green.png" : "qrc:/images/common/images/common/Other/ring-blank.png"
                        }
                        Text{
                            text: qsTr("备用")
                            font.family:FontName.fontCurrentFzLt
                            font.pixelSize: 21
                            color: "#4e75ac"
                            style: Text.Raised;
                            styleColor: "black"
                        }
                    }
                }
            }
        }
    }

    function setOutputIcon(currentValue) {
        currentValue = parseFloat(currentValue);
        if(currentValue >= 12.0) {
            return "qrc:/images/common/images/common/Other/ring-red.png";
        }
        if(currentValue >= 0.3) {
            return "qrc:/images/common/images/common/Other/ring-green.png";
        }
        if(currentValue > 0.0) {
            return "qrc:/images/common/images/common/Other/ring-yellow.png";
        } else {
            return "qrc:/images/common/images/common/Other/ring-blank.png";
        }
    }

    Text {
        x: 570
        y: 75
        width: 300
        height: 45
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("仪表系统信息")
        font.family:FontName.fontCurrentFzLt
        font.pixelSize: 21
        color: "#00D1FF"
        style: Text.Raised;
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: testModuleMenu; opacity: 0.0 }
            PropertyChanges { target: ringBg1; x: 280 }
            PropertyChanges { target: ringBg2; x: 558 }
            PropertyChanges { target: centerImageRect; x: 720 }
            PropertyChanges { target: centerImageRect; width: 0 }
            PropertyChanges { target: centerImageBg; x: -370 }
            PropertyChanges { target: menuBgFog; visible: false }
            PropertyChanges { target: detailContent; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
        },
        State {
            name: "show1"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 1}
        },
        State {
            name: "show2"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 2}
        },
        State {
            name: "show3"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 3}
        },
        State {
            name: "show4"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 4}
        },
        State {
            name: "show5"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 5}
        },
        State {
            name: "show6"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 6}
        },
        State {
            name: "show7"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 7}
        },
        State {
            name: "show8"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 8}
        },
        State {
            name: "show9"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 9}
        },
        State {
            name: "show10"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 10}
        },
        State {
            name: "show11"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 11}
        },
        State {
            name: "show12"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 1.0; visible: true}
            PropertyChanges { target: bat13;  opacity: 0.0; visible: false}
            PropertyChanges { target: detailContent;  pageIndex: 12}
        },
        State {
            name: "show13"
            PropertyChanges { target: testModuleMenu; opacity: 1.0 }
            PropertyChanges { target: ringBg1; x: -86 }
            PropertyChanges { target: ringBg2; x: 936 }
            PropertyChanges { target: centerImageRect; x: 350 }
            PropertyChanges { target: centerImageRect; width: 750 }
            PropertyChanges { target: centerImageBg; x: 0 }
            PropertyChanges { target: menuBgFog; visible: true }
            PropertyChanges { target: detailContent; opacity: 1.0 }
            PropertyChanges { target: bat1;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat2;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat3;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat4;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat5;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat6;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat7;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat8;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat9;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat10;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat11;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat12;  opacity: 0.0; visible: false}
            PropertyChanges { target: bat13;  opacity: 1.0; visible: true}
            PropertyChanges { target: detailContent;  pageIndex: 13}
        }
    ]

    transitions: [
        Transition {
            from: ""
            to:   "show"
            ParallelAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: ringBg1
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: ringBg2
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "width"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageBg
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                }
                ParallelAnimation{
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 800}
                }
            }
        },
        Transition {
            from: ""
            to:   "show1"
            ParallelAnimation{
                ParallelAnimation{
                    NumberAnimation {
                        target: ringBg1
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: ringBg2
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageRect
                        properties: "width"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                    NumberAnimation {
                        target: centerImageBg
                        properties: "x"
                        duration: 800
                        easing.type: Easing.OutExpo
                    }
                }
                ParallelAnimation{
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 800}
                }
            }
        },
        Transition {
            from: ""
            to:   "*"
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: testModuleMenu; property: "opacity"; duration: 100;}
                    NumberAnimation {target: menuBgFog; property: "visible"; duration: 100;}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 100;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 100;}
                }
            }
        },
        Transition {
            from: "show"
            to:    ""
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation {target: testModuleMenu; property: "opacity"; duration: 100;}
                    NumberAnimation {target: menuBg; property: "visible"; duration: 100;}
                    NumberAnimation {target: detailContent; property: "opacity"; duration: 100;}
                }
            }
        }
    ]

}

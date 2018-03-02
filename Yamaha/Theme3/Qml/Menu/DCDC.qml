import QtQuick 2.6
import CustomEnum 1.0

import "./"
import "qrc:/Common/Component"

Item {
    id: root
    x:373
    y:80
    visible: false;

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string dcStateTitleImage:sourceImageUrl+"Image/MenuPanel/dc_title.png";

    Connections {
        // 链接CarMsg信号
        target: CarMsg
        onKeyShortPressed: {
            if(key === 1) //back键
            {
                if(root.visible == false)
                {
                    return;
                }
                UiController.hideLayer("DCDC");
                UiController.showLayer("MenuPanel");
            }
        }
    }

    Image {
        id: dcStateTitle
        x:274
        y:1
        width:359
        height:44
        source: "qrc:/Theme/Theme3/Image/MenuPanel/dc_title.png"
    }
    Text {
        id: dc_dydy
        x:126
        y:60
        width:122
        height:21
        text: qsTr("DCDC低压电压")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_dydy_value
        x:298
        y:60
        width:54
        height:20
        text: qsTr("26.9v")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color:"white"
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_wendu
        x:126
        y:89
        width:86
        height:16
        text: qsTr("DCDC温度")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_wendu_value
        x:298
        y:89
        width:54
        height:12
        text: qsTr("024℃")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: dc_qianya
        x:126
        y:115
        width:85
        height:16
        text: qsTr("DCDC欠压")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"    //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_qianya_value
        x:299
        y:111
        width:41
        height:20
        text: qsTr("正常")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_guore
        x:126
        y:139
        width:87
        height:21
        text: qsTr("DCDC过热")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"    //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_guore_value
        x:299
        y:137
        width:41
        height:20
        text: qsTr("正常")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: dc_state2
        x:126
        y:166
        width:101
        height:17
        text: qsTr("DCDC状态2")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_state2_value
        x:298
        y:162
        width:41
        height:20
        text: qsTr("工作")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_dydl
        x:411
        y:60
        width:122
        height:21
        text: qsTr("DCDC低压电流")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_dydl_value
        x:571
        y:60
        width:69
        height:20
        text: qsTr("004.1a")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color:"white"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: dc_workstate
        x:410
        y:89
        width:121
        height:16
        text: qsTr("DCDC工作状态")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"  //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_workstate_value
        x:571
        y:86
        width:76
        height:20
        text: qsTr("启动工作")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color:"white"
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_guoya
        x:409
        y:115
        width:85
        height:16
        text: qsTr("DCDC过压")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_guoya_value
        x:571
        y:111
        width:41
        height:20
        text: qsTr("正常")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color:"white"
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_duanlu
        x:409
        y:138
        width:87
        height:21
        text: qsTr("DCDC短路")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "#00ccff"   //rgba(0,92,189,255)
        horizontalAlignment: Text.AlignHCenter
    }
    Text {
        id: dc_duanlu_value
        x:571
        y:137
        width:41
        height:20
        text: qsTr("正常")
        font.family: "PingFang SC Regular"
        font.pixelSize: 17; font.weight: Font.Black
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }
}

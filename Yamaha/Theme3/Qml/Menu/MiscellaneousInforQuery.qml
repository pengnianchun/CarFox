import QtQuick 2.6
import CustomEnum 1.0

import "./"

Item{
    id:root
    anchors.fill: parent
    visible: false
    Image{
        id:miscellaneousInfor_Title
        x:304
        y:56
        width: 163
        height:44
        source:"qrc:/Theme/Theme3/Image/1st/Text/MiscellaneousInforQuery.png"
    }
    Text{
        id:speedrate_name
        x:301
        y:144
        width:46
        height:22
        text:"速比："
        font.family: "PingFang SC Regular"
        font.bold: true
        font.pixelSize: 23
        color:"white"
    }
    Text{
        id:speedrate_value
        x:401
        y:144
        width:46
        height:22
        text:"1500"
        font.family: "PingFang SC Regular"
        font.bold: true
        font.pixelSize: 23
        color:"white"
    }
    Text{
        id:buzzer_name
        x:266
        y:206
        width:46
        height:22
        text:"蜂鸣器："
        font.family: "PingFang SC Regular"
        font.bold: true
        font.pixelSize: 23
        color:"white"
    }
    Text{
        id:buzzer_value_start
        x:382
        y:206
        width:44
        height:22
        text:"开启"
        font.family: "PingFang SC Regular"
        font.bold: true
        font.pixelSize: 23
        color:"#06fd00"
    }
    Text{
        id:buzzer_value_sprit  //斜杠
        x:426
        y:206
        text:"/"
        font.family: "PingFang SC Regular"
        font.bold: true
        font.pixelSize: 23
        color:"white"
    }
    Text{
        id:buzzer_value_close //关闭
        x:440
        y:206
        text:"关闭"
        font.family: "PingFang SC Regular"
        font.bold: true
        font.pixelSize: 23
        color:"white"
    }
}

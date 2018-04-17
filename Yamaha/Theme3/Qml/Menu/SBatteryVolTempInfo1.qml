import QtQuick 2.6
import CustomEnum 1.0
import "./"
import QtQuick.Layouts 1.1
import "qrc:/Common/Component"
MenuItem {
    id: root
    x:382
    y:77
    visible: false;
    menuLayerId: "SBatteryVolTempInfo1"
    parentMenuId: "MenuPanel"

    property string sourceImageUrl:"qrc:/Theme/Theme3/";
    property string bettaryTempTitleImage:sourceImageUrl+"Image/MenuPanel/battery_temp_title.png";

    enterMenu: function(){}
    hideMenu: function(){
        UiController.hideLayer("SBatteryVolTempInfo1");
        UiController.showLayer("MenuPanel");
    }
    previousMenu: function(){
    }
    nextMenu: function(){
        UiController.hideLayer("SBatteryVolTempInfo1");
        UiController.showLayer("SBatteryVolTempInfo2");
    }
    timeoutMenu: function() {
        //console.log("MenuItem timeout", me);
        // 隐藏自己， 父菜单， 根菜单
        UiController.hideLayer("SBatteryVolTempInfo1");
        //UiController.showLayer("MenuPanel");
        UiController.showLayer("MainPanel");
        UiController.setLayerProperty("MainPanel", "externState", "MainView");
//        UiController.setLayerProperty("MainPanel","busPanelVisible",true);
    }

    Image {
        id: bettary_Temp_Title
        x:251
        y:3
        width:210
        height:44
        source: bettaryTempTitleImage
    }
    Row{
        x:34
        y:22
        spacing: 42
        Text{
            id:bettary_box1_name
            width:70
            height: 65
            text:"电池箱1"
            color:"#00ccff"
            font.pixelSize:16
            font.family: "PingFang SC Regular"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text{
            id:bettary_box1_v_name
            width:460
            height: 65
            text:"电压  (单位 V)"
            color: "#00ccff"   //"white"
            font.pixelSize:16
            font.family: "PingFang SC Regular"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Column{
        id:temp
        x:44
        y:254
        spacing:2
        Row{
            x:0
            y:0
            spacing: 42
            Text{
                id:bettary_box1_1_name
                width:60
                height: 17
                text:"电池箱1"
                color:"#00ccff"
                font.pixelSize:16
                font.family: "PingFang SC Regular"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Text{
                id:bettary_box1_Temp_name
                width:460
                height: 17
                text:"温度  (单位 ℃)"
                color:"#00ccff"   //"white"
                font.pixelSize:16
                font.family: "PingFang SC Regular"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        Column{
            x:0   //44
            y:0   //275
            spacing: 10

            SBatteryVolTempColumn {
                id: row7
                pID:"1~10";
            }
            SBatteryVolTempColumn {
                id: row8
                pID:"11~20";
            }
        }
    }


    Connections {
        target: visible ? CarMsg : null
        onBatVoltageChanged: {
            var departairPortlist = CarMsg.batVoltage;
            for(var i in departairPortlist)
            {
                var count = i;
                if(count === "1")
                    row1.pValue1 = departairPortlist[i]
                else if(count === "2")
                    row1.pValue2 = departairPortlist[i]
                else if(count === "3")
                    row1.pValue3 = departairPortlist[i]
                else if(count === "4")
                    row1.pValue4 = departairPortlist[i]
                else if(count === "5")
                    row1.pValue5 = departairPortlist[i]
                else if(count === "6")
                    row1.pValue6 = departairPortlist[i]
                else if(count === "7")
                    row1.pValue7 = departairPortlist[i]
                else if(count === "8")
                    row1.pValue8 = departairPortlist[i]
                else if(count === "9")
                    row1.pValue9 = departairPortlist[i]
                else if(count === "10")
                    row1.pValue10 = departairPortlist[i]
                else if(count === "11")
                    row2.pValue1 = departairPortlist[i]
                else if(count === "12")
                    row2.pValue2 = departairPortlist[i]
                else if(count === "13")
                    row2.pValue3 = departairPortlist[i]
                else if(count === "14")
                    row2.pValue4 = departairPortlist[i]
                else if(count === "15")
                    row2.pValue5 = departairPortlist[i]
                else if(count === "16")
                    row2.pValue6 = departairPortlist[i]
                else if(count === "17")
                    row2.pValue7 = departairPortlist[i]
                else if(count === "18")
                    row2.pValue8 = departairPortlist[i]
                else if(count === "19")
                    row2.pValue9 = departairPortlist[i]
                else if(count === "20")
                    row2.pValue10 = departairPortlist[i]
                else if(count === "21")
                    row3.pValue1 = departairPortlist[i]
                else if(count === "22")
                    row3.pValue2 = departairPortlist[i]
                else if(count === "23")
                    row3.pValue3 = departairPortlist[i]
                else if(count === "24")
                    row3.pValue4 = departairPortlist[i]
                else if(count === "25")
                    row3.pValue5 = departairPortlist[i]
                else if(count === "26")
                    row3.pValue6 = departairPortlist[i]
                else if(count === "27")
                    row3.pValue7 = departairPortlist[i]
                else if(count === "28")
                    row3.pValue8 = departairPortlist[i]
                else if(count === "29")
                    row3.pValue9 = departairPortlist[i]
                else if(count === "30")
                    row3.pValue10 = departairPortlist[i]
                else if(count === "31")
                    row4.pValue1 = departairPortlist[i]
                else if(count === "32")
                    row4.pValue2 = departairPortlist[i]
                else if(count === "33")
                    row4.pValue3 = departairPortlist[i]
                else if(count === "34")
                    row4.pValue4 = departairPortlist[i]
                else if(count === "35")
                    row4.pValue5 = departairPortlist[i]
                else if(count === "36")
                    row4.pValue6 = departairPortlist[i]
                else if(count === "37")
                    row4.pValue7 = departairPortlist[i]
                else if(count === "38")
                    row4.pValue8 = departairPortlist[i]
                else if(count === "39")
                    row4.pValue9 = departairPortlist[i]
                else if(count === "40")
                    row4.pValue10 = departairPortlist[i]
                else if(count === "41")
                    row5.pValue1 = departairPortlist[i]
                else if(count === "42")
                    row5.pValue2 = departairPortlist[i]
                else if(count === "43")
                    row5.pValue3 = departairPortlist[i]
                else if(count === "44")
                    row5.pValue4 = departairPortlist[i]
                else if(count === "45")
                    row5.pValue5 = departairPortlist[i]
                else if(count === "46")
                    row5.pValue6 = departairPortlist[i]
                else if(count === "47")
                    row5.pValue7 = departairPortlist[i]
                else if(count === "48")
                    row5.pValue8 = departairPortlist[i]
                else if(count === "49")
                    row5.pValue9 = departairPortlist[i]
                else if(count === "50")
                    row5.pValue10 = departairPortlist[i]
                else if(count === "51")
                    row6.pValue1 = departairPortlist[i]
                else if(count === "52")
                    row6.pValue2 = departairPortlist[i]
                else if(count === "53")
                    row6.pValue3 = departairPortlist[i]
                else if(count === "54")
                    row6.pValue4 = departairPortlist[i]
                else if(count === "55")
                    row6.pValue5 = departairPortlist[i]
                else if(count === "56")
                    row6.pValue6 = departairPortlist[i]
                else if(count === "57")
                    row6.pValue7 = departairPortlist[i]
                else if(count === "58")
                    row6.pValue8 = departairPortlist[i]
                else if(count === "59")
                    row6.pValue9 = departairPortlist[i]
                else if(count === "60")
                    row6.pValue10 = departairPortlist[i]
            }
        }
        onBatTempChanged: {
            var departairPortlist = CarMsg.batTemp;
            for(var i in departairPortlist)
            {
                var count = i;
                if(count === "1")
                    row7.pValue1 = departairPortlist[i]
                else if(count === "2")
                    row7.pValue2 = departairPortlist[i]
                else if(count === "3")
                    row7.pValue3 = departairPortlist[i]
                else if(count === "4")
                    row7.pValue4 = departairPortlist[i]
                else if(count === "5")
                    row7.pValue5 = departairPortlist[i]
                else if(count === "6")
                    row7.pValue6 = departairPortlist[i]
                else if(count === "7")
                    row7.pValue7 = departairPortlist[i]
                else if(count === "8")
                    row7.pValue8 = departairPortlist[i]
                else if(count === "9")
                    row7.pValue9 = departairPortlist[i]
                else if(count === "10")
                    row7.pValue10 = departairPortlist[i]
                else if(count === "11")
                    row7.pValue1 = departairPortlist[i]
                else if(count === "12")
                    row7.pValue2 = departairPortlist[i]
                else if(count === "13")
                    row7.pValue3 = departairPortlist[i]
                else if(count === "14")
                    row7.pValue4 = departairPortlist[i]
                else if(count === "15")
                    row7.pValue5 = departairPortlist[i]
                else if(count === "16")
                    row7.pValue6 = departairPortlist[i]
                else if(count === "17")
                    row7.pValue7 = departairPortlist[i]
                else if(count === "18")
                    row7.pValue8 = departairPortlist[i]
                else if(count === "19")
                    row7.pValue9 = departairPortlist[i]
                else if(count === "20")
                    row7.pValue10 = departairPortlist[i]
            }
        }
    }

    Column {
        x:44
        y:62

        spacing: 10

        SBatteryVolTempColumn {
            id: row1
            pID:"1~10";
        }
        SBatteryVolTempColumn {
            id: row2
            pID:"11~20";
        }
        SBatteryVolTempColumn{
            id:row3
            pID:"21~30";
        }
        SBatteryVolTempColumn{
            id:row4
            pID:"31~40";
        }
        SBatteryVolTempColumn{
            id:row5
            pID:"41~50";
        }
        SBatteryVolTempColumn{
            id:row6
            pID:"51~60";
        }
    }
}

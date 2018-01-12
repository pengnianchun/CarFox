import QtQuick 2.0
import QtQuick.Window 2.2

import "common"

Item {
    id: indexHome
    width:  1440
    height: 544

    property bool active: (CarStatus.autoFlash === 1) ? true : false
    property int menu_L0:  CarStatus.menu_L0
    property int themeIndex: ThemeStyle.themeIndex
    property bool theme1Loaded: false
    property bool theme2Loaded: false

    Loader {
        id : theme1
        active: themeIndex === 0 || theme1Loaded === true
        visible:  themeIndex === 0
        asynchronous: true
        source: "qrc:/qml/qml/themeOne/ThemeOne.qml"
        onLoaded:{
            theme1Loaded = true
            console.log("========theme1 loaded=============")
            //emit: CarStatus.setFb1Alpha()
            theme2.active = true
        }
    }
    Loader {
        id : theme2
        active: themeIndex === 1 || theme2Loaded === true
        visible:  themeIndex === 1
        asynchronous: true
        source: "qrc:/qml/qml/themeTwo/ThemeTwo.qml"
        onLoaded:  {
            theme2Loaded = true
            console.log("========theme2 loaded=============")
            theme1.active = true
        }
    }


    onActiveChanged: {
        if(active === true) {
            if (theme1Loaded === true || theme2Loaded === true) {
                emit: CarStatus.setFb1Alpha()
            }
        }
        console.log(" --- Received auto flash signal !!!")

    }

    onTheme1LoadedChanged: {
        if (active == true) {
            emit: CarStatus.setFb1Alpha()
        }
    }

    onTheme2LoadedChanged: {
        if (active == true) {
            emit: CarStatus.setFb1Alpha()
        }
    }

    Toast {
        id: toastTips
        state: ""
    }

    UpgradeUI {
        id: upgradeUI
        state: ""
    }



    onMenu_L0Changed: {
        switch(menu_L0){
            case 0:
                toastTips.state = ""
                upgradeUI.state = ""
                break;
            case 1:
                toastTips.state = "show"
                upgradeUI.state = ""
                break;
            case 2:
                toastTips.state = ""
                upgradeUI.state = "show"
                break;
        }
    }

    Component.onCompleted: {
        console.log("=============main component complete ============")
        if(Screen.height < 500) {
            indexHome.x = -72;
            indexHome.y = -30;
            indexHome.scale = 0.89
            indexHome.width = 1280
            indexHome.height = 480
        }
    }
}

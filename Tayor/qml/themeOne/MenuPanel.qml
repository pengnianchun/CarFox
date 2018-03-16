import QtQuick 2.0
import "subMenu"

Item {
    id: menuPanel
    opacity: 0.0

    property int menu_L1: CarStatus.menu_L1
    property int menu_L2: CarStatus.menu_L2
    property int menu_L3: CarStatus.menu_L3
    property int menu_L4: CarStatus.menu_L4
    property int menu_L5: CarStatus.menu_L5
    property int menu_L6: CarStatus.menu_L6
    property int menu_L7: CarStatus.menu_L7
    property int menu_L8: CarStatus.menu_L8
    property int m_menu_L1: 0
    property int m_menu_L2: 0
    property int enableKeyPress: 0
    property real utcTimeSetValue: 1483200000

    signal sendUTCSetToTime(real utcTime)

    function menuStatus(menuL1, menuL2, menuL3, menuL4, menuL5, menuL6, menuL7, menuL8){

        if(menuPanel.enableKeyPress === 0) { return }
        switch(menuL1){
        case 0:
            menuPanel.state = "";
            menuMain.state = "";
            pageLoader.setSource("")
            break;
        case 1:
            menuPanel.state = "show";
            menuMain.state = "show";
            pageLoader.setSource("")
            break;
        case 2:
            menuMain.state = "";
            switch(menuL2){
            case 1:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/ControlSystemMenu.qml")
                pageLoader.item.state = "show"
                break;
            case 2:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/MotorSystemMenu.qml")
                pageLoader.item.state = "show"
                break;
            case 3:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/AuxiliarySystemMenu.qml")
                pageLoader.item.state = "show"
                break;
            case 4:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/TcuSystemMenu.qml")
                pageLoader.item.state = "show"
                break;
            case 5:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/BatteryManagementMenu.qml")
                pageLoader.item.state = "show"
                break;
            case 6:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/BatteryStatusMenu.qml")
                pageLoader.item.state = "show";
                break;
            case 7:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/AirControlSystemMenu.qml")
                pageLoader.item.state = "show"
                break;
            case 8:
                if((m_menu_L1!==menuL1)||(m_menu_L2!==menuL2)) {
                    pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/TestModuleMenu.qml")
                }
                switch(menuL6){
                    case 1:
                        pageLoader.item.state = "show1"
                        break;
                    case 2:
                        pageLoader.item.state = "show2"
                        break;
                    case 3:
                        pageLoader.item.state = "show3"
                        break;
                    case 4:
                        pageLoader.item.state = "show4"
                        break;
                    case 5:
                        pageLoader.item.state = "show5"
                        break;
                    case 6:
                        pageLoader.item.state = "show6"
                        break;
                    case 7:
                        pageLoader.item.state = "show7"
                        break;
                    case 8:
                        pageLoader.item.state = "show8"
                        break;
                    case 9:
                        pageLoader.item.state = "show9"
                        break;
                    case 10:
                        pageLoader.item.state = "show10"
                        break;
                    case 11:
                        pageLoader.item.state = "show11"
                        break;
                    case 12:
                        pageLoader.item.state = "show12"
                        break;
                    case 13:
                        pageLoader.item.state = "show13"
                        break;
                    default: break;
                }
                break;
            case 9:
                pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/SystemSettingsMenu.qml")
                pageLoader.item.state = "show"
                break;
            default: break;
            }
            break;
        case 3:
            menuMain.state = "";
            switch(menuL2){
                case 9:
                    switch(menuL8) {
                        case 1:
                            pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/TimeSetMenu.qml")
                            pageLoader.item.defaultUTCTime = menuPanel.utcTimeSetValue;
                            pageLoader.item.state = "show"
                            break;
                        case 2:
                            pageLoader.setSource("qrc:/qml/qml/themeOne/subMenu/ThemeChangeMenu.qml")
                            pageLoader.item.state = "show"
                            break;
                    }
                    break;
            }
            break;
        }
        m_menu_L1 = menuL1
        m_menu_L2 = menuL2
    }

    onMenu_L1Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L2Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L3Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L4Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L5Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L6Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L7Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    onMenu_L8Changed: {
        menuStatus(menu_L1, menu_L2, menu_L3, menu_L4, menu_L5, menu_L6, menu_L7, menu_L8);
    }

    MenuMain {
        id: menuMain
        state: ""
    }

    Loader {
        id: pageLoader
        width: 1440
        height: 544
        focus: true
    }

    function setKeyEnable(enable) {
        menuPanel.enableKeyPress = enable;
    }

    states: [
        State {
            name: ""
            PropertyChanges { target: menuPanel; opacity: 0.0 }
        },
        State {
            name: "show"
            PropertyChanges { target: menuPanel; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "show"
        },
        Transition {
            from: "show"
            to: ""
        }
    ]

    Component.onCompleted: {

        console.log("=============theme1's menupanel component complete ============")
    }

}

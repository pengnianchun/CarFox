#include "carmenucontrol.h"
#include <QSettings>

CarMenuControl::CarMenuControl(QObject *parent) : QObject(parent)
{
    connect(KeyManager::instance(), &KeyManager::keyDoublePressed, this, &CarMenuControl::handleKeyDoublePressed, Qt::DirectConnection);
    connect(KeyManager::instance(), &KeyManager::doubleKeysPressed, this, &CarMenuControl::handleDoubleKeysPressed, Qt::DirectConnection);
    connect(KeyManager::instance(), &KeyManager::keyLongPressed, this, &CarMenuControl::handleKeyLongPressed, Qt::DirectConnection);
    connect(KeyManager::instance(), &KeyManager::keyShortPressed, this, &CarMenuControl::handleKeyShortPressed, Qt::DirectConnection);

    upgradeStatus = NORMAL_STATE;
}

void CarMenuControl::onNotifyUpgradeStatus(UpgradeMode status, QString msg) {
    upgradeStatus = status;
    qDebug()<<" --- update current mode status ---   status = "<<status<<"    msg = "<<msg;
    if(status == NEWEST_VERSION) {
        ValueChangeSet(menu_L0, MENU_UPGRADE_TIPS);
    } else if(status == UPDATED_FAILED) {
        ValueChangeSet(menu_L0, MENU_L0_NULL);
    } else if(status == UPDATING_STATE) {
        QString text = "";
        if(msg.contains("ui")) {
            text = tr("正在升级APP,请耐心等待...");
        } else if(msg.contains("mcu")) {
            text = tr("正在升级MCU,请耐心等待...");
        } else {
            text = tr("正在升级中,请耐心等待...");
        }
        ValueChangeOnlyNotify(upgradeTips, text);
        QString value = msg.split(":").at(1);
        ValueChangeSet(progressValue, value.toInt());
    } else if(status == UPDATED_SUCCESS) {
        ValueChangeOnlyNotify(upgradeTips, tr("升级成功！重启后生效"));
        ValueChangeSet(progressValue, 100);
    }

}

void CarMenuControl::onNotifyResetStatus() {
    ValueChangeNotify(menu_L1, MENU_L1_NULL);
    ValueChangeNotify(menu_L2, MENU_L2_NULL);
    ValueChangeNotify(menu_L6, MENU_L6_NULL);
    ValueChangeNotify(menu_L8, MENU_L8_NULL);
    m_menu_TimePos = 0;
    m_menuInfoSet = MENU_L2_NULL;
    emit notifyMenuInfoRequest(m_menuInfoSet);
}

void CarMenuControl::handleKeyDoublePressed(KeyManager::KeyType keyType)
{
    Q_UNUSED(keyType);
}

void CarMenuControl::handleDoubleKeysPressed(KeyManager::KeyType keyType1, KeyManager::KeyType keyType2)
{
    Q_UNUSED(keyType1);
    Q_UNUSED(keyType2);
}

void CarMenuControl::handleKeyLongPressed(KeyManager::KeyType keyType) {
    switch(keyType){
        case KeyManager::EnterKey:
            m_tripClear = true;
            emit notifyClearTripRequest();
            qDebug()<<" --- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clear all the speed value reset to zero !!!!!!!!!!!! ";
            break;
        default:
            break;
    }
}

void CarMenuControl::handleKeyShortPressed(KeyManager::KeyType keyType) {

    switch(keyType){
        case KeyManager::EnterKey:
            if(upgradeStatus != NORMAL_STATE) {
                 if(upgradeStatus == NEWEST_VERSION) {
                     emit notifyUpgradeStart();
                     upgradeStatus = UPDATING_STATE;
                     ValueChangeSet(menu_L0, MENU_UPGRADE_PROCESS);
                 }
                 qDebug()<<" --- You have pressed [Enter Key]";
                 return;
             }
             switch(m_menu_L1){
                case MENU_L1_NULL:
                    ValueChangeNotify(menu_L1, MENU_MAIN);
                    ValueChangeNotify(menu_L2, MENU_CONTROLSYSTEM);
                    break;
                case MENU_MAIN:
                    ValueChangeNotify(menu_L1, MENU_SUB);
                    ValueChangeNotify(menu_L6, MENU_TESTDIAG_PAGE1);
                    ValueChangeNotify(menu_SettingsSelect, MENU_TIME_SETTINGS);
                    ValueChangeNotify(menu_TimePos, MENU_DATETIME_HOUR);
                    if((m_menu_L2 >= MENU_CONTROLSYSTEM) && (m_menu_L2 <= MENU_AIRCONTROLSYSTEM)) {
                        m_menuInfoSet = m_menu_L2;
                    } else {
                        m_menuInfoSet = MENU_L2_NULL;
                    }
                    emit notifyMenuInfoRequest(m_menuInfoSet);
                    break;
                case MENU_SUB:
                    switch(m_menu_L2){
                        case MENU_SYSTEMSET:
                            ValueChangeNotify(menu_L1, MENU_CHILD);
                            ValueChangeNotify(menu_L8, m_menu_SettingsSelect);
                            if(m_menu_L8 == MENU_THEME_SETTINGS) {
                                qint64 currentTheme = MTheme::instance()->getTheme();
                                m_menu_ThemeSelect = -1;
                                if(currentTheme == 0) {
                                    ValueChangeSet(menu_ThemeSelect, APP_THEME_ONE);
                                } else {
                                    ValueChangeSet(menu_ThemeSelect, APP_THEME_TWO);
                                }
                            }
                            break;
                    }
                    break;
                case MENU_CHILD:
                    switch(m_menu_L8){
                        case MENU_TIME_SETTINGS: {
                            if((m_menu_TimePos)>MENU_DATETIME_DAY) {
                                emit menu_time_tips(1);
                                m_menu_TimePos = MENU_DATETIME_NULL;
                                break;
                            }
                            qDebug()<<" --- You have press key Enter, current position = "<<m_menu_TimePos;
                            qint64 temp = m_menu_TimePos+1;
                            ValueChangeSet(menu_TimePos, temp);
                            }
                            break;
                        case MENU_THEME_SETTINGS: {
                                emit menu_set_theme();
                            }
                            break;
                    }
                    break;
            	}
                break;
        case KeyManager::BackKey:
            if(upgradeStatus != NORMAL_STATE) {
                if(upgradeStatus == NEWEST_VERSION) {
                    upgradeStatus = NORMAL_STATE;
                    ValueChangeSet(menu_L0, MENU_L0_NULL);
                }
                qDebug()<<" --- You have pressed [Cancel Key]";
                return;
            }
            switch(m_menu_L1){
                case MENU_MAIN:
                    ValueChangeNotify(menu_L1, MENU_L1_NULL);
                    ValueChangeNotify(menu_L2, MENU_L2_NULL);
                    break;
                case MENU_SUB:
                    switch(m_menu_L2){
                        case MENU_CONTROLSYSTEM:
                            ValueChangeNotify(menu_L2, MENU_CONTROLSYSTEM);
                            break;
                        case MENU_MOTORSYSTEM:
                            ValueChangeNotify(menu_L2, MENU_MOTORSYSTEM);
                            break;
                        case MENU_AUXILIARYSYSTEM:
                            ValueChangeNotify(menu_L2, MENU_AUXILIARYSYSTEM);
                            break;
                        case MENU_TCUSYSTEM:
                            ValueChangeNotify(menu_L2, MENU_TCUSYSTEM);
                            break;
                        case MENU_BATTERYMANAGESYSTEM:
                            ValueChangeNotify(menu_L2, MENU_BATTERYMANAGESYSTEM);
                            break;
                        case MENU_BATTERYSTATE:
                            ValueChangeNotify(menu_L2, MENU_BATTERYSTATE);
                            break;
                        case MENU_AIRCONTROLSYSTEM:
                            ValueChangeNotify(menu_L2, MENU_AIRCONTROLSYSTEM);
                            break;
                        case MENU_TESTMODULESYSTEM:
                            ValueChangeNotify(menu_L2, MENU_TESTMODULESYSTEM);
                            break;
                        case MENU_SYSTEMSET:
                            ValueChangeNotify(menu_L1, MENU_SUB);
                            ValueChangeNotify(menu_L2, MENU_SYSTEMSET);
                            break;
                        default:
                            ValueChangeNotify(menu_L2, MENU_L2_NULL);
                            break;
                    }
                    ValueChangeNotify(menu_L1, MENU_MAIN);
                    ValueChangeNotify(menu_L6, MENU_L6_NULL);
                    break;
                case MENU_CHILD:
                    switch(m_menu_L8){
                        case MENU_TIME_SETTINGS:
                        case MENU_THEME_SETTINGS:
                            ValueChangeNotify(menu_L8, MENU_L8_NULL);
                            break;
                    }
                    ValueChangeNotify(menu_L1, MENU_SUB);
                    ValueChangeNotify(menu_L2, MENU_SYSTEMSET);
                    break;
            }
            m_menuInfoSet = MENU_L2_NULL;
            emit notifyMenuInfoRequest(m_menuInfoSet);
            break;
        case KeyManager::PrevKey:
            if(upgradeStatus != NORMAL_STATE) {
                 return;
             }
            switch(m_menu_L1){
                case MENU_MAIN:
                    if(m_menu_L2 == MENU_CONTROLSYSTEM) {
                        ValueChangeNotify(menu_L2, MENU_SYSTEMSET);
                    } else {
                        qint64 temp =  m_menu_L2 - 1;
                        ValueChangeNotify(menu_L2, temp);
                    }
                    break;
                case MENU_SUB:
                    switch(m_menu_L2){
                        case MENU_TESTMODULESYSTEM:
                            if(m_menu_L6<= MENU_TESTDIAG_PAGE1) {
                                ValueChangeSet(menu_L6, MENU_TESTDIAG_PAGE13);
                            } else {
                                qint64 temp = m_menu_L6 - 1;
                                ValueChangeSet(menu_L6, temp);
                            }
                            if((m_menu_L6 >= MENU_TESTDIAG_PAGE5) && (m_menu_L6 <= MENU_TESTDIAG_PAGE7)) {
                                m_menuInfoSet = MENU_FRONT_MODULE;
                            } else if((m_menu_L6 >= MENU_TESTDIAG_PAGE8) && (m_menu_L6 <= MENU_TESTDIAG_PAGE10)) {
                                m_menuInfoSet = MENU_MIDDLE_MODULE;
                            } else if((m_menu_L6 >= MENU_TESTDIAG_PAGE11) && (m_menu_L6 <= MENU_TESTDIAG_PAGE13)) {
                                m_menuInfoSet = MENU_BACK_MODULE;
                            } else {
                                m_menuInfoSet = MENU_MODULE_NULL;
                            }
                            emit notifyMenuInfoRequest(m_menuInfoSet);
                            break;
                        case MENU_SYSTEMSET:
                            if(m_menu_SettingsSelect <= MENU_TIME_SETTINGS) {
                                ValueChangeSet(menu_SettingsSelect, MENU_THEME_SETTINGS);
                            } else {
                                qint64 temp = m_menu_SettingsSelect - 1;
                                ValueChangeSet(menu_SettingsSelect, temp);
                            }
                            break;
                    }
                    break;
                case MENU_CHILD:
                    switch(m_menu_L8){
                        case MENU_TIME_SETTINGS:
                            emit menu_decrease(MENU_DIRECTION_PREV);
                            break;
                        case MENU_THEME_SETTINGS:
                            if(m_menu_ThemeSelect <= APP_THEME_ONE) {
                                ValueChangeSet(menu_ThemeSelect, APP_THEME_TWO);
                            } else {
                                qint64 temp = m_menu_ThemeSelect - 1;
                                ValueChangeSet(menu_ThemeSelect, temp);
                            }
                            break;
                    }
                    break;
            }
            break;
        case KeyManager::NextKey:
            if(upgradeStatus != NORMAL_STATE) {
                return;
            }

            switch(m_menu_L1){
            case MENU_MAIN:
                if(m_menu_L2 == MENU_SYSTEMSET) {
                    ValueChangeSet(menu_L2,MENU_CONTROLSYSTEM);
                } else {
                    qint64 temp =  m_menu_L2 + 1;
                    ValueChangeSet(menu_L2, temp);
                }
                break;
            case MENU_SUB:
                switch(m_menu_L2){
                case MENU_TESTMODULESYSTEM:
                    if(m_menu_L6 >= MENU_TESTDIAG_PAGE13) {
                        ValueChangeSet(menu_L6, MENU_TESTDIAG_PAGE1);
                    } else {
                        qint64 temp =  m_menu_L6 + 1;
                        ValueChangeSet(menu_L6, temp);
                    }
                    if((m_menu_L6 >= MENU_TESTDIAG_PAGE5) && (m_menu_L6 <= MENU_TESTDIAG_PAGE7)) {
                        m_menuInfoSet = MENU_FRONT_MODULE;
                    } else if((m_menu_L6 >= MENU_TESTDIAG_PAGE8) && (m_menu_L6 <= MENU_TESTDIAG_PAGE10)) {
                        m_menuInfoSet = MENU_MIDDLE_MODULE;
                    } else if((m_menu_L6 >= MENU_TESTDIAG_PAGE11) && (m_menu_L6 <= MENU_TESTDIAG_PAGE13)) {
                        m_menuInfoSet = MENU_BACK_MODULE;
                    } else {
                        m_menuInfoSet = MENU_MODULE_NULL;
                    }
                    emit notifyMenuInfoRequest(m_menuInfoSet);
                    break;
                case MENU_SYSTEMSET:
                    if(m_menu_SettingsSelect >= MENU_THEME_SETTINGS) {
                        ValueChangeSet(menu_SettingsSelect, MENU_TIME_SETTINGS);
                    } else {
                        qint64 temp =  m_menu_SettingsSelect + 1;
                        ValueChangeSet(menu_SettingsSelect, temp);
                    }
                    break;
                }
                break;
            case MENU_CHILD:
                switch(m_menu_L8){
                    case MENU_TIME_SETTINGS:
                        emit menu_increase(MENU_DIRECTION_NEXT);
                        break;
                    case MENU_THEME_SETTINGS:
                        if(m_menu_ThemeSelect >= APP_THEME_TWO) {
                            ValueChangeSet(menu_ThemeSelect, APP_THEME_ONE);
                        } else {
                            qint64 temp =  m_menu_ThemeSelect + 1;
                            ValueChangeSet(menu_ThemeSelect, temp);
                        }
                        break;
                }
                break;
            }
            break;
        default:
            break;
    }
}

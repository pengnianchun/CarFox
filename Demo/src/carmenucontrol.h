#ifndef CARMENUCONTROL_H
#define CARMENUCONTROL_H

#include <QObject>
#include <QDebug>
#include "keymanager.h"
#include "common.h"
#include "theme.h"

class CarMenuControl : public QObject
{
    Q_OBJECT
public:
    explicit CarMenuControl(QObject *parent = 0);

public slots:
    void handleKeyDoublePressed(KeyManager::KeyType keyType);
    void handleDoubleKeysPressed(KeyManager::KeyType keyType1, KeyManager::KeyType keyType2);
    void handleKeyLongPressed(KeyManager::KeyType keyType);
    void handleKeyShortPressed(KeyManager::KeyType keyType);
    void onNotifyUpgradeStatus(UpgradeMode status, QString msg);
    void onNotifyResetStatus();

signals:
    void notifyUpgradeStart();

    void tripClearChanged(bool);
    void batNumSetChanged(int);
    void dateTimeSet(int);
    void menu_increase(int);
    void menu_decrease(int);
    void menu_time_tips(int);
    void menu_set_theme();
    void menu_L0Changed(uint);
    void menu_L1Changed(uint);
    void menu_L2Changed(uint);
    void menu_L3Changed(uint);
    void menu_L4Changed(uint);
    void menu_L5Changed(uint);
    void menu_L6Changed(uint);
    void menu_L7Changed(uint);
    void menu_L8Changed(uint);
    void menu_TimePosChanged(uint);
    void menu_DirectionChanged(uint);
    void menu_SettingsSelectChanged(uint);
    void menu_ThemeSelectChanged(uint);
    void upgradeTipsChanged(QString);
    void progressValueChanged(int);

    void notifyClearTripRequest();
    void notifyMenuInfoRequest(qint64 MenuNo, qint64 pageNo = 0);

private:
    UpgradeMode upgradeStatus;

    bool m_tripClear = false;
    qint64 m_menuInfoSet = 0;
    int m_batNumSet = 0;
    int m_dateTime = 0;
    bool m_timeValid = 0;

    uint m_menu_L0 = 0;
    int m_menu_L1 = 0;
    int m_menu_L2 = 0;
    int m_menu_L3 = 0;
    int m_menu_L4 = 0;
    int m_menu_L5 = 0;
    int m_menu_L6 = 0;
    int m_menu_L7 = 0;
    int m_menu_L8 = 0;
    int m_menu_TimePos = 0;
    int m_menu_Direction = 0;
    int m_menu_SettingsSelect = 0;
    int m_menu_ThemeSelect = 0;
    QString m_upgradeTips = "";
    int m_progressValue = 0;

};

#endif // CARMENUCONTROL_H

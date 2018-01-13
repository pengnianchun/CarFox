#pragma once

#include <CarUpdatesWorker.hpp>

#include "CustomProtocol.hpp"
#include "CustomCarUpdatesWorkerData.hpp"



class CustomCarUpdatesWorker : public carfox::CarUpdatesWorker
{
    Q_OBJECT

public:
    CustomCarUpdatesWorker();

public slots:
    // 专用下行帧 数据更新槽函数
//    void sendMaintenanceClean(bool maintenanceClean);
//    void sendUsbUpdate(bool usbUpdate);
//    void sendSelfCheckFlag(bool selfCheckFlag);
//    void sendUsbDiskCheckSet();
    void sendThemeSet(int offset);
    void sendLanguageSet(uint languageSet);
//    void sendSpeedLimitSet(uint speedLimitSet);
//    void sendNaviModeSet(uint autoNavi);
    void sendUiVersion(const QString uiVersion);

    void onIgOnChanged(bool status);

signals:
    // 专用上行帧 数据变更信号
    void lfTirePressureChanged(qreal);
    void lfTirePressureWarnChanged(uint);


    void tirePressureWarningChanged(bool);
    void tireWarningsTextsChanged(const QStringList &texts);

    void themeModeChanged(uint);

    // UI版本号 数据变更信号
    void qtVersionIChanged(quint8);
    void qtVersionIIChanged(quint8);
    void qtVersionIIIChanged(quint8);


protected:
    virtual DataParseStatus parseData(carfox::MagicFrame *magicFrame, QByteArray &byteArray);
    virtual void checkCarUpdatesSignals();

private:
    void updateCarUpdates(SpecialInfo data);
    void updateCarUpdates(QByteArray data);    // 当接收到第一帧信号是创建日志文件
    void updateSelfCheck(SpecialInfo data);

    void setDefaultSettingFrame(SpecSettingsInfo &specSettingsInfo);
    void checkTirePressure();
    void addTireWarnText(int priority, const QString &text);
    void removeTireWarnText(int priority);
    virtual void printHwVersion();

private:
    CustomCarUpdatesWorkerStateData mStateData;

    bool mTirePressureWarning = false;

    int mQtVersionI = 0;
    int mQtVersionII = 0;
    int mQtVersionIII = 0;
    quint8 mCurrentPepsState = 0;

//    QTimer mLogTimer;
//    LogToFile mLogToFile;
    QMap<int, QString> mTireWarningsTextsMap;
};

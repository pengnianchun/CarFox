#pragma once

#include <CarUpdates.hpp>

class CustomCarUpdatesWorker;
class CustomCarUpdates : public carfox::CarUpdates
{
    Q_OBJECT

    // 专用上行帧, 利用宏定义变量、信号、用Q_PROPERTY注册到QML
    // 这个跟专用帧对应
    MEMBER_PROPERTY_WITH_NOTIFY(qreal, lfTirePressure, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(int, lfTirePressureWarn, 0)
    MEMBER_PROPERTY_WITH_NOTIFY(bool, hasTireWarn, false)
    MEMBER_PROPERTY_WITH_NOTIFY(int, themeMode, 0) // 主题设置

    Q_PROPERTY(QStringList tireWarningsTexts MEMBER mTireWarningsTexts NOTIFY tireWarningsTextsChanged)

    public:
        explicit CustomCarUpdates(CustomCarUpdatesWorker *worker);

    void sendUiVersion(const QString ui);

signals:
    // 专用下行帧 数据变更信号
    void tireWarningsTextsChanged();

private slots:
    // 专用上行帧 更新数据槽函数

    void updateLfTirePressure (qreal lfTirePressure);
    void updateLfTirePressureWarn (int lfTirePressureWarn);
    void updateHasTireWarn(bool hasTireWarn);

    void updateTireWarningsTexts (const QStringList &texts);

    void updateThemeMode (int data);

private:
    void checkHasWarningInfoChanged();

private:
    // 专用下行帧数据

    // Custom
    QStringList mTireWarningsTexts;

    bool mHasWarningInfo = false;

};

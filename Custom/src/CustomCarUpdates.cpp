#include <QCoreApplication>

#include "CustomCarUpdates.hpp"
#include "CustomCarUpdatesWorker.hpp"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef Q_PROCESSOR_ARM
#include <utsrelease.h>
#endif

#ifdef __cplusplus
}
#endif


CustomCarUpdates::CustomCarUpdates(CustomCarUpdatesWorker *worker)
    : carfox::CarUpdates(worker)
{
    if (!worker) return;

    connect(worker, &CustomCarUpdatesWorker::lfTirePressureChanged, this, &CustomCarUpdates::updateLfTirePressure);
    connect(worker, &CustomCarUpdatesWorker::lfTirePressureWarnChanged, this, &CustomCarUpdates::updateLfTirePressureWarn);

    connect(worker, &CustomCarUpdatesWorker::tirePressureWarningChanged, this, &CustomCarUpdates::updateHasTireWarn);

    connect(worker, &CustomCarUpdatesWorker::tireWarningsTextsChanged, this, &CustomCarUpdates::updateTireWarningsTexts);

    connect(worker, &CustomCarUpdatesWorker::themeModeChanged, this,  &CustomCarUpdates::updateThemeMode);

    connect(this, &CustomCarUpdates::uiVersionChanged, worker, &CustomCarUpdatesWorker::sendUiVersion);
}

void CustomCarUpdates::sendUiVersion(const QString ui)
{
    this->uiVersionChanged(ui);
}



void CustomCarUpdates::updateLfTirePressure(qreal data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(lfTirePressure, data);
}


void CustomCarUpdates::updateLfTirePressureWarn(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(lfTirePressureWarn, data);
}


void CustomCarUpdates::updateHasTireWarn(bool data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(hasTireWarn, data);
}

void CustomCarUpdates::updateThemeMode(int data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(themeMode, data);
}

void CustomCarUpdates::updateTireWarningsTexts(const QStringList &texts)
{
    if (mTireWarningsTexts != texts) {
        mTireWarningsTexts = texts;
        emit tireWarningsTextsChanged();
    }
}


#pragma once

#include <QObject>

#include <UiController.hpp>

#include "CustomCarUpdates.hpp"
#include "CustomMultiLanguage.hpp"
#include "CustomCarUpdatesWorker.hpp"

#include "CustomCarMsg.hpp"
#include "CustomCarMsgWorker.hpp"

class CustomCarUpdates;

class CustomUiController : public carfox::UiController
{
    Q_OBJECT

public:
    CustomUiController(int screenWidth, int screenHeight, bool firstInstance = true);

    void setReleaseVersion(const QString &releaseVersion);



protected:
    virtual void createThemes(std::shared_ptr<carfox::ContextProperty> cp);
    virtual void registerQmlTypes();
    virtual void loadFonts();
    virtual std::shared_ptr<carfox::CarUpdates> createCarUpdates();
    virtual std::shared_ptr<carfox::CarUpdates> createFakeCarUpdates();
    virtual std::shared_ptr<carfox::CarMsg> createCarMsg();
    virtual std::shared_ptr<carfox::CarMsg> createFakeCarMsg();
    virtual std::shared_ptr<carfox::MultiLanguage> createMultiLanguage();
    virtual std::shared_ptr<carfox::MultiLanguage> createFakeMultiLanguage();

private slots: //槽函数
    void handleHasWarningInfoChanged(bool hasWarningInfo);
    void handleTirePressureChanged(bool tirePressure);
    void handleThemeModeChanged();
    void handleSystemShutdown();
    void handleSystemWakeup();
    void handleInitialized();
    void switchLanguage();
    void showDormancy();

private:
    QString m_releaseVersion;
    std::shared_ptr<CustomMultiLanguage> mMultiLanguage = std::make_shared<CustomMultiLanguage>();
    std::shared_ptr<CustomCarUpdates> mCarUpdates = std::make_shared<CustomCarUpdates>(new CustomCarUpdatesWorker);
    std::shared_ptr<CustomCarMsg> mCarMsg = std::make_shared<CustomCarMsg>(new CustomCarMsgWorker);
};

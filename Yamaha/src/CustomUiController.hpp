#pragma once

#include <QObject>
#include <UiController.hpp>
#include "CustomMultiLanguage.hpp"
#include "CustomCarMsg.hpp"
#include "CustomCarMsgWorker.hpp"

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
    virtual std::shared_ptr<carfox::CarMsg> createCarMsg();
    virtual std::shared_ptr<carfox::CarMsg> createFakeCarMsg();
    virtual std::shared_ptr<carfox::MultiLanguage> createMultiLanguage();
    virtual std::shared_ptr<carfox::MultiLanguage> createFakeMultiLanguage();

private slots: //槽函数
    void handleHasWarningInfoChanged(bool hasWarningInfo);
    void handleThemeModeChanged();
    void handleSystemShutdown();
    void handleSystemWakeup();
    void handleInitialized(); // CarMsgWorker 收到重要信息后，执行
    void handleStartShow(int data);   // CarMsgWorker 收到动画完成之后，执行
    void switchLanguage(); // 切换语言时候执行
    void showDormancy(); // 显示休眠界面

private:
    QString m_releaseVersion;
    std::shared_ptr<CustomMultiLanguage> mMultiLanguage = std::make_shared<CustomMultiLanguage>();
    std::shared_ptr<CustomCarMsg> mCarMsg = std::make_shared<CustomCarMsg>(new CustomCarMsgWorker);
};

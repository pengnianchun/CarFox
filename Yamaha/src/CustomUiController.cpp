#include <QDir>

#include "CustomEnum.hpp"

#include "CustomTheme1.hpp"
#include "CustomTheme2.hpp"
#include "CustomTheme3.hpp"
#include "CustomTheme4.hpp"
#include "CustomUiController.hpp"
#include "CustomUiController.hpp"


// 打开这个宏会直接显示主界面,而不是需要等待mcu发送第一帧信号
//#define CUSTOM_PROFILE

CustomUiController::CustomUiController(int screenWidth, int screenHeight, bool firstInstance)
    : carfox::UiController(screenWidth, screenHeight, firstInstance)
{
}

/*
 * 创建主题
 */
void CustomUiController::createThemes(std::shared_ptr<carfox::ContextProperty> cp)
{
    qDebug() << "Creating themes";
    //1. carMsg 初始化完成后，处理初始化的东西。因为有些东西需要首先得到属性
    auto worker = qobject_cast<CustomCarMsgWorker *>(mCarMsg->getCarMsgWorker());
    connect(worker, &carfox::CarMsgWorker::initialized, this, &CustomUiController::handleInitialized,
            static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::QueuedConnection));
    connect(worker, &CustomCarMsgWorker::autoFlashChanged, this, &CustomUiController::handleStartShow,
            static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::QueuedConnection));
    //2. 添加主题
    // Note: 需要添加
    auto customTheme1 = std::make_shared<CustomTheme1>(cp, "CustomTheme1");
    addTheme(customTheme1, 16, 3);
    auto customTheme2 = std::make_shared<CustomTheme2>(cp, "CustomTheme2");
    addTheme(customTheme2, 16, 3);
    auto customTheme3 = std::make_shared<CustomTheme3>(cp, "CustomTheme3");
    addTheme(customTheme3, 16, 3);
    auto customTheme4 = std::make_shared<CustomTheme4>(cp, "CustomTheme4");
    addTheme(customTheme4, 16, 3);

    // only for Common
#ifdef CARFOX_DEBUG_FPS
    addGlobalLayer(cp, "qrc:/Common/Qml/Common/Fps.qml", "FpsLayer")->setShowPolicy(carfox::Layer::ShowOnLoaded); //加载的时候显示
#endif
    addGlobalLayer(cp, "qrc:/Common/Qml/Common/DormancyPanel.qml", "DormancyPanel")->setShowPolicy(carfox::Layer::ManualShow);
    qDebug() << "Create themes done";

#ifdef CUSTOM_PROFILE
    handleInitialized();
#endif
}

// 主题切换
void CustomUiController::handleThemeModeChanged()
{
    auto themeMode = mCarMsg->property("themeMode").toInt();
    qDebug() << "handle theme mode changed: " << themeMode;

    if (mCarMsg->property("igOn").toBool()) {
        switch (themeMode) {
        case CustomEnum::Theme1Mode:
            switchThemeTo("CustomTheme1");
            break;
        case CustomEnum::Theme2Mode:
            switchThemeTo("CustomTheme2");
            break;
        case CustomEnum::Theme3Mode:
            switchThemeTo("CustomTheme3");
            break;
        case CustomEnum::Theme4Mode:
            switchThemeTo("CustomTheme4");
            break;
        default:
            break;
        }
    } else {
        switch (themeMode) {
        case CustomEnum::Theme1Mode:
            themeManager()->setCurrentTheme("CustomTheme1");
            break;
        case CustomEnum::Theme2Mode:
            themeManager()->setCurrentTheme("CustomTheme2");
            break;
        case CustomEnum::Theme3Mode:
            themeManager()->setCurrentTheme("CustomTheme3");
            break;
        case CustomEnum::Theme4Mode:
            themeManager()->setCurrentTheme("CustomTheme4");
            break;
        default:
            break;
        }
    }
}

// 语言切换
void CustomUiController::switchLanguage()
{
    if (mCarMsg->property("languageMode").toBool()) {
        mMultiLanguage->switchLanguageTo(CustomMultiLanguage::EN);
    } else {
        mMultiLanguage->switchLanguageTo(CustomMultiLanguage::CN);
    }
}

// 初始化, 当接收到CarMsgWorker的重要信息时候会执行。
void CustomUiController::handleInitialized()
{
    //mCarMsg.get()->printReleaseVersion(m_releaseVersion);

    qDebug() << "Start initialize";

#ifndef CUSTOM_PROFILE
    auto worker = qobject_cast<CustomCarMsgWorker *>(sender());

    disconnect(worker, &CustomCarMsgWorker::initialized, this, &CustomUiController::handleInitialized);
#endif

    handleSystemWakeup();
    connect(this, &carfox::UiController::requestSystemShutdown, this, &CustomUiController::handleSystemShutdown);
    connect(this, &carfox::UiController::requestSystemWakeup, this, &CustomUiController::handleSystemWakeup);
    connect(themeManager(), &carfox::ThemeManager::showDormancy, this, &CustomUiController::showDormancy);

    switchLanguage();

    auto themeMode = mCarMsg->property("themeMode").toInt();
    qDebug() << "themeMode : " << themeMode;
    switch (themeMode) {
    case CustomEnum::Theme1Mode:
        loadWith("CustomTheme1");
        break;
    case CustomEnum::Theme2Mode:
        loadWith("CustomTheme2");
        break;
    case CustomEnum::Theme3Mode:
        loadWith("CustomTheme3");
        break;
    case CustomEnum::Theme4Mode:
        loadWith("CustomTheme4");
        break;
    default:
        break;
    }
    qDebug() << "End initialize";
//    themeManager()->setReady(true);
    connect(mCarMsg.get(), &CustomCarMsg::themeModeChanged, this, &CustomUiController::handleThemeModeChanged);
}

void CustomUiController::handleStartShow()
{
    mVisible = true;
    carfox::ThemeManager::instance()->handleSplashScreenFinished();
    themeManager()->setReady(true);
}

/*
 * 休眠, qWarning的内容供测试软件用
 */
void CustomUiController::handleSystemShutdown()
{
    qWarning() << "begin system shutdown";

    qWarning() << "end system shutdown";
}

// 唤醒, qWarning的内容供测试软件用，勿删
void CustomUiController::handleSystemWakeup()
{
    qWarning() << "begin system wakeup";

    qWarning() << "end system wakeup";
}

// 休眠
void CustomUiController::showDormancy()
{
    qDebug() << "CustomUiController::showDormancy";
    hideCurrentTheme();
    themeManager()->qmlLayer("DormancyPanel")->loadSync();
    showLayer("DormancyPanel");
}

void CustomUiController::registerQmlTypes()
{
    UiController::registerQmlTypes();
    qmlRegisterType<CustomEnum>("CustomEnum", 1, 0, "CustomEnum");
}

void CustomUiController::loadFonts()
{
#ifdef Q_PROCESSOR_ARM
    loadFont("/usr/lib/fonts/FangYan.ttf");
    loadFont("/usr/lib/fonts/NotoSansHans-DemiLight.ttf");
    loadFont("/usr/lib/fonts/ConceptFont.ttf");
    loadFont("/usr/lib/fonts/WenQuanYiMicroHei.ttf");
#else
    loadFont(QDir::currentPath() + "/fonts/FangYan.ttf");
    loadFont(QDir::currentPath() + "/fonts/NotoSansHans-DemiLight.ttf");
    loadFont(QDir::currentPath() + "/fonts/ConceptFont.ttf");
    loadFont(QDir::currentPath() + "/fonts/WenQuanYiMicroHei.ttf");
#endif
}

std::shared_ptr<carfox::CarMsg> CustomUiController::createCarMsg()
{
    return mCarMsg;
}

std::shared_ptr<carfox::CarMsg> CustomUiController::createFakeCarMsg()
{
    return std::make_shared<CustomCarMsg>(nullptr);
}

std::shared_ptr<carfox::MultiLanguage> CustomUiController::createMultiLanguage()
{
    return mMultiLanguage;
}

std::shared_ptr<carfox::MultiLanguage> CustomUiController::createFakeMultiLanguage()
{
    return std::make_shared<CustomMultiLanguage>(true);
}

// 报警动画
void CustomUiController::handleHasWarningInfoChanged(bool hasWarningInfo)
{
    if (hasWarningInfo) {
        auto currentThemeId = themeManager()->currentTheme()->objectName();
        if (currentThemeId == "CustomTheme4") {
            pushToStackView("Theme4WarningInfo", 2);
        } else if (currentThemeId == "CustomTheme3") {
            pushToStackView("Theme3WarningInfo", 2);
        } else if (currentThemeId == "CustomTheme2") {
            pushToStackView("Theme2WarningInfo", 2);
        } else if (currentThemeId == "CustomTheme1") {
            pushToStackView("Theme1WarningInfo", 2);
        }
    } else {
        popFromStackView(2);
    }
}


void CustomUiController::setReleaseVersion(const QString &releaseVersion)
{
    if (m_releaseVersion != releaseVersion) {
        m_releaseVersion = releaseVersion;
    }
}

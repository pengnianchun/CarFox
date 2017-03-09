#include <QQuickItem>
#include <QFontDatabase>

#include "UiController.hpp"
#include "UndeadMain.hpp"

CARFOX_BEGIN_NAMESPACE

UiController::UiController(int screenWidth, int screenHeight, bool firstInstance)
    : mFirstInstance(firstInstance)
{
    Window::instance()->resize(screenWidth, screenHeight);
}

void UiController::connectQuitToApp(QGuiApplication *app)
{
    app->connect(Window::instance()->engine(), &QQmlEngine::quit, &QGuiApplication::quit);
}

/*
 *  显示一个图层，参数是qml的layer
 */
void UiController::showLayer(const QString &layerId)
{
    mThemeManager->showLayer(layerId); // 这个是一个单例
    updateRootMenuStatus(layerId, true);
}

/*
 * 设置layer的property属性
 */
void UiController::setLayerProperty(const QString &layerId, const QString &propertyName, QVariant value, bool setForVisibleLayerOnly)
{
    qDebug() << "setLayerProperty" << layerId << "," << propertyName << "=" << value;
    if (setForVisibleLayerOnly) {
        if (!isLayerShown(layerId)) {
            return;
        }
    }

    auto layer = mThemeManager->qmlLayer(layerId);
    if (!layer) {
        return;
    }

    auto layerItem = layer->qmlLayerItem();
    layerItem->setProperty(propertyName.toLatin1().data(), value);
}

/*
 * setLayerChildObjectProperty
 */
void UiController::setLayerChildObjectProperty(const QString &layerId, const QString &objectName, const QString &propertyName, QVariant value)
{
    auto layer = mThemeManager->qmlLayer(layerId);
    if (!layer) return;
    auto layerItem = layer->qmlLayerItem();
    auto object = layerItem->findChild<QObject *>(objectName);
    object->setProperty(propertyName.toLatin1().data(), value);
}

/*
 * 隐藏图层
 */
void UiController::hideLayer(const QString &layerId)
{
    mThemeManager->hideLayer(layerId);
    updateRootMenuStatus(layerId, false);
}


/*
 * 返回指定的layer是否可见，使用layer的parentItem来判断
 * 因为在layer中，hidelayer()的时候都会将parentItem设置为null，showLayer()的时候都会将parentItem设置为qml窗体
 */
bool UiController::isLayerShown(const QString &layerId)
{
    auto layer = mThemeManager->qmlLayer(layerId);
    if (layer) {
        auto layerItem = layer->qmlLayerItem();
        if (layerItem) {
            return layerItem->parentItem();
        }
    }
    return false;
}

bool UiController::isMenuShown()
{
    return mIsMenuShown;
}

/*
 *  框架的总入口点
 */
void UiController::start()
{
    qDebug() << "UiController::start, mFirstInstance:" << mFirstInstance;
    loadFonts();
    registerQmlTypes();
    createThemes(createContextProperty(createCarUpdates(), createFakeCarUpdates(), createMultiLanguage(), createFakeMultiLanguage()));
    if (!mFirstInstance) { //如果不是第一次
        ThemeManager::instance()->handleSplashScreenFinished();
    }
}

/*
 * 隐藏菜单
 */
void UiController::hideRootMenu()
{
    QString rootMenuId = mThemeManager->currentTheme()->getRootMenuId(); // 通过主题获得菜单id
    if (rootMenuId == "") {
        return;
    }
    qDebug() << "UiController::hideRootMenu " << rootMenuId;
    hideLayer(rootMenuId);
}

/*
 * 显示菜单
 */
void UiController::showRootMenu()
{
    QString rootMenuId = mThemeManager->currentTheme()->getRootMenuId();
    if (rootMenuId == "") return;
    showLayer(rootMenuId);
}

/*
 * 同步加载指定的layer
 */
void UiController::loadLayer(const QString &layerId)
{
    auto layer = mThemeManager->qmlLayer(layerId);
    if (layer && !layer->isLoaded()) {
        layer->loadSync();
    }
}

/*
 * 卸载制定的layerId
 */
void UiController::unloadLayer(const QString &layerId)
{
    mThemeManager->unloadLayer(layerId);
}

/*
 * 将指定的图层(layerId)加入到列表中，并且显示priority最大的图层
 */
void UiController::pushToStackView(const QString &layerId, int priority)
{
    // 如果map中包含了该优先级，直接返回
    if (mStackView->contains(priority)) {
        return;
    }
    auto qmlLayer = mStackView->isEmpty() ? layerId : mStackView->last();
    mStackView->insert(priority, layerId);
    if (mStackView->size() > 1) {
        if (isLayerShown(qmlLayer)) {
            showStackViewTop();
        }
    } else {
        showStackViewTop();
    }
}

/*
 * 将指定的图层从列表中去除， 并且显示priority最大的layer
 */
void UiController::popFromStackView(int priority)
{
    if (!mStackView->contains(priority)) {
        return;
    }

    bool isTopLayerShown = isLayerShown(mStackView->last());
    mThemeManager->hideLayer(mStackView->value(priority));
    mStackView->remove(priority);
    if (isTopLayerShown) {
        showStackViewTop();
    }
}

/*
 * 显示priority最大的layer，并且隐藏其余的layer
 */
void UiController::showStackViewTop()
{
    if (mStackView->isEmpty()) {
        return;
    }

    auto views = mStackView->values();
    for (auto i = 0; i < views.size() - 1; ++i) {
        mThemeManager->hideLayer(views[i]);
    }
    if (!isLayerShown(mStackView->last())) {
        mThemeManager->showLayer(mStackView->last());
    }
}

/*
 *
 */
void UiController::refreshScreen()
{
    Window::instance()->update();
}

/*
 * 卸载当前主题
 */
void UiController::unloadCurrentTheme()
{
    // 隐藏当前的主题，之后的主题切换不用再次加载，不过可能内存占用的多？？
    hideCurrentTheme();
}

/*
 * 加载当前主题
 */
void UiController::loadCurrentTheme()
{
    setRemainContent("loadType", "wakeup");
    mStackView->clear();
    mThemeManager->loadThemeSync(mThemeManager->currentTheme()->objectName());  //同步加载
    mThemeManager->showMainScreen(); // 显示当前主题的主界面
}

/*
 *  隐藏当前主题
 */
void UiController::hideCurrentTheme()
{
    mStackView->clear();
    mThemeManager->currentTheme()->hideAll();
}

/*
 * 显示当前主题
 */
void UiController::showCurrentTheme()
{
    mStackView->clear();
    mThemeManager->currentTheme()->show();
}

/*
 * 后台加载其余主题
 */
void UiController::loadThemesBackground()
{
    mThemeManager->loadThemesBackground();
}

/*
 * 设置layer的显示策略
 */
void UiController::setLayerShowPolicy(const QString &layerId, Layer::ShowPolicy showPolicy)
{
    auto layer = mThemeManager->qmlLayer(layerId);
    layer->setShowPolicy(showPolicy);
}

/*
 * 设置剩余的内容
 */
void UiController::setRemainContent(const QString &layerId, const QVariant &content)
{
    mRemainContent[layerId] = content;
    emit remainContentChanged();
}


QVariant UiController::remainContent(const QString &key)
{
    return mRemainContent[key];
}

void UiController::setWindowBackgroundColor(const QColor &color)
{
    Window::instance()->setColor(color);
}

/*
 * 创建上下文属性
 */
std::shared_ptr<ContextProperty> UiController::createContextProperty(std::shared_ptr<CarUpdates> carUpdates,
                                                                     std::shared_ptr<CarUpdates> fakeCarUpdates,
                                                                     std::shared_ptr<MultiLanguage> multiLanguage,
                                                                     std::shared_ptr<MultiLanguage> fakeMultiLanguage)
{
    carUpdates->startCarUpdatesSendReceiveThread();
    auto contextProperties = std::make_shared<ContextProperty>("CarUpdates", "ML");
    contextProperties->setFakeCarUpdates(fakeCarUpdates);
    contextProperties->setTrueCarUpdates(carUpdates);
    contextProperties->addContextProperty("CarUpdates", fakeCarUpdates.get());

    contextProperties->setFakeMultiLanguage(fakeMultiLanguage);
    contextProperties->setTrueMultiLanguage(multiLanguage);
    contextProperties->addContextProperty("ML", fakeMultiLanguage.get());

    contextProperties->addContextProperty("UiController", this);
    contextProperties->addContextProperty("ThemeManager", mThemeManager);

    return contextProperties;
}

/*
 *
 */
std::shared_ptr<CarUpdates> UiController::createCarUpdates()
{
    auto carUpdates = std::make_shared<CarUpdates>(new CarUpdatesWorker);
    return carUpdates;
}

std::shared_ptr<CarUpdates> UiController::createFakeCarUpdates()
{
    return std::make_shared<CarUpdates>(nullptr);
}

std::shared_ptr<MultiLanguage> UiController::createMultiLanguage()
{
    return std::make_shared<MultiLanguage>();
}

std::shared_ptr<MultiLanguage> UiController::createFakeMultiLanguage()
{
    return std::make_shared<MultiLanguage>(true);
}

void UiController::registerQmlTypes()
{
//    int ret;
//     qmlRegisterType<RingCut>("RingCut", 1, 0, "RingCut");
//     qmlRegisterType<RingTex>("RingTex", 1, 0, "RingTex");
 /*
     // QML书写的QML类
     ret = qmlRegisterType(QUrl(QString("qrc:/Qml/CommonItem.qml")), "CommonItem", 1, 0, "CommonItem");
     if (ret == -1)
         qWarning() << "Fatal Error: Failed to register CommonItem";
 */
}

void UiController::loadFonts()
{

}

void UiController::loadFont(const QString &fontPath)
{
    QFile fontFile(fontPath);
    if (!fontFile.open(QIODevice::ReadOnly)) {
        qWarning() << "font file" << fontPath << "load fail";
        return;
    }

    // You can see the family names here
    //#define DEBUG_FAMILIES
#ifdef DEBUG_FAMILIES
    int loadedFontID = QFontDatabase::addApplicationFontFromData(fontFile.readAll());
    QStringList loadedFontFamilies = QFontDatabase::applicationFontFamilies(loadedFontID);
    std::for_each(loadedFontFamilies.begin(), loadedFontFamilies.end(),
                  [=] (QString fontFamily) { qDebug() << fontPath << " : " << fontFamily; });
#else
    QFontDatabase::addApplicationFontFromData(fontFile.readAll());
#endif

    fontFile.close();
}

void UiController::addTheme(std::shared_ptr<Theme> theme)
{
    mThemeManager->addTheme(theme);
}

void UiController::addTheme(std::shared_ptr<Theme> theme, qint32 startTime, qint32 incubateForTime)
{
    theme->incubationController()->setIncubationTime(startTime, incubateForTime);
    mThemeManager->addTheme(theme);
}

std::shared_ptr<Layer> UiController::addGlobalLayer(std::shared_ptr<ContextProperty> contextProperties, const QString &layerPath, const QString &layerId)
{
    return mThemeManager->addGlobalLayer(contextProperties, layerPath, layerId);
}

ThemeManager *UiController::themeManager()
{
    return mThemeManager;
}

/*
 * 开机，同步加载指定的主题
 */
void UiController::startWith(const QString &themeId)
{
    setRemainContent("loadType", "startup");
    mThemeManager->setCurrentTheme(themeId);
    mThemeManager->currentTheme()->create(); //调用当前主题的create函数。里面会去加载qml文件
    mThemeManager->currentTheme()->setHasCreated(true);

    // 开机后加载默认主题
    mThemeManager->loadThemeSync(themeId);  // 同步加载
    //mThemeManager->loadTheme(themeId);  // 半同步加载

    // 等待Splash进程的指令：显示界面
    UndeadMain::waitStartShow();

    // 显示本主题
    ThemeManager::instance()->handleSplashScreenFinished();
}

void UiController::switchThemeTo(const QString &themeId)
{
    setRemainContent("loadType", "switchTheme");

    mIsMenuShown = false;
    emit isMenuShownChanged();

    mStackView->clear();
    mThemeManager->switchTheme(themeId);
}

/*
 * 检查rootMenu的visible状态
 */
void UiController::updateRootMenuStatus(const QString &layerId, bool status)
{
    QString rootMenuId = mThemeManager->currentTheme()->getRootMenuId();
    if (rootMenuId != layerId) {
        return;
    }
    // 保存当前的rootMenuId
    mRootMenuId = layerId;

    // 菜单是否允许显示
    if (mIsMenuShown != status) {
        qDebug() << "Menu shown changed:" << mIsMenuShown << "-->" << status;
        mIsMenuShown = status;
        emit isMenuShownChanged();
    }
}



CARFOX_END_NAMESPACE

#include <QQmlContext>
#include <QQuickView>

#include "ThemeManager.hpp"
CARFOX_BEGIN_NAMESPACE



void ThemeManager::addTheme(std::shared_ptr<Theme> theme)
{
    auto themeId = theme->objectName();
    if (!mThemes.contains(themeId)) {
        mThemes[themeId] = theme;
    }
}

/*
 * 同步加载InstantShow，然后异步加载ManualShow
 */
void ThemeManager::loadTheme(const QString &themeId)
{
    if (!mThemes.contains(themeId)) {
        return;
    }

    // 首先加载global的layer
    for (auto &t : mGlobalLayers.values()) {
        if (!t->isLoaded()) {
            t->loadSync();
        }
    }
    auto theme = mThemes[themeId];
    theme->load();
}

/*
 * 同步加载 , 切换主题的时候调用
 */
void ThemeManager::loadThemeSync(const QString &themeId)
{
    if (!mThemes.contains(themeId)) {
        return;
    }

    auto theme = mThemes[themeId];
    // 每个主题必须保证app层create过
    if (!theme->hasCreated()) {
        theme->create();
        theme->setHasCreated(true);
    }

    // 如果该主题加载过了(主题的所有layer都加载完毕)，就不用再加载
    if (!theme->isLoaded()) {
        theme->loadSync();
    }

    // 全局的layer加载
    for (auto &t : mGlobalLayers.values()) {
        if (!t->isLoaded()) {
            t->loadSync();
        }
    }

    // 显示
    auto layers = mGlobalLayers.values();
    QList<std::shared_ptr<Layer>> showOnLoadedLayers;
    std::copy_if(layers.begin(), layers.end(), std::back_inserter(showOnLoadedLayers),
                 [](std::shared_ptr<Layer> layer){ return layer->showPolicy() == Layer::ShowOnLoaded;});
    for (auto &layer : showOnLoadedLayers) {
        layer->show();
    }

    emit currentTheme()->isLoadedChanged();  // 这个会发射到qml层
}

/*
 * 设置准备好了,上层app会调用
 */
void ThemeManager::setReady(bool isReady)
{
    mReady = isReady;
    if (mReady) {
        emit ready();
    }
}

/*
 * 设置主题为当前主题，切换主题的时候使用
 */
void ThemeManager::setCurrentTheme(const QString &themeId)
{
    if (themeId == mCurrentThemeId) {
        return;
    }

    mCurrentThemeId = themeId;
    emit currentThemeChanged(); // 发射到qml层
}

/*
 *  显示图层
 */
void ThemeManager::showLayer(const QString &layerId)
{
    if (mGlobalLayers.contains(layerId)) {
        mGlobalLayers[layerId]->show();;
    }
    else {
        currentTheme()->showLayer(layerId);
    }
}

/*
 *  隐藏图层
 */
void ThemeManager::hideLayer(const QString &layerId)
{
    if (mGlobalLayers.contains(layerId)) {
        mGlobalLayers[layerId]->hide();
    }
    else {
        currentTheme()->hideLayer(layerId);
    }
}

/*
 *  卸载当前主题指定的layer
 */
void ThemeManager::unloadLayer(const QString &layerId)
{
    if (mGlobalLayers.contains(layerId)) {
        mGlobalLayers[layerId]->unLoad();
    }
    else {
        currentTheme()->unloadLayer(layerId);
    }
}

/*
 * 重要函数： 后台异步加载其他主题
 */
void ThemeManager::loadThemesBackground()
{
    for (auto &t : mThemes.values()) {
        // 首先确保当前主题加载完毕
        if (!mThemes[mCurrentThemeId]->isLoaded()) {
            t = mThemes[mCurrentThemeId];
        }
        if (!t->hasCreated()) {
            t->create();
            t->setHasCreate(true);
        }
        if (!t->loaded()) {
            mLoadingTheme = t.get();
            // 等待本主题后台加载完毕 , 然后
            connect(t.get(), &Theme::allLayerLoaded(), this, &ThemeManager::onThemeLoaded);
            t->loadAsync();
            return;  // 这里加载一次
        }
    }
}

/*
 * Splash screen结束后，显示主界面
 */
void ThemeManager::handleSplashScreenFinished()
{
    qDebug() << "now splash screen finished.";
    Window::instance()->setVisible(true);
    showMainScreen();
}

/*
 * 全局的layer是否加载完毕
 */
bool ThemeManager::isGlobalLayersLoaded()
{
    auto layers = mGlobalLayers.values();
    QList<std::shared_ptr<Layer>> unloadedLayers;
    std::copy_if(layers.begin(), layers.end(), std::back_inserter(unloadedLayers),
                     [](std::shared_ptr<Layer> layer){return !layer->isLoaded();});
    return unloadedLayers.size() == 0 ? true : false;
}

/*
 * 返回当前主题
 */
Theme *ThemeManager::currentTheme()
{
    return mThemes[mCurrentThemeId].get();
}

/*
 * 返回当前主题的layer。 可能为null
 */
std::shared_ptr<Layer> ThemeManager::qmlLayer(const QString &layerId)
{
    if (mGlobalLayers.contains(layerId)) {
        return mGlobalLayers[layerId];
    }
    else {
        return currentTheme()->layer(layerId);
    }
}

/*
 * 添加全局的layer
 */
std::shared_ptr<Layer> ThemeManager::addGlobalLayer(std::shared_ptr<ContextProperty> contextProperties, const QString &layerPath, const QString &layerId)
{
    auto layer = std::make_shared<Layer>(contextProperties, layerPath, layerId);
    if (!mGlobalLayers.contains(layerId)) {
        mGlobalLayers[layerId] = layer;
    }
    return layer;
}

/*
 * 重要函数： 切换主题
 */
void ThemeManager::switchTheme(const QString &themeId)
{
    mPreThemeId = mCurrentThemeId;
    if (!mThemes.contains(themeId) || themeId == mCurrentThemeId) {
        return;
    }

    mIsSwitchingTheme = true;
    Window::instance()->engine()->clearComponentCache();
    // 同步加载待显示的主题
    loadThemeSync(themeId);
    // 隐藏之前的主题
    auto theme = mThemes[mPreThemeId];
    theme->hideAll();

    //显示前才改变当前主题的Id
    setCurrentTheme(themeId);
    showMainScreen();
}

/*
 * 同步加载全局的layer
 * 暂时没用
 */
void ThemeManager::loadGlobal()
{
    if (sender()) {
        sender()->disconnect(this);
    }

    for(auto &t : mGlobalLayers.values()) {
        if (!t->isLoaded()) {
            t->loadSync();
            break;
        }
    }
    auto layers = mGlobalLayers.values();

    QList<std::shared_ptr<Layer>> showOnLoadedLayers;
    std::copy_if(layers.begin(), layers.end(), std::back_inserter(showOnLoadedLayers),
                 [](std::shared_ptr<Layer> layer){return layer->showPolicy() == Layer::ShowOnLoaded;});
    for (auto &layer : showOnLoadedLayers) {
        if (layer->isLoaded()) {
            layer->show();
        }
    }

    if (isGlobalLayersLoaded()) {
        emit currentTheme()->isLoadedChanged();
    }

}

/*
 * 重要函数： 显示当前主题的主界面
 */
void ThemeManager::showMainScreen()
{
    // 如果没有准备好，那就等准备好了在调用
    if (!mReady) {
        connect(this, &ThemeManager::ready, this, &ThemeManager::showMainScreen,
                static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
        return;
    }
    else {
        disconnect(this, &ThemeManager::ready, this, &ThemeManager::showMainScreen);
    }

    if (!mThemes.contains(mCurrentThemeId)) {
        return;
    }

    auto current = mThemes[mCurrentThemeId];
    qWarning() << "Now, Let's show screen!";

    //当前状态为IGNON的时候，直接显示主界面中所有的InstantShow类型的layer，否则显示休眠界面
    if (current->contextProperty()->trueCarUpdates()->property("igOn").toBool()) {
        current->show();
    }
    else {
        emit showDormancy(); //  发射休眠界面的信号
    }

}

ThemeManager::ThemeManager()
{
    connect(this, &ThemeManager::currentThemeChanged, this, &ThemeManager::unloadTheme);
}
/*
 *  处理主题加载改变的逻辑
 *  暂时没有用到
 */
void ThemeManager::handleThemeLoadedChanged()
{
    if (currentTheme()->isLoaded()) {
        disconnect(currentTheme(), &Theme::isLoadedChanged, this, &ThemeManager::handleThemeLoadedChanged);
        mIsSwitchingTheme = false;
        emit currentThemeLoaded();
    }
}

/*
 *  一个主题后台加载完毕
 */
void ThemeManager::onThemeLoaded()
{
    // 如果某一个主题加载了，就不再接收信号
    if (mLoadingTheme) {
        disconnect(mLoadingTheme, &Theme::allLayersLoaded, this, &ThemeManager::onThemeLoaded);
    }
    loadThemesBackground();
}

/*
 *  卸载主题, 当主题改变的时候会调用到
 */
void ThemeManager::unloadTheme()
{
    if (mPreThemeId.isEmpty()) {
        return ;
    }

    mThemes[mPreThemeId]->hideAll();

    if (!mThemes.contains(mPreThemeId)) {
        return;
    }

    auto theme = mThemes[mPreThemeId];
    theme->unload();
}

CARFOX_END_NAMESPACE

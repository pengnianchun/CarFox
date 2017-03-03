#include <QList>
#include <QQuickItem>
#include <QCoreApplication>

#include "Theme.hpp"
#include "ThemeManager.hpp"
CARFOX_BEGIN_NAMESPACE

Theme::Theme(std::shared_ptr<ContextProperty> contextProperties, const QString &themeId)
    : mContextProperties(contextProperties)
{
    Q_ASSERT(!themeId.isEmpty());
    setObjectName(themeId);
}

/*
 * 隐藏该主题中所有的layer
 */
void Theme::hideAll()
{
    for (auto &s: mLayers.values()) {
        s->hide();
    }
}

/*
 * 该主题是否被创建过
 */
bool Theme::hasCreated()
{
    return mHasCreated;
}
void Theme::setHasCreated(bool created)
{
    mHasCreated = created;
}

/*
 *  该主题中了Layer是否全部加载完毕
 */
bool Theme::isLoaded()
{
    return mLoadProgressStatus == Theme::AllLayerLoaded && ThemeManager::instance()->isGlobalLayersLoaded();
}

bool Theme::isLoading()
{
    return mLoadProgressStatus > Theme::NoLayerLoaded && !isLoaded();
}

/*
 *  异步加载该主题中所有的layer
 */
void Theme::loadAsync()
{
    qDebug() << "loading theme full asynchronous: " << objectName() << ", cnt: " << mLayers.count();
    mLoadProgressStatus = Theme::LoadStarted;
    connect(this, &Theme::showOnLoadedLayersLoaded, this, &Theme::loadManualShowLayers, static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
    loadAllLayers();
}

/*
 * 同步加载该主题中所有的layer
 */
void Theme::loadSync()
{
    qDebug() << "loading theme full synchronous: " << objectName() << ", cnt: " << mLayers.count();
    if (!this->isLoaded()) { // 如果没有完全加载完毕
        for (auto &layer : mLayers.values()) {
            layer->loadSync();
        }
    }
    mLoadProgressStatus = Theme::AllLayerLoaded;
    emit allLayerLoaded();
    emit isLoadedChanged();
}

/*
 *  同步加载该主题中InstantShow类型的qml， 异步加载ManualShow类型的qml, 通过ThemeManager的loadTheme掉进来
 */

void Theme::load()
{
    qDebug() << "loading theme part asynchronous: " << objectName() << ", cnt: " << mLayers.count();
    mLoadProgressStatus = Theme::LoadStarted;
    // 首先将InstantShow类型的qml同步加载
    loadInstantShowLayers();
    // 然后异步加载剩余的
    loadAsync();
}

/*
 *  卸载主题
 */

void Theme::unload()
{
    for (auto &layer : mLayers.values()) {
        layer->unload();
    }
    mLoadProgressStatus = Theme::NoLayerLoaded;
}

/*
 *  卸载主题中制定的layer
 */
void Theme::unloadLayer(const QString &layerId)
{
    if (mLayers.contains(layerId)) {
        mLayers[layerId]->unload();
    }
}

/*
 *  显示指定的layer， 如果找不到，打印错误信息
 *  ThemeManager 的 showLayer会调用进来
 */
void Theme::showLayer(const QString &layerId)
{
    if (mLayers.contains(layerId)) {
        mLayers[layerId]->show();
    }
    else {
        qCritical() << "WARNING:" << objectName() << "::showLayer()," << layerId << " not exists..";
    }
}

/*
 * 隐藏指定的layer， 如果找不到，打印错误信息
 */
void Theme::hideLayer(const QString &layerId)
{
    if (mLayers.contains(layerId)) {
        mLayers[layerId]->hide();
    }
    else {
        qCritical() << "WARNING:" << objectName() << "::hideLayer()," << layerId << " not exists..";
    }
}

void Theme::stopAsyncLoad()
{

}

/*
 *  得到该主题的根菜单的ID
 */
QString Theme::getRootMenuId()
{
    return mRootMenuId;
}

Theme::LoadProgressStatus Theme::loadProgressStatus()
{
    return mLoadProgressStatus;
}

std::shared_ptr<ContextProperty> Theme::contextProperty()
{
    return mContextProperties;
}

std::shared_ptr<Layer> Theme::layer(const QString &layerId)
{
    if (mLayers.contains(layerId)) {
        return mLayers[layerId];
    }
    else {
        qCritical() << "WARNING:" << layerId() << " not exists..";
        return nullptr;
    }
}

std::shared_ptr<IncubationController> Theme::incubationController()
{
    return mIncubationController;
}

/*
 * 显示该出题， 如果该主题的layer没有全部加载完毕，立即加载，并且显示所有的InstantShow Layer ,
 */
void Theme::show()
{
    for (auto &layer : mLayers.values()) {
        if (layer->showPolicy() == Layer::InstantShow) {
            layer->show();
        }

        auto layerItem = layer->qmlLayerItem();
        // 找到根菜单，并记录下来
        if (!layerItem->property("rootMenu").isValid()) {
            continue;
        }
        bool isRootMenu = layerItem->property("rootMenu").toBool();
        if (!isRootMenu) {
            continue;
        }
        mRootMenuId = layer->objectName();
        qDebug() << "--->Found rootMenu" << mRootMenuId;
    }

}

/*
 *  添加qmlLayer，
 */
std::shared_ptr<Layer> Theme::addLayer(const QString &layerPath, const QString &layerId)
{
    auto layer = std::make_shared<Layer>(mContextProperties, layerPath, layerId);
    addLayer(layer);
    return layer;
}

/*
 * 添加qml layer ， 同时指定了showpolicy
 */
void Theme::addLayer(const QString &layerPath, const QString &layerId, Layer::ShowPolicy policy)
{
    addLayer(layerPath, layerId)->setShowPolicy(policy);
}

/*
 * 将要加载的qml添加到列表中
 */
void Theme::addLayer(const std::shared_ptr<Layer> layer)
{
    auto layerId = layer->objectName();
    if (!mLayers.contains(layerId)) {
        layer->setContextProperty(objectName(), this);
        mLayers[layerId] = layer;
        mOrderLayers.push_back(layer);
    }
    else {
        // FIXME: 临时解决方案
        qCritical() << "Fatal Error: Layer" << layerId << "already exist...";
        while (1);
    }
}

/*
 * 异步加载当前主题所有的layer
 */
void Theme::loadAllLayers()
{
    QList<std::shared_ptr<Layer>> layers;
    std::copy(mOrderLayers.begin(), mOrderLayers.end(), std::back_inserter(layers));
    if (layers.size() < 1) {
        setShowOnLoadedLayersLoaded();
        return;
    }

    for (auto i = 0; i < layers.size() - 1; ++i) {
        auto currentLayer = layers[i];
        auto nextLayer = layers[i + 1];
        // 每一个QML加载完毕，就自动调用下一个QmlLayer的loadAsync()加载
        connect(currentLayer.get(), &Layer::asyncLoaded, nextLayer.get(), &Layer::loadAsync);
    }
    connect(layers.last().get(), &Layer::asyncLoaded, this, &Theme::onAllLayersLoaded, static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));

    // 开始加载第一个QML
    layers[0]->loadAsync(this);
}

/*
 * 将当前主题中InstantShow类型的qml加载进来
 */
void Theme::loadInstantShowLayers()
{
    QList<std::shared_ptr<Layer>> instantShowLayers;
    std::copy_if(mOrderLayers.begin(), mOrderLayers.end(), std::back_inserter(instantShowLayers),
                 [](std::shared_ptr<Layer> layer) { return layer->showPolicy() == Layer::InstantShow;});
    if (instantShowLayers.size() < 1) { //如果没有instantshowlayer，就设置加载完成
        setInstantShowLayersLoaded();
        return;
    }
    for (auto i = 0; i < instantShowLayers.size() - 1; ++i) {
        auto currentLayer = instantShowLayers[i];
        currentLayer->loadSync();
    }
}

void Theme::loadShowOnLoadedLayers()
{

}

/*
 * 加载ManualShow类型的layer , 异步加载
 */
void Theme::loadManualShowLayers()
{
    disconnect(this, &Theme::showOnLoadedLayersLoaded, this, &Theme::loadManualShowLayers);

    QList<std::shared_ptr<Layer>> manualShowLayers;
    std::copy_if(mOrderLayers.begin(), mOrderLayers.end(), std::back_inserter(manualShowLayers),
                     [](std::shared_ptr<Layer> layer){return layer->showPolicy() == Layer::ManualShow;});
    if (manualShowLayers.size() < 1) {
        setManualShowLayersLoaded();
        return;
    }

    //建立连接
    for (auto i = 0; i < manualShowLayers.size() - 1; ++i) {
        auto currentLayer = manualShowLayers[i];
        auto nextLayer = manualShowLayers[i + 1]; // 有可能是null
        connect(currentLayer.get(), &Layer::loaded, nextLayer.get(), &Layer::loadQml);
    }

    connect(manualShowLayers.last().get(), &Layer::loaded, this, &Theme::setManualShowLayersLoaded,
            static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
    manualShowLayers[0]->loadAsync(this);
}

void Theme::onAllLayersLoaded()
{
    qDebug() << "Theme: " << objectName() << "Loaded ok.";
    mLoadProgressStatus = Theme::AllLayerLoaded;
    emit allLayerLoaded();
    emit isLoadedChanged();
}

/*
 * instantShow类型的layer加载完毕
 */
void Theme::setInstantShowLayersLoaded()
{
    if (sender()) {
        disconnect(static_cast<QmlLayer *>(sender()), &QmlLayer::loaded, this, &Theme::setInstantShowLayersLoaded);
    }
    mLoadProgressStatus = Theme::InstantShowLayersLoaded;
    emit instantLayersLoaded();
}

void Theme::setShowOnLoadedLayersLoaded()
{
    qDebug() << "setShowOnLoadedLayersLoaded";
    if (sender()) {
        disconnect(static_cast<QmlLayer *>(sender()), &QmlLayer::loaded, this, &Theme::setShowOnLoadedLayersLoaded);
    }
    mLoadProgressStatus = Theme::ShowOnLoadedLayersLoaded;
    emit showOnLoadedLayersLoaded();
}

void Theme::setManualShowLayersLoaded()
{
    if (sender()) {
        disconnect(static_cast<QmlLayer *>(sender()), &QmlLayer::loaded, this, &Theme::setManualShowLayersLoaded);
    }

    mLoadProgressStatus = Theme::AllLayersLoaded;
    emit allLayersLoaded();
    emit isLoadedChanged();
    qDebug() << "signal: " << objectName() << "::allLayersLoaded";
}


CARFOX_END_NAMESPACE






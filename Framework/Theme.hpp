#pragma once

#include "Layer.hpp"
#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

/*
 * 重要类： 主题类。
 * APP层需要继承该类。必须重写create函数
 */
class Theme : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isLoaded READ isLoaded  NOTIFY isLoadedChanged)

public:
    // 主题的加载状态, 与qml的显示策略有关系
    enum LoadProgressStatus {
        NoLayerLoaded = 0,          // 完全没有加载
        LoadStarted,                // 开始加载
        InstantShowLayersLoaded,    // 立即显示的layer的加载完毕， 代表的同步加载
        ShowOnLoadedLayersLoaded,   // 需要显示时加载的layer的加载完毕，代表的异步加载
        AllLayersLoaded              // 所有layer加载完毕
    };

    // themeId 代表 theme的名称
    Theme(std::shared_ptr<ContextProperty> contextProperties, const QString &themeId);

    // 隐藏theme中所有的layer
    void hideAll();

    // 纯虚函数, 在里面添加layer
    virtual void create() = 0;
    bool hasCreated();
    void setHasCreated(bool created);

    Q_INVOKABLE bool isLoaded();
    bool isLoading();

    void load();
    void loadAsync();
    void loadSync();
    void unload();
    void unloadLayer(const QString &layerId);
    void showLayer(const QString &layerId);
    void hideLayer(const QString &layerId);
    void stopAsyncLoad();

    QString getRootMenuId();

    LoadProgressStatus loadProgressStatus();
    std::shared_ptr<ContextProperty> contextProperty();
    std::shared_ptr<Layer> layer(const QString &layerId);
    std::shared_ptr<IncubationController> incubationController();

signals:
    void instantShowLayersLoaded();
    void showOnLoadedLayersLoaded();
    void allLayersLoaded();
    void isLoadedChanged();

public slots:
    void show();

protected:
    std::shared_ptr<Layer> addLayer(const QString &layerPath, const QString &layerId);
    void addLayer(const QString &layerPath, const QString &layerId, Layer::ShowPolicy policy);

private:
    void addLayer(const std::shared_ptr<Layer> layer);
    void loadAllLayers();

private slots:
    void loadInstantShowLayers();
    void loadShowOnLoadedLayers();
    void loadManualShowLayers(); //当showOnLoadedLayersLoaded发射时调用
    void onAllLayersLoaded();

    void setInstantShowLayersLoaded();
    void setShowOnLoadedLayersLoaded();
    void setManualShowLayersLoaded();

private:
    QHash<QString, std::shared_ptr<Layer>> mLayers;
    QVector<std::shared_ptr<Layer>> mOrderLayers; //Make qml layers loaded in added order
    LoadProgressStatus mLoadProgressStatus = Theme::NoLayerLoaded;
    std::shared_ptr<ContextProperty> mContextProperties;
    std::shared_ptr<IncubationController> mIncubationController = std::make_shared<IncubationController>();
    bool mHasCreated = false;

    QString mRootMenuId;

};

CARFOX_END_NAMESPACE

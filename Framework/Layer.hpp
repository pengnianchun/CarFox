#pragma once

#include <QQmlContext>
#include <QQmlComponent>

#include "Window.hpp"
#include "Incubator.hpp"
#include "ContextProperty.hpp"
#include "IncubationController.hpp"
#include "Global.hpp"
CARFOX_BEGIN_NAMESPACE

class Theme;

/*
 * 超级重要类： 代表一个qml。
 */
class Layer : public QObject
{
    Q_OBJECT
public:
    // QML 被加载的状态
    enum QmlLoadStatus {
        Loading = 0,
        Unloaded,
        Loaded
    };

    // QML 的显示策略
    enum ShowPolicy {
        InstantShow = 0, // 立即显示
        ShowOnLoaded,    // 加载的时候显示
        ManualShow       // 手动显示
    };

public:
    Layer(std::shared_ptr<ContextProperty> contextProperty,
          const QString &qmlUrl, const QString &layerId);

    //同步加载
    void loadSync();
    void unload();

    void setContextProperties(ContextPropertyHash contextPropertyHash);
    void setContextProperty(const QString &contextName, QObject *object);


public:
    inline const QString &qmlUrl() const
    {
        return mQmlUrl;
    }
    inline ShowPolicy showPolicy()
    {
        return mShowPolicy;
    }
    inline QmlLoadStatus loadStatus()
    {
        return mQmlLoadStatus;
    }
    inline std::shared_ptr<QQuickItem> qmlLayerItem()
    {
        return mLayerItem;
    }
    inline void setShowPolicy(ShowPolicy showPolicy)
    {
        mShowPolicy = showPolicy;
    }
    inline bool isLoaded()
    {
        return Layer::Loaded == mQmlLoadStatus;
    }

public slots:
    void show();
    void hide();
    void loadQml(); // 如果一个qml加载完毕，会调用下一个qml的加载
    void loadAsync(Theme *theme); //暂时不使用智能指针

signals:
    void loaded(); //加载完毕信号
    void asyncLoaded(Theme *theme);

private slots:
    void handleQmlLoadStatusChanged(QQmlIncubator::Status status);

private:
    void loadAsyncInternal();

private:
    std::shared_ptr<ContextProperty> mContextProperties;
    QString mQmlUrl;
    QQmlEngine *mEngine = Window::instance()->engine();
    std::shared_ptr<Incubator> mIncubator = std::make_shared<Incubator>();
    std::shared_ptr<QQmlComponent> mComponent = std::make_shared<QQmlComponent>(mEngine, QUrl(mQmlUrl));
    std::shared_ptr<QQmlContext> mContext = std::make_shared<QQmlContext>(Window::instance()->rootContext());
    std::shared_ptr<QQuickItem> mLayerItem;

    QmlLoadStatus mQmlLoadStatus = Layer::Unloaded;
    ShowPolicy mShowPolicy = Layer::ManualShow;

    Theme *mParentTheme;
};

CARFOX_END_NAMESPACE

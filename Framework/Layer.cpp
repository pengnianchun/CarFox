#include <QQuickItem>

#include "Layer.hpp"
#include "ThemeManager.hpp"

CARFOX_BEGIN_NAMESPACE

Layer::Layer(std::shared_ptr<ContextProperty> contextProperty, const QString &qmlUrl, const QString &layerId)
    : mContextProperties(contextProperty)
    , mQmlUrl(qmlUrl)
{
    setObjectName(layerId);
    setContextProperties(mContextProperties->contextProperties());
}

/*
 * 重要函数： 同步加载layer
 * 线程不安全
 */
void Layer::loadSync()
{
    // 如果加载过了，直接return
    if (this->isLoaded()) {
        return;
    }

    mParentTheme = ThemeManager::instance()->currentTheme();

    mEngine->setIncubationController(nullptr);
    mQmlLoadStatus = Layer::Loading;
    mLayerItem.reset(qobject_cast<QQuickItem *>(mComponent->create(mContext.get())));
    if (mLayerItem) {
        mQmlLoadStatus = Layer::Loaded;
        //  如果这个layer是菜单项,设置qml的menuLayerId
        if (mLayerItem->property("menuLayerId").isValid()) {
            mLayerItem->setProperty("menuLayerId", objectName());
        }
        if (mLayerItem->property("me").isValid()) {
            mLayerItem->setProperty("me", objectName());
        }
        //qDebug() << mQmlUrl << " is loaded syncly....";
        // AsyncLoad中的Layer被强制SyncLoad，必须通知AsyncLoader，否则其余的Layer无法被load
        if (mParentTheme)
            emit asyncLoaded(mParentTheme);
    } else {
        mQmlLoadStatus = Layer::Unloaded;
        if (mComponent->isError()) {
            qCritical() << mQmlUrl + " qml error: " << mComponent->errorString();
        }
    }
}

/*
 * 卸载Layer
 */
void Layer::unload()
{
    if (mQmlLoadStatus == Layer::Unloaded) {
        return;
    }

    if (mQmlLoadStatus == Layer::Loading) {
        disconnect(mIncubator.get(), &Incubator::qmlIncubatorStatusChanged,
                   this, &Layer::handleQmlLoadStatusChanged);
        mIncubator->forceCompletion();
        ThemeManager::instance()->currentTheme()->incubationController()->stop();
    }
    qDebug() << mQmlUrl << " is unloaded";
    mLayerItem.reset();
    mQmlLoadStatus = Layer::Unloaded;
}

/*
 *
 */
void Layer::setContextProperties(ContextPropertyHash contextPropertyHash)
{
    auto i = contextPropertyHash.constBegin();
    while (i != contextPropertyHash.constEnd()) {
        mContext->setContextProperty(i.key(), i.value());
        ++i;
    }
}

void Layer::setContextProperty(const QString &contextName, QObject *object)
{
    mContext->setContextProperty(contextName, object);
}

/*
 * 显示一个layer，如果此时还未被加载， 直接loadSync
 */
void Layer::show()
{
    if (!isLoaded()) {
        loadSync();
    }
    qDebug() << "show layer" << objectName();
    // 可见的Layer接收carMsg信号
    mContext->setContextProperty(mContextProperties->carMsgName(), mContextProperties->trueCarMsg().get());
    mContext->setContextProperty(mContextProperties->multiLanguageName(), mContextProperties->trueMultiLanguage().get());

    mLayerItem->setParentItem(Window::instance()->contentItem()); //设置父级
    mLayerItem->setVisible(true);
    qDebug() << "Layer::show : " << mContextProperties->carMsgName();
}

/*
 * 隐藏一个layer
 */
void Layer::hide()
{
    qDebug() << "Hide layer" << objectName();
    if (showPolicy() == Layer::ManualShow) {
        disconnect(this, &Layer::loaded, this, &Layer::show);
    }
    if (!mLayerItem) {
        return;
    }

    mLayerItem->setVisible(false);
    mLayerItem->setParentItem(nullptr);
    // 被隐藏的Layer不接收carStatus信号
    mContext->setContextProperty(mContextProperties->carMsgName(), mContextProperties->fakeCarMsg().get());
    mContext->setContextProperty(mContextProperties->multiLanguageName(), mContextProperties->fakeMultiLanguage().get());
}

/*
 * 加载一个qml
 */
void Layer::loadQml()
{
    if (mQmlLoadStatus != Layer::Unloaded) {
        if (mQmlLoadStatus == Layer::Loaded) {
            emit loaded();
        }
        return;
    }
    if (this->isLoaded()) {
        return;
    }

    if (sender()) {
        sender()->disconnect(this);
    }
    if (mShowPolicy == Layer::InstantShow) {
        loadSync(); //同步加载
    }
    else {
        qDebug() << "loadQml:" << mQmlUrl;
        ThemeManager::instance()->currentTheme()->incubationController()->start();
        mEngine->setIncubationController(ThemeManager::instance()->currentTheme()->incubationController().get());
        mQmlLoadStatus = Layer::Loading;
        mComponent->create(*mIncubator.get(), mContext.get(), mContext.get());
        if (mComponent->isError()) {
            qCritical() << mQmlUrl + " qml error: " << mComponent->errorString();
        }

        // 当前QML异步加载完毕后，发个消息，以便加载下一个
        connect(mIncubator.get(), &Incubator::qmlIncubatorStatusChanged,
                this, &Layer::handleQmlLoadStatusChanged, static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
    }
}

/*
 * 异步加载layer
 */
void Layer::loadAsync(Theme *theme)
{
    mParentTheme = theme;
    loadAsyncInternal();
}

/*
 * 异步加载时，如果状态发生变化，回调这个函数
 */
void Layer::handleQmlLoadStatusChanged(QQmlIncubator::Status status)
{
    if (sender()) {
            sender()->disconnect(this);
        }

        if (status == QQmlIncubator::Ready) {
            mLayerItem.reset(qobject_cast<QQuickItem *>(mIncubator->object()));
    #ifndef Q_PROCESSOR_ARM
            if (!mLayerItem) {
                if (!QString(typeid(mLayerItem).name()).contains("QQuickItem")) {
                    qDebug() << "Error:" << mQmlUrl << "must have an 'Item' as root!";
                } else if (!(mIncubator->object())) {
                    qDebug() << mQmlUrl << "is loaded, but the item is null.";
                } else {
                    qDebug() << mQmlUrl << "cannot convert to QQuickItem.";
                }
            }
    #endif
            if (mLayerItem->property("menuLayerId").isValid()) {
                mLayerItem->setProperty("menuLayerId", objectName());
            }
            if (mLayerItem->property("me").isValid()) {
                mLayerItem->setProperty("me", objectName());
            }
            //ThemeManager::instance()->currentTheme()->loaderController()->stop();
            mParentTheme->incubationController()->stop();
            mQmlLoadStatus = Layer::Loaded;
            //qDebug() << mQmlUrl << " is loaded";
            emit asyncLoaded(mParentTheme);
        }
}

void Layer::loadAsyncInternal()
{
    if (sender()) {
        sender()->disconnect(this);
    }

    if (mQmlLoadStatus != Layer::Unloaded) {
        if (mQmlLoadStatus == Layer::Loaded) {
            qDebug() << "All layers loaded: objectName: " << objectName()
                     << " ParentTheme objectName: "<< mParentTheme->objectName();
            emit asyncLoaded(mParentTheme);
        }
        return;
    }

    //qDebug() << "loadLayerAsync()" << objectName() << mParentTheme;
    if (!mParentTheme) return;

    mParentTheme->incubationController()->start();
    mEngine->setIncubationController(mParentTheme->incubationController().get());
    mQmlLoadStatus = Layer::Loading;

    mComponent->create(*mIncubator.get(), mContext.get(), mContext.get());
    if (mComponent->isError()) {
        qCritical() << mQmlUrl + " qml error: " << mComponent->errorString();
    }

    // 当前QML异步加载完毕后，发个消息，以便加载下一个
    connect(mIncubator.get(), &Incubator::qmlIncubatorStatusChanged,
            this, &Layer::handleQmlLoadStatusChanged, static_cast<Qt::ConnectionType>(Qt::UniqueConnection | Qt::DirectConnection));
}



CARFOX_END_NAMESPACE

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

}



CARFOX_END_NAMESPACE

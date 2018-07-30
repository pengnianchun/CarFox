#include "Window.hpp"

CARFOX_BEGIN_NAMESPACE

Window::Window()
{
    qCDebug(Framework);
    setDefaultAlphaBuffer(true);
    setClearBeforeRendering(true);
#ifdef Q_PROCESSOR_ARM
    setWindowState(Qt::WindowFullScreen);
#endif
    setColor(QColor(Qt::black)); // QColor(Qt::transparent)
}

Window::~Window()
{
    qCDebug(Framework);
}

CARFOX_END_NAMESPACE

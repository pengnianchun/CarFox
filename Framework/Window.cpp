
#include "Window.hpp"

CARFOX_BEGIN_NAMESPACE

Window::Window()
{
    setDefaultAlphaBuffer(true);
    setClearBeforeRendering(true);
#ifdef Q_PROCESSOR_ARM
    setWindowState(Qt::WindowFullScreen);
#endif
//    setColor(QColor(Qt::transparent));
    setColor(QColor(Qt::black));
}

Window::~Window()
{

}

CARFOX_END_NAMESPACE

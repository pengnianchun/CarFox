
#include "Window.hpp"

CARFOX_BEGIN_NAMESPACE

Window::Window()
{
    setDefaultAlphaBuffer(true);
    setClearBeforeRendering(true);
#ifdef Q_PROCESSOR_ARM
    setWindowState(Qt::WindowFullScreen);
#endif
    setColor(QColor(Qt::transparent));
}

Window::~Window()
{

}



CARFOX_END_NAMESPACE

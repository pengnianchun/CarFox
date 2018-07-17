#include <QGuiApplication>
#include <Global.hpp>
//#include <CarFox/Splash.hpp>
#include <UndeadMain.hpp>
#include <ThemeManager.hpp>
#include "CustomUiController.hpp"

#include <QCoreApplication>
#include <QStringList>
#include <QFontDatabase>
#include <QFont>
#include <QDebug>
#include <QtGlobal>

#if defined(Q_PROCESSOR_ARM)
#include <unistd.h>
#include <syslog.h>
#include <execinfo.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <fcntl.h>

#define MXCFB_SET_GBL_ALPHA     _IOW('F', 0x21, struct mxcfb_gbl_alpha)
struct mxcfb_gbl_alpha {
    int enable;
    int alpha;
};

void initfb() {
    mxcfb_gbl_alpha alpha;
    int fd_fb = open("/dev/fb1", O_RDWR);
    if (fd_fb < 0) {
        perror(__func__);
        return;
    }
    //Disable global alpha since we need Pixel Alpha
    alpha.enable = 0;
    alpha.alpha = 0xff;
    ioctl(fd_fb, MXCFB_SET_GBL_ALPHA, &alpha);
    close(fd_fb);
}

void initEnv() {
    initfb();
    setenv("QT_NO_FT_CACHE","1",1);
    setenv("QT_QPA_EGLFS_FB","/dev/fb1",1);
    setenv("QML_USE_GLYPHCACHE_WORKAROUND","1",1);
}
#endif

int main(int argc, char *argv[]) {
#if defined(Q_PROCESSOR_ARM)
    initEnv();
#endif

    std::shared_ptr<QGuiApplication> app = std::make_shared<QGuiApplication>(argc, argv);
    std::unique_ptr<CustomUiController> uiController(new CustomUiController(1440, 540, false));
    uiController->setReleaseVersion("v1.0.0");
    uiController->start();

    return app->exec();
}

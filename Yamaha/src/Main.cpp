#include <QGuiApplication>
#include <QCoreApplication>
#include <QStringList>
#include <QFontDatabase>
#include <QFont>
#include <QtGlobal>
#include <QDebug>

#include "Global.hpp"
#include "UndeadMain.hpp"
#include "ThemeManager.hpp"
#include "CustomUiController.hpp"

Q_LOGGING_CATEGORY(Framework, "Framework")
Q_LOGGING_CATEGORY(Yamaha, "Yamaha")

#if defined(Q_PROCESSOR_ARM)
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <syslog.h>
#include <execinfo.h>
#include <sys/ioctl.h>

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

    qputenv("QT_NO_FT_CACHE", "1");
    qputenv("QT_QPA_EGLFS_FB", "/dev/fb1");
    qputenv("QML_USE_GLYPHCACHE_WORKAROUND", "1");

    qputenv("FB_MULTI_BUFFER", "3");
}
#endif

int main(int argc, char *argv[]) {

    qSetMessagePattern("%{time [yyyyMMdd hh:mm:ss.zzz]} %{function}@%{line} %{type}: %{message}");

    qCWarning(Yamaha, "APP: %s", qApp->applicationName().toStdString().c_str());
    qCWarning(Yamaha, "VER: %s", GIT_VERSION);
    qCWarning(Yamaha, "PRO: %s", PROTO_VERSION);
    qCWarning(Yamaha, "REL: %s %s", __DATE__, __TIME__);

#if defined(Q_PROCESSOR_ARM)
    initEnv();
#endif

    std::shared_ptr<QGuiApplication> app = std::make_shared<QGuiApplication>(argc, argv);

    std::unique_ptr<CustomUiController> uiController(new CustomUiController(1440, 540, false));
    uiController->setReleaseVersion("v1.0.0");
    uiController->start();

    return app->exec();
}

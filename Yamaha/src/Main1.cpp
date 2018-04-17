#include <unistd.h>
#include <QGuiApplication>

#include <Global.hpp>
//#include <CarFox/Splash.hpp>
#include <UndeadMain.hpp>
#include <ThemeManager.hpp>

#include "CustomUiController.hpp"

#include <sys/ioctl.h>
//#include <execinfo.h>
#include <fcntl.h>

struct mxcfb_gbl_alpha {
    int enable;
    int alpha;
};

#define MXCFB_SET_GBL_ALPHA     _IOW('F', 0x21, struct mxcfb_gbl_alpha)

void initfb()
{
    mxcfb_gbl_alpha alpha;
    int fd_fb = open("/dev/fb0", O_RDWR);
    if (fd_fb < 0)
    {
        perror(__func__);
        return;
    }
    //Disable global alpha since we need Pixel Alpha
//    alpha.enable = 0;
//    alpha.alpha = 0xff;
    alpha.enable = 1;
    alpha.alpha = 127;
    ioctl(fd_fb, MXCFB_SET_GBL_ALPHA, &alpha);
    //ioctl(fd_fb, MXCFB_SET_LOC_ALPHA, &alpha);
    close(fd_fb);
}


void initEnv()
{
    initfb();
    setenv("QT_NO_FT_CACHE","1",1);
    setenv("QT_QPA_EGLFS_FB","/dev/fb1",1);
    setenv("QML_USE_GLYPHCACHE_WORKAROUND","1",1);
}



int main(int argc, char *argv[]) {
    qDebug() << "main";

    initEnv();

    std::shared_ptr<QGuiApplication> app = std::make_shared<QGuiApplication>(argc, argv);
    std::unique_ptr<CustomUiController> uiController(new CustomUiController(1440, 540, false));
    uiController->setReleaseVersion("v1.0.0");
    uiController->start();
    return app->exec();
}

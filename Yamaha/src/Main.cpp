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

void initFont() {
    QStringList m_fontList;

    //QString fontFilePath("/home/samba/CarFox/CarFox/Yamaha/resource/Theme1/font/EuropeExt.ttf");
    QString fontFilePath("/home/samba/CarFox_old/CarFox/Yamaha/Fonts/ConceptFont.ttf");
    QFile fontFile(fontFilePath);
    if (!fontFile.open(QIODevice::ReadOnly)) {
        qWarning() << "font file" << fontFilePath << "load fail";
        return;
    }

    int loadedFontID = QFontDatabase::addApplicationFontFromData(fontFile.readAll());
    QStringList loadedFontFamilies = QFontDatabase::applicationFontFamilies(loadedFontID);
    std::for_each(loadedFontFamilies.begin(), loadedFontFamilies.end(),
                  [=] (QString fontFamily) { qDebug() << fontFilePath << " : " << fontFamily; });

    //int lcdFontId = QFontDatabase::addApplicationFont(":/Theme1/font/resource/Theme1/font/EuropeExt.ttf"); // 从source资源文件
//    QString dir = QCoreApplication::applicationDirPath();
//    int lcdFontId = QFontDatabase::addApplicationFont(dir + "/home/samba/CarFox/CarFox/Yamaha/resource/Theme1/font/EuropeExt.ttf"); //从外部资源文件
//    if (lcdFontId != -1) { // -1为加载失败
//        m_fontList << QFontDatabase::applicationFontFamilies(lcdFontId);
//    }

    qDebug() << "m_fontList:" << m_fontList;
//    if (!m_fontList.isEmpty()) {
//        QFont font;
//        font.setFamily(m_fontList.at(0));
//    }
}


int main(int argc, char *argv[]) {
#if defined(Q_PROCESSOR_ARM)
    initEnv();
#endif

    initFont();

    std::shared_ptr<QGuiApplication> app = std::make_shared<QGuiApplication>(argc, argv);
    std::unique_ptr<CustomUiController> uiController(new CustomUiController(1440, 540, false));
    uiController->setReleaseVersion("v1.0.0");
    uiController->start();

    return app->exec();
}

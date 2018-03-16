#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include "transformring.h"
#include "carviewmodel.h"
#include "fontName.h"
#include <syslog.h>
#include <execinfo.h>
#include "theme.h"
#include "fbhelper.h"

int main(int argc, char *argv[])
{
    // 将fb1设置为透明
   FbHelper::getInstance()->setFb1Alpha(0x00);
   //设置当前进程显示到fb1上
   setenv("QT_QPA_EGLFS_FB","/dev/fb1",1);
    QGuiApplication app(argc, argv);



    LogMsgHandle::initialize();
    //qputenv("QT_LOGGING_TO_CONSOLE", QByteArray("0"));
    //openlog("testsyslog", LOG_CONS | LOG_PID, 0);
    //syslog(LOG_USER | LOG_INFO, "syslog test message generated in program\n");

    CarViewModel carViewModel;

    MFontName fontName;
    QQuickView viewer;
    qmlRegisterType<TransformRing>("TransformRing", 1, 0, "TransformRing");
    //viewer.setColor(QColor(Qt::transparent));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.rootContext()->setContextProperty("CarStatus", &carViewModel);
    viewer.rootContext()->setContextProperty("ThemeStyle", MTheme::instance());
    viewer.rootContext()->setContextProperty("FontName", &fontName);
    viewer.setSource(QUrl("qrc:/qml/qml/main.qml"));
    viewer.show();

    return app.exec();
}

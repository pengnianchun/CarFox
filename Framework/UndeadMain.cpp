
#include <QFile>
#include <QDateTime>
#include <QTextStream>
#include <QGuiApplication>
#include <QSystemSemaphore>

#include <cstdlib>
#include <iostream>

#ifdef __cplusplus
extern "C" {
#endif
#include <wait.h>
#include <fcntl.h>
#include <unistd.h>
#include <unistd.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/ioctl.h>

// 打开这个宏会不显示Splash Screen，直接显示主界面
#define CARFOX_PROFILE


#ifdef Q_PROCESSOR_ARM
//#include <initroot_startup.h>
#endif
#ifdef __cplusplus
}
#endif

#ifdef Q_PROCESSOR_ARM
#define INIT_QT_ENV(nfb)    do{\
    setenv("QSG_RENDER_LOOP", "threaded", 1);\
    setenv("QT_QPA_EGLFS_FB", "/dev/fb"#nfb, 1);\
}while(0)
#else
#define INIT_QT_ENV(nfb)    do{\
    setenv("QSG_RENDER_LOOP", "window", 1); /*setenv("QSG_RENDERER_DEBUG", "render", 1); Let's keep batches under 20*/\
    }while(0)
#endif



#include "UndeadMain.hpp"

CARFOX_BEGIN_NAMESPACE

struct mxcfb_gbl_alpha {
    int enable;
    int alpha;
};
#define MXCFB_SET_GBL_ALPHA     _IOW('F', 0x21, struct mxcfb_gbl_alpha)

QSystemSemaphore *UndeadMain::semStartShow;


/*
 * 重要函数： 有系统动画splash开始
 */
int UndeadMain::startWithSplash(std::function<int (int, char **)> splashMain, std::function<int (int, char **, bool)> appMain, int argc, char *argv[])
{
    bool firstInstance=false;

    setenv("QT_NO_FT_CACHE", "1", 1);
    setenv("QT_QPA_EGLFS_FORCEVSYNC","1",1);
    setenv("QML_USE_GLYPHCACHE_WORKAROUND", "1", 1);
    qDebug() << "1.enter main process of Project";

#ifdef Q_PROCESSOR_ARM
    setFbAlpha("/dev/fb1", 0xff);
    firstInstance = true;
//    startup_begin();
//    SystemController::initGPIO();
#endif
    initStartShow();

#ifdef CARFOX_PROFILE //直接进入主界面
    releaseStartShow();
    return appMain(argc, argv, false);
#else

    //退出状态
    ExitStatus exitedStatus = Initialize;
    pid_t sAppPid = -1;
    pid_t sSplashPid = -1;

    if (!splashMain) {
        releaseStartShow();
    }

    do {
        qDebug() << "2.main start fork server";
        if (exitedStatus == Initialize && splashMain) {
            // 启动Splash进程，返回0的是子进程
            if (0 == (sSplashPid = fork())) {
                qDebug() << "in splash exe.";
                INIT_QT_ENV(0); // Splash takes fb0
                return splashMain(argc, argv);
            }
        }

        //
        if (exitedStatus == Initialize || exitedStatus == AppExited) {
            // 启动主界面进程
            if (0 == (sAppPid = fork())) {
                INIT_QT_ENV(1); //App takes fb1
                /* Qt打开串口的进程会创建"串口锁文件",
                 * 当此进程由于ctrl+c或者kill或者其它原因崩溃了,
                 * 这个"串口锁文件"不会立即消失，如果立即重新启动此进程实例再次去尝试打开串口，
                 * 有很大几率发现这个"串口锁文件"依旧存在则会立即报错，进而导致打开串口失败,
                 * 这里我们采用每次打开串口的进程去打开串口前先将这个"串口锁文件"删除来避免这个问题
                 */
                int ret = ::remove("/tmp/LCK..ttymxc1");
                qDebug() << "Remove SerialPort Locker: " << ret;

                return appMain(argc, argv, firstInstance);
            }
        }

        if (0 > sAppPid) {
            break;
        }

        int status;
        pid_t wpid = wait(&status);
        if (wpid == sAppPid) {
            exitedStatus = AppExited;
            qWarning() << "App exit with status: " << status;
            releaseStartShow();// app crash release sem
        }
        else if (wpid == sSplashPid) {
            qWarning() << "Splash exit with status: " << status;
            exitedStatus = OpenNormalExited;
            firstInstance = false;
            releaseStartShow();
        }
#ifdef Q_PROCESSOR_ARM
    } while(true);
    //           return startup_end(EXIT_SUCCESS);
    return EXIT_SUCCESS;
#else
    } while(false);
    return EXIT_SUCCESS;
#endif

#endif
}

/*
 * 重要函数： 无系统动画splash开始
 */
int UndeadMain::startWithoutSplash(std::function<int (int, char **, bool)> appMain, int argc, char *argv[])
{
    qDebug() << "UndeadMain startWithoutSplash";
    return startWithSplash(NULL, appMain, argc, argv);
}

int UndeadMain::exec(std::shared_ptr<QGuiApplication> app)
{
#ifdef Q_PROCESSOR_ARM
//    return startup_cend(app->exec);
    return app->exec();
#else
    return app->exec();
#endif
}

void UndeadMain::waitStartShow()
{
    if(!semStartShow) {

        initStartShow();
    }
    else {
        semStartShow->acquire();
    }
}

void UndeadMain::initStartShow()
{
    semStartShow = new QSystemSemaphore("startShow", 0, QSystemSemaphore::Open);
}

void UndeadMain::releaseStartShow()
{
    if (!semStartShow) {
        return;
    }
    semStartShow->release();
}

void UndeadMain::setFbAlpha(QString dev, int alphaValue)
{

}

CARFOX_END_NAMESPACE

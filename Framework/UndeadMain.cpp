
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
//#define CARFOX_PROFILE


#ifdef Q_PROCESSOR_ARM
//#include <initroot_startup.h>
#endif
#ifdef __cplusplus
}
#endif

#include "UndeadMain.hpp"

CARFOX_BEGIN_NAMESPACE

static pid_t sAppPid = -1;
static pid_t sSplashPid = -1;
static bool sFirstInstance = true;

static QSystemSemaphore *semStartShow;
void lockStartShow()
{
    semStartShow = new QSystemSemaphore("startShow", 1, QSystemSemaphore::Open);
    semStartShow->acquire();
}

void releaseStartShow()
{
    semStartShow->release();
}

static void interrupt_service_rountine(int signo)
{
    switch (signo) {
    case SIGUSR1: {
        qDebug() << "receive SIGUSR1 from splash";
        int openSendOk = kill(sSplashPid, 9);
        qDebug() << "killed open logo " << sSplashPid << " " << openSendOk;

        QSystemSemaphore *semLoading = new QSystemSemaphore("loading", 1, QSystemSemaphore::Open);
        semLoading->acquire();

        releaseStartShow();
        break;
    }
    default:
        break;
    }
}



/*
 * 重要函数： 有系统动画splash开始
 */
int UndeadMain::startWithSplash(std::function<int (int, char **)> appSplash, std::function<int (int, char **, bool)> appMain, int argc, char *argv[])
{
    setenv("QT_NO_FT_CACHE", "1", 1);
    setenv("QT_QPA_EGLFS_FORCEVSYNC","1",1);
    setenv("QML_USE_GLYPHCACHE_WORKAROUND", "1", 1);
    signal(SIGUSR1, interrupt_service_rountine);
    qDebug() << "1.enter main process of Project";

    lockStartShow();

#ifdef CARFOX_PROFILE //直接进入主界面
    releaseStartShow();
    return appMain(argc, argv, false);
#endif

    //退出状态
    ExitStatus exitedStatus = Initialize;

    do {
        qDebug() << "2.main start fork server";
        if (exitedStatus == Initialize) {
            // 启动Splash进程，返回0的是子进程
            if (0 == (sSplashPid = fork())) {
#ifdef Q_PROCESSOR_ARM
                setenv("QSG_RENDER_LOOP", "threaded", 1);
                setenv("QT_QPA_EGLFS_FB", "/dev/fb0", 1); // Splash takes fb0
#else //非arm平台
                setenv("QSG_RENDER_LOOP", "window", 1);
                //    setenv("QSG_RENDERER_DEBUG", "render", 1); // Let's keep batches under 20
#endif
                return splashMain(argc, argv);
            }
        }

        //
        if (exitedStatus == Initialize || exitedStatus == AppExited) {
            // 启动主界面进程
            if (0 == (sAppPid = fork())) {
#ifdef Q_PROCESSOR_ARM
                setenv("QSG_RENDER_LOOP", "threaded", 1);
                setenv("QT_QPA_EGLFS_FB", "/dev/fb1", 1); // App takes fb1
#else
                setenv("QSG_RENDER_LOOP", "window", 1);
                //    setenv("QSG_RENDERER_DEBUG", "render", 1); // Let's keep batches under 20
#endif
                return appMain(argc, argv, sFirstInstance);
            }
        }

        if (0 < sAppPid) {
            int status;
            auto wpid = wait(&status);
            if (wpid == sAppPid) {
                exitedStatus = AppExited;
                qWarning() << "App exit with status: " << status;
            }
            else if (wpid == sSplashPid) {
                qWarning() << "Splash exit with status: " << status;
                sFirstInstance = false;
                exitedStatus = OpenNormalExited;
            }
        }
        else {
            break;
        }
#ifdef Q_PROCESSOR_ARM //arm平台
    } while(true);
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
    setenv("QT_QPA_EGLFS_FORCEVSYNC","1",1);

#ifdef FUSION_PROFILE //直接进入主界面
    return appMain(argc, argv);
#else

    do {
        if (0 == (sAppPid = fork())) {
#ifdef Q_PROCESSOR_ARM
            setenv("QSG_RENDER_LOOP", "threaded", 1);
#else
            setenv("QSG_RENDER_LOOP", "window", 1);
            // setenv("QSG_RENDERER_DEBUG", "render", 1); // Let's keep batches under 20
#endif
            return appMain(argc, argv);
        }
        else if (0 < sAppPid) { // 这个是父进程，wait住。
            int status;
            if (wait(&status) == sAppPid) {
                qWarning() << "App exit with status: " << status;
            }
        } else { //这个是最不愿意看到的
            qWarning() << "App Fork Error!";
            break;
        }
#ifdef Q_PROCESSOR_ARM
    } while(true);
    return EXIT_SUCCESS;
#else
    } while(false);
    return EXIT_SUCCESS;
#endif

#endif
}

int UndeadMain::exec(std::shared_ptr<QGuiApplication> app)
{
    return app->exec();
}

CARFOX_END_NAMESPACE

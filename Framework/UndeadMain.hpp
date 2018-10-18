#pragma once

#include <QObject>

#include <functional>

#include "Global.hpp"

class QGuiApplication;
class QSystemSemaphore;

CARFOX_BEGIN_NAMESPACE

class UndeadMain
{
public:
    enum ExitStatus {
        Initialize,
        OpenCrashExited,
        OpenNormalExited,
        AppExited,
        Undefined
    };

    static int startWithSplash(std::function<int (int, char**)> splashMain,
                               std::function<int (int, char**, bool)> appMain,
                               int argc, char *argv[]);
    static int startWithoutSplash(std::function<int (int, char **, bool)> appMain,
                                  int argc, char *argv[]);

    static int exec(std::shared_ptr<QGuiApplication> app);
    static void waitStartShow();

protected:
    static void initStartShow();
    static void releaseStartShow();
    static void setFbAlpha(QString dev, int alphaValue);

private:
    static QSystemSemaphore *semStartShow;

};

CARFOX_END_NAMESPACE

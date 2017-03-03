#pragma once

#include <QObject>

#include <functional>

#include "Global.hpp"

class QGuiApplication;

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

    static int startWithSplash(std::function<int (int, char**)> appSplash,
                               std::function<int (int, char**, bool)> appMain,
                               int argc, char *argv[]);
    static int startWithoutSplash(std::function<int (int, char **, bool)> appMain,
                                  int argc, char *argv[]);

    static int exec(std::shared_ptr<QGuiApplication> app);

};

CARFOX_END_NAMESPACE

#pragma once

#include <QElapsedTimer>
#include <QQmlIncubationController>

#include "Global.hpp"
CARFOX_BEGIN_NAMESPACE

/*
 *  说明： 重要类，目的是控制异步加载qml的占空比等。每个主题都使用自己的IncubationController，不要共用当前主题的IncubationController.
 */
class IncubationController : public QObject, public QQmlIncubationController
{
    Q_OBJECT

private:
    struct CPU_USAGE
    {
        quint8 name[20];
        quint32 user;
        quint32 nice;
        quint32 system;
        quint32 idle;
    };

public:
    IncubationController();

    void setIncubationTime(qint32 startTime, qint32 incubateForTime);

    void start();

    void stop();

protected:
    virtual void timerEvent(QTimerEvent *event) Q_DECL_OVERRIDE; //声明这是一个对虚函数进行定义的方法, 定时器执行函数

private:
    qint32 getCpuInfo(CPU_USAGE &usg);
    int calcCpuUsage();

private:
    qint32 mTimerId = -1;
    qint32 mStartTime = 50;       // 50ms定时器。
    qint32 mIncubateForTime = 10; //孵化时间10ms。

    CPU_USAGE mPrevUsage; //存储上一次的cpu信息

};

CARFOX_END_NAMESPACE

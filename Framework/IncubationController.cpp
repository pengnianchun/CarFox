#include "IncubationController.hpp"

CARFOX_BEGIN_NAMESPACE

IncubationController::IncubationController()
{
    memset(&mPrevUsage, 0, sizeof(CPU_USAGE));
}

/*
 *  获取cpu的信息，去读/proc/stat文件第一行
 */
qint32 IncubationController::getCpuInfo(CPU_USAGE &usg)
{
    QFile cpuFile("/proc/stat");
    if (!cpuFile.open(QIODevice::ReadOnly)) {
        return -1;
    }
    QString cpuInfo = QLatin1String(cpuFile.readLine());

    if (cpuInfo.startsWith("cpu")) {
        QStringList list = cpuInfo.split(" ");
//        usg.name = "cpu";
        usg.user = list.at(2).toInt();
        usg.nice = list.at(3).toInt();
        usg.system = list.at(4).toInt();
        usg.idle = list.at(5).toInt();
    }
    cpuFile.close(); //关闭stat文件
    return 0;
}

/*
 *  计算cpu占用率
 */
int IncubationController::calcCpuUsage()
{
    CPU_USAGE usg;

    if (getCpuInfo(usg) < 0) return 0;
    if (mPrevUsage.user == 0)
    {
        memcpy(&mPrevUsage, &usg, sizeof(CPU_USAGE));
        return 100;
    }
    int percent = (usg.user - mPrevUsage.user) + (usg.system - mPrevUsage.system) + (usg.idle - mPrevUsage.idle);
    if (percent != 0)
        percent = ((usg.user - mPrevUsage.user) + (usg.system - mPrevUsage.system)) * 100/percent;
    else
        percent = 100;
    //printf("Percent:%d\n", percent);
    memcpy(&mPrevUsage, &usg, sizeof(CPU_USAGE));
    return percent;
}

void IncubationController::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event);

    // Note: ARM 需要计算CPU占用率，x86平台则不需要
#ifdef Q_PROCESSOR_ARM
    int percent = calcCpuUsage();
    if (percent <= 50)
#endif
        incubateFor(mIncubateForTime); //接下来的mIncubateForTime时间内进行加载，除非没有qml需要加载
}

/*
 * 重要函数：设置异步加载qml的频率， 每startTime毫秒加载一次，每次占用incubateForTime毫秒的时间。可以计算出加载qml的占空比
 */
void IncubationController::setIncubationTime(qint32 startTime, qint32 incubateForTime)
{
    mStartTime = startTime;
    mIncubateForTime = incubateForTime;
}

void IncubationController::start()
{
    mTimerId = startTimer(mStartTime);
}

void IncubationController::stop()
{
    if (mTimerId > -1) {
        killTimer(mTimerId);
        mTimerId = -1;
    }
}

CARFOX_END_NAMESPACE

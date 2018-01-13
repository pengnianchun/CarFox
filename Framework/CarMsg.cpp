#include "CarMsg.hpp"

CARFOX_BEGIN_NAMESPACE

CarMsg::CarMsg(CarMsgWorker *worker)
    :mWorker(worker)
{
    if (!mWorker) {
        return;
    }
    mWorker->moveToThread(mThread.get());
    connect(mThread.get(), &QThread::started, mWorker, &CarMsgWorker::onStarted);
    connect(mThread.get(), &QThread::finished, mWorker, &QObject::deleteLater);
}

void CarMsg::startThread()
{
    mThread->start();
}

CARFOX_END_NAMESPACE

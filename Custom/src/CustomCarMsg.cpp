
#include "CustomCarMsg.hpp"
#include "CustomCarMsgWorker.hpp"
#include "KeyManager.hpp"

CustomCarMsg::CustomCarMsg(CustomCarMsgWorker *worker)
    : carfox::CarMsg(worker)
{

    if (!worker) {
        return;
    }
    connectMsgToWorker(worker);
    connectWorkerToMsg(worker);
}

void CustomCarMsg::connectWorkerToMsg(CustomCarMsgWorker *worker)
{
    connect(worker, &CustomCarMsgWorker::keyPressed, this, &CustomCarMsg::keyPressed);
    connect(worker, &CustomCarMsgWorker::keyReleased, this, &CustomCarMsg::keyReleased);
    connect(worker, &CustomCarMsgWorker::keyDoublePressed, this, &CustomCarMsg::keyDoublePressed);
    connect(worker, &CustomCarMsgWorker::doubleKeysPressed, this, &CustomCarMsg::doubleKeysPressed);
    connect(worker, &CustomCarMsgWorker::keyLongPressed, this, &CustomCarMsg::keyLongPressed);
    connect(worker, &CustomCarMsgWorker::keyShortPressed, this, &CustomCarMsg::keyShortPressed);

    connect(worker, &CustomCarMsgWorker::keyShortPressed, this, &CustomCarMsg::onkeyShortPressed);

}

void CustomCarMsg::connectMsgToWorker(CustomCarMsgWorker *worker)
{
    connect(this, &CustomCarMsg::enableKeys, worker, &CustomCarMsgWorker::enableKeys);
}


void CustomCarMsg::updateThemeMode(int data)
{

}

void CustomCarMsg::onkeyShortPressed(int keyType)
{
    qDebug() << "CustomCarMsg::onkeyShortPressed" ;
}

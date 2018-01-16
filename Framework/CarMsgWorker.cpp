
#include "CarMsgWorker.hpp"

CARFOX_BEGIN_NAMESPACE

CarMsgWorker::CarMsgWorker()
{

}

void CarMsgWorker::onStarted()
{
    qDebug() << "CarMsgWorker::onStarted";
    initSocket();
}

void CarMsgWorker::onReadyRead()
{
    QByteArray recvData = mSubSock->read();
    qDebug() << " --- Recv: " << recvData.toHex();
    mHandler.parseMessage(recvData);
}

void CarMsgWorker::initSocket()
{
    qDebug() << "CarMsgWorker::initSocket";
    mPubSock = std::make_shared<PubSocket>();
    mSubSock = std::make_shared<SubSocket>();
    mPubSock->bind("tcp://*:5556");
    mSubSock->subscribeFilter("");
    mSubSock->connectToAddress("tcp://127.0.0.1:5555");
    connect(mSubSock.get(), &SubSocket::readyRead, this, &CarMsgWorker::onReadyRead);
    registerCallback();
}



CARFOX_END_NAMESPACE

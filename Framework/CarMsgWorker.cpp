
#include "CarMsgWorker.hpp"
#include <QCommandLineParser>

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
//    qDebug() << " --- Recv: " << recvData.toHex();
    mHandler.parseMessage(recvData);
}

void CarMsgWorker::sendProtoMsg(const google::protobuf::Message &msg)
{
    QByteArray packedData;
    packedData = mHandler.packMessage(msg);
    mPubSock->write(packedData);
}

void CarMsgWorker::initSocket()
{
    qDebug() << "CarMsgWorker::initSocket";
    mPubSock = std::make_shared<PubSocket>();
    mSubSock = std::make_shared<SubSocket>();
    mPubSock->bind("tcp://*:5556");
    mSubSock->subscribeFilter("");

    QString address = "tcp://127.0.0.1:5555";
    QCommandLineParser parser;
    parser.addHelpOption();
    QCommandLineOption ipOption(QStringList() << "i" << "ip", "specify ip address", "127.0.0.1");
    parser.addOption(ipOption);
    parser.process(*qApp);

    if (parser.isSet(ipOption))
        address = "tcp://" + parser.value(ipOption) + ":5555";

    mSubSock->connectToAddress(address);
    connect(mSubSock.get(), &SubSocket::readyRead, this, &CarMsgWorker::onReadyRead);
    registerCallback();
}



CARFOX_END_NAMESPACE

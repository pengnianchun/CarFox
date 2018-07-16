
#include "CarMsgWorker.hpp"
#include <QCommandLineParser>

CARFOX_BEGIN_NAMESPACE

CarMsgWorker::CarMsgWorker()
{

}
CarMsgWorker::~CarMsgWorker()
{
    if(m_timerId > 0){
        killTimer(m_timerId);
    }
}

void CarMsgWorker::onStarted()
{
    qDebug() << "CarMsgWorker::onStarted";
    initSocket();
    m_timerId = startTimer(200);
}

void CarMsgWorker::onReadyRead()
{
    QByteArray recvData = mSubSock->read();
    //qDebug() << " --- Recv: " << recvData.toHex();
    mHandler.parseMessage(recvData);

    m_isLive = true;
}

void CarMsgWorker::timerEvent(QTimerEvent *e)
{
#if defined(Q_PROCESSOR_ARM)
    static int counter = 3;
    if(m_isLive == true){
        m_isLive = false;
        counter = 3;
    }else{
        if(counter -- < 0){
            QString cmd;
//            QString filePath = "/home/root/error.txt";
//            QFile file(filePath);

//            if (!file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append)){
//                qDebug() << "open file fail...";
//                return;
//            }
//            QTextStream out(&file);

//            out << "timerEvent:qt socket overtime！" <<endl;
//            file.close();

            cmd = QString("kill -9 %1 ").arg(getpid());
            system(cmd.toUtf8().data());
        }
    }
#endif
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

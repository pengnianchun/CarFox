
#include "CarMsgWorker.hpp"

CARFOX_BEGIN_NAMESPACE

CarMsgWorker::CarMsgWorker()
{

}

void CarMsgWorker::onStarted()
{
    initSocket();
}

void CarMsgWorker::initSocket()
{
    // init publish socket
//    pubsock = new PubSocket();
//    pubsock->bind("tcp://*:5556");

//    // init subscribe socket
//    subsock = new SubSocket();

//    // subscribe message
//    subsock->subscribeFilter("");

//    subsock->connectToAddress("tcp://127.0.0.1:5555");
//    connect(subsock, SIGNAL(readyRead()), this, SLOT(onReadyRead()));
}



CARFOX_END_NAMESPACE

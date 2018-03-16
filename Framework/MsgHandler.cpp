
#include "MsgHandler.hpp"

CARFOX_BEGIN_NAMESPACE

MsgHandler::MsgHandler(QObject *parent) : QObject(parent)
{

}

void MsgHandler::registerMsgCallback(const google::protobuf::Descriptor *desc, const MsgHandler::MessageCallback &callback)
{
    if (desc) {
        mCallbackMaps[QString::fromStdString(desc->full_name())] = callback;
        qDebug() << "Register proto type: " << QString::fromStdString(desc->full_name());
    }
}

void MsgHandler::parseMessage(QByteArray &recvmsg)
{
    bool bResult = false;
    const char* recvBuffer = NULL;
    QString protoTypeName = "";
    uint8_t protoTypeNameLength = 0;
    uint32_t protoMessageLength = 0;
    MessageCallback callback;
    MessagePtr message;

    recvBuffer = recvmsg.data();

    // get typename string len(typename c string with '\0')
    protoTypeNameLength = *recvBuffer;

    // seek to typename string
    recvBuffer += sizeof(protoTypeNameLength);

    // get typename string
    protoTypeName = QString(recvBuffer);
//    qDebug() << "protoTypeName:" << protoTypeName;

    protoMessageLength = recvmsg.length() - protoTypeNameLength - sizeof(protoTypeNameLength);

    // get callback for parsing proto
    callback = mCallbackMaps[protoTypeName];
    if (!callback) {
        qDebug() << "get callback for proto type:" << protoTypeName << "failed!!";
        return;
    }

    // create protobuf::Message for proto
    message.reset(createMessage(protoTypeName));
    if (!message) {
        qDebug() << "get message for" << protoTypeName << "error";
        return;
    }

    // parse data to message format
    recvBuffer += protoTypeNameLength;
    bResult = message->ParseFromArray(recvBuffer, protoMessageLength);
    if (bResult) {
        callback(message);
    } else {
        qDebug() << "parse" << protoTypeName << "to protobuf::Message format fail";
    }
}

QByteArray MsgHandler::packMessage(const google::protobuf::Message &msg)
{
    char sendBuffer[4096] = {};
    const char *protoTypeName = NULL;
    int messageSize = 0;
    uint8_t protoTypeNameLength = 0;
    uint32_t packetLength = 0;
    messageSize = msg.ByteSize();

    protoTypeName = msg.GetDescriptor()->full_name().c_str();
    protoTypeNameLength = strlen(protoTypeName) + 1 /* '\0' */;
//    qDebug() << " --- protoTypeName = " << protoTypeName << ", protoTypeNameLength = " << (int)protoTypeNameLength;

    memcpy(sendBuffer, &protoTypeNameLength, sizeof(protoTypeNameLength));
    memcpy(sendBuffer + sizeof(protoTypeNameLength), protoTypeName, protoTypeNameLength + 1);

    msg.SerializeToArray(sendBuffer + sizeof(protoTypeNameLength) + protoTypeNameLength, messageSize);

    packetLength = sizeof(protoTypeNameLength) + protoTypeNameLength + messageSize;

    QByteArray sendData = QByteArray((char *)sendBuffer, packetLength);

    return sendData;
}

google::protobuf::Message *MsgHandler::createMessage(QString &typeName)
{
    google::protobuf::Message* message = NULL;
    std::string name = typeName.toStdString();

    const google::protobuf::Descriptor* descriptor =
            google::protobuf::DescriptorPool::generated_pool()->FindMessageTypeByName(name);
    if (descriptor) {
        const google::protobuf::Message* prototype =
                google::protobuf::MessageFactory::generated_factory()->GetPrototype(descriptor);

        if (prototype)
            message = prototype->New();
    }

    return message;
}

CARFOX_END_NAMESPACE

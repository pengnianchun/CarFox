#pragma once

#include <assert.h>
#include <unistd.h>
#include <typeinfo>

#include <google/protobuf/descriptor.h>
#include <google/protobuf/message.h>

#include "Global.hpp"

using namespace std;
using namespace placeholders;

CARFOX_BEGIN_NAMESPACE

template<typename To, typename From>
inline To implicit_cast(From const &f)
{
    return f;
}

template<typename To, typename From>
inline std::shared_ptr<To> down_pointer_cast(const std::shared_ptr<From>& f)
{
    if (false)
    {
        implicit_cast<From*, To*>(0);
    }
    return ::std::static_pointer_cast<To>(f);
}


typedef shared_ptr<google::protobuf::Message> MessagePtr;

/*
 * 打包数据格式如下所示
 ___________________________
|                 |    ↑
|      len        |   1字节
|_________________|____↓____
|                 |    ↑
|    typeName     |   len
|_________________|____↓____
|                 |    ↑
|                 |
|                 |
|     rawData     |   变长
|                 |
|                 |
|                 |
|_________________|____↓____
*/

class MsgHandler : public QObject
{
    Q_OBJECT

public:
    typedef function<void (const MessagePtr&)> MessageCallback;

public:
    explicit MsgHandler(QObject *parent = 0);

    /*
     * 为关心的消息类型注册回调函数
     */
    void registerMsgCallback(const google::protobuf::Descriptor* desc, const MessageCallback& callback);

    /*
     * 数据解包
     */
    void parseMessage(QByteArray& recvmsg);

    /*
     * 数据打包
     */
    QByteArray packMessage(const google::protobuf::Message& msg);

private:
    google::protobuf::Message *createMessage(QString& typeName);

    QMap<QString, MessageCallback> mCallbackMaps;
};

CARFOX_END_NAMESPACE

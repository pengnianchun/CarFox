#pragma once

#include <QObject>

#include "Global.hpp"
#include "QnnMsgPubSub.hpp"
#include "QnnMsgSocket.hpp"
#include "MsgHandler.hpp"

CARFOX_BEGIN_NAMESPACE

/*
 * 说明： 该类接受nanomsg的数据，然后发射到CarMsg中
 */
class CarMsgWorker : public QObject
{
    Q_OBJECT
public:
    CarMsgWorker();

public slots:

    virtual void onStarted(); // 线程启动的时候调用

    // 下行，数据更新槽函数 , 通过socket发送

private slots:
    void onReadyRead(); // 网路有数据的时候回调

signals:
    // 上行变更信号， 发射给CarMsg


protected:

    // 注册回调函数, 子类必须实现
    virtual void registerCallback() = 0;

    void sendProtoMeg(const google::protobuf::Message& msg);

private:
    void initSocket(); // 初始化socket函数

protected:
    // 成员变量： 打包等类
    MsgHandler mHandler;

private:
    std::shared_ptr<PubSocket> mPubSock; // = std::make_shared<PubSocket>();
    std::shared_ptr<SubSocket> mSubSock; // = std::make_shared<SubSocket>();
};


CARFOX_END_NAMESPACE

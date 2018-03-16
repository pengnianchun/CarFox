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



    // 下行，数据更新槽函数 , 通过socket发送
    virtual void onStarted(); // 线程启动的时候调用

private slots:

    void onReadyRead(); // 网路有数据的时候回调

signals:
    // 上行变更信号， 发射给CarMsg


    // 发射给UiController

    void initialized();

protected:

    // 注册回调函数, 子类必须实现
    virtual void registerCallback() = 0;

    void sendProtoMsg(const google::protobuf::Message& msg);

    template <typename T>
    void updateStates(T &oldValue, const T &newValue, std::function<void (T)> signal = [](T){}) {
        if (newValue != oldValue) {
            oldValue = newValue;
            signal(oldValue);
        }
    }

    /*
     * 更新信号， 发射合适的数据。
     */
    template <typename T>
    void updateStates(T &oldValue, const T &newValue, const T &min, const T &max, std::function<void (T)> signal = [](T){}) {
         if (qAbs(oldValue - qBound(min, newValue, max)) > 0.001) {
           oldValue = qBound(min, newValue, max);
           signal(oldValue);
       }
   }

   template <typename T>
   void updateStates(T &oldValue, const T &newValue, const T &min, const T &max, const T &err, std::function<void (T)> signal = [](T){}) {
       if (err == newValue) {
           this->updateStates(oldValue, newValue, signal);
       }
       else {
           this->updateStates(oldValue, newValue, min, max, signal);
       }
   }

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

#pragma once


#include <QThread>
#include <QObject>
#include <QString>
#include <QProcess>
#include <QDateTime>

#include "Global.hpp"

#include "CarMsgWorker.hpp"

CARFOX_BEGIN_NAMESPACE

/*
 * 说明： 该接口拥有QML中所有的消息。比如车速状态等。针对app，需要将它注册到qml中
 */
class CarMsg : public QObject
{
    Q_OBJECT

    // 通用上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML, 这个是一个例子
    Q_PROPERTY(QVariantMap data MEMBER mData NOTIFY dataChanged)


public:

    CarMsg(CarMsgWorker *worker);

    void startThread(); //开启工作线程

    CarMsgWorker *getCarMsgWorker() {
        return mWorker;
    }

signals:
    void dataChanged(); // 当数据变化时发射

public slots:

private:
    std::shared_ptr<QThread> mThread = std::make_shared<QThread>(); // 线程类， 将工作类的东西
    CarMsgWorker *mWorker = nullptr; // 工作类， 从网路上接收数据
    QVariantMap mData;
};

CARFOX_END_NAMESPACE

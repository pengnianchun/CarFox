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

    // 通用上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML


public:

    CarMsg(CarMsgWorker *worker);

signals:

public slots:

private:
    //CarMsgWorker *mWorker = nullptr;
};

CARFOX_END_NAMESPACE

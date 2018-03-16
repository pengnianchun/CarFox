#pragma once

#include <QObject>
#include <QMap>

#include "nn.h"
#include "pair.h"
#include "pubsub.h"
#include "reqrep.h"
#include "pipeline.h"
#include "survey.h"
#include "bus.h"

#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

class Socket : public QObject
{
    Q_OBJECT

public:
    enum Type
    {
        pair,       //pair mode
        pub,        //pubsub mode
        sub,        //pubsub mode
        req,        //reqrep mode
        rep,        //reqrep mode
        push,       //pipeline mode
        pull,       //pipeline mode
        surveyor,   //survey mode
        respondent, //survey mode
        bus,        //bus mode
    };

    Socket(Type type, QObject *parent = 0);
    ~Socket();

    bool connectToAddress(const QString &url);
    bool bind(const QString &url);

    QByteArray read();
    bool write(const QByteArray &message);

    int setsockopt(int level, int option, const void *optval, size_t optlen);
    int getsockopt(int level, int option, void *optval, size_t *optlen);

signals:
    void readyRead();

private:
    int sock;
    QMap<Type, int> Protocols;
    void init();

public slots:
    void nnsocket_activated();
};

CARFOX_END_NAMESPACE

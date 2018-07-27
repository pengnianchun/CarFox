#pragma once

#include "QnnMsgSocket.hpp"
#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

class PubSocket: public QObject
{
	Q_OBJECT

public:
    inline PubSocket(QObject *parent = 0) :
        QObject(parent)
    {
        m_sockVaild = false;
        sock = new Socket(Socket::pub);
    }

    inline ~PubSocket()
    {
        delete sock;
    }

    inline bool bind(const QString &addr)
    {
        m_sockVaild = sock->bind(addr);

        return m_sockVaild;
    }

    inline bool write(const QByteArray &message)
    {
        if (!m_sockVaild) {
            qDebug() << "socket for write invalid now.";
            return false;
        }
        return sock->write(message);
    }

private:
    Socket *sock;
    bool m_sockVaild;
};

class SubSocket: public QObject
{
    Q_OBJECT

public:
    inline SubSocket(QObject *parent = 0) :
        QObject(parent)
    {
        m_sockVaild = false;
        sock = new Socket(Socket::sub, this);
        connect(sock, SIGNAL(readyRead()), SLOT(sock_readyRead()));
    }

    inline ~SubSocket()
    {
        delete sock;
    }

    inline bool connectToAddress(const QString &addr)
    {
        m_sockVaild = sock->connectToAddress(addr);

        qDebug() << "m_sockValid:" << m_sockVaild;
        return m_sockVaild;
    }

    inline QByteArray read()
    {
        if (!m_sockVaild) {
            qDebug() << "socket for read invalid now.";
            return "";
        }

        return sock->read();
    }

    inline int setsockopt(int level, int option, const void *optval, size_t optlen)
    {
        if (!m_sockVaild) {
            qDebug() << "socket for setsockopt invalid now.";
            return -1;
        }

        return sock->setsockopt(level, option, optval, optlen);
    }

    inline bool subscribeFilter(const QString &filter)
    {
        int ret = 0;

        ret = sock->setsockopt(NN_SUB, NN_SUB_SUBSCRIBE, filter.toUtf8().data(), filter.length());

        return -ret;
    }

    inline bool unSubscribeFilter(const QString &filter)
    {
        int ret = 0;

        ret = sock->setsockopt(NN_SUB, NN_SUB_UNSUBSCRIBE, filter.data(), filter.length());

        return -ret;
    }

signals:
    void readyRead();

public slots:
    inline void sock_readyRead()
    {
        emit readyRead();
    }

private:
    Socket *sock;
    bool m_sockVaild;
};

CARFOX_END_NAMESPACE

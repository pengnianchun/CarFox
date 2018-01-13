/*
 * Copyright(C) 2012-2016 Justin Karneges
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files(the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <assert.h>
#include <QStringList>
#include <QPointer>
#include <QTimer>
#include <QSocketNotifier>
#include <QMutex>
#include <QThread>
#include <QDebug>

#include "QnnMsgSocket.hpp"

CARFOX_BEGIN_NAMESPACE

static int get_fd(int sock)
{
    int ret = 0;
    int fd = -1;
	size_t opt_len = sizeof(fd);

    ret = nn_getsockopt(sock, NN_SOL_SOCKET, NN_RCVFD, &fd, &opt_len);
    if (ret) {
        fprintf(stderr, "nn_getsockopt error: %s\n", nn_strerror(nn_errno()));
        fd = -1;
    }

	return fd;
}

Socket::Socket(Type type, QObject *parent) :
	QObject(parent)
{
    QSocketNotifier *nnsocket = NULL;
    int sockfd = -1;

    init();

    sock = nn_socket(AF_SP, Protocols[type]);
    if (sock < 0) {
        fprintf(stderr, "nn_socket error: %s\n", nn_strerror(nn_errno()));
        return;
    }

    if (type == pub)
        return;

    sockfd = get_fd(sock);
    if (sockfd >= 0) {
        nnsocket = new QSocketNotifier(get_fd(sock), QSocketNotifier::Read, this);
        connect(nnsocket, SIGNAL(activated(int)), SLOT(nnsocket_activated()));
        nnsocket->setEnabled(true);
    } else {
        qDebug() << "get system socket fd from nnsock error.";
    }
}

Socket::~Socket()
{
    if (sock >= 0) {
        nn_shutdown(sock, 0);
        sock = -1;
    }
}

void Socket::init()
{
    Protocols.insert(pair, NN_PAIR);
    Protocols.insert(pub, NN_PUB);
    Protocols.insert(sub, NN_SUB);
    Protocols.insert(req, NN_REQ);
    Protocols.insert(rep, NN_REP);
    Protocols.insert(push, NN_PUSH);
    Protocols.insert(pull, NN_PULL);
    Protocols.insert(surveyor, NN_SURVEYOR);
    Protocols.insert(respondent, NN_RESPONDENT);
    Protocols.insert(bus, NN_BUS);

    sock = -1;
}

bool Socket::connectToAddress(const QString &url)
{
    int ret = 0;

    ret = nn_connect(sock, url.toUtf8().data());
    if (!ret) {
        fprintf(stderr, "nn_connect error: %s\n", nn_strerror(nn_errno()));
        nn_close(sock);
        return false;
    }
//    QThread::sleep(1);

    return true;
}

bool Socket::bind(const QString &url)
{
    int ret = 0;

    ret = nn_bind(sock, url.toUtf8().data());
    if (!ret) {
        fprintf(stderr, "nn_bind error: %s\n", nn_strerror(nn_errno()));
        nn_close(sock);
        return false;
    }
    QThread::msleep(1);

	return true;
}

QByteArray Socket::read()
{
    char *buf = NULL;
    int ret = 0;
    QByteArray data;

    ret = nn_recv(sock, &buf, NN_MSG, 0);
    if (ret <= 0) {
        fprintf(stderr, "nn_recv error: %s\n", nn_strerror(nn_errno()));
        data.clear();
    } else {
        data = QByteArray(buf, ret);
        nn_freemsg(buf);
    }

    return data;
}

bool Socket::write(const QByteArray &message)
{
    bool sendok = true;
    int bytes = 0;

    bytes = nn_send(sock, message.data(), message.length(), 0);
    if (bytes != message.length()) {
        fprintf(stderr, "nn_send error: %s\n", nn_strerror(nn_errno()));
        sendok = false;
    }

    return sendok;
}

int Socket::setsockopt(int level, int option, const void *optval, size_t optlen)
{
    int ret = 0;

    ret = nn_setsockopt(sock, level, option, optval, optlen);
    if (ret != 0) {
        fprintf(stderr, "nn_setsockopt error: %s\n", nn_strerror(nn_errno()));
        return -1;
    }

    return 0;
}

int Socket::getsockopt(int level, int option, void *optval, size_t *optlen)
{
    int ret = 0;

    ret = nn_getsockopt(sock, level, option, optval, optlen);
    if (ret != 0) {
        fprintf(stderr, "nn_getsockopt error: %s\n", nn_strerror(nn_errno()));
        return -1;
    }

    return 0;
}

void Socket::nnsocket_activated()
{
    emit readyRead();
}

CARFOX_END_NAMESPACE

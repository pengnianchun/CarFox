#ifndef NCLOG_H
#define NCLOG_H

#pragma once

#include <QObject>
#include <QDir>
#include <QFile>

class NCLog : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(NCLog)

    Q_INVOKABLE void NQDebug(const QString& _message);
    Q_INVOKABLE void NQInfo(const QString& _message);
    Q_INVOKABLE void NQWarning(const QString& _message);
    Q_INVOKABLE void NQCritical(const QString& _message);

public:
    static void init(const QString& _logDir, QObject* _parent);
    static void deinit();

    static void NCDebug(const QString& _message);
    static void NCInfo(const QString& _message);
    static void NCWarning(const QString& _message);
    static void NCCritical(const QString& _message);

private:
    NCLog(QObject* _parent);
    ~NCLog();

    static NCLog* m_instance;
    static QThread* m_loggerThread;
    static QFile* m_logFile;

    static void messageHandler(QtMsgType _type, const QMessageLogContext &_context, const QString &_msg);
    static void rolling();
};

#endif // NCLOG_H

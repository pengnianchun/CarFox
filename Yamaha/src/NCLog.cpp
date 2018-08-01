#include <QCoreApplication>
#include <QDateTime>
#include <QLoggingCategory>
#include <QTextStream>
#include <QThread>
#include "NCLog.hpp"

Q_DECLARE_LOGGING_CATEGORY(APP)
Q_LOGGING_CATEGORY(APP, "APP")

const char LOG_FILE_NAME[] = "app.log";
const int  LOG_FILE_SIZE   = 4 * 1024 * 1024;
const int  LOG_FILE_COUNT  = 16;

NCLog* NCLog::m_instance = nullptr;
QThread* NCLog::m_loggerThread = nullptr;
QFile* NCLog::m_logFile = nullptr;

NCLog::NCLog(QObject* _parent)
    : QObject(_parent)
{
    qInstallMessageHandler(&NCLog::messageHandler);
}

NCLog::~NCLog() {
}

void NCLog::init(const QString &_logDir, QObject* _parent)
{
    Q_ASSERT(m_instance == nullptr);

    m_loggerThread = new QThread(_parent);
    m_instance = new NCLog(m_loggerThread);
    m_logFile = new QFile(m_loggerThread);

    QDir dir(_logDir);
    if (!dir.exists()) {
        dir.mkpath(_logDir);
    }

    m_logFile->setFileName(dir.absoluteFilePath(LOG_FILE_NAME));
    if (!m_logFile->open(QFile::WriteOnly | QFile::Append | QFile::Text)) {
        fprintf(stderr, "[Logger] Can't open log file\n");
    }

    m_instance->moveToThread(m_loggerThread);
    m_logFile->moveToThread(m_loggerThread);
    m_loggerThread->start();
}

void NCLog::deinit() {
    m_loggerThread->quit();
    m_loggerThread->wait();
    qInstallMessageHandler(0);
}

void NCLog::messageHandler(QtMsgType _type, const QMessageLogContext &_context, const QString &_msg) {
    if (!QLoggingCategory(_context.category).isEnabled(_type)) {
        return;
    }

    QString timeString = QDateTime::currentDateTime().toString("yyyyMMdd hh:mm:ss.zzz");
    QString typeString;
    switch (_type) {
    case QtDebugMsg:
        typeString = "D";
        break;
    case QtInfoMsg:
        typeString = "I";
        break;
    case QtWarningMsg:
        typeString = "W";
        break;
    case QtCriticalMsg:
        typeString = "E";
        break;
    case QtFatalMsg:
        fprintf(stderr, "%s [EE] %s\n", qPrintable(timeString), qPrintable(_msg));
        abort();
    }

    QString logString = QString("%1 [%2] %3@%4 %5").arg(timeString).arg(typeString)
            .arg(_context.function).arg(_context.line).arg(_msg);
    if (m_logFile->isOpen()) {
        QTextStream logStream(m_logFile);
        logStream << logString << endl;
    }

    if (QLoggingCategory(_context.category).isEnabled(_type)) {
        fprintf(stderr, "%s\n", qPrintable(logString));
        fflush(stderr);
    }

    rolling();
}

void NCLog::rolling()
{
    Q_ASSERT(m_logFile != nullptr);

    if (m_logFile->size() >= LOG_FILE_SIZE) {
        QDateTime time = QDateTime::currentDateTime();
        QString str = time.toString("yyMMdd_hhmm");
        QFileInfo info(*m_logFile);

        m_logFile->close();

        info.dir().rename(info.absoluteFilePath(), info.absoluteFilePath() + "." + str);

        m_logFile->setFileName(info.dir().absoluteFilePath(LOG_FILE_NAME));
        if (!m_logFile->open(QFile::WriteOnly | QFile::Truncate | QFile::Text)) {
            fprintf(stderr, "[Logger] Can't open log file\n");
        }

        QFileInfoList fileList;
        fileList = info.dir().entryInfoList(QDir::Dirs|QDir::Files|QDir::Readable|QDir::Writable|QDir::Hidden|QDir::NoDotAndDotDot, QDir::Name);
        if(fileList.size() > LOG_FILE_COUNT){
            QFile fileTemp(fileList.at(1).filePath());
            fileTemp.remove();
            fileList.removeAt(0);
        }
    }
}

void NCLog::NQDebug(const QString& _message) {
    Q_ASSERT(m_instance != nullptr);
    QMetaObject::invokeMethod(m_instance, "NCDebug", Qt::QueuedConnection, Q_ARG(QString, _message));
}

void NCLog::NQInfo(const QString& _message) {
    Q_ASSERT(m_instance != nullptr);
    QMetaObject::invokeMethod(m_instance, "NCInfo", Qt::QueuedConnection, Q_ARG(QString, _message));
}

void NCLog::NQWarning(const QString& _message) {
    Q_ASSERT(m_instance != nullptr);
    QMetaObject::invokeMethod(m_instance, "NCWarning", Qt::QueuedConnection, Q_ARG(QString, _message));
}

void NCLog::NQCritical(const QString& _message) {
    Q_ASSERT(m_instance != nullptr);
    QMetaObject::invokeMethod(m_instance, "NCCritical", Qt::QueuedConnection, Q_ARG(QString, _message));
}

void NCLog::NCDebug(const QString& _message) {
    qCDebug(APP) << qPrintable(_message);
}

void NCLog::NCInfo(const QString& _message) {
    qCInfo(APP) << qPrintable(_message);
}

void NCLog::NCWarning(const QString& _message) {
    qCWarning(APP) << qPrintable(_message);
}

void NCLog::NCCritical(const QString& _message) {
    qCCritical(APP) << qPrintable(_message);
}

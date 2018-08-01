#ifndef NQFILE_H
#define NQFILE_H

#include <QObject>
#include <QFile>

class NQFile : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString content READ getContent)
    Q_PROPERTY(QString filename READ getFileName WRITE setFileName)
    Q_INVOKABLE QString getContent();
    Q_INVOKABLE QString getFileName();

    NQFile(QObject *parent = 0);
    ~NQFile();

public slots:
    void setFileName(const QString& filename);
    void clearContent();

private:
    QFile   *file;
    QString content;
    QString filename;
};

#endif // NQFILE_H

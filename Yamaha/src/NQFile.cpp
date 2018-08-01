#include <iostream>
#include <QTextStream>
#include <QDebug>
#include "NQFile.hpp"

QString NQFile::getContent()
{
    file->open(QIODevice::ReadOnly | QIODevice::Text);
    QTextStream in(file);
    content = in.readAll();
    file->close();

    return content;
}

QString NQFile::getFileName()
{
    return this->filename;
}

NQFile::NQFile(QObject *parent) : QObject(parent)
{

}

NQFile::~NQFile()
{
    delete file;
    file = NULL;
}

void NQFile::setFileName(const QString &filename)
{
    this->filename = filename;
    file = new QFile(filename);
}

void NQFile::clearContent()
{
    content.clear();
}

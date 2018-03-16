#ifndef THEME_H
#define THEME_H

#include <QDebug>
#include <QObject>
#include <QSettings>
#include <unistd.h>
#include "common.h"

class MTheme : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int themeIndex MEMBER m_themeIndex NOTIFY themeIndexChanged)

public:
    typedef enum ThemeStyleType {
        ThemeStyleOne = 0,
        ThemeStyleTwo,
        ThemeStyleThree
    } ThemeType;

    explicit MTheme(QObject *parent = 0): QObject(parent) {
        currentTheme = 0;
        m_themeIndex = getTheme();
//        getTheme();
    }

    static MTheme *instance() {
        static MTheme *sMTheme= new MTheme;
        return sMTheme;
    }

signals:
    void themeIndexChanged(int);

public slots:
    void setTheme(qint64 theme) {
        qWarning()<<" --- setTheme : "<<theme;
        qint64 nTheme = getTheme();
        if(nTheme == theme) {
            return;
        }

        QSettings* settings;
        settings = new QSettings("/opt/.theme.ini", QSettings::IniFormat);
        if(settings == NULL) {
            qWarning()<<" --- Error: theme.ini set value failed";
            return;
        }
        settings->setValue("theme/id", theme);
        delete settings;
        sync();
        ValueChangeSet(themeIndex, theme);
//        m_themeIndex = theme;
        qWarning()<<" --- set theme value = "<<theme;
        currentTheme = theme;
    }

    qint64 getTheme() {
        QSettings* settings;
        settings = new QSettings("/opt/.theme.ini", QSettings::IniFormat);
        if(settings == NULL) {
            currentTheme = 0;
            qWarning()<<" --- Error: theme.ini get value failed";
            return 0;
        }
        currentTheme = settings->value("theme/id", 0).toInt();
        delete settings;
        qWarning()<<" --- get theme value = "<<currentTheme;
        return currentTheme;
    }

    qint64 getCurrentTheme() {
        return currentTheme;
    }

private:
    qint64 currentTheme = 0;
    qint64 m_themeIndex = 0;

};

#endif // THEME_H

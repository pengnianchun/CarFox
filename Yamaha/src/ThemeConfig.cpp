
#include "ThemeConfig.hpp"
#include <QSettings>

ThemeConfig::ThemeConfig()
{

}

void ThemeConfig::setThemeNo(qint8 themeNo)
{
    qint8 theme = getThemeNo();
    if (theme == themeNo) {
        return;
    }

#ifdef Q_PROCESSOR_ARM
    QSettings * settings = new QSettings("/opt/.theme.ini", QSettings::IniFormat);
#else
    QSettings * settings = new QSettings(".theme.ini", QSettings::IniFormat);
#endif

    if (settings == NULL) {
        qWarning()<<" --- Error: theme.ini set value failed";
        return;
    }
    settings->setValue("theme/id", themeNo);
    delete settings;
#ifdef Q_PROCESSOR_ARM
        sync();
#else
   //    sync();
#endif

    if (mThemeNo != themeNo) {
        mThemeNo = themeNo;
        emit themeNoChanged(themeNo);
    }

}

qint8 ThemeConfig::getThemeNo()
{

#ifdef Q_PROCESSOR_ARM
    QSettings * settings = new QSettings("/opt/.theme.ini", QSettings::IniFormat);
#else
    QSettings * settings = new QSettings(".theme.ini", QSettings::IniFormat);
#endif

    qDebug() << "---------ThemeConfig::getThemeNo, setting:" << settings->fileName();
    if(settings == NULL) {
        qWarning()<<" --- Error: theme.ini get value failed";
        mThemeNo = -1;
        return mThemeNo;
    }
    mThemeNo = settings->value("theme/id", 0).toInt();

    delete settings;
    qDebug() << "---------ThemeConfig::getThemeNo : " << mThemeNo;

    return mThemeNo;
}

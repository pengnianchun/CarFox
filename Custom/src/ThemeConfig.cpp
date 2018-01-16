
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

    QSettings * settings = new QSettings("~/.theme.ini", QSettings::IniFormat);

    if (settings == NULL) {
        return;
    }
    settings->setValue("theme/id", themeNo);
    delete settings;
//    sync();

    if (mThemeNo != themeNo) {
        mThemeNo = themeNo;
        emit themeNoChanged(themeNo);
    }

}

qint8 ThemeConfig::getThemeNo()
{
    QSettings* settings;
    settings = new QSettings("~/.theme.ini", QSettings::IniFormat);
    if(settings == NULL) {
        qWarning()<<" --- Error: theme.ini get value failed";
        mThemeNo = -1;
        return mThemeNo;
    }
    mThemeNo = settings->value("theme/id", 0).toInt();
    delete settings;
    return mThemeNo;
}

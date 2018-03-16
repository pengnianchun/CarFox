#pragma once

#include <QObject>
#include "Global.hpp"

class ThemeConfig : public QObject
{
    Q_OBJECT

public:
    ThemeConfig();

    void setThemeNo(qint8 themeNo);

    qint8 getThemeNo();

signals:
    void themeNoChanged(int themeNo);

private:
    int mThemeNo = -1;

};

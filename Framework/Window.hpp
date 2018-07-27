#pragma once

#include <QQuickView>
#include <QQmlEngine>

#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

/*
 * 重要类： 继承了QQuickView， 提供了Qt Quick的接口.显示QtQuick用户界面的窗口
 */

class Window : public QQuickView
{
    Q_OBJECT

public:
    static Window *instance() {
        static Window *sWindow = new Window;
        return sWindow;
    }

protected:
    Window();
    virtual ~Window();
};

CARFOX_END_NAMESPACE

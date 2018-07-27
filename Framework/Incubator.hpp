#pragma once

#include <QQmlIncubator>

#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

/*
 * 重要类： 继承了QQmlIncubator。 目的是异步加载qml。qml的孵化器
 * 该类不对外开放的。QmlLayer类拥有该对象。
 */

class Incubator : public QObject, public QQmlIncubator
{
    Q_OBJECT

public:
    Incubator();

signals:
    void qmlIncubatorStatusChanged(QQmlIncubator::Status status);

protected:
    virtual void statusChanged(Status status) Q_DECL_OVERRIDE; //实现父类函数
};

CARFOX_END_NAMESPACE

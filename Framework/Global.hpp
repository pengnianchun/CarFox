#pragma once

#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <cstdlib>
#include <map>
#include <functional>
#include <memory>
#include <QObject>
#include <QFile>
#include <QString>
#include <QDateTime>
#include <QMap>
#include <QThread>
#include <QLoggingCategory>
#include <QDebug>

#define HOST_IP_ADDRESS   "192.168.3.5"
#define LOACTION_ADDRESS  "127.0.0.1"

#define CARFOX_NAME_SPACE carfox
#define CARFOX_BEGIN_NAMESPACE namespace CARFOX_NAME_SPACE {
#define CARFOX_END_NAMESPACE }

#define FUNC __PRETTY_FUNCTION__

Q_DECLARE_LOGGING_CATEGORY(Framework)
Q_DECLARE_LOGGING_CATEGORY(Yamaha)

/*
 * Q_PROPERTY的替代宏定义，方便代码书写
 */
#define MEMBER_PROPERTY_WITH_NOTIFY(Type, Name, InitValue) \
public: \
    Q_SIGNAL void Name##Changed(Type); \
protected: \
    Type m_##Name = InitValue; \
    Q_PROPERTY(Type Name MEMBER m_##Name NOTIFY Name##Changed) \
private:

#define MEMBER_PROPERTY_WITHOUT_NOTIFY(Type, Name, InitValue) \
protected: \
    Type m_##Name = InitValue; \
    Q_PROPERTY(Type Name MEMBER m_##Name) \
private:

#define MEMBER_PROPERTY_VALUE_CHANGED(name, v) do { if (m_##name != (v)) { m_##name = (v); emit name##Changed(v); }} while (0)


#pragma once

#include <QObject>

class CustomEnum : public QObject
{
    Q_OBJECT
public:
    // 枚举主题模式
    enum ThemeMode
    {
        Theme1Mode = 0,    // 传统主题
        Theme2Mode = 1,      // 简约主题
        Theme3Mode = 2,         // 科技主题
        Theme4Mode = 3       // 概念主题
    };
    Q_ENUMS(ThemeMode)

    // 按键键值枚举
    enum KeyValue
    {
        KEY_ENTER = 1,
        KEY_BACK = 2,
        KEY_UP = 3,
        KEY_DOWN = 4,
    };
    Q_ENUMS(KeyValue)

    // 语言类型枚举
    enum TypeLangSet
    {
        LANG_CN = 0,
        LANG_EN = 1,
    };
    Q_ENUMS(TypeLangSet)

};

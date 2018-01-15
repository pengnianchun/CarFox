#pragma once

#include <CarMsg.hpp>

class CustomCarMsgWorker;

class CustomCarMsg : public carfox::CarMsg
{
    Q_OBJECT

    // 上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML
    MEMBER_PROPERTY_WITH_NOTIFY(int, themeMode, 0) // 主题设置




public:
    explicit CustomCarMsg(CustomCarMsgWorker *worker);

public slots:

private slots:
    // 上行帧 更新数据槽函数
    void updateThemeMode (int data);


signals:
    // 下行帧 数据变更信号


private:

};

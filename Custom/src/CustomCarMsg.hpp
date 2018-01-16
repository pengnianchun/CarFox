#pragma once

#include <CarMsg.hpp>
#include "KeyManager.hpp"
class CustomCarMsgWorker;

class CustomCarMsg : public carfox::CarMsg
{
    Q_OBJECT

    // 上行帧,利用宏定义变量、信号、用Q_PROPERTY注册到QML
    MEMBER_PROPERTY_WITH_NOTIFY(int, themeMode, 0) // 主题设置




public:
    explicit CustomCarMsg(CustomCarMsgWorker *worker);


private:
    void connectWorkerToMsg(CustomCarMsgWorker *worker);
    void connectMsgToWorker(CustomCarMsgWorker *worker);

public slots:


private slots:
    // 上行帧 更新数据槽函数, worker to msg
    void updateThemeMode (qint8 data);

signals:
    // 上行帧 worker to msg
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);
    void downButtonChanged();


    // 下行帧 数据变更信号
    void sendEnableKeys(bool enable);
    void sendThemeSetChanged(qint8 themeNo);

private:
    bool mEnableKeys = false;
};

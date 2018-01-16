
#pragma once

#include <memory>
#include <QTimer>
#include <QHash>
#include "CustomEnum.hpp"

class KeyManager : public QObject
{
    Q_OBJECT

public:


    enum KeyStatus {
        KeyPressed = 0,    // 只要按下，就持续触发
        KeyReleased,       // 松开时触发一次
        KeyShortPressed,   // keyPressed/keyReleased按顺序发生时触发一次
        KeyDoublePressed,  // 双击，500毫秒内
        DoubleKeysPressed, // 同时按下2个键
        KeyLongPressed     // 长按，2000ms
    };

public:
    KeyManager();

public:

    /*
     * 检测按键状态
     * value: 1 表示按下， 0 表示没有按下
     * key: 表示使用哪个按键
     */
    void detectKeyEvent(bool value, CustomEnum::KeyType key);

signals:
    void keyPressed(int keyType);
    void keyReleased(int keyType);
    void keyDoublePressed(int keyType);
    void doubleKeysPressed(int keyType1, int keyType2);
    void keyLongPressed(int keyType);
    void keyShortPressed(int keyType);

private slots:
    void handleLongPressTimeout();

private:
    CustomEnum::KeyType mPreviousPressedKey = CustomEnum::NoneKey;
    qint64 mPreviousKeyPressedTime = 0;
    std::shared_ptr<QTimer> mLongPressDetectionTimer = std::make_shared<QTimer>(this);
    QHash<int, bool> mKeyStatus;

};


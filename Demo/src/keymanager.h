#ifndef KEYMANAGER_H
#define KEYMANAGER_H

#include <memory>
#include <QTimer>
#include <QHash>

class KeyManager : public QObject
{
    Q_OBJECT

public:
    enum KeyType {
        EnterKey = 0,
        BackKey,
        PrevKey,
        NextKey,
        NoneKey
    };

    enum KeyStatus {
        KeyPressed = 0,    // 只要按下，就持续触发
        KeyReleased,       // 松开时触发一次
        KeyShortPressed,   // keyPressed/keyReleased按顺序发生时触发一次
        KeyDoublePressed,  // 双击，500毫秒内
        DoubleKeysPressed, // 同时按下2个键
        KeyLongPressed     // 长按，2000ms
    };

protected:
    KeyManager();

public:
    static KeyManager *instance() {
        static KeyManager *sKeyManager= new KeyManager;
        return sKeyManager;
    }

public:

    /*
     * 检测按键状态
     * value: 1 表示按下， 0 表示没有按下
     * key: 表示使用哪个按键
     */
    void detectKeyEvent(bool value, KeyType key);

signals:
    void keyPressed(KeyType keyType);
    void keyReleased(KeyType keyType);
    void keyDoublePressed(KeyType keyType);
    void doubleKeysPressed(KeyType keyType1, KeyType keyType2);
    void keyLongPressed(KeyType keyType);
    void keyShortPressed(KeyType keyType);

private slots:
    void handleLongPressTimeout();

private:
    KeyType mPreviousPressedKey = NoneKey;
    qint64 mPreviousKeyPressedTime = 0;
    std::shared_ptr<QTimer> mLongPressDetectionTimer = std::make_shared<QTimer>(this);
    QHash<int, bool> mKeyStatus;

};

#endif // KEYMANAGER_H

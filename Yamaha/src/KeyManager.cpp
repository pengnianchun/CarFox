#include "KeyManager.hpp"
#include <QDateTime>

KeyManager::KeyManager()
{
    connect(mLongPressDetectionTimer.get(), &QTimer::timeout, this, &KeyManager::handleLongPressTimeout);
    mKeyStatus.insert(CustomEnum::EnterKey, false);
    mKeyStatus.insert(CustomEnum::BackKey, false);
    mKeyStatus.insert(CustomEnum::NextKey, false);
    mKeyStatus.insert(CustomEnum::PrevKey, false);
}

void KeyManager::detectKeyEvent(bool value, CustomEnum::KeyType key)
{
    if(mKeyStatus.value(key) == value) {
        return;
    }

    mKeyStatus.insert(key, value);
    if (true == value) {
        emit this->keyPressed(key); // 发射持续触发 ， 一般不用关心
        qint64 currentTime = QDateTime::currentDateTime().toMSecsSinceEpoch();
        if (mPreviousPressedKey == key && (currentTime - mPreviousKeyPressedTime < 500)) {
            emit this->keyDoublePressed(key); // 双击按键
        } else if (currentTime - mPreviousKeyPressedTime < 500) {
            emit this->doubleKeysPressed(mPreviousPressedKey, key);
        }
        mPreviousPressedKey = key;
        mPreviousKeyPressedTime = currentTime;
        mLongPressDetectionTimer->start(2000);
    } else {
        emit this->keyReleased(key);
        mPreviousKeyPressedTime = 0;
        if (mLongPressDetectionTimer->isActive()) {
            mLongPressDetectionTimer->stop();
            emit this->keyShortPressed(key);
        }
    }
}

void KeyManager::handleLongPressTimeout()
{
    emit this->keyLongPressed(mPreviousPressedKey);
    mLongPressDetectionTimer->stop();
}

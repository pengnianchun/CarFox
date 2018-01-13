#pragma once

#include <QPair>
#include <QHash>

#include "Global.hpp"
#include "CarUpdates.hpp"
#include "MultiLanguage.hpp"

#include "CarMsg.hpp"

CARFOX_BEGIN_NAMESPACE

typedef QHash<QString, QObject *> ContextPropertyHash;

/*
 * 说明： 上下文属性类，控制了串口协议，和多语言设置
 * Fake : 存在Fake的目的是将qml和cpp之间的信号发射中断， 比如有些qml是hide状态，没必要拿到cpp里面的信号
 */
class ContextProperty
{
public:
    ContextProperty(const QString &carUpdatesName,  const QString &carMsgName,  const QString &multiLanguageName);

    void addContextProperty(const QString &contextName, QObject *obj);

    const ContextPropertyHash &contextProperties();

    const QString &carUpdatesName() const;
    std::shared_ptr<CarUpdates> fakeCarUpdates();
    void setFakeCarUpdates(std::shared_ptr<CarUpdates> fakeCarUpdatesObj);
    std::shared_ptr<CarUpdates> trueCarUpdates();
    void setTrueCarUpdates(std::shared_ptr<CarUpdates> trueCarUpdatesObj);

    const QString &multiLanguageName() const;
    std::shared_ptr<MultiLanguage> fakeMultiLanguage();
    void setFakeMultiLanguage(std::shared_ptr<MultiLanguage> fakeMultiLanguageObj);
    std::shared_ptr<MultiLanguage> trueMultiLanguage();
    void setTrueMultiLanguage(std::shared_ptr<MultiLanguage> trueMultiLanguageObj);

    const QString &carMsgName() const;
    std::shared_ptr<CarMsg> fakeCarMsg();
    void setFakeCarMsg(std::shared_ptr<CarMsg> fakeCarMsgObj);
    std::shared_ptr<CarMsg> trueCarMsg();
    void setTrueCarMsg(std::shared_ptr<CarMsg> trueCarMsgObj);

private:
    ContextPropertyHash mContextProperties;

    QString mCarUpdatesName;
    std::shared_ptr<CarUpdates> mFakeCarUpdates;
    std::shared_ptr<CarUpdates> mTrueCarUpdates;

    QString mMultilanguageName;
    std::shared_ptr<MultiLanguage> mFakeMultiLanguages;
    std::shared_ptr<MultiLanguage> mTrueMultilanguages;

    QString mCarMsgName;
    std::shared_ptr<CarMsg> mFakeCarMsg;
    std::shared_ptr<CarMsg> mTrueCarMsg;
};

CARFOX_END_NAMESPACE

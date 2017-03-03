#pragma once

#include <QPair>
#include <QHash>

#include "Global.hpp"
#include "CarUpdates.hpp"
#include "MultiLanguage.hpp"

CARFOX_BEGIN_NAMESPACE

typedef QHash<QString, QObject *> ContextPropertyHash;

/*
 * 说明： 上下文属性类，控制了串口协议，和多语言设置
 */
class ContextProperty
{
public:
    ContextProperty(const QString &carUpdatesName, const QString &multiLanguageName);

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

private:
    ContextPropertyHash mContextProperties;

    QString mCarUpdatesName;
    std::shared_ptr<CarUpdates> mFakeCarUpdates;
    std::shared_ptr<CarUpdates> mTrueCarUpdates;

    QString mMultilanguageName;
    std::shared_ptr<MultiLanguage> mFakeMultiLanguages;
    std::shared_ptr<MultiLanguage> mTrueMultilanguages;
};

CARFOX_END_NAMESPACE

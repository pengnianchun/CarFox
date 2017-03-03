#include "ContextProperty.hpp"

CARFOX_BEGIN_NAMESPACE

ContextProperty::ContextProperty(const QString &carUpdatesName, const QString &multiLanguageName)
    : mCarUpdatesName(carUpdatesName)
    , mMultilanguageName(multiLanguageName)
{
    Q_ASSERT(!mCarUpdatesName.isEmpty());
}

void ContextProperty::addContextProperty(const QString &contextName, QObject *obj)
{
    if (contextName.isEmpty()) {
        return;
    }
    mContextProperties[contextName] = obj;
}

const ContextPropertyHash &ContextProperty::contextProperties()
{
    return mContextProperties;
}

const QString &ContextProperty::carUpdatesName() const
{
    return mCarUpdatesName;
}

std::shared_ptr<CarUpdates> ContextProperty::fakeCarUpdates()
{
    return mFakeCarUpdates;
}

void ContextProperty::setFakeCarUpdates(std::shared_ptr<CarUpdates> fakeCarUpdatesObj)
{
    mFakeCarUpdates = fakeCarUpdatesObj;
}

std::shared_ptr<CarUpdates> ContextProperty::trueCarUpdates()
{
    return mTrueCarUpdates;
}

void ContextProperty::setTrueCarUpdates(std::shared_ptr<CarUpdates> trueCarUpdatesObj)
{
    mTrueCarUpdates = trueCarUpdatesObj;
}

const QString &ContextProperty::multiLanguageName() const
{
    return mMultilanguageName;
}

std::shared_ptr<MultiLanguage> ContextProperty::fakeMultiLanguage()
{
    return mFakeMultiLanguages;
}

void ContextProperty::setFakeMultiLanguage(std::shared_ptr<MultiLanguage> fakeMultiLanguageObj)
{
    mFakeMultiLanguages = fakeMultiLanguageObj;
}

std::shared_ptr<MultiLanguage> ContextProperty::trueMultiLanguage()
{
    return mTrueMultilanguages;
}

void ContextProperty::setTrueMultiLanguage(std::shared_ptr<MultiLanguage> trueMultiLanguageObj)
{
    mTrueMultilanguages = trueMultiLanguageObj;
}


CARFOX_END_NAMESPACE

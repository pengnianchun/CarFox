#include "ContextProperty.hpp"

CARFOX_BEGIN_NAMESPACE

ContextProperty::ContextProperty(const QString &carMsgName, const QString &multiLanguageName)
    : mCarMsgName(carMsgName)
    , mMultilanguageName(multiLanguageName)
{
    Q_ASSERT(!mCarMsgName.isEmpty());
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

const QString &ContextProperty::carMsgName() const
{
    return mCarMsgName;
}

std::shared_ptr<CarMsg> ContextProperty::fakeCarMsg()
{
    return mFakeCarMsg;
}

void ContextProperty::setFakeCarMsg(std::shared_ptr<CarMsg> fakeCarMsgObj)
{
    mFakeCarMsg = fakeCarMsgObj;
}

std::shared_ptr<CarMsg> ContextProperty::trueCarMsg()
{
    return mTrueCarMsg;
}

void ContextProperty::setTrueCarMsg(std::shared_ptr<CarMsg> trueCarMsgObj)
{
    mTrueCarMsg = trueCarMsgObj;
}


CARFOX_END_NAMESPACE

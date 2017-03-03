#include <QCoreApplication>

#include "MultiLanguage.hpp"

CARFOX_BEGIN_NAMESPACE

MultiLanguage::MultiLanguage(bool fakeMultiLanguage)
    :mFakeMultiLanguage(fakeMultiLanguage)
{

}

void MultiLanguage::switchLanguageTo(const Languages &lan)
{
    mLanguage = mLanguageHash[lan];

    if (mFakeMultiLanguage) return;

    emit languageChanged();
}

CARFOX_END_NAMESPACE

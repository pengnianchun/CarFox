#include "CustomMultiLanguage.hpp"

CustomMultiLanguage::CustomMultiLanguage(bool fakeMultiLanguage)
: MultiLanguage(fakeMultiLanguage)
{
    initializeENTranslation();
    initializeCNTranslation();
    switchLanguageTo(CustomMultiLanguage::EN);
}

void CustomMultiLanguage::initializeENTranslation()
{

}

void CustomMultiLanguage::initializeCNTranslation()
{

}

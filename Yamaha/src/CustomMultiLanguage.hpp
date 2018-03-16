#pragma once

#include <MultiLanguage.hpp>

class CustomMultiLanguage : public carfox::MultiLanguage
{
    Q_OBJECT

public:
    CustomMultiLanguage(bool fakeMultiLanguage = false);

private:
    void initializeENTranslation();
    void initializeCNTranslation();
};

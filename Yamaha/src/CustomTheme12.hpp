#pragma once

#include <Theme.hpp>

class CustomTheme12 : public carfox::Theme
{
    Q_OBJECT
public:
    CustomTheme12(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId);

    void create();
};

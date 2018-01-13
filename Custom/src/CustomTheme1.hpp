#pragma once

#include <Theme.hpp>

class CustomTheme1 : public carfox::Theme
{
    Q_OBJECT
public:
    CustomTheme1(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId);

    void create();
};

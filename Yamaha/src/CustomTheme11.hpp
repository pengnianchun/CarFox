#pragma once

#include <Theme.hpp>

class CustomTheme11 : public carfox::Theme
{
    Q_OBJECT
public:
    CustomTheme11(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId);

    void create();
};

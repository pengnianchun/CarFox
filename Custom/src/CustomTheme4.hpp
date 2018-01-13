#pragma once

#include <Theme.hpp>

class CustomTheme4 : public carfox::Theme
{
    Q_OBJECT
public:
    CustomTheme4(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId);

    void create();
};

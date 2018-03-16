#pragma once

#include <Theme.hpp>

class CustomTheme2 : public carfox::Theme
{
    Q_OBJECT
public:
    CustomTheme2(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId);

    void create();
};

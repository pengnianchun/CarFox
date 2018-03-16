#pragma once

#include <Theme.hpp>

class CustomTheme3 : public carfox::Theme
{
    Q_OBJECT
public:
    CustomTheme3(std::shared_ptr<carfox::ContextProperty> contextProperties, const QString &themeId);

    void create();
};

#pragma once

#include "Theme.hpp"
#include "Global.hpp"
CARFOX_BEGIN_NAMESPACE

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTheme MEMBER mCurrentThemeId WRITE setCurrentTheme NOTIFY currentThemeChanged)

public:
    static ThemeManager *instance() {
        static ThemeManager *sThemeManager= new ThemeManager;
        return sThemeManager;
    }

    inline bool isSwitchingTheme() {
        return mIsSwitchingTheme;
    }

    void addTheme(std::shared_ptr<Theme> theme);
    void loadTheme(const QString &themeId);
    void loadThemeSync(const QString &themeId);
    void setReady(bool isReady);
    void setCurrentTheme(const QString &themeId);
    void showLayer(const QString &layerId);
    void hideLayer(const QString &layerId);
    void unloadLayer(const QString &layerId);
    void loadThemesBackground();
    void handleSplashScreenFinished();
    bool isGlobalLayersLoaded();
    Theme *currentTheme();
    std::shared_ptr<Layer> qmlLayer(const QString &layerId);
    std::shared_ptr<Layer> addGlobalLayer(std::shared_ptr<ContextProperty> contextProperties, const QString &layerPath, const QString &layerId);

    Q_INVOKABLE void switchTheme(const QString &themeId);

public slots:
    void loadGlobal();
    void showMainScreen();

signals:
    void currentThemeChanged();
    void ready();
    void showDormancy();
    void currentThemeLoaded();

protected:
    ThemeManager();

private slots:
    void handleThemeLoadedChanged();
    void onThemeLoaded();

    void unloadTheme();


private:

    bool mReady = false;
    bool mIsSwitchingTheme = false;
    QString mCurrentThemeId;
    QString mPreThemeId = QString::fromLatin1("");
    Theme *mLoadingTheme;

    QHash<QString, std::shared_ptr<Theme>> mThemes;
    QHash<QString, std::shared_ptr<Layer>> mGlobalLayers; //全局的layer,不隶属于某一个theme
};

CARFOX_END_NAMESPACE

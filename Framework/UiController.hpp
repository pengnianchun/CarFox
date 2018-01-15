#pragma once

#include <QMap>
#include <QLocalSocket>
#include <QGuiApplication>
#include <QSystemSemaphore>

#ifdef __cplusplus
extern "C" {
#endif

#include <unistd.h>

#ifdef __cplusplus
}
#endif

#include "ThemeManager.hpp"
#include "MultiLanguage.hpp"
#include "Global.hpp"
CARFOX_BEGIN_NAMESPACE

typedef QMap<int, QString> StackView;

/*
 * 超级重要接口类： Ui的总控制
 */
class UiController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantMap rc MEMBER mRemainContent NOTIFY remainContentChanged)
    Q_PROPERTY(bool firstInstance MEMBER mFirstInstance NOTIFY firstInstanceChanged)
    Q_PROPERTY(bool isMenuShown READ isMenuShown NOTIFY isMenuShownChanged)

public:
    UiController(int screenWidth, int screenHeight, bool firstInstance = true);

    // APP层调用，框架的入口
    void start();
    void connectQuitToApp(QGuiApplication *app);

    /*
     * qml可以调用到c++层的代码
     */
    Q_INVOKABLE void showLayer(const QString &layerId); // 手动显示layer
    Q_INVOKABLE void setLayerProperty(const QString &layerId, const QString &propertyName, QVariant value,
                                      bool setForVisibleLayerOnly = true);
    Q_INVOKABLE void setLayerChildObjectProperty(const QString &layerId, const QString &objectName,
                                                 const QString &propertyName, QVariant value);

    Q_INVOKABLE void hideLayer(const QString &layerId);
    Q_INVOKABLE bool isLayerShown(const QString &layerId);

    Q_INVOKABLE bool isMenuShown();
    Q_INVOKABLE void hideRootMenu();
    Q_INVOKABLE void showRootMenu();

    Q_INVOKABLE void loadLayer(const QString &layerId);
    Q_INVOKABLE void unloadLayer(const QString &layerId);

    Q_INVOKABLE void pushToStackView(const QString &layerId, int priority);
    Q_INVOKABLE void popFromStackView(int priority);
    Q_INVOKABLE void showStackViewTop();
    Q_INVOKABLE void refreshScreen();

    Q_INVOKABLE void unloadCurrentTheme();
    Q_INVOKABLE void loadCurrentTheme();
    Q_INVOKABLE void hideCurrentTheme();
    Q_INVOKABLE void showCurrentTheme();
    Q_INVOKABLE void loadThemesBackground();

    Q_INVOKABLE void setLayerShowPolicy(const QString &layerId, Layer::ShowPolicy showPolicy);
    Q_INVOKABLE void setRemainContent(const QString &layerId, const QVariant &content);
    Q_INVOKABLE QVariant remainContent(const QString &key);

    Q_INVOKABLE void setWindowBackgroundColor(const QColor &color);

signals:
    void requestSystemShutdown();
    void requestSystemWakeup();

    void remainContentChanged();
    void firstInstanceChanged();
    void isMenuShownChanged();

protected:
    // 纯需函数， 子类必须实现
    virtual void createThemes(std::shared_ptr<ContextProperty> cp) = 0;

    // 创建上下文，这样在QML中就可以使用, 子类不应该重新实现
     std::shared_ptr<ContextProperty> createContextProperty(std::shared_ptr<CarMsg> carMsg, std::shared_ptr<CarMsg> fakeCarMsg,
            std::shared_ptr<MultiLanguage> multiLanguage, std::shared_ptr<MultiLanguage> fakeMultiLanguage);


     virtual std::shared_ptr<CarMsg> createCarMsg() = 0;
     virtual std::shared_ptr<CarMsg> createFakeCarMsg() = 0;

     virtual std::shared_ptr<MultiLanguage> createMultiLanguage() = 0;
     virtual std::shared_ptr<MultiLanguage> createFakeMultiLanguage() = 0;

    virtual void registerQmlTypes();
    virtual void loadFonts();

    void loadFont(const QString &fontPath);

    void addTheme(std::shared_ptr<Theme> theme);
    void addTheme(std::shared_ptr<Theme> theme, qint32 startTime,qint32 incubateForTime);

    std::shared_ptr<Layer> addGlobalLayer(std::shared_ptr<ContextProperty> contextProperties, const QString &layerPath, const QString &layerId);
    ThemeManager *themeManager(); // app层的UiController继承者可以拿到这个对象

    void startWith(const QString &themeId);
    void switchThemeTo(const QString &themeId);
private:
    void updateRootMenuStatus(const QString &layerId, bool status);

protected:
    bool mFirstInstance;

private:
    ThemeManager *mThemeManager = ThemeManager::instance();
    std::shared_ptr<StackView> mStackView = std::make_shared<StackView>();
    QMap<QString, QVariant> mRemainContent;

    // 菜单
    bool mIsMenuShown = false;
    QString mRootMenuId = "";


};

CARFOX_END_NAMESPACE

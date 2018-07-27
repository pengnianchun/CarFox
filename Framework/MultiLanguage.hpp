#pragma once

#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

/*
 *  说明： 多语言相关处理类
 */
class MultiLanguage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantMap  lan  MEMBER mLanguage NOTIFY languageChanged)

public:

    MultiLanguage(bool fakeMultiLanguage = false);

    enum Languages
    {
        EN = 0,
        CN
    };
    Q_ENUMS(Languages)

    void switchLanguageTo(const Languages &lan);

signals:
    void languageChanged();

protected:
    inline void insertTranslation(const Languages &lan, const QString &source, const QString &translation) {
        mLanguageHash[lan].insert(source, translation);
    }

private:
    bool mFakeMultiLanguage;
    QHash<Languages, QVariantMap> mLanguageHash;
    QVariantMap mLanguage; //注意这个是一个map，key-value
};

CARFOX_END_NAMESPACE

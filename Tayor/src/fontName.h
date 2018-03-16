#include <QFile>
#include <unistd.h>
#include <QDebug>
#include <QObject>
#include <QFontDatabase>

class MFontName : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString fontCurrentFzLt MEMBER m_fontCurrentFzLt NOTIFY fontCurrentFzLtChanged)
	Q_PROPERTY(QString fontCurrentMetroDF MEMBER m_fontCurrentMetroDF NOTIFY fontCurrentMetroDFChanged)

signals:
    // fonts
	void fontCurrentFzLtChanged(QString);
	void fontCurrentMetroDFChanged(QString);

public:
	explicit MFontName(QObject *parent = 0)
		: QObject(parent)
	{
		m_fontCurrentFzLt = loadFontFamilyFromTTF("/usr/lib/fonts/FzLt.TTF");
        //m_fontCurrentMetroDF = loadFontFamilyFromTTF("/usr/lib/fonts/MetroDF.ttf");
    }

	QString loadFontFamilyFromTTF(QString str)
	{
		static QString font;
		QFile fontFile(str);
		if(!fontFile.open(QIODevice::ReadOnly)) {
			qWarning() << "font file load fail";
			return QString();
		}
		int loadedFontID = QFontDatabase::addApplicationFontFromData(fontFile.readAll());
		QStringList loadedFontFamilies = QFontDatabase::applicationFontFamilies(loadedFontID);
		if(!loadedFontFamilies.empty())
			font = loadedFontFamilies.at(0);

		fontFile.close();
		return font;
	}

private:
	QString m_fontCurrentFzLt;
	QString m_fontCurrentMetroDF;
};

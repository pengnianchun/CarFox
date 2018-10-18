#ifndef QMLGIFIMAGE_H
#define QMLGIFIMAGE_H

#include <QQuickPaintedItem>
#include <QMovie>
#include <QPixmap>
#include <QPainter>

class QmlGifImage : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString gifSource READ gifSource WRITE setGifSource NOTIFY gifSourceChanged)
    Q_PROPERTY(bool playing READ playing WRITE setPlaying NOTIFY playingChanged)
public:
    QmlGifImage(QQuickItem *parent = Q_NULLPTR);

    QString gifSource();
    void setGifSource(QString pValue);

    bool playing();
    void setPlaying(bool pValue);

    void paint(QPainter *painter);

signals:
    void gifSourceChanged();
    void playingChanged();
    void finished();

public slots:
    void slot_GifFrame(int pIndex);

public:
    QMovie      *mMovie;
    QString      m_gifSource;
    bool        m_playing;
};

#endif // QMLGIFIMAGE_H

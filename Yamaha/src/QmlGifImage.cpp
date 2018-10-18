#include "QmlGifImage.hpp"

QmlGifImage::QmlGifImage(QQuickItem *parent) : QQuickPaintedItem(parent)
{
    m_playing = false;
    mMovie = new QMovie(this);
    connect(mMovie, SIGNAL(frameChanged(int)), this, SLOT(slot_GifFrame(int)));
}

QString QmlGifImage::gifSource()
{
    return m_gifSource;
}

void QmlGifImage::setGifSource(QString pValue)
{
    if(m_gifSource.compare(pValue))
    {
        m_gifSource = pValue;
        emit gifSourceChanged();

        if(mMovie)
        {
            QString tmpFile;
            if(m_gifSource.startsWith("qrc:/"))
            {
                tmpFile = m_gifSource.mid(3);
            }
            else
            {
                tmpFile = m_gifSource;
            }
            mMovie->setFileName(tmpFile);  //
        }
    }
}

bool QmlGifImage::playing()
{
    return m_playing;
}

void QmlGifImage::setPlaying(bool pValue)
{
    if(m_playing != pValue)
    {
        m_playing = pValue;
        emit playingChanged();

        if(m_playing == true)
        {
            if(mMovie && mMovie->isValid() && (mMovie->state() == QMovie::NotRunning))
            {
                mMovie->start();
            }
        }
        else
        {
            if(mMovie && mMovie->isValid() && (mMovie->state() != QMovie::NotRunning))
            {
                mMovie->stop();
            }
        }
    }
}

void QmlGifImage::paint(QPainter *painter)
{
    if(mMovie && mMovie->isValid())
    {
        QPixmap tmpPixmap = mMovie->currentPixmap();
        if(!tmpPixmap.isNull())
        {
            painter->drawPixmap(QRect(0,0,width(),height()), tmpPixmap);
        }
    }
}

void QmlGifImage::slot_GifFrame(int pIndex)
{
    if(pIndex == (mMovie->frameCount()-1))
    {
        mMovie->stop();
        mMovie->deleteLater();
        mMovie = 0;
        emit finished();
    }
    else
    {
        update();
    }
}

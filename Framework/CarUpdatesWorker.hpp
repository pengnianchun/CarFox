#pragma once


#include <QTimer>
#include <QObject>
#include <QDateTime>
#include <QSerialPort>
#include <QMetaMethod>
#include <QTimerEvent>
#include <functional>

#include "Global.hpp"
#include "Protocol.hpp"
#include "CarUpdatesWorkerData.hpp"

CARFOX_BEGIN_NAMESPACE

class CarUpdatesWorker : public QObject
{
    Q_OBJECT
public:
    // 通用帧和专用帧初始化状态标志位
    enum InitializeType {
        GeneralFrameInitialized = 0,
        SpecialFrameInitialized
    };

    // 数据解析状态标志位
    enum DataParseStatus {
        Successed = 0,
        LengthFailed,
        TailFlagFailed,
        MagicFailed
    };

    bool isEnabled()
    {
        return mSerialEnabled;
    }

    CarUpdatesWorker();

    CarUpdatesWorkerStateData &data();

public slots:
    void onStarted();
    void activate();
    void deactivate();
    void updateSignals();

    // 通用下行帧，数据更新槽函数
    void sendCommandReq(bool commandReq);
    void sendCloseReq(bool closeReq);
    void sendTripClean(bool tripClean);
    void sendAvgSpeedClean(bool avgSpeedClean);
    void sendAvgFuelClean(bool avgFuelClean);
    void sendProjectMode(bool projectMode);
    void sendAlarmInterface(uint alarmInterface);
    void sendInterfaceSoundSync(uint interfaceSoundSync);
    void sendDateTimeSet(uint dateTimeSet);

signals:
    // 通用上行帧变更信号
    void tmpVersionChanged(quint8);
    void relVersionChanged(quint8);
    void hwVersionChanged(quint8);
    void strMcuVersionChanged(QString);
    void rpmChanged(quint16);
    void qDateTimeChanged(QDateTime);
    void dateTimeChanged(quint32);
    void speedChanged(quint8);
    void waterTempChanged(quint8);
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);
    void igOnChanged(bool);
    void gearChanged(uint);
    void gearModeChanged(uint);
    void lfDoorChanged(bool);
    void rfDoorChanged(bool);
    void lrDoorChanged(bool);
    void rrDoorChanged(bool);
    void hoodDoorChanged(bool);
    void trunkDoorChanged(bool);
    void odoChanged(quint32);
    void avgSpeedChanged(quint8);
    void remainMileageChanged(quint16);
    void trip1Changed(quint32);
    void fuelChanged(quint8);
    void trip2Changed(quint32);
    void socChanged(quint8);
    void maintenanceMileageChanged(quint16);
    void outTempChanged(quint16);
    void avgFuelChanged(quint16);
    void instantFuelChanged(quint16);
    void batteryCurrentChanged(quint16);
    void batteryVoltageChanged(quint16);

    void initialized();

protected:

    // 数据解析
    virtual DataParseStatus parseData(MagicFrame *magicFrame, QByteArray &byteArray);

    // 打印硬件版本
    virtual void printHwVersion();

    template <typename T>
    void updateStatus(T &oldValue, const T &newValue, std::function<void (T)> signal = [](T){}) {
        if (newValue != oldValue) {
            oldValue = newValue;
            signal(oldValue);
        }
    }

    /*
     * 更新信号， 发射合适的数据。
     */
    template <typename T>
    void updateStatus(T &oldValue, const T &newValue, const T &min, const T &max, std::function<void (T)> signal = [](T){}) {
         if (qAbs(oldValue - qBound(min, newValue, max)) > 0.001) {
           oldValue = qBound(min, newValue, max);
           signal(oldValue);
       }
   }

   template <typename T>
   void updateStatus(T &oldValue, const T &newValue, const T &min, const T &max, const T &err, std::function<void (T)> signal = [](T){}) {
       if (err == newValue) {
           this->updateStatus(oldValue, newValue, signal);
       }
       else {
           this->updateStatus(oldValue, newValue, min, max, signal);
       }
   }

   // 发送数据
   void sendData(const QByteArray &data, uint frameType);

   virtual void checkCarUpdatesSignals();
   void initializeFirstFrame(InitializeType type);
   bool isInitialized();
   bool isSerialPortOpened();

protected:
   void timerEvent(QTimerEvent *event);

private:

   void updateCarUpdates(GeneralInfo data);
   void updateSignalData(GeneralInfo data);


   void initializeSerialPort();
   void lookingFor0xAA(bool &found);

   void sendDefaultSettingsFrame();
   void setDefaultSettingsFrame(SettingsInfo &settingsInfo);
   void detectKeyEvent(bool value, int key);

   void sendHeartBeatPacket();

private slots:
   void receiveData();
   void handleLongPressTimeout();
   void handleError(QSerialPort::SerialPortError error);

private:
    std::shared_ptr<QSerialPort> mSerialPort;
    bool mSerialEnabled = false;
    QByteArray mReceivedData; //收到的数据,这个是一个缓存
    CarUpdatesWorkerStateData mStateData; //状态数据
    CarUpdatesWorkerSignalData mSignalData; // 信号数据

    std::shared_ptr<QTimer> mLongPressDetectionTimer;

    bool mSignalDataInitialized = false;
    bool mGeneralFrameInitialized = false;
    bool mSpecialFrameInitialized = false;

    uint mAlarmInterface = 0;
};

CARFOX_END_NAMESPACE

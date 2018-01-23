#pragma once

#include <CarMsgWorker.hpp>
#include "KeyManager.hpp"
#include "ThemeConfig.hpp"
#include "CustomCarMsgWorkerData.hpp"

#include "airctrl_system_frame.pb.h"
#include "auxiliary_system_frame.pb.h"
#include "battery_group_temperature_frame.pb.h"
#include "battery_group_voltage_frame.pb.h"
#include "battery_manage_system_frame.pb.h"
#include "control_system_frame.pb.h"
#include "settings.pb.h"
#include "general_info_frame.pb.h"
#include "instrument_frame.pb.h"
#include "key.pb.h"
#include "menu_num.pb.h"
#include "module_back_frame.pb.h"
#include "module_front_frame.pb.h"
#include "module_middle_frame.pb.h"
#include "moter_system_frame.pb.h"
#include "tcu_system_frame.pb.h"
#include "warning_frame.pb.h"


class CustomCarMsgWorker : public carfox::CarMsgWorker
{
    Q_OBJECT

public:
    CustomCarMsgWorker();

public slots:
    virtual void onStarted(); // 线程启动的时候调用, 这个在次线程下

    // 下行帧，Msg to Worker
    void enableKeys(bool enable);
    void themeSet(qint8 setNo);

    void handleThemeModeChanged(qint8 themeNo);

signals:
    // 上行帧 Worker to Msg
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);
    void themeModeChanged(qint8 themeNo);
    void carModeChanged(qint8 modeNo);

    void carSpeedChanged(int value);
    void rpmChanged(int value);
    void totalVoltageChanged(int value);
    void totalCurrentChanged(int value);
    void gearChanged(int value);
    void odoChanged(uint value);
    void tripChanged(float value);
    void socChanged(uint value);
    void apVol1Changed(float value);
    void apVol2Changed(float value);
    void moter_control_tempChanged(int value);
    void moter_tempChanged(int value);
    void batteryChanged(int value);
    void spnChanged(int value);
    void engine_water_tempChanged(int value);
    void urea_levelChanged(int value);
    void fault_levelChanged(uint value);
    void fault_codeChanged(int value);
    void oil_levelChanged(uint value);
    void engine_oil_pressureChanged(float value);

protected:
     virtual void registerCallback();

private:

    void handleProtoKey(const carfox::MessagePtr& msg);
    void handleProtoAutoFlash(const carfox::MessagePtr& msg);
    void handleGeneralInfoFrame(const carfox::MessagePtr& msg);

private:
    CarMsgWorkerStateData mStateData;
    std::shared_ptr<KeyManager> mKeyManager;
    std::shared_ptr<ThemeConfig> mThemeConfig;
};

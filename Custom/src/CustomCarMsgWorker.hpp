#pragma once

#include <CarMsgWorker.hpp>
#include "KeyManager.hpp"

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

signals:
    // 上行帧
    void keyPressed(int key);
    void keyReleased(int key);
    void keyDoublePressed(int key);
    void doubleKeysPressed(int key1, int key2);
    void keyLongPressed(int key);
    void keyShortPressed(int key);

protected:
     virtual void registerCallback();

private:

    void handleProtoKey(const carfox::MessagePtr& msg);


private:
    std::shared_ptr<KeyManager> mKeyManager;
};

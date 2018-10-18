#pragma once

#include "Global.hpp"
CARFOX_BEGIN_NAMESPACE

#include <stdint.h>

#define GOLDEN_RATIO_PRIME_32 0x9e370001U
#define STR4_HASH(a,b,c,d) (((a)<<24)|((b)<<16)|((c)<<8)|(d))*GOLDEN_RATIO_PRIME_32

#define MAGIC_UPDATE_UP     STR4_HASH('U','P','U','P')
#define MAGIC_UPDATE_DOWN   STR4_HASH('D','O','U','P')
#define MAGIC_GENERAL_UP    STR4_HASH('U','P','G','E')
#define MAGIC_GENERAL_DOWN  STR4_HASH('D','O','G','E')
#define MAGIC_SPECIAL_UP    STR4_HASH('U','P','S','P')
#define MAGIC_SPECIAL_DOWN  STR4_HASH('D','O','S','P')
#define MAGIC_OTHER_UP      STR4_HASH('U','P','O','T')
#define MAGIC_OTHER_DOWN    STR4_HASH('D','O','O','T')
#define MAGIC_LOG_UP        STR4_HASH('U','P','L','O')
#define MAGIC_LOG_DOWN      STR4_HASH('D','O','L','O')


#define MAGIC_LEN   4

#if ((MAGIC_UPDATE_UP == MAGIC_UPDATE_DOWN)       \
    || (MAGIC_UPDATE_UP == MAGIC_GENERAL_UP)      \
    || (MAGIC_UPDATE_UP == MAGIC_GENERAL_DOWN)    \
    || (MAGIC_UPDATE_UP == MAGIC_SPECIAL_UP)      \
    || (MAGIC_UPDATE_UP == MAGIC_SPECIAL_DOWN)    \
    || (MAGIC_UPDATE_UP== MAGIC_OTHER_UP)         \
    || (MAGIC_UPDATE_UP == MAGIC_OTHER_DOWN)      \
    || (MAGIC_UPDATE_UP == MAGIC_LOG_UP)          \
    || (MAGIC_UPDATE_UP == MAGIC_LOG_DOWN)        \
    || (MAGIC_UPDATE_DOWN == MAGIC_GENERAL_UP)    \
    || (MAGIC_UPDATE_DOWN == MAGIC_GENERAL_DOWN)  \
    || (MAGIC_UPDATE_DOWN == MAGIC_SPECIAL_UP)    \
    || (MAGIC_UPDATE_DOWN == MAGIC_SPECIAL_DOWN)  \
    || (MAGIC_UPDATE_DOWN == MAGIC_OTHER_UP)      \
    || (MAGIC_UPDATE_DOWN == MAGIC_OTHER_DOWN)    \
    || (MAGIC_UPDATE_DOWN == MAGIC_LOG_UP)        \
    || (MAGIC_UPDATE_DOWN == MAGIC_LOG_DOWN)      \
    || (MAGIC_GENERAL_UP == MAGIC_GENERAL_DOWN)   \
    || (MAGIC_GENERAL_UP == MAGIC_SPECIAL_UP)     \
    || (MAGIC_GENERAL_UP == MAGIC_SPECIAL_DOWN)   \
    || (MAGIC_GENERAL_UP == MAGIC_OTHER_UP)       \
    || (MAGIC_GENERAL_UP == MAGIC_OTHER_DOWN)     \
    || (MAGIC_GENERAL_UP == MAGIC_LOG_UP)         \
    || (MAGIC_GENERAL_UP == MAGIC_LOG_DOWN)       \
    || (MAGIC_GENERAL_DOWN == MAGIC_SPECIAL_UP)   \
    || (MAGIC_GENERAL_DOWN == MAGIC_SPECIAL_DOWN) \
    || (MAGIC_GENERAL_DOWN == MAGIC_OTHER_UP)     \
    || (MAGIC_GENERAL_DOWN == MAGIC_OTHER_DOWN)   \
    || (MAGIC_GENERAL_DOWN == MAGIC_LOG_UP)       \
    || (MAGIC_GENERAL_DOWN == MAGIC_LOG_DOWN)     \
    || (MAGIC_SPECIAL_UP == MAGIC_SPECIAL_DOWN)   \
    || (MAGIC_SPECIAL_UP == MAGIC_OTHER_UP)       \
    || (MAGIC_SPECIAL_UP == MAGIC_OTHER_DOWN)     \
    || (MAGIC_SPECIAL_UP == MAGIC_LOG_UP)         \
    || (MAGIC_SPECIAL_UP == MAGIC_LOG_DOWN)       \
    || (MAGIC_SPECIAL_DOWN == MAGIC_OTHER_UP)     \
    || (MAGIC_SPECIAL_DOWN == MAGIC_OTHER_DOWN)   \
    || (MAGIC_SPECIAL_DOWN == MAGIC_LOG_UP)       \
    || (MAGIC_SPECIAL_DOWN == MAGIC_LOG_DOWN)     \
    || (MAGIC_OTHER_UP == MAGIC_OTHER_DOWN)       \
    || (MAGIC_OTHER_UP == MAGIC_LOG_UP)           \
    || (MAGIC_OTHER_UP == MAGIC_LOG_DOWN)         \
    || (MAGIC_LOG_UP == MAGIC_LOG_DOWN))
#error "Magic hash conflicts"
#endif

/*
 * magic frame sent by MCU . 帧头 长度 crc校验 magic
 */
typedef struct {
    quint8 head;
    quint8 length;
    quint16 crc;
    quint32 magic;
}__attribute__((packed)) MagicFrame;

// 通用上行帧数据 参见《方堰串口通信协议》使用版本为V1.0
typedef struct {
    quint16 tmpVersion: 8,       // byte0: 0 ~ 7  版本信息
        relVersion: 5,           // byte0: 8 ~ 12
        hwVersion: 3;            // byte1: 13 ~ 15
    quint16 rpm;                 // byte2: 0 ~ 15  转速
    quint32 dateTime;            // byte4: 0 ~ 31  日期时间
    quint8 speed;                // byte8: 0 ~ 7   车速
    quint8 waterTemp;            // byte9: 0 ~ 7   水温表
    quint8 key1: 1,              // byte10: 0      确定
        key2: 1,                 // byte10: 1      返回
        key3: 1,                 // byte10: 2      上翻
        key4: 1,                 // byte10: 3      下翻
        remain1: 3,              // byte10: 4 ~ 6  保留
        igOn: 1;                 // byte10: 7      点火状态
    quint8 gear: 4,              // byte11: 0 ~ 3  档位信息
        gearMode: 2,             // byte11: 4 ~ 5  档位模式
        keyStatus: 2;            // byte11: 6 ~ 7  钥匙状态
    quint8 lfDoor: 1,            // byte12: 0      前左门状态
        rfDoor: 1,               // byte12: 1      前右门状态
        lrDoor: 1,               // byte12: 2      后左门状态
        rrDoor: 1,               // byte12: 3      后右门状态
        hoodDoor: 1,             // byte12: 4      引擎盖状态
        trunkDoor: 1,            // byte12: 5      行李箱状态
        remain3: 2;              // byte12: 6 ~ 7  保留
    quint32 odo: 24,             // byte13: 0 ~23  总里程
        avgSpeed: 8;             // byte16: 24~31  平均车速
    quint8 remain4: 8;           // byte17: 0 ~ 7  保留
    quint16 remainMileage;       // byte18: 0 ~ 15 续航里程
    quint32 trip1: 24,           // byte20: 0 ~ 23 小计里程1
        fuel: 8;                 // byte23: 24 ~ 31 燃油量
    quint32 trip2: 24,           // byte24: 0 ~ 23  小计里程2
        soc: 8;                  // byte27: 24 ~ 31 电量
    quint16 maintenanceMileage;  // byte28: 0 ~ 15  保养里程
    quint16 outTemp;             // byte30: 0 ~ 15  车外温度
    quint16 avgFuel;             // byte32: 0 ~ 15  平均油耗
    quint16 instantFuel;         // byte34: 0 ~ 15  瞬时油耗
    quint16 batteryCurrent;      // byte36: 0 ~ 15  动力电池电流
    quint16 batteryVoltage;      // byte38: 0 ~ 15  动力电池电压
}__attribute__((packed)) GeneralInfo;

// 通用上行帧校验
typedef struct {
    quint8 head;
    quint8 length;
    quint16 crc;
    quint32 magic;
    GeneralInfo generalInfo;
    quint8 tail;
}__attribute__((packed)) GeneralFrame;

// 通用下行帧数据
typedef struct {
    quint8 commandReq: 1,       // byte0: 0       命令请求
        closeReq: 1,            // byte0: 1       关屏请求
        tripClean: 1,           // byte0: 2       小计里程清零
        avgSpeedClean: 1,       // byte0: 3       平均车速清零
        avgFuelClean: 1,        // byte0: 4       平均油耗清零
        remain1: 2,             // byte0: 5 ~ 6   保留
        projectMode: 1;         // byte0: 7       工程模式
    quint8 alarmInterface;      // byte1: 0 ~ 7   报警界面声音同步
    quint8 interfaceSoundSync;  // byte2: 0 ~ 7  预留
    quint8 remain2: 8;          // byte3: 0 ~ 7
    quint32 dateTimeSet;        // byte4: 0 ~ 31  日期时间设置
}__attribute__((packed)) SettingsInfo;

// 通用下行帧校验
typedef struct {
    quint8 head;
    quint8 length;
    quint16 crc;
    quint32 magic;
    SettingsInfo settingsInfo;
    quint8 tail;
}__attribute__((packed)) SettingsFrame;

// 定义各个帧长度
#define MAGIC_FRAME_LEN     (const int)(sizeof(MagicFrame))
#define GENERAL_INFO_LEN    (const int)(sizeof(GeneralInfo))
#define GENERAL_FRAME_LEN   (const int)(sizeof(GeneralFrame))
#define SETTINGS_INFO_LEN   (const int)(sizeof(SettingsInfo))
#define SETTINGS_FRAME_LEN  (const int)(sizeof(SettingsFrame))

// 定义向 MCU 发送数据的频率
#define SETTINGSFTRAME_FREQ 100

// 定义串口波特率值
#define SERIAL_BAUD_RATE QSerialPort::Baud115200

/*
 * crc16 check
 */
quint16 crc16Check(quint8 *ptr,quint8 len);

CARFOX_END_NAMESPACE

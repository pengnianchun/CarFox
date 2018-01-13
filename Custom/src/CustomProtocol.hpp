#pragma once
#include <stdint.h>

/*
 * 专用上行帧, 测试使用
 */
typedef struct {
    quint8 lfTirePressure;           // byte0: 0 ~ 7 前左胎压
    quint8 lfTirePressureWarn: 3,    // byte1: 0 ~ 2 前左胎压报警
           lfRemain: 5;
    quint8 themeMode: 2,        // byte2: 0~1 主题设置
           themeModeRemain: 6;

}__attribute__((packed)) SpecialInfo;

/*
 * 专用上行帧校验
 */
typedef struct {
    quint8 head;
    quint8 length;
    quint16 crc;
    quint32 magic;
    SpecialInfo specialInfo;
    quint8 tail;
}__attribute__((packed)) SpecialFrame;

/*
 * 专用下行帧
 */
typedef struct {
    quint16 qtVersionI: 8,            // byte3 ~ byte4 Qt版本信息
        qtVersionII: 5,
        qtVersionIII: 3;

}__attribute__((packed)) SpecSettingsInfo;

/*
 * 专用下行帧校验
 */
typedef struct {
    quint8 head;
    quint8 length;
    quint16 crc;
    quint32 magic;
    SpecSettingsInfo specSettingsInfo;
    quint8 tail;
}__attribute__((packed)) SpecSettingsFrame;

/*
 * 定义专用各帧的长度
 */
#define SPECIAL_INFO_LEN    (const int)(sizeof(SpecialInfo))
#define SPECIAL_FRAME_LEN   (const int)(sizeof(SpecialFrame))
#define SPECSETTINGS_INFO_LEN   (const int)(sizeof(SpecSettingsInfo))
#define SPECSETTINGS_FRAME_LEN  (const int)(sizeof(SpecSettingsFrame))

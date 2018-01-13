#include "Protocol.hpp"

CARFOX_BEGIN_NAMESPACE

const quint16 crc16_half_byte[16]= {
    0x0000, 0x1021, 0x2042, 0x3063,
    0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b,
    0xc18c, 0xd1ad, 0xe1ce, 0xf1ef };

quint16 crc16Check(quint8 *ptr,quint8 len)
{
    quint8 data = 0;
    quint16 crc = 0;
    while(len-- != 0)
    {
        data = ((quint8)(crc/256))/16;
        crc <<= 4;
        crc ^= crc16_half_byte[data^(*ptr/16)];
        data = ((quint8)(crc/256)/16);
        crc <<= 4;
        crc ^= crc16_half_byte[data^(*ptr&0x0f)];
        ptr++;
    }
    return(crc);
}

CARFOX_END_NAMESPACE

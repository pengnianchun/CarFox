#pragma once

#include "Global.hpp"

CARFOX_BEGIN_NAMESPACE

template <class T>
        struct CarUpdatesData
{
    CarUpdatesData(T dataValue)
        :data(dataValue)
    {
    }

    CarUpdatesData(T dataValue, T minValue, T maxValue)
        : min(minValue), max(maxValue), data(dataValue)
    {
    }

    CarUpdatesData(T dataValue, T minValue, T maxValue, T invalidValue)
        : min(minValue), max(maxValue), invalid(invalidValue), data(dataValue)
    {
    }

    T min; //最小值
    T max; //最大值
    T invalid; //无效指
    T data;
};


CARFOX_END_NAMESPACE

#pragma once

#include <CarMsg.hpp>

class CustomCarMsgWorker;

class CustomCarMsg : public carfox::CarMsg
{
    Q_OBJECT


public:
    explicit CustomCarMsg(CustomCarMsgWorker *worker);
};

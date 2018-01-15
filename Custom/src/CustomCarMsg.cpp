
#include "CustomCarMsg.hpp"
#include "CustomCarMsgWorker.hpp"

CustomCarMsg::CustomCarMsg(CustomCarMsgWorker *worker)
    : carfox::CarMsg(worker)
{

}

void CustomCarMsg::updateThemeMode(int data)
{

}

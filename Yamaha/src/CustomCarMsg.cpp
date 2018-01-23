
#include "CustomCarMsg.hpp"
#include "CustomCarMsgWorker.hpp"
#include "KeyManager.hpp"

CustomCarMsg::CustomCarMsg(CustomCarMsgWorker *worker)
    : carfox::CarMsg(worker)
{

    if (!worker) {
        return;
    }
    connectMsgToWorker(worker);
    connectWorkerToMsg(worker);
}

void CustomCarMsg::connectWorkerToMsg(CustomCarMsgWorker *worker)
{
    connect(worker, &CustomCarMsgWorker::keyPressed, this, &CustomCarMsg::keyPressed);
    connect(worker, &CustomCarMsgWorker::keyReleased, this, &CustomCarMsg::keyReleased);
    connect(worker, &CustomCarMsgWorker::keyDoublePressed, this, &CustomCarMsg::keyDoublePressed);
    connect(worker, &CustomCarMsgWorker::doubleKeysPressed, this, &CustomCarMsg::doubleKeysPressed);
    connect(worker, &CustomCarMsgWorker::keyLongPressed, this, &CustomCarMsg::keyLongPressed);
    connect(worker, &CustomCarMsgWorker::keyShortPressed, this, &CustomCarMsg::keyShortPressed);

    connect(worker, &CustomCarMsgWorker::themeModeChanged, this, &CustomCarMsg::updateThemeMode);
    connect(worker, &CustomCarMsgWorker::carModeChanged, this, &CustomCarMsg::updateCarMode);

    connect(worker, &CustomCarMsgWorker::carSpeedChanged, this, &CustomCarMsg::updateCarSpeed);
    connect(worker, &CustomCarMsgWorker::rpmChanged, this, &CustomCarMsg::updateRpm);
    connect(worker, &CustomCarMsgWorker::totalVoltageChanged, this, &CustomCarMsg::updateTotalVoltage);
    connect(worker, &CustomCarMsgWorker::totalCurrentChanged, this, &CustomCarMsg::updateTotalCurrent);
    connect(worker, &CustomCarMsgWorker::gearChanged, this, &CustomCarMsg::updateGear);
    connect(worker, &CustomCarMsgWorker::odoChanged, this, &CustomCarMsg::updateOdo);
    connect(worker, &CustomCarMsgWorker::tripChanged, this, &CustomCarMsg::updateTrip);
    connect(worker, &CustomCarMsgWorker::socChanged, this, &CustomCarMsg::updateSoc);
    connect(worker, &CustomCarMsgWorker::apVol1Changed, this, &CustomCarMsg::updateApVol1);
    connect(worker, &CustomCarMsgWorker::apVol2Changed, this, &CustomCarMsg::updateApVol2);
    connect(worker, &CustomCarMsgWorker::moter_control_tempChanged, this, &CustomCarMsg::updateMoter_control_temp);
    connect(worker, &CustomCarMsgWorker::moter_tempChanged, this, &CustomCarMsg::updateMoter_temp);
    connect(worker, &CustomCarMsgWorker::batteryChanged, this, &CustomCarMsg::updateBattery);
    connect(worker, &CustomCarMsgWorker::spnChanged, this, &CustomCarMsg::updateSpn);
    connect(worker, &CustomCarMsgWorker::engine_water_tempChanged, this, &CustomCarMsg::updateEngine_water_temp);
    connect(worker, &CustomCarMsgWorker::urea_levelChanged, this, &CustomCarMsg::updateUrea_level);
    connect(worker, &CustomCarMsgWorker::fault_levelChanged, this, &CustomCarMsg::updateFault_level);
    connect(worker, &CustomCarMsgWorker::fault_codeChanged, this, &CustomCarMsg::updateFault_code);
    connect(worker, &CustomCarMsgWorker::oil_levelChanged, this, &CustomCarMsg::updateOil_level);
    connect(worker, &CustomCarMsgWorker::engine_oil_pressureChanged, this, &CustomCarMsg::updateEngine_oil_pressure);
}

void CustomCarMsg::connectMsgToWorker(CustomCarMsgWorker *worker)
{
    connect(this, &CustomCarMsg::sendEnableKeys, worker, &CustomCarMsgWorker::enableKeys);
    connect(this,  &CustomCarMsg::sendThemeSetChanged, worker, &CustomCarMsgWorker::themeSet);
}

void CustomCarMsg::updateThemeMode(qint8 data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(themeMode, data);
}

void CustomCarMsg::updateCarMode(qint8 data)
{
    MEMBER_PROPERTY_VALUE_CHANGED(carMode, data);
}

void CustomCarMsg::updateCarSpeed(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(carSpeed, value);
}

void CustomCarMsg::updateRpm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(rpm, value);
}

void CustomCarMsg::updateTotalVoltage(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(totalVoltage, value);
}

void CustomCarMsg::updateTotalCurrent(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(totalCurrent, value);
}

void CustomCarMsg::updateGear(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(gear, value);
}

void CustomCarMsg::updateOdo(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(odo, value);
}

void CustomCarMsg::updateTrip(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(trip, value);
}

void CustomCarMsg::updateSoc(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(soc, value);
}

void CustomCarMsg::updateApVol1(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(apVol1, value);
}

void CustomCarMsg::updateApVol2(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(apVol2, value);
}

void CustomCarMsg::updateMoter_control_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(moter_control_temp, value);
}

void CustomCarMsg::updateMoter_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(moter_temp, value);
}

void CustomCarMsg::updateBattery(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(battery, value);
}

void CustomCarMsg::updateSpn(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(spn, value);
}

void CustomCarMsg::updateEngine_water_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_water_temp, value);
}

void CustomCarMsg::updateUrea_level(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(urea_level, value);
}

void CustomCarMsg::updateFault_level(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fault_level, value);
}

void CustomCarMsg::updateFault_code(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fault_code, value);
}

void CustomCarMsg::updateOil_level(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_level, value);
}

void CustomCarMsg::updateEngine_oil_pressure(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_oil_pressure, value);
}

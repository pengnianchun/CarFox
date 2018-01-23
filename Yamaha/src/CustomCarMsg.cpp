
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

    connect(worker, &CustomCarMsgWorker::motor_in_voltageChanged, this, &CustomCarMsg::updateMotor_in_voltage);
    connect(worker, &CustomCarMsgWorker::motor_in_currentChanged, this, &CustomCarMsg::updateMotor_in_current);
    connect(worker, &CustomCarMsgWorker::motor_tempChanged, this, &CustomCarMsg::updateMotor_temp);
    connect(worker, &CustomCarMsgWorker::motor_controller_tempChanged, this, &CustomCarMsg::updateMotor_controller_temp);
    connect(worker, &CustomCarMsgWorker::car_modeChanged, this, &CustomCarMsg::updateCar_mode);
    connect(worker, &CustomCarMsgWorker::versionChanged, this, &CustomCarMsg::updateVersion);
    connect(worker, &CustomCarMsgWorker::car_lifeChanged, this, &CustomCarMsg::updateCar_life);
    connect(worker, &CustomCarMsgWorker::accel_pedal_percentChanged, this, &CustomCarMsg::updateAccel_pedal_percent);
    connect(worker, &CustomCarMsgWorker::brake_pedal_percentChanged, this, &CustomCarMsg::updateBrake_pedal_percent);
    connect(worker, &CustomCarMsgWorker::din1Changed, this, &CustomCarMsg::updateDin1);
    connect(worker, &CustomCarMsgWorker::din2Changed, this, &CustomCarMsg::updateDin2);
    connect(worker, &CustomCarMsgWorker::din3Changed, this, &CustomCarMsg::updateDin3);
    connect(worker, &CustomCarMsgWorker::dout1Changed, this, &CustomCarMsg::updateDout1);
    connect(worker, &CustomCarMsgWorker::dout2Changed, this, &CustomCarMsg::updateDout2);
    connect(worker, &CustomCarMsgWorker::dout3Changed, this, &CustomCarMsg::updateDout3);

    connect(worker, &CustomCarMsgWorker::engine_fuel_consumptionChanged, this, &CustomCarMsg::updateEngine_fuel_consumption);
    connect(worker, &CustomCarMsgWorker::engine_loadChanged, this, &CustomCarMsg::updateEngine_load);
    connect(worker, &CustomCarMsgWorker::engine_target_throttleChanged, this, &CustomCarMsg::updateEngine_target_throttle);
    connect(worker, &CustomCarMsgWorker::engine_actual_throttleChanged, this, &CustomCarMsg::updateEngine_actual_throttle);
    connect(worker, &CustomCarMsgWorker::engine_inlet_temperatureChanged, this, &CustomCarMsg::updateEngine_inlet_temperature);

    connect(worker, &CustomCarMsgWorker::oil_pump_dcac_w_output_currentChanged, this, &CustomCarMsg::updateOil_pump_dcac_w_output_current);
    connect(worker, &CustomCarMsgWorker::oil_pump_dcac_v_output_currentChanged, this, &CustomCarMsg::updateOil_pump_dcac_v_output_current);
    connect(worker, &CustomCarMsgWorker::oil_pump_dcac_u_output_currentChanged, this, &CustomCarMsg::updateOil_pump_dcac_u_output_current);
    connect(worker, &CustomCarMsgWorker::radiator_temperatureChanged, this, &CustomCarMsg::updateRadiator_temperature);

    connect(worker, &CustomCarMsgWorker::actual_clutch_positionChanged, this, &CustomCarMsg::updateActual_clutch_position);
    connect(worker, &CustomCarMsgWorker::tcu_fault_codeChanged, this, &CustomCarMsg::updateTcu_fault_code);
    connect(worker, &CustomCarMsgWorker::axis_rpmChanged, this, &CustomCarMsg::updateAxis_rpm);
    connect(worker, &CustomCarMsgWorker::fmiChanged, this, &CustomCarMsg::updateFmi);
    connect(worker, &CustomCarMsgWorker::cmChanged, this, &CustomCarMsg::updateCm);
    connect(worker, &CustomCarMsgWorker::ocChanged, this, &CustomCarMsg::updateOc);
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

void CustomCarMsg::updateMotor_in_voltage(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_in_voltage, value);
}

void CustomCarMsg::updateMotor_in_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_in_current, value);
}

void CustomCarMsg::updateMotor_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_temp, value);
}

void CustomCarMsg::updateMotor_controller_temp(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(motor_controller_temp, value);
}

void CustomCarMsg::updateCar_mode(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(car_mode, value);
}

void CustomCarMsg::updateVersion(double value) {
    MEMBER_PROPERTY_VALUE_CHANGED(version, value);
}

void CustomCarMsg::updateCar_life(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(car_life, value);
}

void CustomCarMsg::updateAccel_pedal_percent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(accel_pedal_percent, value);
}

void CustomCarMsg::updateBrake_pedal_percent(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(brake_pedal_percent, value);
}

void CustomCarMsg::updateDin1(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(din1, value);
}

void CustomCarMsg::updateDin2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(din2, value);
}

void CustomCarMsg::updateDin3(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(din3, value);
}

void CustomCarMsg::updateDout1(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dout1, value);
}

void CustomCarMsg::updateDout2(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dout2, value);
}

void CustomCarMsg::updateDout3(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(dout3, value);
}

void CustomCarMsg::updateEngine_fuel_consumption(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_fuel_consumption, value);
}

void CustomCarMsg::updateEngine_load(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_load, value);
}

void CustomCarMsg::updateEngine_target_throttle(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_target_throttle, value);
}

void CustomCarMsg::updateEngine_actual_throttle(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_actual_throttle, value);
}

void CustomCarMsg::updateEngine_inlet_temperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(engine_inlet_temperature, value);
}

void CustomCarMsg::updateOil_pump_dcac_w_output_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_pump_dcac_w_output_current, value);
}

void CustomCarMsg::updateOil_pump_dcac_v_output_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_pump_dcac_v_output_current, value);
}

void CustomCarMsg::updateOil_pump_dcac_u_output_current(float value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oil_pump_dcac_u_output_current, value);
}

void CustomCarMsg::updateRadiator_temperature(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(radiator_temperature, value);
}

void CustomCarMsg::updateActual_clutch_position(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(actual_clutch_position, value);
}

void CustomCarMsg::updateTcu_fault_code(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(tcu_fault_code, value);
}

void CustomCarMsg::updateAxis_rpm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(axis_rpm, value);
}

void CustomCarMsg::updateFmi(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(fmi, value);
}

void CustomCarMsg::updateCm(int value) {
    MEMBER_PROPERTY_VALUE_CHANGED(cm, value);
}

void CustomCarMsg::updateOc(uint value) {
    MEMBER_PROPERTY_VALUE_CHANGED(oc, value);
}


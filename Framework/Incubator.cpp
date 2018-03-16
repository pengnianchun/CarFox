#include "Incubator.hpp"

CARFOX_BEGIN_NAMESPACE

Incubator::Incubator()
    : QQmlIncubator(QQmlIncubator::Asynchronous)
{

}

void Incubator::statusChanged(Status status)
{
    emit qmlIncubatorStatusChanged(status);
}

CARFOX_END_NAMESPACE

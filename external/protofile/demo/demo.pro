TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp

LIBS += -lprotobuf

RESOURCES += qml.qrc

include($$PWD/../proto.pri)

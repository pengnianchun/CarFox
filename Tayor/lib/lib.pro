TARGET = msg
TEMPLATE = lib

DEFINES += QNNMSG_LIBRARY

# Close Debug Info When Release
DEFINES += QT_NO_DEBUG_OUTPUT

system(rm ../protocode -rf && mkdir -p ../protocode && protoc -I=../proto --cpp_out=../protocode ../proto/*.proto)

SOURCES += qnnmsgsocket.cpp \
    msghandler.cpp

HEADERS += \
    qnnmsgsocket.h \
    qnnmsgpubsub.h \
    msghandler.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

CONFIG += c++11

LIBS += -lnanomsg -lprotobuf

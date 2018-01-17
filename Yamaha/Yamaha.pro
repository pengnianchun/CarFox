QT += qml quick serialport

TARGET = Yamaha
TEMPLATE = app

#LIBS += -L/usr/lib/x86_64-linux-gnu/ -lnanomsg -lprotobuf
unix:!macx{
    INCLUDEPATH += ../externals/nanomsg/linux/include
    LIBS += -L../externals/protobuf/linux -lprotobuf
    cross_compile { # ARM平台
        LIBS += -L../CarFox/bin/static -lCarFoxArm
    }
    else {
        QMAKE_LFLAGS += -Wl,--rpath=../Framework/bin/
        LIBS += -L../Framework/bin/ -lCarFoxLinux
    }
}
win32 {
    LIBS += -lCarFoxWindows
}

system(rm ./protocode -rf && mkdir -p ./protocode && protoc -I=./proto --cpp_out=./protocode ./proto/*.proto)
QMAKE_CXXFLAGS = -g -rdynamic -fasynchronous-unwind-tables -DGIT_VERSION="$(shell git describe --always --long --dirty || date +%y%m%d%H%M%S)"

CONFIG += c++11
CONFIG += qtquickcompiler
QMAKE_DISTCLEAN += .qtquickcompiler/*
QMAKE_DISTCLEAN += *_qtquickcompiler.qrc

DEFINES += CARFOX_DEBUG_FPS

# Close Debug Info When Release
CONFIG(release, debug|release) {
#    DEFINES += QT_NO_DEBUG_OUTPUT
}

INCLUDEPATH += ./
INCLUDEPATH += ../Framework
INCLUDEPATH += ./protocode

fonts.path = /usr/lib
INSTALLS += fonts

# Binary and obj files path
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build
QMAKE_POST_LINK += $(STRIP) $(TARGET)

include($$PWD/Yamaha.pri)



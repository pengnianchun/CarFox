QT += qml quick serialport

TARGET = Yamaha
TEMPLATE = app

unix:!macx{
    INCLUDEPATH += $$PWD/../externals/nanomsg/linux/include
    INCLUDEPATH += $$PWD/../externals/protobuf/linux/include

    LIBS += -lnanomsg -lprotobuf
    LIBS += -L$$PWD/../Framework/lib/

    QMAKE_CXXFLAGS = -g -rdynamic -fasynchronous-unwind-tables
    QMAKE_CXXFLAGS += -DGIT_VERSION="$(shell git describe --always --long --dirty || date +%y%m%d%H%M%S)"

    system(bash $$PWD/../externals/script/proto.sh v1.0)

    cross_compile { # ARM平台
        LIBS += -lCarFoxArm

        LIBS += -L$$PWD/../externals/nanomsg/linux/lib/arm
        LIBS += -L$$PWD/../externals/protobuf/linux/lib/arm
    }
    else {
        LIBS += -lCarFoxLinux

        LIBS += -L$$PWD/../externals/nanomsg/linux/lib/x86
        LIBS += -L$$PWD/../externals/protobuf/linux/lib/x86

        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../Framework/lib/
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../externals/nanomsg/linux/lib/x86

    }
}
win32 {
    INCLUDEPATH += ../externals/protobuf/windows/include
    LIBS += -L$$PWD/../externals/protobuf/windows -lprotobuf
    LIBS += -L../Framework/bin/ -lCarFoxWindows

    QMAKE_CXXFLAGS += -DGIT_VERSION="windowsVersion"
}

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
INCLUDEPATH += ./protofile/protocode

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



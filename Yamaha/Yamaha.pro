TEMPLATE = app

QT += quick
QT += qml
QT += serialport
QT += opengl

CONFIG += c++11
CONFIG += qtquickcompiler
CONFIG += resources_big
CONFIG += debug

TARGET  = Yamaha

DESTDIR = bin
UI_DIR  = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build

QMAKE_DISTCLEAN += .qtquickcompiler/*
QMAKE_DISTCLEAN += *_qtquickcompiler.qrc

DEFINES += GIT_VERSION=\\\"$$system(git describe --always --tag)\\\"
DEFINES += PROTO_VERSION=\\\"$$system(git submodule | grep proto | awk \'{print $3}\' | awk -F \"[()]\" \'{print $2}\')\\\"

QMAKE_CFLAGS += -Wno-unused-parameter
QMAKE_CXXFLAGS += -Wno-unused-parameter

CONFIG(release) {
    CONFIG  += qml_debug
    DEFINES += CARFOX_DEBUG_FPS
}

include($$PWD/../external/protofile/proto.pri)

INCLUDEPATH += $$PWD/../Framework
INCLUDEPATH += $$PWD/../external/protofile

unix:!macx{
    INCLUDEPATH += $$PWD/../external/nanomsg/linux/include
    INCLUDEPATH += $$PWD/../external/protofile/protobuf/linux/include

    LIBS += -L$$PWD/../Framework/lib/

    QMAKE_CXXFLAGS = -g -rdynamic -fasynchronous-unwind-tables

    cross_compile {
        LIBS += -lCarFoxArm

        LIBS += -L$$PWD/../external/nanomsg/linux/lib/arm
        LIBS += -L$$PWD/../external/protofile/protobuf/linux/lib/arm
    }
    else {
        LIBS += -lCarFoxLinux

        LIBS += -L$$PWD/../external/nanomsg/linux/lib/x86
        LIBS += -L$$PWD/../external/protofile/protobuf/linux/lib/x86

        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../Framework/lib/
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../external/nanomsg/linux/lib/x86
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../external/protofile/protobuf/linux/lib/x86
    }
    LIBS += -lnanomsg -lprotobuf
    QMAKE_POST_LINK += $(STRIP) $(TARGET)
}

win32 {
    INCLUDEPATH += $$PWD/../external/nanomsg/windows/include
    INCLUDEPATH += $$PWD/../external/protofile/protobuf/windows/include
    LIBS += $$PWD/../external/nanomsg/windows/libnanomsg.dll
    LIBS += $$PWD/../external/protofile/protobuf/windows/libprotobuf.a
    LIBS += $$PWD/../Framework/lib/libCarFoxWindows.a

    DEST = $$replace(PWD, /, \\)
    QMAKE_POST_LINK += xcopy $$DEST\\..\\external\\nanomsg\\windows\\libnanomsg.dll $$DESTDIR /y /e
    system($$PWD/../external/script/proto.bat $$PROTOTAG)
    QMAKE_CXXFLAGS += -DGIT_VERSION="windowsVersion"
}

fonts.path = /usr/lib
INSTALLS += fonts

include($$PWD/Yamaha.pri)

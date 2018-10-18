TEMPLATE = lib

QT += core
QT += qml
QT += quick
QT += serialport

CONFIG += c++11
CONFIG += qtquickcompiler
CONFIG += debug

QMAKE_DISTCLEAN += .qtquickcompiler/*
QMAKE_DISTCLEAN += *_qtquickcompiler.qrc

UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build

QMAKE_CFLAGS += -Wno-unused-parameter
QMAKE_CXXFLAGS += -Wno-unused-parameter
QMAKE_CXXFLAGS += -g -rdynamic -fasynchronous-unwind-tables

include(Framework.pri)

headers.files = *.hpp
headers.path = $$[QT_INSTALL_HEADERS]/CarFox
INSTALLS += headers

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target

unix:!macx{
    CONFIG += lib

    INCLUDEPATH += $$PWD/../external/nanomsg/linux/include
    INCLUDEPATH += $$PWD/../external/protofile/protobuf/linux/include
    DESTDIR = $$PWD/../Framework/lib/

    cross_compile {
        TARGET = CarFoxArm
        LIBS += -L$$PWD/../externals/nanomsg/linux/lib/arm
        LIBS += -L$$PWD/../externals/protofile/protobuf/linux/lib/arm
    }
    else {
        TARGET = CarFoxLinux
        LIBS += -L$$PWD/../external/nanomsg/linux/lib/x86
        LIBS += -L$$PWD/../external/protofile/protobuf/linux/lib/x86
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../Framework/lib/
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../external/nanomsg/linux/lib/x86
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../external/protofile/protobuf/linux/lib/x86
    }
    LIBS += -lprotobuf -lnanomsg
}

win32 {
    TARGET = CarFoxWindows
    CONFIG += staticlib
    INCLUDEPATH += $$PWD/../external/nanomsg/windows/include
    INCLUDEPATH += $$PWD/../external/protofile/protobuf/windows/include
    LIBS += $$PWD/../external/nanomsg/windows/libnanomsg.dll
    LIBS += $$PWD/../external/nanomsg/windows/libnanomsg.dll.a
    LIBS += $$PWD/../external/protofile/protobuf/windows/libprotobuf.a

    dst_dir = $$PWD\..\Framework\lib\
    dst_dir ~= s,/,\\,g
    DESTDIR = $$dst_dir
}

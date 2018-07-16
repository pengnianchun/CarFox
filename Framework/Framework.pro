TEMPLATE = lib

QT += qml
QT += quick
QT += serialport

CONFIG += c++11

CONFIG += qtquickcompiler

QMAKE_DISTCLEAN += .qtquickcompiler/*
QMAKE_DISTCLEAN += *_qtquickcompiler.qrc

UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build

include(Framework.pri)

headers.files += \
    ./*.hpp

headers.path =  $$[QT_INSTALL_HEADERS]/CarFox

INSTALLS += headers

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target

unix:!macx{
    INCLUDEPATH += $$PWD/../external/nanomsg/linux/include
    INCLUDEPATH += $$PWD/../external/protofile/protobuf/linux/include
    DESTDIR = $$PWD/../Framework/lib/

    CONFIG += lib

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
    CONFIG += staticlib
    INCLUDEPATH += $$PWD/../external/nanomsg/windows/include
    LIBS += $$PWD/../external/nanomsg/windows/libnanomsg.dll
    INCLUDEPATH += $$PWD/../external/protofile/protobuf/windows/include
    LIBS += $$PWD/../external/nanomsg/windows/libnanomsg.dll.a
    LIBS += $$PWD/../external/protofile/protobuf/windows/libprotobuf.a

    TARGET = CarFoxWindows

    dst_dir = $$PWD\..\Framework\lib\
    dst_dir ~= s,/,\\,g
    DESTDIR = $$dst_dir
}

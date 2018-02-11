QT += qml quick serialport

TARGET = Yamaha
TEMPLATE = app

# Binary and obj files path
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build
PROTOTAG=v1.2

unix:!macx{
    INCLUDEPATH += $$PWD/../externals/nanomsg/linux/include
    INCLUDEPATH += $$PWD/../externals/protobuf/linux/include

    LIBS += -L$$PWD/../Framework/lib/

    QMAKE_CXXFLAGS = -g -rdynamic -fasynchronous-unwind-tables
    QMAKE_CXXFLAGS += -DGIT_VERSION="$(shell git describe --always --long --dirty || date +%y%m%d%H%M%S)"

    system(bash $$PWD/../externals/script/proto.sh $$PROTOTAG)

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
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../externals/protobuf/linux/lib/x86
    }
    LIBS += -lnanomsg -lprotobuf
    QMAKE_POST_LINK += $(STRIP) $(TARGET)
}
win32 {


    INCLUDEPATH += $$PWD/../externals/nanomsg/windows/include
    LIBS += $$PWD/../externals/nanomsg/windows/libnanomsg.dll
    INCLUDEPATH += $$PWD/../externals/protobuf/windows/include
    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf.a
#    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf-lite.a
#    LIBS += $$PWD/../externals/protobuf/windows/libprotoc.a
    LIBS += $$PWD/../Framework/lib/libCarFoxWindows.a

    DEST = $$replace(PWD, /, \\)
    QMAKE_POST_LINK += xcopy $$DEST\\..\\externals\\nanomsg\\windows\\libnanomsg.dll $$DESTDIR /y /e
    system($$PWD/../externals/script/proto.bat $$PROTOTAG)
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

include($$PWD/Yamaha.pri)





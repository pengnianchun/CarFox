QT += qml quick serialport

TARGET = Yamaha
TEMPLATE = app

#LIBS += -L/usr/lib/x86_64-linux-gnu/ -lnanomsg -lprotobuf
unix:!macx{

    cross_compile { # ARM平台
        LIBS += -L$$PWD/../CarFox/bin/static -lCarFoxArm
    }
    else {
        INCLUDEPATH += $$PWD/../externals/nanomsg/linux/include
        LIBS += -L$$PWD/../externals/nanomsg/linux -lnanomsg
        QMAKE_LFLAGS += -Wl,--rpath=../Framework/lib/
        INCLUDEPATH += $$PWD/../externals/protobuf/linux/include
        LIBS += -L$$PWD/../externals/protobuf/linux -lprotobuf
        LIBS += -L$$PWD/../Framework/lib/ -lCarFoxLinux
        system(bash $$PWD/../externals/script/proto.sh v1.0)
    }
}
win32 {

    INCLUDEPATH += $$PWD/../externals/nanomsg/windows/include
    LIBS += $$PWD/../externals/nanomsg/windows/libnanomsg.dll.a
    INCLUDEPATH += $$PWD/../externals/protobuf/windows/include
    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf.a
    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf-lite.a
    LIBS += $$PWD/../externals/protobuf/windows/libprotoc.a

    LIBS += -L$$PWD/../Framework/lib/ -lCarFoxWindows
    message("=========================")
    system($$PWD/../externals/script/proto.bat v1.0)
}


#QMAKE_CXXFLAGS = -g -rdynamic -fasynchronous-unwind-tables
#QMAKE_CXXFLAGS +=  -DGIT_VERSION="$(shell git describe --always --long --dirty || date +%y%m%d%H%M%S)"

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



QT += qml quick serialport

TARGET = test
TEMPLATE = app

unix:!macx{
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

fonts.path = /usr/lib
INSTALLS += fonts

# Binary and obj files path
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build
QMAKE_POST_LINK += $(STRIP) $(TARGET)

include($$PWD/Custom.pri)



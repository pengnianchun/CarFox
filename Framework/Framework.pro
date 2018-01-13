QT += qml quick serialport

TEMPLATE = lib

CONFIG += c++11
CONFIG += staticlib
CONFIG += qtquickcompiler

QMAKE_DISTCLEAN += .qtquickcompiler/*
QMAKE_DISTCLEAN += *_qtquickcompiler.qrc

# Close Debug Info When Release
#CONFIG(release, debug|release) {
#    DEFINES += QT_NO_DEBUG_OUTPUT
#}



include(Framework.pri)
headers.files += \
    ./*.hpp
headers.path =  $$[QT_INSTALL_HEADERS]/CarFox
INSTALLS += headers

unix:!macx{
    LIBS += -L/usr/lib/x86_64-linux-gnu/ -lnanomsg -lprotobuf
    cross_compile { # Arm
        TARGET = CarFoxArm
    }
    else { # Linux
        TARGET = CarFoxLinux
    }
}

win32 {
    TARGET = CarFoxWindows
}

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target

 # Binary and obj files path
 DESTDIR = bin
 UI_DIR = build
 MOC_DIR = build
 RCC_DIR = build
 OBJECTS_DIR = build

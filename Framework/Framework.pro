QT += qml quick serialport

TEMPLATE = lib

CONFIG += c++11

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

    INCLUDEPATH += $$PWD/../externals/nanomsg/linux/include
    INCLUDEPATH += $$PWD/../externals/protobuf/linux/include
    DESTDIR = $$PWD/../Framework/lib/

    CONFIG += lib

    cross_compile { # Arm
        TARGET = CarFoxArm
        LIBS += -L$$PWD/../externals/nanomsg/linux/lib/arm
        LIBS += -L$$PWD/../externals/protobuf/linux/lib/arm
    }
    else { # Linux
        TARGET = CarFoxLinux
        LIBS += -L$$PWD/../externals/nanomsg/linux/lib/x86
        LIBS += -L$$PWD/../externals/protobuf/linux/lib/x86
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../Framework/lib/
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../externals/nanomsg/linux/lib/x86
        QMAKE_LFLAGS += -Wl,--rpath=$$PWD/../externals/protobuf/linux/lib/x86
    }
    LIBS += -lprotobuf -lnanomsg
}

win32 {
    CONFIG += staticlib
    INCLUDEPATH += $$PWD/../externals/nanomsg/windows/include
    LIBS += $$PWD/../externals/nanomsg/windows/libnanomsg.dll
    INCLUDEPATH += $$PWD/../externals/protobuf/windows/include
    LIBS += $$PWD/../externals/nanomsg/windows/libnanomsg.dll.a
    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf.a

    TARGET = CarFoxWindows

    dst_dir = $$PWD\..\Framework\lib\

    dst_dir ~= s,/,\\,g
    DESTDIR = $$dst_dir
}

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target

 # Binary and obj files path

 UI_DIR = build
 MOC_DIR = build
 RCC_DIR = build
 OBJECTS_DIR = build

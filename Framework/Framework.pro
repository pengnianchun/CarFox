QT += qml quick serialport

TEMPLATE = lib

CONFIG += c++11
CONFIG += lib
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

#LIBS += -L/usr/lib/x86_64-linux-gnu/ -lnanomsg -lprotobuf
unix:!macx{

    cross_compile { # Arm
        TARGET = CarFoxArm
    }
    else { # Linux
        INCLUDEPATH += $$PWD/../externals/nanomsg/linux/include
        LIBS += -L$$PWD/../externals/nanomsg/linux -lnanomsg
        INCLUDEPATH += $$PWD/../externals/protobuf/linux/include
        LIBS += -L$$PWD/../externals/protobuf/linux -lprotobuf
        TARGET = CarFoxLinux
        DESTDIR = $$PWD/../Framework/lib/
#        QMAKE_POST_LINK += mkdir $$PWD/../Framework/lib/ -p; cp -a lib/lib*.so* $$PWD/../Framework/lib/
    }
}

win32 {
    INCLUDEPATH += $$PWD/../externals/nanomsg/windows/include
    LIBS += $$PWD/../externals/nanomsg/windows/libnanomsg.dll.a
    INCLUDEPATH += $$PWD/../externals/protobuf/windows/include
    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf.a
    LIBS += $$PWD/../externals/protobuf/windows/libprotobuf-lite.a
    LIBS += $$PWD/../externals/protobuf/windows/libprotoc.a
    TARGET = CarFoxWindows

    lib_dir = lib\lib*.so*
    dst_dir = $$PWD\..\Framework\lib\\

    dst_dir ~= s,/,\\,g
    DESTDIR = $$dst_dir
    #QMAKE_POST_LINK += xcopy $$lib_dir $$dst_dir /y /e
}

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target

 # Binary and obj files path

 UI_DIR = build
 MOC_DIR = build
 RCC_DIR = build
 OBJECTS_DIR = build


QT += qml quick

TARGET = Tayor
CONFIG += console
CONFIG -= app_bundle
CONFIG += c++11
TEMPLATE = app

INCLUDEPATH += ./protocode
INCLUDEPATH += ./src

#DEFINES += QT_PRINT_CMD
#DEFINES += DEBUG_ENABLE
DEFINES += QT_NO_DEBUG_OUTPUT

system(rm ./protocode -rf && mkdir -p ./protocode && protoc -I=./proto --cpp_out=./protocode ./proto/*.proto)

QMAKE_CXXFLAGS = -g -rdynamic -fasynchronous-unwind-tables -DGIT_VERSION="$(shell git describe --always --long --dirty || date +%y%m%d%H%M%S)"

#LIBS += -L../msghandler -lmsghandler -L../qnanomsg -lqnnmsg -lnanomsg -lprotobuf
LIBS += -L./lib -lmsg  -lnanomsg -lprotobuf
#LD_LIBRARY_PATH=../../lib/ ./CarInfo



SOURCES += \
    ./src/main.cpp \
    ./src/keymanager.cpp \
    ./src/transformring.cpp \
    ./src/carviewmodel.cpp \
    ./src/carmessagehandle.cpp \
    ./src/carmenucontrol.cpp \
    ./src/fbhelper.cpp

HEADERS += \
    ./src/common.h \
    ./src/theme.h \
    ./src/fontName.h \
    ./src/keymanager.h \
    ./src/transformring.h \
    ./src/carviewmodel.h \
    ./src/carmessagehandle.h \
    ./src/carmenucontrol.h \
    ./src/fbhelper.h

SOURCES += $$files($$PWD/protofile/protocode/*.pb.cc)
HEADERS += $$files($$PWD/protofile/protocode/*.pb.h)
HEADERS += $$files($$PWD/protofile/protocode/protoheader.h)

unix {
    QMAKE_DISTCLEAN += -r $$PWD/protofile
}

win32 {
    QMAKE_DEL_FILE          = del /f /s /q
    DEST = $$replace(PWD, /, \\)
    QMAKE_DISTCLEAN += $$DEST\protofile
}

RESOURCES += \
    resource.qrc

# Font
FONT_FOLDER  = fonts/

# Main Qml Files
OTHER_FILES += \
    qml/common/*.qml \
    qml/*.qml

# Theme One Qml Files
OTHER_FILES += \
    qml/themeOne/subMenu/*.qml \
    qml/themeOne/*.qml

# Theme Two Qml Files
OTHER_FILES += \
    qml/themeTwo/subMenu/*.qml \
    qml/themeTwo/*.qml

# Objects Pathes
DESTDIR = bin
UI_DIR  = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build
#QMAKE_POST_LINK += $(STRIP) $(TARGET)

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

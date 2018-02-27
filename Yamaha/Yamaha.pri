HEADERS += \ 
    ./src/CustomCarMsg.hpp \
    ./src/CustomCarMsgWorker.hpp \
    ./src/KeyManager.hpp \
    ./src/ThemeConfig.hpp \
    ./src/CustomRing.hpp \
    ./src/CustomCarMsgWorkerData.hpp \ 
    ./src/CustomMultiLanguage.hpp \ 
    ./src/CustomUiController.hpp \ 
    ./src/CustomTheme1.hpp \ 
    ./src/CustomTheme2.hpp \ 
    ./src/CustomTheme3.hpp \ 
    ./src/CustomTheme4.hpp \ 
    ./src/CustomEnum.hpp \
    $$PWD/src/QmlGifImage.h

SOURCES += \ 
    ./src/CustomCarMsg.cpp \ 
    ./src/CustomCarMsgWorker.cpp \
    ./src/KeyManager.cpp \
    ./src/ThemeConfig.cpp \
    ./src/CustomRing.cpp \
    ./src/CustomUiController.cpp \ 
    ./src/CustomMultiLanguage.cpp \ 
    ./src/CustomTheme1.cpp \ 
    ./src/CustomTheme2.cpp \ 
    ./src/CustomTheme3.cpp \ 
    ./src/CustomTheme4.cpp \ 
    ./src/Main.cpp \
    $$PWD/src/QmlGifImage.cpp

SOURCES += $$files($$PWD/protofile/protocode/*.pb.cc)
HEADERS += $$files($$PWD/protofile/protocode/*.pb.h)
HEADERS += $$files($$PWD/protofile/protocode/protoheader.h)

unix {
    QMAKE_DEL_FILE = rm -rf
    QMAKE_DISTCLEAN += -r $$PWD/protofile
}

win32 {
    QMAKE_DEL_FILE          = del /f /s /q
    DEST = $$replace(PWD, /, \\)
    QMAKE_DISTCLEAN += $$DEST\protofile
}


fonts.files += \ 
    ./fonts/WenQuanYiZhenHei.ttf


RESOURCES += \ 
    ./QmlResource.qrc

DISTFILES += \
    $$PWD/JS/MenuMainDetailController.js



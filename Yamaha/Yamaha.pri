HEADERS += $$files($$PWD/protofile/protocode/protoheader.h)

HEADERS += \
    ./src/CustomCarMsg.hpp \
    ./src/CustomCarMsgWorker.hpp \
    ./src/CustomCarMsgWorkerData.hpp \
    ./src/CustomEnum.hpp \
    ./src/CustomRing.hpp \
    ./src/KeyManager.hpp \
    ./src/ThemeConfig.hpp \
    ./src/CustomMultiLanguage.hpp \
    ./src/CustomUiController.hpp \ 
    ./src/CustomTheme1.hpp \ 
    ./src/CustomTheme2.hpp \ 
    ./src/CustomTheme3.hpp \ 
    ./src/CustomTheme4.hpp \ 
    ./src/QmlGifImage.hpp \
    ./src/NQFile.hpp \
    ./src/NCLog.hpp \

SOURCES += \ 
    ./src/Main.cpp \
    ./src/CustomCarMsg.cpp \
    ./src/CustomCarMsgWorker.cpp \
    ./src/CustomRing.cpp \
    ./src/KeyManager.cpp \
    ./src/ThemeConfig.cpp \
    ./src/CustomMultiLanguage.cpp \ 
    ./src/CustomUiController.cpp \
    ./src/CustomTheme1.cpp \
    ./src/CustomTheme2.cpp \ 
    ./src/CustomTheme3.cpp \ 
    ./src/CustomTheme4.cpp \ 
    ./src/QmlGifImage.cpp \
    ./src/NQFile.cpp \
    ./src/NCLog.cpp \

RESOURCES += \ 
    $$PWD/qml/qml.qrc \
    $$PWD/resource/desgin.qrc \


#for proto
SOURCES += \
    ./protocode/*.pb.cc

HEADERS += \
    ./protocode/*.pb.h

HEADERS += \ 
    ./src/CustomCarMsg.hpp \
    ./src/CustomCarMsgWorker.hpp \
    ./src/KeyManager.hpp \
    ./src/ThemeConfig.hpp \
    ./src/CustomCarMsgWorkerData.hpp \ 
    ./src/CustomEnum.hpp \ 
    ./src/CustomMultiLanguage.hpp \ 
    ./src/CustomUiController.hpp \ 
    ./src/CustomTheme1.hpp \ 
    ./src/CustomTheme2.hpp \ 
    ./src/CustomTheme3.hpp \ 
    ./src/CustomTheme4.hpp \ 
    ./src/CustomEnum.hpp

SOURCES += \ 
    ./src/CustomCarMsg.cpp \ 
    ./src/CustomCarMsgWorker.cpp \
    ./src/KeyManager.cpp \
    ./src/ThemeConfig.cpp \
    ./src/CustomUiController.cpp \ 
    ./src/CustomMultiLanguage.cpp \ 
    ./src/CustomTheme1.cpp \ 
    ./src/CustomTheme2.cpp \ 
    ./src/CustomTheme3.cpp \ 
    ./src/CustomTheme4.cpp \ 
    ./src/Main.cpp

fonts.files += \ 
    ./fonts/WenQuanYiZhenHei.ttf


RESOURCES += \ 
    ./QmlResource.qrc \ 
    ./ImageResource.qrc



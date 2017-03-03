# 串口数据处理相关类
HEADERS += \
    ./Framework/Protocol.hpp \
    ./Framework/CarUpdates.hpp \
    ./Framework/CarUpdatesData.hpp \
    ./Framework/CarUpdatesWorker.hpp \
    ./Framework/CarUpdatesWorkerData.hpp

SOURCES += \
    ./Framework/Protocol.cpp \
    ./Framework/CarUpdates.cpp \
    ./Framework/CarUpdatesWorker.cpp


# 多主题 多语言 QML加载相关类
HEADERS += \
    ./Framework/ThemeManager.hpp \
    ./Framework/Theme.hpp \
    ./Framework/ContextProperty.hpp \
    ./Framework/MultiLanguage.hpp \
    ./Framework/IncubationController.hpp \
    ./Framework/Incubator.hpp \
    ./Framework/Window.hpp \
    ./Framework/Layer.hpp

SOURCES += \
    ./Framework/ThemeManager.cpp \
    ./Framework/Theme.cpp \
    ./Framework/ContextProperty.cpp \
    ./Framework/MultiLanguage.cpp \
    ./Framework/IncubationController.cpp \
    ./Framework/Incubator.cpp \
    ./Framework/Window.cpp \
    ./Framework/Layer.cpp


# 框架管理相关类
HEADERS += \
    ./Framework/Global.hpp \
    ./Framework/UiController.hpp \
    ./Framework/UndeadMain.hpp

SOURCES += \
    ./Framework/UiController.cpp \
    ./Framework/UndeadMain.cpp

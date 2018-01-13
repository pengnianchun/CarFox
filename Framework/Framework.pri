# 网口据处理相关接口
HEADERS += \
    ./CarUpdates.hpp \
    ./CarUpdatesData.hpp \
    ./CarUpdatesWorker.hpp \
    ./CarUpdatesWorkerData.hpp

SOURCES += \
    ./CarUpdates.cpp \
    ./CarUpdatesWorker.cpp


# 多主题 多语言 QML加载相关类
HEADERS += \
    ./ThemeManager.hpp \
    ./Theme.hpp \
    ./ContextProperty.hpp \
    ./MultiLanguage.hpp \
    ./IncubationController.hpp \
    ./Incubator.hpp \
    ./Window.hpp \
    ./Layer.hpp

SOURCES += \
    ./ThemeManager.cpp \
    ./Theme.cpp \
    ./ContextProperty.cpp \
    ./MultiLanguage.cpp \
    ./IncubationController.cpp \
    ./Incubator.cpp \
    ./Window.cpp \
    ./Layer.cpp


# 框架管理相关类
HEADERS += \
    ./Global.hpp \
    ./UiController.hpp

SOURCES += \
    ./UiController.cpp

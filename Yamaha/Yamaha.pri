
#for proto
SOURCES += \
    ./protofile/protocode/airctrl_system_frame.pb.cc \
    ./protofile/protocode/auxiliary_system_frame.pb.cc \
    ./protofile/protocode/battery_group_temperature_frame.pb.cc \
    ./protofile/protocode/battery_group_voltage_frame.pb.cc \
    ./protofile/protocode/battery_manage_system_frame.pb.cc \
    ./protofile/protocode/control_system_frame.pb.cc \
    ./protofile/protocode/general_info_frame.pb.cc \
    ./protofile/protocode/instrument_frame.pb.cc \
    ./protofile/protocode/key.pb.cc \
    ./protofile/protocode/menu_num.pb.cc \
    ./protofile/protocode/module_back_frame.pb.cc  \
    ./protofile/protocode/module_front_frame.pb.cc \
    ./protofile/protocode/module_middle_frame.pb.cc \
    ./protofile/protocode/moter_system_frame.pb.cc \
    ./protofile/protocode/person.pb.cc \
    ./protofile/protocode/settings.pb.cc \
    ./protofile/protocode/tcu_system_frame.pb.cc \
    ./protofile/protocode/test.pb.cc \
    ./protofile/protocode/warning_frame.pb.cc


HEADERS += \
    ./protofile/protocode/battery_group_voltage_frame.pb.h  \
    ./protofile/protocode/general_info_frame.pb.h \
    ./protofile/protocode/airctrl_system_frame.pb.h \
    ./protofile/protocode/auxiliary_system_frame.pb.h \
    ./protofile/protocode/baairctrl_system_framettery_group_temperature_frame.pb.h \
    ./protofile/protocode/battery_manage_system_frame.pb.h\
    ./protofile/protocode/control_system_frame.pb.h\
    ./protofile/protocode/instrument_frame.pb.h\
    ./protofile/protocode/key.pb.h\
    ./protofile/protocode/menu_num.pb.h\
    ./protofile/protocode/module_back_frame.pb.h\
    ./protofile/protocode/module_front_frame.pb.h\
    ./protofile/protocode/module_middle_frame.pb.h\
    ./protofile/protocode/moter_system_frame.pb.h\
    ./protofile/protocode/settings.pb.h\
    ./protofile/protocode/person.pb.h\
    ./protofile/protocode/tcu_system_frame.pb.h\
    ./protofile/protocode/test.pb.h\
    ./protofile/protocode/warning_frame.pb.h

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
    ./QmlResource.qrc

DISTFILES += \
    $$PWD/JS/MenuMainDetailController.js



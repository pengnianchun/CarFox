PROTOC    = protoc
PROTO_DIR = $$PWD/proto
PROTO_OUT = $$PWD/protocode

PROTOS = $$PROTO_DIR/airctrl_system_frame.proto \
         $$PROTO_DIR/auxiliary_system_frame.proto \
         $$PROTO_DIR/battery_group_temperature_frame.proto \
         $$PROTO_DIR/battery_group_voltage_frame.proto \
         $$PROTO_DIR/battery_manage_system_frame.proto \
         $$PROTO_DIR/control_system_diagnose_frame.proto \
         $$PROTO_DIR/control_system_frame.proto \
         $$PROTO_DIR/dc_status_frame.proto \
         $$PROTO_DIR/general_info_frame.proto \
         $$PROTO_DIR/impetus_battery_diagnose_frame.proto \
         $$PROTO_DIR/instrument_frame.proto \
         $$PROTO_DIR/menu_num.proto \
         $$PROTO_DIR/module_back_frame.proto \
         $$PROTO_DIR/module_front_frame.proto \
         $$PROTO_DIR/module_middle_frame.proto \
         $$PROTO_DIR/moter_system_frame.proto \
         $$PROTO_DIR/pic_lamp_frame.proto \
         $$PROTO_DIR/settings.proto \
         $$PROTO_DIR/tcu_system_frame.proto \
         $$PROTO_DIR/tire_pressure_frame.proto \
         $$PROTO_DIR/warning_frame.proto \

PROTOPATHS =
for(p, PROTO_PATH):PROTOPATHS += --proto_path=$${p}

protobuf_decl.name = protobuf header
protobuf_decl.input = PROTOS
protobuf_decl.output = $${PROTO_OUT}/${QMAKE_FILE_BASE}.pb.h
protobuf_decl.commands = $${PROTOC} --cpp_out="$${PROTO_OUT}" --proto_path=${QMAKE_FILE_IN_PATH} ${QMAKE_FILE_NAME}
protobuf_decl.variable_out = GENERATED_FILES
QMAKE_EXTRA_COMPILERS += protobuf_decl

protobuf_impl.name = protobuf implementation
protobuf_impl.input = PROTOS
protobuf_impl.output = $${PROTO_OUT}/${QMAKE_FILE_BASE}.pb.cc
protobuf_impl.depends = $${PROTO_OUT}/${QMAKE_FILE_BASE}.pb.h
protobuf_impl.commands = $$escape_expand(\\n)
protobuf_impl.variable_out = GENERATED_SOURCES
QMAKE_EXTRA_COMPILERS += protobuf_impl

unix:!macx{
    QMAKE_DISTCLEAN += $$PWD/protocode/*
}
win32 {
    QMAKE_DISTCLEAN += $$PWD\protocode\*
}

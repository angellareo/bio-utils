add_executable(spk-times spk-times.cpp)

set_target_properties(spk-times
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/spk-times")

install(TARGETS spk-times
    DESTINATION "/usr/local/bin")
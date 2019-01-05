
add_library(
    # Name
    meta-core
    # Shared or Static
    SHARED
    # source files (relative)
#    any.h
    computeunit.h
    computedata.cpp
    computedata.h
    dataset.h
    datasource.h
    datasource.cpp
    jsonhelper.cpp
    jsonhelper.h
    arraydatasource.h
    arraydatasource.cpp
)
set_target_properties(meta-core PROPERTIES LINKER_LANGUAGE CXX)
target_include_directories(meta-core PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_library(
    # Name
    nlohmann-json
    # Shared or Static
    SHARED
    # source files (relative)
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/json/json.hpp
)
set_target_properties(nlohmann-json PROPERTIES LINKER_LANGUAGE CXX)
target_include_directories(nlohmann-json PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/json)

#target_include_directories(meta-core PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/boost_any_1_68_0)
target_link_libraries(meta-core nlohmann-json)

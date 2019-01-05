# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.6.0)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

project(meta-frontend)

add_subdirectory(core)
include_directories(core)


add_library(
    # Name
    meta-frontend
    # Shared or Static
    SHARED
    # source files (relative)
    meta-frontend.h
    distributor.cpp
    distributor.h
    log.h
    web/request_builder.cpp
    web/request_builder.h
    distribution_strategies/distribution_strategy.h
    distribution_strategies/local_distribution_strategy.cpp
    distribution_strategies/local_distribution_strategy.h
    distribution_strategies/round_robin_distribution_strategy.cpp
    distribution_strategies/round_robin_distribution_strategy.h
    workeradapter/worker_adapter.h
    workeradapter/local_worker_adapter.cpp
    workeradapter/local_worker_adapter.h
    workeradapter/remote_worker_adapter.cpp
    workeradapter/remote_worker_adapter.h
)
target_include_directories(meta-frontend PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_library(
    # Name
    backcurl
    # Shared or Static
    STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/backcurl/backcurl-core/src/BackCurl.cpp
)
target_include_directories(backcurl PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/backcurl/backcurl-core/header)

add_library(
    curl
    STATIC
    IMPORTED
)
set_target_properties(
    curl
    PROPERTIES IMPORTED_LOCATION
    ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/backcurl/curl-android-ios/prebuilt-with-ssl/android/${ANDROID_ABI}/libcurl.a
)
target_include_directories(backcurl PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/shared_libs/backcurl/curl-android-ios/prebuilt-with-ssl/android/include)


# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library(
    # Sets the name of the path variable.
    log
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    log
)

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.


target_link_libraries(backcurl curl z)
target_link_libraries(meta-frontend meta-core backcurl log)
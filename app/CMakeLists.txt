# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.6.0)

set (CMAKE_CXX_STANDARD 14)


# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library(
    # Sets the name of the library.
    native-lib
    # Sets the library as a shared library.
    SHARED
    # Provides a relative path to your source file(s).
    src/main/cpp/native-lib.cpp
    src/main/cpp/cunits/MyComputeUnit.h
    src/main/cpp/cunits/MyComputeUnit.cpp
)

add_subdirectory(libs/meta-frontend)
include_directories(libs/meta-frontend)

target_link_libraries(
    # Specifies the target library.
    native-lib

    # Links the target library to the log library
    # included in the NDK.
    ${log-lib}

    # link meta-frontend
    meta-frontend
)

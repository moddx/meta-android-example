# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.6.0)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

project(meta-frontend-test)

add_subdirectory(frontend/)

add_executable(
    # Name
    meta-frontend-test
    # source files (relative)
    main-test.cpp
    frontend/cunits/MyComputeUnit.cpp
    frontend/cunits/MyComputeUnit.h
)
target_include_directories(meta-frontend-test PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(meta-frontend-test meta-frontend)
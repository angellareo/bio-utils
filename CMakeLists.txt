cmake_minimum_required(VERSION 2.8)
project(bio-utils CXX)

set(CMake_VERSION_MAJOR "0")
set(CMake_VERSION_MINOR "1")
set(CMake_VERSION_PATCH "0")

set(PROJECT_VERSION ${CMake_VERSION_MAJOR}.${CMake_VERSION_MINOR}.${CMake_VERSION_PATCH})

# Initialize CXXFLAGS.
set(CMAKE_CXX_FLAGS                "-std=c++14")
set(CMAKE_CXX_FLAGS_DEBUG          "-Wall -O0 -g -std=c++14")
set(CMAKE_CXX_FLAGS_RELEASE        "-O4 -DNDEBUG -std=c++14")

add_subdirectory(scripts/spk-times)
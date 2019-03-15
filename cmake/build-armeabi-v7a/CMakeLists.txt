cmake_minimum_required(VERSION 3.1.3)
set(protobuf_source_dir /Users/blueberry/code/xhs/my/protobubf_blueberry)
# include libprotobuf-lite
set(protobuf_VERSION 3.7.x)
set(CMAKE_CXX_STANARD 11)
set(CMAKE_CXX_COMPILER "/Users/blueberry/tools/ndk16-toolchain/bin/arm-linux-androideabi-clang++")
set(CMAKE_C_COMPILER "/Users/blueberry/tools/ndk16-toolchain/bin/arm-linux-androideabi-clang")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")

add_definitions(-DHAVE_PTHREAD)
include(../libprotobuf-lite.cmake)

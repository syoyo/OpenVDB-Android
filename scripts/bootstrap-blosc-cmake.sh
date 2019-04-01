#!/bin/bash

## Please edit android sdk/ndk/cmake path
ANDROID_SDK_ROOT=$HOME/Android/Sdk/
ANDROID_NDK_ROOT=$HOME/local/android-ndk-r19c
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.10.2.4988404/bin/cmake

LOCAL_DIR=`pwd`

rm -rf build-blosc-android

# For ninja build
# -DCMAKE_MAKE_PROGRAM=$CMAKE_BIN/ninja \

$CMAKE_BIN \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_NATIVE_API_LEVEL=28 \
  -DANDROID_STL=c++_static \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX=$LOCAL_DIR/dist \
  -DBUILD_TESTS=Off \
  -DBUILD_BENCHMARKS=Off \
  -Bbuild-blosc-android -Hc-blosc-aarch64

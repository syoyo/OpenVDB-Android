#!/bin/bash

## Please edit android sdk/ndk/cmake path
ANDROID_SDK_ROOT=$HOME/Android/Sdk/
ANDROID_NDK_ROOT=$HOME/local/android-ndk-r19c
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.10.2.4988404/bin/cmake

LOCAL_DIR=`pwd`

rm -rf build-android

# For ninja build
# -DCMAKE_MAKE_PROGRAM=$CMAKE_BIN/ninja \

# Assume all dependent libs(TBB, ilmbase) are installed to `LOCAL_DIR/dist`.
# CMAKE_FIND_ROOT_PATH is required to point to PATH for such dependent libs(e.g. OpenSubdiv. without this, find_library() fails(e.g. it fails to find OpenSubdiv libs even `OPENSUBDIV_ROOT_DIR` is set)

$CMAKE_BIN \
  -DBoost_INCLUDE_DIR=$LOCAL_DIR/boost \
  -DCMAKE_FIND_ROOT_PATH=$LOCAL_DIR/dist \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_NATIVE_API_LEVEL=28 \
  -DANDROID_STL=c++_static \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX=$LOCAL_DIR/dist/USD-android \
  -DUSE_GLFW3=Off \
  -Bbuild-android -Hopenvdb

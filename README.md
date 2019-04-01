# Android port of OpenVDB

Build script for building OpenVDB on Android.
Only CPU vdb io library will be built.

## Supported platform

* [x] Android arm64

## Requirements

* Android NDK
* Cmake

## Build procedure

### Build Blosc

Edit NDK path etc. in `scripts/bootstrap-blosc-cmake.sh`, then

```
$ ./scripts/bootstrap-blosc-cmake.sh
$ cd build-blosc-android
$ make && make install
```

### Build TBB

Edit NDK path etc. in `scripts/bootstrap-tbb-cmake.sh`, then

```
$ ./scripts/bootstrap-tbb-cmake.sh
$ cd build-tbb-android
$ make && make install
```

### Build OpenEXR

T.B.W.

### Build OpenVDB

T.B.W.

## License

Build script and Android modification is licensed under MPL 2.0

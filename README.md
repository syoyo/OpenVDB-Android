# Android port of OpenVDB

Build script for building OpenVDB on Android.
Only CPU vdb io library(`libopenvdb`) will be built.

## Supported platform

* [x] Android arm64

## Requirements

* Android NDK(r19c)
* Cmake

## Build procedure

### Build Boost

```
$ cd boost
```

edit NDK clang path in `user-config.jam`, then

```
$ ./build-boost.sh
$ cd ..
```

#### Note on Boost repo

Following procedure is not needed to compile OpenVDB. Just for notes for developer(s).

All required Boost source codes are copied from 1.69.0 package using `bcp` tool .

Assume `bcp` is installed on your system.

```
$ cd $PATH_TO_BOOST
$ bcp config predef any mpl uuid interprocess timer system thread iostreams build bootstrap.bat bootstrap.sh boostcpp.jam boost-build.jam $OPENVDB_ANDROID/boost
```

### Build Blosc

Edit NDK path etc. in `scripts/bootstrap-blosc-cmake.sh`, then

```
$ ./scripts/bootstrap-blosc-cmake.sh
$ cd build-blosc-android
$ make && make install
$ cd ..
```

### Build TBB

Edit NDK path etc. in `scripts/bootstrap-tbb-cmake.sh`, then

```
$ ./scripts/bootstrap-tbb-cmake.sh
$ cd build-tbb-android
$ make && make install
$ cd ..
```

### Build OpenEXR

```
$ ./scripts/bootstrap-openexr-cmake.sh
$ cd build-openexr-android
$ make && make install
$ cd ..
```

### Build OpenVDB

```
$ ./scripts/bootstrap-openvdb-cmake.sh
$ cd build-openvdb-android
$ make && make install
$ cd ..
```

## License

Build script is licensed under MIT license.
Modification required to `openvdb` is licensed under MPL2.0

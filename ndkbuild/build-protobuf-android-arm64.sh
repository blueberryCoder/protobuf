export NDK_ROOT=~/Library/Android/sdk/ndk-bundle
export PREFIX=~/code/tools/android/protobuf-3.7.x-ndk-arm64
export PATH=$PATH:~/code/tools/android/android-ndk16-arm64/bin
export SYSROOT=~/code/tools/android/android-ndk16-arm64/sysroot
export CC="aarch64-linux-android-gcc --sysroot $SYSROOT"
export CXX="aarch64-linux-android-g++ --sysroot $SYSROOT"
export CXXSTL=$NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9
export LD=~/code/tools/android/android-ndk16-arm64/bin/aarch64-linux-android-ld

../configure \
--prefix=$PREFIX \
--host=aarch64-linux-android \
--with-sysroot="${SYSROOT}" \
--disable-shared \
--enable-cross-compile \
--with-protoc=protoc \
CFLAGS="-march=armv8-a -D__ANDROID_API__=21" \
CXXFLAGS="-frtti -fexceptions -march=armv8-a \
-I${NDK_ROOT}/sources/android/support/include \
-I${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/include \
-I${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/libs/arm64-v8a/include -D__ANDROID_API__=21" \
LDFLAGS="-L${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/libs/arm64-v8a" \
LD=${LD} \
LIBS="-llog -lz -lgnustl_static"

make -j2

make install

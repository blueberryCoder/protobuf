export NDK_ROOT=~/Library/Android/sdk/ndk-bundle
export PREFIX=~/tools/android/protobuf-3.7.x-ndk
export PATH=~/tools/ndk16-toolchain/bin:$PATH
export SYSROOT=~/tools/ndk16-toolchain/sysroot
export CC="arm-linux-androideabi-gcc --sysroot $SYSROOT"
export CXX="arm-linux-androideabi-g++ --sysroot $SYSROOT"
export CXXSTL=$NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9
export LD=~/tools/ndk16-toolchain/bin/arm-linux-androideabi-ld

../configure \
--prefix=$PREFIX \
--host=arm-linux-androideabi \
--with-sysroot="${SYSROOT}" \
--disable-shared \
--enable-cross-compile \
--with-protoc=protoc \
CFLAGS="-march=armv7-a -D__ANDROID_API__=21" \
CXXFLAGS="-frtti -fexceptions -march=armv7-a \
-I${NDK_ROOT}/sources/android/support/include \
-I${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/include \
-I${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/include -D__ANDROID_API__=21" \
LDFLAGS="-L${NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a" \
LD=${LD} \
LIBS="-llog -lz -lgnustl_static"

make -j2

make install

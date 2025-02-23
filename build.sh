#!/usr/bin/bash

sdk_name="openwrt-sdk-23.05.2-ramips-mt7621_gcc-12.3.0_musl.Linux-x86_64"

wget https://archive.openwrt.org/releases/23.05.2/targets/ramips/mt7621/$sdk_name.tar.xz

tar -xvf $sdk_name.tar.xz

cd $sdk_name/package

git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git

cd ..

./scripts/feeds update -a && ./scripts/feeds install -a

make download -j8 V=s

make package/feeds/luci/luci-base/compile V=99

make package/luci-app-unblockneteasemusic/compile V=s



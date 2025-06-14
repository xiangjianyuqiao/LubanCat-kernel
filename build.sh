#########################################################################
# File Name: build.sh
# Author: lyl
# mail: l_haoxinqing@163.com
# Created Time: Fri 02 May 2025 06:44:21 PM CST
#########################################################################
#!/bin/bash
rm -rf ../*.deb
rm -rf ../*.buildinfo
rm -rf ../*.changes

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- mrproper
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  lubancat_linux_rk356x_defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  menuconfig

echo $1 > .version

#time make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc --all)

time make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc --all) bindeb-pkg

#!/bin/sh
#export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.21
export ISD_GIT_ROOT=ssh://git@nero/isd
export ISD_PRODUCT=topaz
export ISD_PREFER_WC=y
BLDVER=python-5.01.02-rc4
export RFS_TYPE=APP

umask 0022

#git clone $ISD_GIT_ROOT/factory #factory-$BLDVER
# cd factory-$BLDVER
git checkout $BLDVER
git clone $ISD_GIT_ROOT/product/$ISD_PRODUCT
cd $ISD_PRODUCT
git checkout $BLDVER
chmod -R g-w ./
cd ..
git clone $ISD_GIT_ROOT/product/common
cd common
git checkout $BLDVER
chmod -R g-w ./
cd ..
cp $ISD_PRODUCT/build/.config .
cp $ISD_PRODUCT/build/versions.mk . 
cp $ISD_PRODUCT/build/linux.config . 
cp $ISD_PRODUCT/build/dk.config . 

# time make 2>&1 | tee APPbuildoutput.log
#cp build_*-timesys-linux-gnu/images/rfs/rootfs.tar.gz rootfs-$BLDVER.tar.gz
#cp build_*-timesys-linux-gnu/*.sh .
#cp build_*-timesys-linux-gnu/toolchain-final*.tgz .

#export RFS_TYPE=DK
#cp dk.config .config
#make rfs-distclean
#time make 2>&1 | tee DKbuildoutput.log
#cp build_*-timesys-linux-gnu/images/rfs/rootfs.tar.gz rootfs-DK$BLDVER.tar.gz
#cp build_*-timesys-linux-gnu/images/rfs/rootfs.ext2.gz rootfs-DK$BLDVER.ext2.gz



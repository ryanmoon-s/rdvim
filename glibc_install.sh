#########################################################################
# File Name:    install.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 2022年01月01日 星期六 17时28分46秒
#########################################################################
#!/bin/bash

# 输入 clangd --version 查看clangd安装情况
# 如果显示需要glibc_2.18支持，则运行此脚本

wget --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/gnu/glibc/glibc-2.18.tar.gz

tar -zxvf glibc-2.18.tar.gz

cd glibc-2.18/

mkdir build
cd build

../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make -j 8
sudo make install

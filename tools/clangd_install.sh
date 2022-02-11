#########################################################################
# File Name:    coc.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 2021年12月31日 星期五 17时43分15秒
#########################################################################
#!/bin/bash

# 此脚本安装clangd
# clangd为C++专用的lsp 其它语言请安装自己的lsp

# 安装方法
# mac    
#   不用运行脚本   brew安装即可：brew install llvm
# linux  
#   运行 sh clangd_install.sh
#   但是下载较慢 可从其它渠道下载 注释掉 wget $clangdurl

coc=coc_dependence
if [[ ! -d $coc ]];then
    mkdir $coc
fi
cd $coc

# 完整url  https://github.com/clangd/clangd/releases/download/snapshot_20211205/clangd-linux-snapshot_20211205.zip
ver=20211205
clangd="clangd-linux-snapshot_"$ver".zip"
unzipclangd="clangd_snapshot_"$ver
clangdurl="https://github.com/clangd/clangd/releases/download/snapshot_"$ver"/"$clangd

wget $clangdurl
unzip $clangd

if [[ -d clangd ]];then
    rm -rf clangd
fi

mv $unzipclangd clangd
rm $clangd

#source
dir=`pwd`
echo -e "\n\nexport PATH=\$PATH:$dir/nodejs/bin:$dir/clangd/bin\n\n"
echo "如果你用的是bash，请把上面这句话复制到 ~/.bashrc"
echo "然后运行source ~/.bashrc"
echo "其它shell脚本同理"

# 必须的检查！
# clangd --version
# 可能出现glibc过旧 还需要运行 zsh glibc_install.sh

echo -e "\n\n请运行calngd --version 检查clangd是否能被支持\n"
echo -e "可能出现glibc过旧 还需要运行 glibc_install.sh\n\n"


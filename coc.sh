#########################################################################
# File Name:    coc.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 2021年12月31日 星期五 17时43分15秒
#########################################################################
#!/bin/bash

# 此脚本安装nodejs clangd
# mac    
#   不用运行脚本   brew安装即可：brew install nodejs; brew install llvm
# linux  
#   如果商店能安装 就不用运行脚本 
#   但是商店源可能太旧，会报错，也需要运行脚本

# 运行脚本
# 运行 sh / zsh coc.sh

# 解释
# coc.nvim依赖nodejs 
# clangd 为 c++ 的语言协议服务器

# nodejs
coc=coc_dependence
if [[ ! -d $coc ]];then
    mkdir $coc
fi
cd $coc

file=node-v16.13.1-linux-x64
tarfile=$file".tar"
xzfile=$tarfile".xz"
url="https://nodejs.org/dist/v16.13.1/"$xzfile

wget $url
xz -d $xzfile
tar -xvf $tarfile
rm $tarfile

if [[ -d nodejs ]];then
    rm -rf nodejs
fi

mv $file nodejs

dir=`pwd`
echo -e "\n\nexport PATH=\$PATH:$dir/nodejs/bin:$dir/clangd/bin\n\n"
echo "如果你用的是bash，请把上面这句话复制到 ~/.bashrc"
echo "然后运行source ~/.bashrc"
echo "其它shell脚本同理"

# clangd
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


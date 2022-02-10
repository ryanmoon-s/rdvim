#########################################################################
# File Name:    coc.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 2021年12月31日 星期五 17时43分15秒
#########################################################################
#!/bin/bash

# coc.nvim依赖nodejs 
# 此脚本安装nodejs

# 安装方法
# mac    
#   不用运行脚本   brew安装即可：brew install nodejs
# linux  
#   运行 sh / zsh coc.sh

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


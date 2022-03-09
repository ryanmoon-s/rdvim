#########################################################################
# File Name:    git-repair.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 2022年02月08日 星期二 18时16分13秒
#########################################################################
#!/bin/bash

# vim-plug 替换github地址 以加速下载

if [ $# -ne 1 ];then
    echo "Usage: 1 加速git 2 恢复原状"
    exit
fi

cd ~/.vim/autoload/

if [ $1 -eq 1 ];then
    cp plug-git-repair.vim plug.vim
    echo "git-repair done"
elif [ $1 -eq 2 ];then
    cp plug-normal.vim plug.vim
    echo "git-normal done"
else
    echo "Usage: 1 加速git 2 恢复原状"
    exit
fi

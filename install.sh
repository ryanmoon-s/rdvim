#########################################################################
# File Name:    install.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 2022年01月06日 星期四 20时34分57秒
#########################################################################
#!/bin/bash

function digitaldatetime() {
    echo `date +"%Y%m%d%H%M%S"`
}

vimdir=`pwd -P`
cd ~

# back-up

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "Found ~/.vimrc Backing up to ~/.vim.`digitaldatetime`";
    mv ~/.vimrc ~/.vimrc.`digitaldatetime`;
fi

if [ -d ~/.vim ]; then
    echo "Found ~/.vim Backing up to ~/.vim.`digitaldatetime`";
    mv ~/.vim ~/.vim.`digitaldatetime`;
fi

if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
    echo "Found ~/.tmux.conf Backing up to ~/.tmux.conf.`digitaldatetime`";
    mv ~/.tmux.conf ~/.tmux.conf.`digitaldatetime`;
fi

if [ -f ~/.tmux.conf.local ] || [ -h ~/.tmux.conf.local ]; then
    echo "Found ~/.tmux.conf.local Backing up to ~/.tmux.conf.local.`digitaldatetime`";
    mv ~/.tmux.conf.local ~/.tmux.conf.local.`digitaldatetime`;
fi

echo

# ln
echo "ln -s `pwd`/.vimrc .vimrc"
ln -s ${vimdir}/.vimrc .vimrc

echo "ln -s `pwd`/.vim .vim"
ln -s ${vimdir}/.vim .vim

echo "ln -s `pwd`/.tmux.conf .vim.conf"
ln -s ${vimdir}/.tmux.conf .tmux.conf

echo "ln -s `pwd`/.tmux.conf.local .vim.conf.lcoal"
ln -s ${vimdir}/.tmux.conf.local .tmux.conf.local

# echo "ln -s `pwd`/.vimrc_for_vscode .vimrc_for_vscode"
# ln -s ${vimdir}/.vimrc_for_vscode .vimrc_for_vscode

# finish

echo ""
echo "** 原来的文件已经备份成         ~/.vim*.xxxxxxxx **"
echo "** 请先安装插件 -> 进入vim输入  :PlugInstall **"

echo "         _       _ "
echo " _ __ __| |_   _(_)_ __ ___ "
echo "| '__/ _\` \ \ / / | '_ \` _ \ "
echo "| | | (_| |\ V /| | | | | | | "
echo "|_|  \__,_| \_/ |_|_| |_| |_| "

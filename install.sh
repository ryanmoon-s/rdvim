#!/bin/bash
function digitaldatetime() {
    echo `date +"%Y%m%d%H%M%S"`
}
vimdir=`pwd -P`
cd $HOME

if [ -f .vimrc ] || [ -h .vimrc ]; then
    echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.`digitaldatetime`\033[0m";
    mv .vimrc .vimrc.`digitaldatetime`;
fi

if [ -d .vim ]; then
    echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32mBacking up to ~/.vim.`digitaldatetime`\033[0m";
    mv .vim .vim.`digitaldatetime`;
fi

echo "\033[0;32mln -s ${vimdir}/.vimrc .vimrc\033[0m"
ln -s ${vimdir}/.vimrc .vimrc
echo "\033[0;32mln -s ${vimdir}/.vim .vim\033[0m"
ln -s ${vimdir}/.vim .vim

# 安装vim插件
vim +PlugInstall +qall

echo "原来的文件已经备份成 .vim*.xxxxxxxx"
echo "** 安装完成** "

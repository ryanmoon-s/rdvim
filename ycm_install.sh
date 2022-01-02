#########################################################################
# File Name:    final_install.sh
# Author:       arashi
# mail:         arashi@tencent.com
# Created Time: 二 12/21 11:29:57 2021
#########################################################################
#!/bin/bash

# 安装YouCompleteMe的脚本 

ycm_dir=".vim/plugged/YouCompleteMe"

if [[ ! -d $ycm_dir ]]; then
    echo "请先进入vim 运行:PlugInstall 下载YouCompleteMe"
else
    # 报错：Undefined symbols for architecture arm64 取消下方--system-libclang注释
    python3 $ycm_dir/install.py --clang-completer     --system-libclang
    if [[ $? -ne 0 ]]; then
        echo; echo
        echo "[ aooo 似乎未安装成功 ]"
        echo
        echo "[ 如果你是 m1 芯片，大概率会报错：Undefined symbols for architecture arm64 ]"
        echo "[ 请取消脚本内 --system-libclang 的注释(以使用自带clang)，重新编译 ]"
        echo
        echo "[ 其它错误请见脚本内 tips ]"
    else
        echo; echo
        echo "[ wuhu~ 安装成功啦 ]"
        echo "[ 请将 ~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py 移到开发项目的根目录 ]"
        cp .ycm_extra_conf.py $ycm_dir
    fi
fi

# tips:

# 遇到缺少的库去安装
# 如果商店安装的库版本太旧，需要百度下载手动编译 (可能有vim cmake等，vim可能还会要求使用python3.xx编译)


# 一个可能会遇到的错误提示（vim编辑界面提示Ycm server shutdown）：
# 按照指引打开日志发现：/lib64/libstdc++.so.6: version `GLIBCXX_3.4.26' not found
# 这是标准库过旧导致ycm编译错误，用下面的方法重新导入需要的lib库
#
# libstdc.so_.6.0.26.zip 下载：https://wwa.lanzoui.com/i8lnene
# unzip libstdc.so_.6.0.26.zip
# cp libstdc++.so.6.0.26 /usr/lib64
# ln -s libstdc++.so.6.0.20 libstdc++.so.6
#

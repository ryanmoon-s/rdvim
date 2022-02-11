# rdvim 简介
大厂程序员自用vim配置，不好用你来砍我。  
```txt
1. 对所有vim自带快捷键进行梳理，容易误触的不使用快捷键全部禁用。
2. 实用的快捷键进行合理的映射，所有快捷键在.vimrc里面罗列展示，快捷查询。
3. 集成了30多个实用插件，所有插件都能在.vimrc里面找到精简教学。
4. 开箱即用，所有插件都hardcode在代码仓库，不需要下载。
5. 部分特性针对c++，其它语言可以类比改造。
```

# rdvim 安装
```bash
cd ~
git clone https://github.com/ryanmoon-s/rdvim.git
cd rdvim
sh ./install.sh
```

# rdvim 使用
## 快捷键
<img src="https://github.com/ryanmoon-s/rdvim/blob/main/.screenshot/Leader.png" width = "400"  alt="Leader map" align=center />  
<img src="https://github.com/ryanmoon-s/rdvim/blob/main/.screenshot/Othermap.png" width = "400"  alt="Other map" align=center /> 

## 插件


## 语法补全
### YouCompleteMe
集成所有补全、跳转等一套功能，但是能使用的语言有限  
本仓库自带其代码，直接安装即可  
安装前务必先阅读一遍这个脚本，里面有遇到错误的解决办法  
  
安装：
```txt
1、打开.vimrc 取消plug注释  
2、sh ./ycm_install.sh  
```
  
### coc.nvim
这是基于lsp(language server protocol)，不懂的可以百度 ~  
它依赖nodejs环境   
它需要一个language server来完成补全等功能，c++用的是clangd，其它语言自行下载对应的server
安装前务必先阅读一遍每个脚本，里面有遇到错误的解决办法  
  
安装：   
```txt
1、打开.vimrc 取消plug注释
2、sh ~/rdvim/tools/clangd_install.sh
3、sh ~/rdvim/tools/nodejs_install.sh
```
#### coc 使用方法：
##### 一、注册language server
vi ~/rdvim/.vim/coc-setting.json   
已经写好了clangd的注册方式  
其它语言的注册参考: https://github.com/neoclide/coc.nvim/wiki/Language-servers

##### 二、coc 更智能的自动提示

现在可以补全了 但是只能在单目录结构下起作用 项目里面那么多散落在各级目录下的头文件 它怎么知道去哪找 ？  

###### 1. compile_commands.json
需要我们先运行cmake/bazel/make来构建一遍项目，用特定工具跟踪编译过程 将所有头文件路径生成一个compile_commands.json文件，就能让server知道去哪些地方找头文件  
参考：https://clangd.llvm.org/installation.html#project-setup  里面的Project setup一节

###### 2. compile_flags.txt
这是另一个不用这么麻烦的办法  
a. 打开vim :CocLocalConfig 在项目根目录生成一个局部的coc-setting.json配置文件输入上方相同内容  
b. 在项目根目录创建一个 compile_flags.txt 文件 输入要传给clangd的flag格式如下：  
```txt
-std=c++11
-xc++
-I
.
-I
./include
```

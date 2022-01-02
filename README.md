# vimrc 安装
sh ./install.sh

# 自动补全
## YouCompleteMe
集成所有补全、跳转 等一套功能，但是能使用的语言有限  
安装：
```txt
1、打开.vimrc 里面的plug注释
2、sh ./ycm_install.sh  
```

安装前最好先阅读一遍这个脚本，里面有遇到错误的解决办法  

## coc.nvim
这是基于lsp(language server protocol)，不懂的可以百度
### 安装
1、它依赖nodejs环境  
2、它需要一个language server来完成补全等功能，c++用的是clangd，其它语言自行下载对应的server  
3、安装方式   
```txt
1、打开.vimrc 里面的plug注释
2、linux：运行脚本 sh ./coc.sh 会同时安装nodejs、clangd
3、mac：brew install nodejs; brew install llvm
```

### linux可能会出现安装问题：
```txt
clangd 至少需要glibc(gnu libc) version >= 2.18
运行：clangd --version 如果没异常则满足 否则会说明glibc版本过低
```
### 解决办法：
```txt
sh ./glibc_install.sh   
中途会让输入用户密码
再输入clangd --version 看是否异常
```

### coc使用方法：
进入vim，输入 :CocConfig  
会进入编辑一个文件 coc-setting.json (coc的配置文件) 输入以下代码 注册language server  
```json
{
"languageserver": {
    "clangd": {
      "command": "clangd",
      "rootPatterns": ["compile_flags.txt", "compile_commands.json"],
      "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"]
    }
  }
}
```

其它语言的注册参考: https://github.com/neoclide/coc.nvim/wiki/Language-servers

### coc更智能的自动提示

现在可以补全了 但是只针对单层目录结构  项目里面那么多散落在各级目录下的头文件 它怎么知道去哪找？  
参考：https://clangd.llvm.org/installation.html#project-setup  里面的Project setup一节  

#### compile_commands.json
需要我们先运行cmake bazel make来构建一遍项目，用特定工具跟踪编译过程 将所有用到的头文件生成一个compile_commands.json文件  
就能让server知道去哪些地方找头文件  

cmake 直接运行命令：
```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```

make 用bear  
bear安装：包管理器 or https://github.com/rizsotto/Bear 手动编译  
```bash
bear -- make 
```

bazel： 
还没搞通 暂时用下面的方法 

#### compile_flags.txt
这是另一个不用这么麻烦的办法  
1、:CocLocalConfig 在项目根目录生成一个局部的coc配置文件输入上方相同内容  
2、在根目录创建一个 compile_flags.txt 文件 输入要传给clangd的flag格式如下：  
```txt
-std=c++11
-xc++
-I
.
-I
./include
```

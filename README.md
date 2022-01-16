# rdvim 简介
鹅厂程序员自用vim配置，不好用你来砍我。  
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

## 插件


## 语法补全
### YouCompleteMe
集成所有补全、跳转 等一套功能，但是能使用的语言有限  
安装：
```txt
1、打开.vimrc 取消plug注释  
2、sh ./ycm_install.sh  
```

安装前最好先阅读一遍这个脚本，里面有遇到错误的解决办法  

### coc.nvim
这是基于lsp(language server protocol)，不懂的可以百度
#### 安装
1、它依赖nodejs环境   
2、它需要一个language server来完成补全等功能，c++用的是clangd，其它语言自行下载对应的server  
3、安装方式   
```txt
1、打开.vimrc 取消plug注释
2、先浏览coc.sh脚本 再按照里面的指示进行安装
```

**linux可能会出现安装问题：**  
```txt
clangd 至少需要glibc(gnu libc) version >= 2.18
运行：clangd --version 如果没异常则满足 否则会说明glibc版本过低
```
**解决办法：**  
```txt
sh ./glibc_install.sh   
中途会让输入用户密码
再输入clangd --version 看是否异常
```

#### coc 使用方法：
##### 注册language server
vi ~/.vim/coc-setting.json   
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

#### coc 更智能的自动提示

现在可以补全了 但是只能在单目录结构下起作用 项目里面那么多散落在各级目录下的头文件 它怎么知道去哪找 ？  
参考：https://clangd.llvm.org/installation.html#project-setup  里面的Project setup一节  

##### 1. compile_commands.json
需要我们先运行cmake/bazel/make来构建一遍项目，用特定工具跟踪编译过程 将所有用到的头文件生成一个compile_commands.json文件，就能让server知道去哪些地方找头文件  

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
还没时间研究 暂时用下面的方法  

##### 2. compile_flags.txt
这是另一个不用这么麻烦的办法  
a. :CocLocalConfig 在项目根目录生成一个局部的coc-setting.json配置文件输入上方相同内容  
b. 在根目录创建一个 compile_flags.txt 文件 输入要传给clangd的flag格式如下：  
```txt
-std=c++11
-xc++
-I
.
-I
./include
```

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

```vim
" ==== Leader ==========================
" define prefix of map : <Leader>
let mapleader=";"

" 1  2  3                    -
"  q  w  e  r       u    o  p  [  ]
"   a  s  d  f    h  j  k  l
"    z     c  v  b  n  m  ,  .  /

" 1 2 / 3       - buffer switch / widen
" -             - buffer delete
" q w           - :q :w
" e             - new file
" r             - rotate window
" o p           - close other win / close other buf
" [1 / [2 / [3  - make vim session
" ]1 / ]2 / ]3  - load vim session
" a             - jump between .h and .cpp
" s             -
" d u b f       - turn pages
" h j k l       - jump to another win
" z             - quickmenu
" c             - coc.nvim quickfix
" v             - :G blame
" n m           - nerd taglist
" ,             - :noh
" /             - produce a bak line

" Q             - :q!
" J             - J J (only in cpp)

" ==== other ===========================
" <c-p>         - fzf files
" <c-c>         - inner terminal

" == single ==
" E             - $
" ,             - brackets match
" tm            - insert time
" mm            - insert lorem
" 'j            - next git hunk
" 'k            - prev git hunk
" gw gf         - ack word / ack file
" tg gt gr      - ctag / go to / go return
" g=            - align with =    (only in visual mode)
" g/            - align with //   (only in visual mode)
" gcc           - (un)comment single line
" gc            - (un)comment a block
" F5            - single file compile
```

## 插件
```vim
call plug#begin('~/.vim/plugged')

" << 美化 >>
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 窗口调整
Plug 'camspiers/lens.vim'     " 切换窗口时 自动调整大小
Plug 'camspiers/animate.vim'  " 窗口调整时 动画效果
" 使ctrl + d 翻页画面过渡流畅
Plug 'psliwka/vim-smoothie'
" vim 不带文件名参数时 展示 启动界面
Plug 'mhinz/vim-startify'
" vim 主题 包含airline主题
Plug 'morhetz/gruvbox', {'do': 'cp colors/gruvbox.vim ~/.vim/colors'}
Plug 'joshdick/onedark.vim', {'do': 'cp colors/onedark.vim ~/.vim/colors \| cp autoload/onedark.vim ~/.vim/autoload'}
Plug 'arcticicestudio/nord-vim', {'do': 'cp colors/nord.vim ~/.vim/colors'}


" << 导航 >>
" 文件窗口
Plug 'preservim/nerdtree'
" git 文件状态
Plug 'Xuyuanp/nerdtree-git-plugin'
" 基于ctag 用于跳转
Plug 'preservim/tagbar'
" 将命令放到菜单栏
Plug 'skywind3000/quickmenu.vim'


" << 搜索 >>
" 可视化ack 前提是已经安装ack
Plug 'mileszs/ack.vim'
" 内置terminal
Plug 'voldikss/vim-floaterm'
" 模糊搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 光标所在单词(屏幕中所有相同单词) 增加下划线 类似于idea
Plug 'itchyny/vim-cursorword'
" 加快jk的移动速度
Plug 'rhysd/accelerated-jk'
" f 行内跳转的高亮
Plug 'hrsh7th/vim-eft'


" << 处理 >>
" 括号处理
Plug 'tpope/vim-surround'
" 文本对齐
Plug 'godlygeek/tabular', {'branch': 'master'}
" 快捷注释 行:gcc  块: gc
Plug 'tpope/vim-commentary'


" << git >>
" 状态栏branch 文件内执行git命令 方便的diff
Plug 'tpope/vim-fugitive'
" git graph  :Flog -max-count=100
Plug 'rbong/vim-flog'
" 状态栏变更显示 左侧变更显示
Plug 'airblade/vim-gitgutter'


" << cpp >>
" c++ 语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'
" 对齐线 for if ...
Plug 'Yggdroot/indentLine'
" 在头/源文件之间快速跳转
Plug 'vim-scripts/a.vim'


" << 补全 >>
" 选择其中一个打开注释即可
" ====
" 1、ycm - 打开注释后参考README里面的安装方式
" Plug 'ryanmoon-s/YouCompleteMe'
" ====
" 2、coc - 打开注释后参考README里面的安装方式
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()
```

## 语法补全
所有的脚本安装前务必先阅读一遍，里面都有遇到错误的解决办法  
### YouCompleteMe
集成所有补全、跳转等一套功能，但是能使用的语言有限  
本仓库自带其代码，直接安装即可  
  
安装：
```txt
1、打开.vimrc 取消plug注释  
2、sh ~/rdvim/tools/ycm_install.sh  
```

### coc.nvim
基于lsp(language server protocol)，不懂的可以百度 ~  
a. 依赖nodejs环境;  
b. 需要一个language server来完成补全等功能，c++用的是clangd，其它语言自行下载对应的server;  
  
***coc 安装方式：***   
```txt
1、打开.vimrc 取消plug注释
2、sh ~/rdvim/tools/clangd_install.sh
3、sh ~/rdvim/tools/nodejs_install.sh
```

***coc 使用方法：***
#### 一、注册language server
vim ~/rdvim/.vim/coc-setting.json   
里面已经写好了clangd的注册方式  
其它语言的注册参考: https://github.com/neoclide/coc.nvim/wiki/Language-servers

#### 二、coc 更智能的自动提示

现在可以补全了，但是只能在单目录结构下起作用。  
项目里面那么多散落在各级目录下的头文件，它怎么知道去哪找 ？  

##### 1. compile_commands.json
需要我们先运行cmake/bazel/make来构建一遍项目，用特定工具跟踪编译过程 将所有头文件路径生成一个compile_commands.json文件，就能让server知道去哪些地方找头文件  
参考：https://clangd.llvm.org/installation.html#project-setup  里面的Project setup一节

##### 2. compile_flags.txt
这是另一个不用这么麻烦的办法  
a. 打开vim :CocLocalConfig 在项目根目录生成一个局部的coc-setting.json配置文件输入上方相同内容  
b. 在项目根目录创建一个 compile_flags.txt 文件 输入要传给clangd的flag格式，如下：  
```txt
-std=c++11
-xc++
-I
.
-I
./include
```

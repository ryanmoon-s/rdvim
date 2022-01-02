" 定义快捷键前缀，即<Leader> 不要用在数字上
let mapleader=";"
" leader have been apply :
" a
" e
" d u b f
" h j k l
" n m
" v
" ,
" 1 2 3
" q w Q
" s
" r
" [ ]
" gf gw
" tg gt gr

" ==== 主题 ================================================
" 暗紫
" set background=dark
" colorscheme onedark

" 橙灰
set background=dark
colorscheme gruvbox

" ==== 教学 ================================================
" ==== map =============================
" n/i/c   nore    map    <silent>        src-cmd    dst-cmd
" mode    非递归  映射   不显示提示信息

" <CR>     carriage-return 回车
" <ESC>    esc
" <C-w>    Ctrl + w 可跟大写
" <Space>  space
" <Leader> mapleader

" <Plug> 类型的不能加 nore 否则不起作用
" 绑定fx，就不要绑定f了，想要f出效果，会等待一段时间 以确认用户不输入第二个字母
" 绑定l， 就不要绑定lx， l会被暂存，下次与其它按键一起出来
" 即 两个键的和一个键的不要重合

" ==== Plug config T =======================================
" ==== junegunn/vim-plug ===============
call plug#begin('~/.vim/plugged')

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 窗口调整
Plug 'camspiers/lens.vim'     " 切换窗口时 自动调整大小
Plug 'camspiers/animate.vim'  " 窗口调整时 动画效果

" 文件窗口
Plug 'preservim/nerdtree'

" 快捷注释 行:gcc  块: gc
Plug 'tpope/vim-commentary'

" 快捷使用ack 前提是已经安装ack
Plug 'mileszs/ack.vim'

" 基于ctag 用于跳转
Plug 'preservim/tagbar'

" 语法补全1 ycm 
" 安装：sh ycm_install.sh
" Plug 'ryanmoon-s/YouCompleteMe'
" 帮助项目生成 .ycm_extra_conf.py，支持make cmake qmake autotools
" Plug 'rdnetto/YCM-Generator'

" 语法补全2 coc
" 1、需要先安装nodejs(coc 依赖)、clangd(作为language server) 有些系统可以用包管理器安装
" 2、运行sh ./coc.sh 安装这两个东西
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 在头/源文件之间快速跳转
Plug 'vim-scripts/a.vim'

" git插件 状态栏branch blame
Plug 'tpope/vim-fugitive'

" git插件 左侧查看变动
Plug 'airblade/vim-gitgutter'

" 文件模糊搜索 ctrl + p
Plug 'ctrlpvim/ctrlp.vim'

" 使ctrl + d 翻页画面过渡流畅
Plug 'psliwka/vim-smoothie'

" vim 主题 包含airline主题
Plug 'morhetz/gruvbox', {'do': 'cp colors/gruvbox.vim ~/.vim/colors'}
Plug 'joshdick/onedark.vim', {'do': 'cp colors/onedark.vim ~/.vim/colors \| cp autoload/onedark.vim ~/.vim/autoload'}

" 文字对齐
" Plug 'godlygeek/tabular'

call plug#end()

" ==== NERD T ==========================
" 为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q |
" 打开文件自动关闭
let NERDTreeQuitOnOpen=1
" 子窗口位置
let NERDTreeWinPos="left"
" 忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']
" 打开快捷键
nnoremap <silent> <Leader>n :NERDTreeToggle <CR>

" ==== airline T =======================
" 永远显示状态栏
set laststatus=2
" tab line
let g:airline#extensions#tabline#enabled = 1              " 是否打开tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1      " 切换模式
nmap <Leader>1 <Plug>AirlineSelectPrevTab                 " 前一个tab <Plug>类型的只可nmap
nmap <Leader>2 <Plug>AirlineSelectNextTab                 " 后一个tab
let g:airline#extensions#tabline#left_sep = ''           " 分隔符
let g:airline#extensions#tabline#left_alt_sep = '➤'

" ale support
let g:airline#extensions#ale#enabled = 1

" fugitive support
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" symbol
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '▌'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '  ｢'
let g:airline_symbols.maxlinenr = '｣'
let g:airline_symbols.colnr = '   ❤ '
let g:airline_symbols.paste = '[paste]'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ' '

" statusline trailing  末尾的文字后面有尾随的空格

" ==== gitgutter T =====================
" 更新间隔
set updatetime=100
" 标志符号
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_modified_removed = '#'
" 进入自动显示
autocmd BufEnter * GitGutter
autocmd VimEnter * GitGutter
" 改动 块间 跳转
nmap 'k <Plug>(GitGutterPrevHunk)
nmap 'j <Plug>(GitGutterNextHunk)

" ==== fugitive T ======================
nnoremap <Leader>v :Git blame <CR>


" ==== ack T ===========================
" 高亮搜索关键词
let g:ackhighlight = 1
" 修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"


" ==== ctrlp T =========================
" 寻找目录：c 当前文件所在目录 
let g:ctrlp_working_path_mode = 'c'
" 最大查找深度
let g:ctrlp_max_depth = 10

" <C-o>  选择打开方式
" <C-c>  退出
" <C-k>  向上选择
" <C-j>  向下选择
" <C-y>  输入不存在的文件 会打开这个文件
" ..<CR> 跳转到上级目录 ...<CR> 上上级 类推

" 另外两个模式 :CtrlPBuffer(buffer) :CtrlPMRU(most recently used)
" 可自行map

" ==== coc T ========================

" ==== ycm T ========================
" 全局文件配置
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" 关闭补全预览
let g:ycm_add_preview_to_completeopt = 0
" 允许vim加载.ycm_extra_conf.py文件，不再提示
let g:ycm_confirm_extra_conf = 0
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" error 符号
let g:ycm_error_symbol = '✗'
" warning 符号
let g:ycm_warning_symbol = '⚠'
" 行颜色
highlight YcmErrorLine guibg=#333333
highlight YcmWarningLine guibg=#008B8B
" 关闭实时语法检测
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_highlighting = 0

" ==== VIM Config T =========================================
" ==== other ===========================
" 点亮光标所在前行
set cursorline
" 插件高度 main for ycm
set pumheight=25
" 退格可以删除：自动缩进、跨行、之前插入的
set backspace=indent,eol,start
" o O <CR> 时复制上一行的缩进格式
set autoindent
" c-style indent
set cindent
set cinoptions=g-1
" 不产生交换文件
set nobackup
" 行号 :no nu 取消
set number
" 命令保存的条数
set history=50
" 显示鼠标位置
set ruler
" 显示未完成的命令
set showcmd
"设置非兼容vi模式
set nocompatible
" 不产生.swp文件
set noswapfile
" <Table> 长度
set tabstop=4
" 缩进偏移量
set shiftwidth=4
" 智能缩进
set smartindent
" 显示匹配的括号
set showmatch
" 把<Table>替换成等量的空格
set expandtab
" 指定何时启动选择模式，而不是可视模式
set selectmode=mouse,key
" 选择模式
set selection=exclusive
" tags搜索路径
set tags=./.tags;,.tags "在每个目录下如果找不到tags就到上一层目录去找
" 编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set modeline
set modeline
" 开启语义分析
syntax enable
" 语法高亮
syntax on
" 不显示打开文件时的提示
set shortmess=atI
" 不显示底部的 --插入-- 等模式文字
set noshowmode

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 根据侦测到的不同类型采用不同的缩进格式
filetype indent on

" 搜索关键词高亮
set hlsearch
" 增量搜索 increase search 边输入边搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase "设置默认大小写不敏感查找
set smartcase  "如果有大写字母，则切换到大小写敏感查找

" ==== map T (快捷键) ======================================
" 实用快捷键记忆
"
" U 将当前行恢复至开始编辑前的样子 只缓存当前行 u撤销是上次操作可无限u
" D 删除至行尾
" I 行首插入
" A 行尾插入
" s 删除并插入
" f + x 行内查找字符x 直接跳转
" H 跳到当前屏幕左上角
" L 跳到当前屏幕左下角
" M 跳到当前屏幕中间行
" K 跳到 当前位置的单词 的help
" X 退格 不断删除光标左边的符号 x是删除光标上的符号
" c cc和dd类似 但不会将光标移到下一行 而是在当前行合适的缩进位置 进入插入模式
" C 和D类似 但删除后 会进入插入模式
" V 行 可视模式
" w 后一单词 b 前一单词 e 词尾
"
" y: yy nyy ygg yG yw y0 y$
" 剪切 复制 [可以] -->  左接数字 || 右接跳转
" 只能左接数字 s x
" 可以右接跳转 y d c

" ==== ban map T =======================
" 禁用快捷键 需要shift+ 才能按出的
nnoremap R <nop>
nnoremap Q <nop>
nnoremap T <nop>
nnoremap S <nop>
nnoremap F <nop>
nnoremap J <nop>
nnoremap Z <nop>
nnoremap B <nop>
nnoremap E <nop>
nnoremap W <nop>
nnoremap ~ <nop>
nnoremap ! <nop>
nnoremap @ <nop>
nnoremap ^ <nop>
nnoremap & <nop>
nnoremap ( <nop>
nnoremap ) <nop>
nnoremap _ <nop>
nnoremap # <nop>
nnoremap ? <nop>

" 未解之迷 [ ]

" 还可以用来组合其它快捷键 直接按出的
nnoremap t <nop>
nnoremap m <nop>
nnoremap q <nop>
nnoremap " <nop>
nnoremap \ <nop>
" nnoremap , <nop>
nnoremap . <nop>
nnoremap ` <nop>
nnoremap - <nop>

" ==== file opention T =================
" 关闭当前窗口
nnoremap <Leader>q :q<CR>
" 保存
nnoremap <Leader>w :w<CR>
" 不保存强制退出
nnoremap <Leader>Q :q!<CR>
" 快速切换头/源文件 需要a.vim插件支持
nnoremap <Leader>a :A <CR>
" 打开文件
nnoremap <Leader>e :e<Space>

" Ack搜索 不自动打开第一个文件
nnoremap <Leader>gw :Ack! <Space>
" AckFile搜索 不自动打开第一个文件
nnoremap <Leader>gf :AckFile!<Space>

" ==== other map T =====================
" 去除搜索高亮
nnoremap <Leader>, :noh<CR>
" 行尾
nnoremap e $
" 括号匹配
nnoremap , %
"r source .vimrc
nnoremap <Leader>s :source ~/.vimrc <CR>

" 输入括号时 括号匹配 ESC光标会向前移一格
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" 使用ctrl c,v实现vim之间的复制粘贴 非mac os实用
vnoremap <C-c> :w! ~/tmp/clipboard.txt <CR>
inoremap <C-v> <Esc>:r ~/tmp/clipboard.txt <CR>

" 会话 记录当前vim所有状态
nnoremap <Leader>[ :mksession! ~/.session.vim  <CR>
nnoremap <Leader>] :source ~/.session.vim      <CR>   " 可在未进入vim时输入 vim -S session.vim

" ==== taglist T (跳转) ================
" taglist 查看符号列表
nnoremap <Leader>m :TagbarToggle <CR>
" 打ctag
nnoremap <leader>tg :!ctags -R --fields=+aS --extra=+q<CR>
" 跳转到光标所在关键词的定义处
nnoremap <Leader>gt g<C-]>
" 跳回原关键词 与 ;gt 合使用
nnoremap <Leader>gr <C-T>

" ==== Window T ========================
" 窗口大小调整
" 高
" nnoremap <Leader>1 <ESC><C-W>15+
" 大
nnoremap 3 <ESC><C-W>15>

" 窗口移动
" h左 l右 k上 j下
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>j <C-W><C-J>

" 窗口交换 针对sp分屏 依次向后
nnoremap <Leader>r <ESC><C-W>r

" 安装了smoothie顺滑插件，以下按键被自动顺滑
nmap <Leader>f <C-f>
nmap <Leader>b <C-b>
nmap <Leader>u <C-u> 
nmap <Leader>d <C-d>

" ==== autocmd T ===========================================
" 花括号自动格式化，首行一个tab
autocmd FileType cpp inoremap { {<CR>}<ESC>kA<CR>

" 注释针对不同语言的注释方法 需要vim-commentary插件支持
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType vim set commentstring=\"\ %s
autocmd FileType shell set commentstring=#\ %s

" 编译 需要当前目录下有 .bin文件夹
autocmd filetype python nnoremap <F1> :w <bar> exec '!python '.shellescape('%')<CR> autocmd filetype c nnoremap <F1> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F1> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>

" 进入窗口高亮 todo TODO
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('todo', 'todo', -1)
augroup END

" ==== function T ==========================================

" 当前位置 插入 时间
nnoremap tm :call SetTime() <CR> 0
func SetTime()
        call append(line("."), "\# ".strftime('%c'))
endfunc

" 当前位置 插入 lorem 凑位词
nnoremap mm :call Lorem() <CR> 0
func Lorem()
        call append(line("."), "Lorem ipsum dolor sit amet, consectetur adipisicing elit dolore magna aliqua.")
endfunc

" 自动插入文件头 .cpp .c .h .sh .java .go
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."),   "\# File Name:    ".expand("%"))
        call append(line(".")+1, "\# Author:       arashi")
        call append(line(".")+2, "\# mail:         arashi@tencent.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/* ************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:        arashi")
        call append(line(".")+2, "> mail:          arashi@tencent.com")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
endfunc

" 新建文件后 自动定位到文件末尾
autocmd BufNewFile * normal G

" ==== block T =============================================

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

" onedark 在非tmux下打开24-bit模式
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


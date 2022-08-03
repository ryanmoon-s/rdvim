" ==== Shortcuts =====================================================
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

" ==== Theme  ========================================================

" 灰蓝 default
" set background=dark
" colorscheme nord 

" 紫蓝
" set background=dark
" colorscheme onedark

" 橙绿 - 不支持coc.nvim
set background=dark
colorscheme gruvbox

" ==== Plug config T =================================================
" ==== junegunn/vim-plug ===============
call plug#begin('~/.vim/plugged')
" 注意: 
" 1. 因为网络原因 git 下载过慢 很多插件下载不下来 并且也为了开箱即用 
" 2. 所以现有插件目录都是删除了 .git 文件夹 hardcode 添加到代码库中的 
" 3. 因此运行 :PlugInstall 等插件命令都会提示: 目录已经存在 忽略即可 不影响新增插件安装
" 4. 如果自己的 git 下载速度没问题 可以将插件目录清空 再运行 PlugInsall 自行下载 则不会再提示

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

" ==== NERD T ==========================
" 开关
nnoremap <silent> <Leader>n :NERDTreeToggle <CR>
" 打开文件自动关闭
let NERDTreeQuitOnOpen = 1
" 子窗口位置
let NERDTreeWinPos = "left"
" 忽略的文件 正则
let NERDTreeIgnore = ['\.vim$', '\.git$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']
" 显示隐藏文件
let NERDTreeShowHidden = 1
" 显示数字
let NERDTreeShowLineNumbers=1

" git 隐藏[]括号 1隐藏
let g:NERDTreeGitStatusConcealBrackets = 1
" git 文件状态
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" 文件打开方式
" o         open in buf / open or close dir
" go        preview
" v         vertical split
" i         horizon  split

" 导航
" p         go to parent
" P         go to root 

" 文件
" C         change tree root to the selected dir

" 过滤开关
" I         hidden files

" ==== airline T =======================
" 永远显示状态栏
set laststatus=2
" tab
let g:airline#extensions#tabline#enabled = 1              " 是否打开tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1      " 切换模式
let g:airline#extensions#tabline#left_sep = ''           " 分隔符
let g:airline#extensions#tabline#left_alt_sep = '➤'
" tab 切换
nmap <Leader>1 <Plug>AirlineSelectPrevTab
nmap <Leader>2 <Plug>AirlineSelectNextTab

" fugitive support
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1

" coc.nvim support
let g:airline#extensions#coc#enabled = 0 " 后台项目pb未引入 错误太多 暂时关闭 仅有下划线提示错误
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#show_coc_status = 1

" symbol 需要终端安装powerline字体
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '  ｢'
let g:airline_symbols.maxlinenr = '｣'
let g:airline_symbols.colnr = '   ❤ '
let g:airline_symbols.paste = '｢paste｣'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ' '

" 关闭white space 提示
let g:airline#extensions#whitespace#enabled = 0

" ==== animate lens T ==================
" 窗口大小 手动调整 带动画
" nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
" nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
" nnoremap <silent> <Left>  :call animate#window_delta_width(-10)<CR>
" nnoremap <silent> <Right> :call animate#window_delta_width(+10)<CR>
nnoremap <silent> <Leader>3 :call animate#window_delta_width(+10)<CR>

" 窗口大小 自动调整 
" let g:lens#disabled = 1

" ==== gitgutter T =====================
" 更新间隔
set updatetime=100
" 标志符号
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_modified_removed = '#'
" 优先级 高
let g:gitgutter_sign_priority = 100
" 进入自动显示
autocmd BufEnter,VimEnter * GitGutter
" 改动 块间 跳转
nmap 'k <Plug>(GitGutterPrevHunk)
nmap 'j <Plug>(GitGutterNextHunk)

" # -> 这行有修改 + 下面有删除

" ==== fugitive T ======================
" blame - D 缩小到时间维度
nnoremap <Leader>v :Git blame <CR>
" :G            等于:Git 接git命令 不接则显示一些基本信息: Untracked Unstaged 
" :G!           背后执行
" :G difftool   将所有hunk展示 每个hunk显示文件名、开始的行号
" :G mergetool  类似于difftool

" ==== cpp hilight T ===================
" 开启一些高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

" ==== floaterm T ======================
" 总是自动关闭
let g:floaterm_autoclose = 2
" 内置term打开文件的方式: buffer中
let g:floaterm_opener = 'edit'
" 窗口类型: 浮动
let g:floaterm_wintype = 'float'
" 窗口宽度
let g:floaterm_width = 0.7
" 窗口高度
let g:floaterm_height = 0.6
" 标题
let g:floaterm_title = '[ what do you want to do ? ]'

" 打开一次性窗口
nnoremap <c-c> :FloatermNew --disposable <CR>

" 终端中打开文件:   floaterm a.txt
" 放在.zshrc中:     alias f=floaterm
" 然后:             f s.txt

" ==== fzf T ===========================
" :Files        Files 
" :BLines       lines in current buffer
" :History      history open files 
" :Commits      commit log
" :BCommits     commit, show diff

" :Files dir
map <c-p> :Files ~/QQMail/wework<CR>

" <c-x>         horizon分屏
" <c-v>         vertical分屏
" <c-j> <c-n>   down
" <c-k> <c-p>   up

" ==== tagbar T ========================
" 右侧tag窗口 高亮光标所在的tag
" 打开后光标跳回文件 因为lens.vim的原因会卡 窗口还没打开完就跳转光标
" nnoremap <silent> <Leader>m :TagbarToggle <CR>
" 打开后光标留在tagbar 选择后自动关闭 否则只能;q关闭
nnoremap <silent> <Leader>m :TagbarOpenAutoClose <CR>

" tags搜索路径 
" . 会替换成当前工作目录   如果用 inner terminal 去其它目录打开文件
" . 还是替换的当前工作目录 找的是当前工作目录下的tag 所以这种情况不要 gt
" set tags=./tags,tags
" 打ctag
" nnoremap tg :!ctags -R --fields=+aS --extra=+q<CR>
" 跳转到光标所在关键词的定义处
" nnoremap gt g<C-]>
" 跳回原关键词 与 gt 配合使用
" nnoremap gr <C-T>

" ==== surround T ======================
" 都是nmap 都是pair操作 不支持可视模式
" 在一对surround 前/中 释放，都会操作到这对surround
" 方向型surround 左括号会在两端加空格，右括号则不会
" html中的<a>会被变成</a> 所有标签类比

" 删除 surround
" ds (       : 删除(

" 替换 surround
" cs ([      : 将( 替换成[   

" 增加 surround
" yss(       : 给这行加上(
" ysiw(      : 给当前单词加上(

" 删除/复制 surround 里面的内容 - vim自带功能
" di( / yi"

" ==== quickmenu T =====================
" 开启
noremap <silent><Leader>z :call quickmenu#toggle(0)<cr>
let g:quickmenu_options = "LH"
call g:quickmenu#reset()
" 修改标题
call g:quickmenu#header('" 蒙多 想去哪就去哪~ "')

" 添加项 append(show text, cmd, help message, filetype filter)
call g:quickmenu#append('# Git', '')
call g:quickmenu#append('Git', 'Git', 'Git base message')
call g:quickmenu#append('Git flog', ':Flog -max-count=100', "Git commit message with graph")
call g:quickmenu#append('Git blame', 'Git blame', "Git blame")
call g:quickmenu#append('Git diff  tool', 'Git difftool', "Git difftool")
call g:quickmenu#append('Git merge tool', 'Git mergetool', "Git mergetool")

call g:quickmenu#append('# Copy', '')
call g:quickmenu#append('paste-copy on', 'call M_paste_copy()', 'cleanly paste and copy')
call g:quickmenu#append('paste-copy off', 'call M_no_paste_copy()', 'recovery')

call g:quickmenu#append('# Plug', '')
call g:quickmenu#append('Plug Install', 'PlugInstall', 'PlugInstall')
call g:quickmenu#append('Plug Clean', 'PlugClean!', 'PlugClean!')
call g:quickmenu#append('Plug Upgrade', 'PlugUpgrade', 'Self Upgrade')

" ==== ack T ===========================
" 高亮搜索关键词
let g:ackhighlight = 1
" 修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"

" ==== tabular T =======================
" :Tabularize /,/r0
" / 为分隔符
" , 为参考符
" r 右对齐 可取: l 左 | r 右 | c 中
" 0 为参考符左右空格个数if 1:     aaa , bbb

" 对齐原则
" 1 参考符 对齐
" 2 其它文字左/中/右 对齐
" 3 补充空格

" 默认条件下:Tabularize /, 为/,/l1

" 限定可视模式使用 防止误用 导致全文件对齐
" <CR>前加空格会被匹配 影响结果
" =  对齐    
vnoremap g= :Tabularize /=<CR>

" // 对齐
vnoremap g/ :Tabularize /\/\/<CR>

" ==== coc T ========================
" quick fix
nmap <Leader>c <plug>(coc-fix-current)

" <c-n>         next key
" <c-p>         prev key

" keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" rename current word
nmap <leader>rn <Plug>(coc-rename)

" format selected region
xmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,cc,c++ setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window
" 如果没有man page就用cocAction显示
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" ==== ycm T ========================
" 全局文件配置
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" 关闭补全预览
let g:ycm_add_preview_to_completeopt = 0
" 允许vim加载.ycm_extra_conf.py文件，不再提示
let g:ycm_confirm_extra_conf = 0
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments = 1
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion = 1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
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

" ==== VIM Config T ==================================================
" 点亮光标所在行列
set cursorline
set cursorcolumn
" 插件高度 main for ycm
set pumheight=25
" 退格可以删除：自动缩进、之前插入的、跨行
set backspace=indent,start,eol
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
" 关闭折叠代码功能 大文件打开所有折叠 卡顿
set nofoldenable

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
set ignorecase " 设置默认大小写不敏感查找
set smartcase  " 如果有大写字母，则切换到大小写敏感查找

" ==== map T (快捷键) ================================================
" ==== ban map T =======================
" 只是禁用按键触发 map里面编码触发是可以的
" 禁用快捷键 需要shift+ 才能按出的
noremap R <nop>
noremap Q <nop>
noremap T <nop>
noremap S <nop>
noremap F <nop>
noremap J <nop>
noremap Z <nop>
noremap B <nop>
" noremap E <nop>
noremap W <nop>
noremap ~ <nop>
noremap ! <nop>
noremap @ <nop>
noremap ^ <nop>
noremap & <nop>
noremap ( <nop>
noremap ) <nop>
noremap _ <nop>
noremap # <nop>
noremap ? <nop>

" 直接按出的 还可以用来组合其它快捷键 
noremap t <nop>
noremap q <nop>
noremap " <nop>
noremap \ <nop>
noremap . <nop>
noremap - <nop>

" ==== file opention map T =============
" 关闭当前窗口
nnoremap <Leader>q :q <CR>
" 关闭当前窗口外的所有窗口
nnoremap <leader>o :only <CR>
" 关闭当前buf外的所有buf
map <Leader>p :call BufCloseOthers() <CR>
" 保存
nnoremap <Leader>w :w <CR>
" 不保存强制退出
nnoremap <Leader>Q :q! <CR>
" 快速切换头/源文件 需要a.vim插件支持
nnoremap <Leader>a :A <CR>
" 打开文件
nnoremap <Leader>e :e <Space>

" Ack搜索 不自动打开第一个文件
" nnoremap <Leader>gw :Ack! <Space>
nnoremap gw :Ack! <Space>
" AckFile搜索 不自动打开第一个文件
" nnoremap gf :AckFile! <Space>

" ==== other map T =====================
" 去除搜索高亮
nnoremap <Leader>, :noh <CR>
" 括号匹配
nnoremap , %

" 输入括号时 括号匹配 ESC光标会向前移一格
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" 使用ctrl c,v实现vim之间的复制粘贴 非mac os实用
vnoremap <C-c> :w! ~/.vim/.clipboard.txt     <CR>
nnoremap <C-v> <Esc>:r ~/.vim/.clipboard.txt <CR>

" 会话 记录当前vim所有状态
" vi -> ;]1
nmap <Leader>[1 :mksession! ~/.session1.vim  <CR>
nmap <Leader>]1 :source     ~/.session1.vim  <CR>   

nmap <Leader>[2 :mksession! ~/.session2.vim  <CR>
nmap <Leader>]2 :source     ~/.session2.vim  <CR>   

nmap <Leader>[3 :mksession! ~/.session3.vim  <CR>
nmap <Leader>]3 :source     ~/.session3.vim  <CR>   

" end of line
noremap E $

" 插入 时间
nnoremap tm :call SetTime() <CR> 0
" 插入 lorem 凑位词
nnoremap mm :call Lorem()   <CR> 0

" ==== window map T ====================
" 窗口选择
" h左 l右 k上 j下
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>j <C-W><C-J>

" 窗口交换 针对分屏 依次向后
nnoremap <Leader>r <ESC><C-W>r

" 翻页
let g:smoothie_enabled = 0 " smoothie翻页顺滑插件开关
nmap <Leader>f <C-f>
nmap <Leader>b <C-b>
nmap <Leader>u <C-u> 
nmap <Leader>d <C-d>

" 退出并删除buffer
nmap <Leader>- :bd <CR>

" ==== plug map T ======================
" accelerated-jk 插件  加快jk操作 
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" eft 插件 高亮f下一个能到达的字母 且尽量是单词首尾
nmap f <Plug>(eft-f)

" 将当前行生成一个注释的副本
nmap <Leader>/ yy P gcc j

" ==== autocmd T =====================================================
" c++ 花括号 函数/类 格式化  autocmd优先于imap
autocmd FileType cpp inoremap { {<CR>}<ESC>kA<CR>
" 非以上类型 如 vector<int> v{1, 2}; 
" 光标放到最上一行 - 连续将后面两行移上来
autocmd FileType cpp nnoremap <Leader>J J J

" 新建文件 自动插入文件头 .cpp .c .h .sh .java .go
" autocmd BufNewFile *.cpp,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"

" 新建文件后 自动定位到文件末尾
autocmd BufNewFile * normal G

" vim-commentary插件 注释针对不同语言的注释方法
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType proto set commentstring=//\ %s
autocmd FileType vim set commentstring=\"\ %s
autocmd FileType shell set commentstring=#\ %s

" 编译 需要当前目录下有 .bin文件夹
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR> autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>

" 进入窗口高亮 todo TODO
autocmd WinEnter,VimEnter * :silent! call matchadd('todo', 'TODO', -1)
autocmd WinEnter,VimEnter * :silent! call matchadd('todo', 'todo', -1)

" ==== function T ====================================================
func SetTime()
        call append(line("."), "\# ".strftime('%c'))
endfunc

func Lorem()
        call append(line("."), "Lorem ipsum dolor sit amet, consectetur adipisicing elit dolore magna aliqua.")
endfunc

" func SetTitle()
"     if &filetype == 'sh'
"         call setline(1,"\#########################################################################")
"         call append(line("."),   "\# File Name:    ".expand("%"))
"         call append(line(".")+1, "\# Author:       arashi")
"         call append(line(".")+2, "\# mail:         arashi@tencent.com")
"         call append(line(".")+3, "\# Created Time: ".strftime("%c"))
"         call append(line(".")+4, "\#########################################################################")
"         call append(line(".")+5, "\#!/bin/bash")
"         call append(line(".")+6, "")
"     else
"         call setline(1, "/* ************************************************************************")
"         call append(line("."),   "> File Name:     ".expand("%"))
"         call append(line(".")+1, "> Author:        arashi")
"         call append(line(".")+2, "> mail:          arashi@tencent.com")
"         call append(line(".")+3, "> Created Time:  ".strftime("%c"))
"         call append(line(".")+4, "> Description:   ")
"         call append(line(".")+5, " ************************************************************************/")
"         call append(line(".")+6, "")
"     endif
" endfunc

" 关闭当前buf外的所有buf
func! BufCloseOthers()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    for i in range(1,bufnr("$"))
        if buflisted(i)
            if i!=l:currentBufNum 
                execute("bdelete ".i)
            endif
        endif
    endfor
endfunc

" 粘贴复制模式：进入paste模式 取消行号 关闭对齐线
func M_paste_copy()
    set paste
    set nonu
    :GitGutterSignsDisable
	:IndentLinesDisable
endfunc

func M_no_paste_copy()
    set nopaste
    set nu
    :GitGutterSignsEnable
	:IndentLinesEnable
endfunc

" ==== block T =======================================================

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

" ==== teaching T (教学) =============================================
" ==== vimdiff teach ===================
" 对比两个文件的差异 删除 增加 修改 三种颜色不同，删除有--- 修改部分高亮
" 外部打开 vimdiff a.txt b.txt
" 内部打开 vi a.txt   :vertical diffsplit b.txt

" 跳转
" [c 跳到上一个差异处
" ]c 跳到下一个差异处

" 差异替换
" dp (diff put)    以当前文件为准 put   过去
" do (diff obtain) 以对面文件为准 obtain过来

" 替换反悔
" ,u 要先跳到对方文件中

" 手动更新状态 (有时候自动更新失败)
" :diffupdate  

" 同时操作两个文件
" :qa  (quit all)
" :wa
" :wqa

" 缺省相同行数
" 相同的上下文 默认只展示6行 可以改变其行数
set diffopt=context:6

" ==== mark teach ======================
" 书签不会因退出vim而删除 
" ' 跳到书签行首 ` 跳到书签标记的光标位置
" 0-9 A-Z 全局 跨文件
" a-z     本地 当前文件使用

" ma                设置标签a
" `a                跳转到标签a
" :marks            查看所有标签
" ``                回到跳转前的位置
" delmarks a        删除标签a
" delmarks!         删除所有标签 不包含 [A-Z] [0-9]
" delmarks A-Z0-9   删除标签 [A-Z] [0-9]

" 自动载入书签
" "                 上次离开buf时光标的位置
" <                 上次可视选择的 第一行
" >                 上次可视选择的 最后一行
" ^                 上次离开Insert模式时光标的位置
" .                 上次改变 文本内容 的位置
" ' `               跳转前的位置

" ==== map teach =======================
" n/i/v   nore    map    <silent>        src-cmd    dst-cmd
" mode    非递归  映射   不显示提示信息
" 可无    可无

" <CR>      carriage-return 回车
" <ESC>     esc
" <C-w>     Ctrl + w 可跟大写
" <Space>   space
" <Leader>  mapleader
" <silent>  静默 状态行不echo文字 
" <space>   空格

" 不能加 nore :
" 1. 需要跳到其它插件执行的
" 2. 数字相关的 - 会导致数字不起作用
" 必须加 nore :
" 1. 已有的按键 o d 等 - 不然会触发原有按键

" 绑定fx，就不要绑定f了，想要f出效果，会等待一段时间 以确认用户不输入第二个字母

" dst-cmd中的空格是生效的 <Space> 只是让人看得出这是有空格的

" ==== system map teach ================
" 一、NORMAL模式快捷键
 
" 1. 施放后还在NORMAL模式

" U 将当前行恢复至开始编辑前的样子 只缓存当前行 u撤销是上次操作可无限u
" V 行 可视模式
" D 删除至行尾 dd 删除当前行
" x 删除光标上的符号 X 删除光标左边的符号

" w 跳到下个词首 dw 删除到下下词首前
" e 跳到下个单尾
" b 跳到上个词首
" f + x 行内查找字符x 直接跳转 只能找到光标后面的字符
" K 跳到 当前位置的单词 的help
" { 跳到上一段 一般以空行为单位
" } 跳到下一段

" M 光标跳到当前屏幕中间行
" H 光标跳到当前屏幕顶部行
" L 光标跳到当前屏幕底部行
" zz 光标行作为屏幕中间行
" zt 当前行作为屏幕顶行
" zb 当前行作为屏幕底行

" backspace 左移光标 会跨行
" space     右移光标 会跨行

" 2. 施放后进入INSERT模式

" i 插入 a 光标后移插入
" s 删除并插入
" I 行首插入 = 0i
" A 行尾插入 = $a
" c cc和dd类似 但不会将光标移到下一行 而是在当前行合适的缩进位置 进入插入模式
" C 和D类似 但删除后 会进入插入模式

" 二、实用快速技巧

" 1. 复合操作
" y: yy 、nyy 、 ygg yG yw y0 y$
" 很多按键 [可以] -->  左接数字 || 右接跳转 || 可视选择
" 只能左接数字 s x w b << >>       //它们是单按键 按下立即产生效果
" 左数字右跳转 y d c = v V         //哪yy y到哪
" 可视+按键    以上都可以
" 组合使用: y2w d2w

" 跳转: 0 $ gg G w e b
" 特殊 w不包含光标字母 e包含光标字母
" dw:  {$h}ello world  ->  {$}world    不包括w
" de:  {$h}ello world  ->  {$} world     包括o

" 2. surround 内容操作
" yi(  解释:y inner  作用: [复制] 光标所在的 括号 内的所有内容
" 变种: y d c  +  i  +  ( [ {


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'      " 注释工具
Plug 'vim-airline/vim-airline'       " 当打开多个文本时，可以用它进行快速的切换
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug '907th/vim-auto-save'
Plug 'w0rp/ale' " 语法检查
call plug#end()

let mapleader = "\<Space>"


"""""""""""" 插件配置""""""""""""""
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" 注释
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
 
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" 注释 <Leader>cc 反注释 <Leader>cu




" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 20 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键



let g:tagbar_width=30
nnoremap <silent> <F7> :TagbarToggle<CR> " 将tagbar的开关按键设置为 F7



let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "UK"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#goto_stubs_command = '<C-s>'
" nnoremap <leader>d :call jedi#goto()
let g:deoplete#enable_at_startup = 1



"自动保存
let g:auto_save = 1


"ale
" 语法检查
let g:ale_linters = {'python': ['flake8', 'mypy'], 'cpp': ['cpplint']}
let g:ale_python_flake8_options = '--max-line-length=180 --ignore=E301,E302,E303,E304,E265,E266,501,W291,F401,E402,E121,E701,E225,E231,E124,E128'
let g:ale_python_mypy_options = '--ignore-missing-imports'
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <F4> :ALEToggle<CR>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0



""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""
nnoremap qq :wq<CR>
nnoremap K :bnext<CR>
nnoremap J :bprev<CR>
nnoremap oo o<esc>
nnoremap ; :
nnoremap <Leader>s /<C-R>=expand("<cword>")<CR><Esc>



" 取消备份
set nobackup
set noswapfile
set noundofile
" 解决consle输出乱码
language messages zh_CN.utf-8
" 状态栏配置
set laststatus=2
" 开启语法检测
syntax on
" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %
" 文件修改之后自动载入
set autoread
" yy直接复制到系统剪切板（For macvim）
set clipboard=unnamed
" 高亮搜索命中的文本
set hlsearch
" 随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 在状态栏显示正在输入的命令
set showcmd
" 显示括号配对情况
set showmatch
set matchtime=5
" :next, :make 命令之前自动保存
set autowrite
" 允许使用鼠标
set mouse=a
" 设置行号
set nu
" 退格键可用
set backspace=2
" 退格键一次删掉4个空格
set smarttab
" 缩进
set autoindent
set smartindent
" 填充Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
" 设置退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=
" After this, every time you simply y or p , Vim will use the system clipboard
set clipboard=unnamedplus 


" 打开文件时始终跳转到上次光标所在位置
autocmd bufreadpost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif



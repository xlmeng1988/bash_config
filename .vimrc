" Change vimrc with auto reload, 修改vimrc保存后，立即生效
autocmd! bufwritepost .vimrc source %

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <c-w> <c-g>u<c-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 不要使用vi的键盘模式，而是vim自己的 
set nocompatible

" history文件中需要记录的行数 
set history=10000 

" 在处理未保存或只读文件的时候，弹出确认 
set confirm 

" 显示行号
set number

" 与windows共享剪贴板 
set clipboard+=unnamed

" 侦测文件类型 
filetype on 
nnoremap <leader>1 :set filetype=xhtml<CR>  "\+1
nnoremap <leader>2 :set filetype=css<CR>    "\+2
nnoremap <leader>3 :set filetype=javascript<CR> "\+3
nnoremap <leader>4 :set filetype=php<CR>    "\+4

" 载入文件类型插件 
filetype plugin on 

" 为特定文件类型载入相关缩进文件 
filetype indent on 

" 保存全局变量 
set viminfo+=! 

" 带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,- 

" syntax highlight 
syntax enable 
syntax on 

"set mouse=a
"set cursorline
"hi CursorLine cterm=NONE ctermbg=blue
"set cursorcolumn

"colorscheme desert

" Comment color setting
highlight Comment ctermfg=6

" Jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 文件设置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 不要备份文件（根据自己需要取舍） 
set nobackup 

" 不要生成swap文件，当buffer被丢弃的时候隐藏它 
setlocal noswapfile 
set bufhidden=hide 

" 字符间插入的像素行数目 
set linespace=1

" 增强模式中的命令行自动完成操作 
set wildmenu 

" 在状态行上显示光标所在位置的行号和列号 
set ruler 
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%) 

" 命令行（在状态行下）的高度，默认为1，这里是2 
set cmdheight=2 

" 使回格键（backspace）正常处理indent, eol, start等 
set backspace=indent,eol,start

" 允许backspace和光标键跨越行边界 
set whichwrap+=<,>,h,l 

" 不让vim发出讨厌的滴滴声 
set noerrorbells 

" 在被分割的窗口间显示空白，便于阅读 
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 搜索和匹配 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 高亮显示匹配的括号 
set showmatch 

" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5 

" 在搜索的时候忽略大小写 
set ignorecase 

" 不要高亮被搜索的句子（phrases） 
set hlsearch

set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" 我的状态行显示的内容（包括文件类型和解码） 
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

" 总是显示状态行 
set laststatus=2 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 文本格式和排版 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 自动格式化 
set formatoptions=tcrqn 

" 继承前一行的缩进方式，特别适用于多行注释, 使用F3切换多行注释的启用
set autoindent 
set pastetoggle=<F3>

" 为C程序提供自动缩进 
set smartindent 

" 使用C样式的缩进 
set cindent 

" 制表符为4 
set tabstop=4 

" 统一缩进为4 
set softtabstop=4 
set shiftwidth=4
" 使用空格代替制表符
"set expandtab

" 在行和段开始处使用制表符 
set smarttab 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Plugin configuration

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExplorer : minibufexpl.vim
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows=1
" c/h file switch : a.vim
nnoremap <silent> <F12> :A<CR>

" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" winManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

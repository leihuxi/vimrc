"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 现代终端（Ghostty / iTerm2 + tmux）下的体验优化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber cursorline
set mouse=a
if !has('nvim') | set ttymouse=sgr | endif
set clipboard=unnamed               " y / p 直接使用系统剪贴板
set shortmess-=S shortmess+=c       " 显示搜索计数 [3/10]（取代 vim-searchindex）
set ttimeout ttimeoutlen=10         " Esc 立即响应
set splitright splitbelow
set wildmode=longest:full,full
set scrolloff=7 sidescrolloff=5
packadd! matchit                    " 内置 matchit，取代 matchit.zip

" 插入 / 替换 / 普通模式光标形状
let &t_SI = "\e[6 q" | let &t_SR = "\e[4 q" | let &t_EI = "\e[2 q"

" tmux 内真彩色
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Esc Esc 取消搜索高亮
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" 可视模式缩进后保持选中
vnoremap < <gv
vnoremap > >gv

" 保存时去掉行尾空格（扩展到所有代码文件，Markdown/diff 除外）
autocmd BufWritePre * if &ft !~# '^\(markdown\|diff\|mail\)$' | call CleanExtraSpaces() | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MacVim / GUI（mvim）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h14,Menlo:h14
    set linespace=2
    set guioptions-=T guioptions-=r guioptions-=L guioptions+=k
    set guicursor+=a:blinkon0
    if has('gui_macvim')
        set macmeta                         " Option 当 Alt 用（M-j / M-k 移动行）
        set fuoptions=maxvert,maxhorz
    endif
endif

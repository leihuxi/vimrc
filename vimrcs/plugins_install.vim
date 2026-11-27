"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plugdir='~/.vim_runtime/plugged/'

if empty(glob('~/.vim_runtime/autoload/plug.vim'))
    silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim 9 内置插件（取代 vim-commentary / matchit.zip / vim-highlightedyank / editorconfig-vim）
if !has('nvim')
    silent! packadd! comment        " gc / gcc 注释
    silent! packadd! matchit        " % 跳转 if/endif、标签等
    silent! packadd! hlyank         " 复制时高亮
    silent! packadd! editorconfig   " 读取 .editorconfig
endif

call plug#begin(g:plugdir)
let g:plug_window = 'enew'

" -- 外观 --
Plug 'catppuccin/vim', { 'as': 'catppuccin' }   " 与终端 / tmux 统一的 Catppuccin Mocha
Plug 'tomasr/molokai'                           " 备用：:colorscheme molokai
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'

" -- 通用编辑 --
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'                 " 自动识别文件的缩进风格
Plug 'wellle/targets.vim'               " 更多文本对象：ci, ci( 在行内任意位置都能用
Plug 'mg979/vim-visual-multi'           " 多光标（Ctrl-n）
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'Raimondi/delimitMate'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'liuchengxu/vim-which-key'         " 按下 leader 后弹出可用快捷键提示

" -- 文件 / 搜索 --
Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFromBookmark']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFromBookmark']}
" fzf 用 Homebrew 安装的版本（原写法会运行 ./install --all 改写 shell 配置）
Plug isdirectory('/opt/homebrew/opt/fzf') ? '/opt/homebrew/opt/fzf' : 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'brooth/far.vim'
if has("nvim")
    Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
    Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" -- 编程：LSP 补全 / 跳转 / 诊断 / 格式化 / 代码片段 --
" coc.nvim 取代 YouCompleteMe + tabnine + ALE + vim-autoformat + UltiSnips
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'               " 片段库，由 coc-snippets 加载
Plug 'Valloric/ListToggle'
Plug 'preservim/tagbar'

" -- Git --
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'                " :GBrowse 在 GitHub 打开
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

" -- tmux --
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'preservim/vimux'

" -- 语言 --
" json / nginx / protobuf / rust / c++ 语法高亮用 Vim 9 内置 runtime，LSP 由 coc 提供
Plug 'preservim/vim-markdown', {'for': [ 'markdown' ]}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown'] }
if executable('go')
    Plug 'fatih/vim-go', {'for': [ 'go' ], 'do': ':GoUpdateBinaries'}
else
    Plug 'fatih/vim-go', {'for': [ 'go' ]}
endif
Plug 'vim-utils/vim-man'                " :Man（zsh 的 nman 用到）

" vim-devicons 必须最后加载（需要 Nerd Font）
Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plugdir='~/.vim_runtime/plugged/'

if empty(glob('~/.vim_runtime/autoload/plug.vim'))
    silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:plugdir)
let g:plug_window = 'enew'

" Corlor and Theme
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'godlygeek/csapprox'
Plug 'liuchengxu/space-vim-dark'
" Plug 'altercation/vim-colors-solarized'
" Plug 'vim-airline/vim-airline-themes'

" General
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} | Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'google/vim-searchindex'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'troydm/zoomwintab.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'amix/open_file_under_cursor.vim'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-unimpaired'
" Plug 'kassio/neoterm'

" Program
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        silent !(git submodule update --init --recursive ;./install.py --clang-completer --clangd-completer --rust-completer --gocode-completer --java-completer --clang-tidy --core-tests --system-libclang)
    endif
endfunction
Plug 'Valloric/ListToggle'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale', {'for': [ 'go', 'sh', 'python', 'java', 'javascript', 'html']}
" Plug 'Shougo/echodoc.vim'
" Plug 'neomake/neomake'
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}
Plug 'zxqfl/tabnine-vim'

" For Code Format
Plug 'Chiel92/vim-autoformat'

" Snip
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'
" plug 'sodapopcan/vim-twiggy'

" Ttmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'benmills/vimux'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': [ 'markdown' ]}
" Plug 'suan/vim-instant-markdown', {'for': [ 'markdown' ]}

" Vim script
Plug 'digitaltoad/vim-pug', {'for': [ 'vim' ]}

"Go
Plug 'fatih/vim-go', {'for': [ 'go' ], 'do': ':GoInstallBinaries'}
Plug 'AndrewRadev/splitjoin.vim'

" Json
Plug 'leshill/vim-json', {'for': [ 'json' ]}

" Protobuf
Plug 'uarun/vim-protobuf',  {'for': [ 'proto' ]}

" Nginx
Plug 'chr4/nginx.vim'

"Rust
Plug 'rust-lang/rust.vim'

" C family
if has("nvim")
    Plug 'arakashic/chromatica.nvim'
else
    function! BuildColorCoded(info)
        if a:info.status == 'installed' || a:info.force
            silent !(cmake -H. -Bbuild -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF -DDOWNLOAD_CLANG=OFF; make -j4 -Cbuild install)
        endif
    endfunction
    " Plug 'jeaye/color_coded', {'do': function('BuildColorCoded'), 'for' : ['c', 'cpp']}
endif
Plug 'jsfaint/gen_tags.vim' , {'for': [ 'c', 'cpp' ]}
Plug 'derekwyatt/vim-fswitch', {'for': [ 'c', 'cpp' ]}
Plug 'octol/vim-cpp-enhanced-highlight'

" Todo
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes'

" Android
" Plug 'hsanson/vim-android'

" Cmake
" Plug 'jalcine/cmake.vim'
call plug#end()

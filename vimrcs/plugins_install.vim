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

" Man and Help
Plug 'nhooyr/neoman.vim'
Plug 'dbeniamine/cheat.sh-vim'

" Corlor and Theme
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
" Plug 'luochen1990/rainbow'
" Plug 'altercation/vim-colors-solarized'
" Plug 'godlygeek/csapprox'
" Plug 'vim-airline/vim-airline-themes'

" General
Plug 'MarcWeber/vim-addon-mw-utils'
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
Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'troydm/zoomwintab.vim'
" Plug 'mhinz/vim-startify'

" Program
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        silent !(git submodule update --init --recursive ;./install.py --clang-completer --gocode-completer --java-completer)
    endif
endfunction
" Plug 'Valloric/YouCompleteMe', {'for' : [ 'c', 'cpp', 'go', 'python', 'java', 'javascript'],  'do': function('BuildYCM')}
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}
Plug 'Valloric/ListToggle'
Plug 'rdnetto/YCM-Generator'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

" For Code Format
" Plug 'rhysd/vim-clang-format'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Snip
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'

" Ttmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': [ 'markdown' ]}

" Vim script
" Plug 'digitaltoad/vim-pug', {'for': [ 'vim' ]}

"Go
Plug 'fatih/vim-go', {'for': [ 'go' ], 'do': ':GoInstallBinaries'}

" Json
Plug 'leshill/vim-json', {'for': [ 'json' ]}

" Protobuf
Plug 'uarun/vim-protobuf',  {'for': [ 'proto' ]}

" Nginx
Plug 'chr4/nginx.vim'

" C family
if has("nvim")
    Plug 'arakashic/chromatica.nvim'
else
    function! BuildColorCoded(info)
        if a:info.status == 'installed' || a:info.force
            silent !(mkdir build; cd build; cmake ..; make -j5; make install)
        endif
    endfunction
    " Plug 'jeaye/color_coded', {'for': [ 'c', 'cpp' ], 'do': function('BuildColorCoded')}
endif
Plug 'jsfaint/gen_tags.vim' , {'for': [ 'c', 'cpp' ]}
Plug 'vim-scripts/a.vim', {'for': [ 'c', 'cpp' ]}


call plug#end()

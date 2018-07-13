"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plugdir='~/.vim_runtime/plugged/'
call plug#begin(g:plugdir)
let g:plug_window = 'enew' 
" VimL Lib
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'

" Man and Help
Plug 'nhooyr/neoman.vim'
Plug 'lifepillar/vim-cheat40'
Plug 'dbeniamine/cheat.sh-vim'

" Corlor and Theme
Plug 'luochen1990/rainbow'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/csapprox'

" General
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} | Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'google/vim-searchindex'
Plug 'vim-scripts/matchit.zip'
Plug 'mhinz/vim-startify'
Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'troydm/zoomwintab.vim'

" Program
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        silent !(git submodule update --init --recursive ;./install.py --clang-completer --gocode-completer --java-completer)
    endif
endfunction
Plug 'Valloric/YouCompleteMe', {'for' : [ 'c', 'cpp', 'cc', 'go', 'py', 'java' ],  'do': function('BuildYCM')}

if has("nvim")
    Plug 'arakashic/chromatica.nvim'
else
    function! BuildColorCoded(info)
        if a:info.status == 'installed' || a:info.force
            silent !(mkdir build; cd build; cmake ..; make -j5; make install)
        endif
    endfunction
    Plug 'jeaye/color_coded', {'for' : [ 'c', 'cpp', 'cc' ], 'do' : function('BuildColorCoded')}
endif
Plug 'Valloric/ListToggle'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'jsfaint/gen_tags.vim' , {'for' : [ 'c', 'cpp', 'cc' ]}
Plug 'vim-scripts/a.vim', {'for' : [ 'c', 'cpp', 'cc' ]}
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

" For Code Format
" Plug 'rhysd/vim-clang-format'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Snip
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Markdown
Plug 'suan/vim-instant-markdown', {'for' : [ 'md' ]}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'

" Ttmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Vim script
Plug 'digitaltoad/vim-pug', {'for' : [ 'vim' ]}

"Go
Plug 'fatih/vim-go', {'for' : [ 'go' ], 'do': ':GoInstallBinaries'}

" Json
Plug 'leshill/vim-json', {'for' : [ 'json' ]}

" Protobuf
Plug 'uarun/vim-protobuf',  {'for' : [ 'proto' ]}

" Nginx
Plug 'chr4/nginx.vim', {'for' : [ 'conf' ]}

call plug#end()

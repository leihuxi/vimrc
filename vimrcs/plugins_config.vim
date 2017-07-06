"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clangdir='/usr/lib/llvm-5.0/lib'
let g:rootdir='~/.vim_runtime/'
let g:plugdir=g:rootdir.'plugged/'
let g:tempdir=g:rootdir.'temp_dirs/'
call plug#begin(g:plugdir)
let g:plug_window = 'enew' 
" VimL Lib
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'

" Man and Help
Plug 'nhooyr/neoman.vim'
Plug 'lifepillar/vim-cheat40'

" Font and Corlor and Theme
Plug 'powerline/fonts', {'do': './install.sh'}
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'mbbill/undotree'
Plug 'google/vim-searchindex'
Plug 'vim-scripts/matchit.zip'
Plug 'mhinz/vim-startify'
Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/YankRing.vim'
Plug 'justinmk/vim-gtfo'
Plug 'Raimondi/delimitMate'

" Program
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        silent !(git submodule update --init --recursive ;./install.py --clang-completer --gocode-completer --tern-completer)
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM')}

if has("nvim")
    Plug 'arakashic/chromatica.nvim'
else
    function! BuildColorCoded(info)
        if a:info.status == 'installed' || a:info.force
            silent !(mkdir build; cd build; cmake ..; make; make install)
        endif
    endfunction
    Plug 'jeaye/color_coded', {'do' : function('BuildColorCoded')}
endif

Plug 'Valloric/ListToggle'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'vim-scripts/indexer.tar.gz'
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/a.vim'
Plug 'majutsushi/tagbar'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'vim-scripts/Conque-GDB'

" Snip
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/conflict-marker.vim'
Plug 'junegunn/gv.vim'

" Ttmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Vim script
Plug 'digitaltoad/vim-pug'

" System language
Plug 'nickhutchinson/vim-systemtap'

"Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Nginx
Plug 'evanmiller/nginx-vim-syntax'
Plug 'vim-scripts/httplog'

" Json
Plug 'leshill/vim-json'

" Javascript and Java
Plug 'marijnh/tern_for_vim'
Plug 'artur-shaik/vim-javacomplete2'

" Protobuf
Plug 'uarun/vim-protobuf'

call plug#end()

""""""""""""""""""""""""""""""
" => Molokai
""""""""""""""""""""""""""""""
let g:molokai_original=1
let g:rehash256 = 1

""""""""""""""""""""""""""""""
" => Solarized
""""""""""""""""""""""""""""""
let g:solarized_termcolors=     256
let g:solarized_termtrans =     1
let g:solarized_degrade   =     1
let g:solarized_bold      =     0
let g:solarized_underline =     0
let g:solarized_italic    =     0
let g:solarized_contrast  =     "high"
let g:solarized_visibility=     "high"
let g:solarized_hitrail   =     1
let g:solarized_menu      =     0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>df :GitGutterToggle<cr>
let g:gitgutter_max_signs=500  " default value

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_flake8_args = '--max-line-length=80 ' .
            \ '--max-complexity=10 --ignore=E111,E114,E121,E125,E126,E127,E128,E129,' .
            \ 'E131,E133,E201,E202,E203,E211,E221,E222,E241,E251,E261,E303,E402,W503'

let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": ["dart", "html"] }
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ycm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>ge :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>go :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GogoReferences<CR>
nnoremap <leader>gw :YcmCompleter GetDoc<CR>
nnoremap <leader>ga :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gz :YcmCompleter ClearCompilationFlagCache<CR>
nnoremap <leader>gf :YcmForceCompileAndDiagnostics <CR>
nnoremap <leader>gx :YcmCompleter FixIt<CR>
nnoremap <leader>gc :YcmDiags<CR>

let g:ycm_global_ycm_extra_conf = g:plugdir.'YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indexer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gdb
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ConqueGdb_Leader = ";"
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clang-Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \ "IndentWidth" : 4,
            \ "UseTab" : "Never",
            \ "ColumnLimit" : 150,
            \ "BinPackParameters" : "true",
            \ "BreakBeforeBraces" : "Allman",
            \ "AccessModifierOffset" : -4,
            \ "IndentCaseLabels" : "true",
            \ "AlignAfterOpenBracket" : "Align",
            \ "BreakBeforeBinaryOperators" : "false",
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine " : "false"}

" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
if has("autocmd")
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc,java,py nnoremap <buffer><Leader>fcc :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc,java,py vnoremap <buffer><Leader>fcc :ClangFormat<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'
map <leader>f  :FZF<cr>
map <leader>F  :FZF!<cr>
map <leader>o  :FzfBuffers<cr>
map <leader>fa :FzfAg <c-r><c-w><cr>
map <leader>fm :FzfMaps<cr>
map <leader>fk :FzfMarks<cr>
map <leader>fc :FzfCommits<cr>
map <leader>fh :FzfHistory<cr>
map <leader>fs :FzfGFiles?<cr>
map <leader>fn :FzfSnippets<cr>
map <leader>ft :FzfTags<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

function! s:make_sentence(lines)
    return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#complete({
            \ 'source':  'cat /usr/share/dict/words',
            \ 'reducer': function('<sid>make_sentence'),
            \ 'options': '--multi --reverse --margin 15%,0',
            \ 'left':    20})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ListToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>L'
let g:lt_quickfix_list_toggle_map = '<leader>Q'
let g:lt_height = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"toggles the undo plugin window
nnoremap <leader>u :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnip and Snippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="ii"
" we can't use <tab> as our snippet key since we use that with YouCompleteMe
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsListSnippets        = "<c-m-s>"
let g:UltiSnipsJumpForwardTrigger  = "<right>"
let g:UltiSnipsJumpBackwardTrigger = "<left>"
" let g:snips_author                 = 'leihu xi'
" let g:neosnippet#snippets_directory= g:tempdir.'vim-snippets/snippets'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>nn :NERDTreeToggle<CR>
map  <C-e> <plug>NERDTreeTabsToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>
map  <leader>nb :NERDTreeFromBookmark<Space>
map  <leader>nf :NERDTreeFind<cr>

let g:NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

if has("autocmd")
    " close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " open NERDTree automatically when vim starts up on opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " open a NERDTree automatically when vim starts up if no files were specified
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Improve Rainbrow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => A.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>a :A<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* Activate autoupdate on exit
let g:tmux_navigator_save_on_switch = 1

"* Custom Key Bindings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ackprg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Ack and put the cursor in the right position
map <leader>g :Ack
nmap <leader>gg :Ack<CR>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
    let g:ackprg = "ack-grep --nocolor --nogroup --column"
elseif executable('ack')
    let g:ackprg = "ack --nocolor --nogroup --column"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1
"split navigations
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-y> :TmuxNavigatePrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YankRing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankring_history_dir = g:tempdir
" this is so that single char deletes don't end up in the yankring
let g:yankring_min_element_length = 2
let g:yankring_window_height = 14
nnoremap <leader>y :YRShow<CR>

" this makes Y yank from the cursor to the end of the line, which makes more
" sense than the default of yanking the whole current line (we can use yy for
" that)
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

" Provides the equivalent of <Leader>s, which is forwards/backwards search for a
" character.
" has to be 'nmap', 'noremap' doesn't work
nmap <leader>s <Plug>(easymotion-s)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 0
let g:tagbar_sort = 0
if has("gui_macvim")
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

nnoremap <Leader>tt :TagbarToggle<cr><c-w>=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nman
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent>K :Nman <C-R><C-W><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
if has("autocmd")
    " Vim-Go
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>c <Plug>(go-coverage)

    autocmd FileType go nmap <leader>ds <Plug>(go-def-split)
    autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>dt <Plug>(go-def-tab)
    autocmd FileType go nmap <leader>gb <Plug>(go-doc-browser)
    autocmd FileType go nmap <leader>s <Plug>(go-implements)
    autocmd FileType go nmap <leader>i <Plug>(go-info)
    autocmd FileType go nmap <leader>e <Plug>(go-rename)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color-coded
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:color_coded_filetypes = ['c', 'cc', 'cpp', 'objc']
" Disable color_coded in diff mode
if &diff
    let g:color_coded_enabled = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Chromatica
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:chromatica#libclang_path=g:clangdir
let g:chromatica#enable_at_startup=1

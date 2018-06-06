"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clangdir='/usr/lib/llvm-6.0/lib'
if has("mac")
  let g:clangdir='/usr/local/opt/llvm/lib'
endif

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
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'Raimondi/delimitMate'
Plug 'troydm/zoomwintab.vim'

" Program
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        silent !(git submodule update --init --recursive ;./install.py --clang-completer --gocode-completer --java-completer)
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM')}

if has("nvim")
    Plug 'arakashic/chromatica.nvim'
else
    function! BuildColorCoded(info)
        if a:info.status == 'installed' || a:info.force
            silent !(mkdir build; cd build; cmake ..; make -j5; make install)
        endif
    endfunction
    Plug 'jeaye/color_coded', {'do' : function('BuildColorCoded')}
endif
Plug 'Valloric/ListToggle'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'jsfaint/gen_tags.vim'
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/a.vim'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
" Snip
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Markdown
Plug 'suan/vim-instant-markdown'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/conflict-marker.vim'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'

" Ttmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" Vim script
Plug 'digitaltoad/vim-pug'

"Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}

" Json
Plug 'leshill/vim-json'

" Protobuf
Plug 'uarun/vim-protobuf'

" Nginx
Plug 'chr4/nginx.vim'
Plug 'vim-scripts/httplog'

" PythonMode
Plug 'python-mode/python-mode'


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
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
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
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=0
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
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

if has("autocmd")
    " Vim-Go
    autocmd FileType go nmap <leader>or <Plug>(go-run)
    autocmd FileType go nmap <leader>ob <Plug>(go-build)
    autocmd FileType go nmap <leader>ot <Plug>(go-test)
    autocmd FileType go nmap <leader>oc <Plug>(go-coverage)

    autocmd FileType go nmap <leader>os <Plug>(go-def-split)
    autocmd FileType go nmap <leader>ov <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>ot <Plug>(go-def-tab)
    autocmd FileType go nmap <leader>od <Plug>(go-doc-browser)
    autocmd FileType go nmap <leader>op <Plug>(go-implements)
    autocmd FileType go nmap <leader>oi <Plug>(go-info)
    autocmd FileType go nmap <leader>oe <Plug>(go-rename)
    autocmd FileType go nmap <Leader>om <Plug>(go-metalinter)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color-coded
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:color_coded_filetypes = ['c', 'cc', 'cpp', 'objc', 'go', 'sh', 'py', 'java']
" Disable color_coded in diff mode
if &diff
    let g:color_coded_enabled = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Chromatica
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:chromatica#libclang_path=g:clangdir
let g:chromatica#enable_at_startup=1
let g:chromatica#highlight_feature_level=1
let g:chromatica#responsive_mode=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"use ycm for c && c++
let g:ale_linters = {
\ 'c': [],
\ 'cpp': [],
\ 'cc': [],
\}

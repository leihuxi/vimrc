"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("mac")
    let g:clangdir='/usr/local/opt/llvm/lib'
endif

let g:rootdir='~/.vim_runtime/'
let g:tempdir=g:rootdir.'temp_dirs/'

""""""""""""""""""""""""""""""
" => Molokai
""""""""""""""""""""""""""""""
colorscheme molokai
set background=dark
let g:molokai_original=1
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>df :GitGutterToggle<cr>
let g:gitgutter_max_signs=500  " default value
" let g:gitgutter_highlight_lines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ycm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>je :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>jw :YcmCompleter GetDoc<CR>
nnoremap <leader>ja :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jp :YcmCompleter GetParent<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
nnoremap <leader>jz :YcmCompleter ClearCompilationFlagCache<CR>
nnoremap <leader>jn :YcmCompleter RefactorRename<space>
nnoremap <leader>jf :YcmForceCompileAndDiagnostics <CR>
nnoremap <leader>jx :YcmCompleter FixIt<CR>
nnoremap <leader>jc :YcmDiags<CR>

let g:ycm_global_ycm_extra_conf = g:rootdir.'plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_command_prefix = 'Fzf'
map <leader>f  :FZF<cr>
map <leader>F  :FZF!<cr>
map <leader>o  :FzfBuffers<cr>

map <leader>fa :FzfAg <c-r><c-w><cr>
map <leader>fm :FzfMaps<cr>
map <leader>fk :FzfMarks<cr>
map <leader>fi :FzfCommits<cr>
map <leader>fb :FzfBCommits<cr>
map <leader>fh :FzfHistory<cr>
map <leader>fg :FzfGFiles?<cr>
map <leader>fe :FzfFiles?<cr>
map <leader>fs :FzfSnippets<cr>
map <leader>ft :FzfTags<cr>
map <leader>fl :FzfLines<cr>
map <leader>fo :FzfColors<cr>
map <leader>fc :FzfCommands<cr>
map <leader>fd :FzfAg<cr>
map <leader>fr :FzfRg<cr>

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

" Fzf Tip
if has("autocmd")
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    function! s:fzf_statusline()
        " Override statusline as you like
        highlight fzf1 ctermfg=161 ctermbg=251
        highlight fzf2 ctermfg=23 ctermbg=251
        highlight fzf3 ctermfg=237 ctermbg=251
        setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction

    autocmd! User FzfStatusLine call <SID>fzf_statusline()
endif

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
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=1
let NERDTreeCaseSensitiveSort=0
let NERDTreeSortOrder=['\/$', '*', '[[-timestamp]]']
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
let g:go_auto_sameids = 1
let g:go_textobj_include_function_doc = 1

if has("autocmd")
    " Vim-Go
    autocmd FileType go nmap <leader>gr <Plug>(go-run)
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
    autocmd FileType go nmap <leader>gc <Plug>(go-coverage)

    autocmd FileType go nmap <leader>gs <Plug>(go-def-split)
    autocmd FileType go nmap <leader>gv <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>gt <Plug>(go-def-tab)
    autocmd FileType go nmap <leader>gd <Plug>(go-doc-browser)
    autocmd FileType go nmap <leader>gp <Plug>(go-implements)
    autocmd FileType go nmap <leader>gi <Plug>(go-info)
    autocmd FileType go nmap <leader>ge <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gm <Plug>(go-metalinter)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>pt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
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
if has("mac")
    let g:chromatica#libclang_path=g:clangdir
endif
let g:chromatica#enable_at_startup=1
let g:chromatica#highlight_feature_level=1
let g:chromatica#responsive_mode=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale(syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"use ycm for c && c++
let g:ale_linters = {
            \ 'c': [''],
            \ 'cpp': [''],
            \ 'javascript': ['eslint'],
            \ 'python': ['flake8'],
            \ 'go': ['go', 'golint', 'errcheck'],
            \ 'html': ['alex']
            \}

" let g:ale_linters_explicit = 1

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Note
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.md'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree Git Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

let g:android_sdk_path = '~/work/Android/Sdk/ndk-bundle'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rust_clip_command = 'xclip -selection clipboard'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-fswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch to the file and load it into the current window >
nmap <silent> <Leader>a :FSHere<cr>

if has("autocmd")
    augroup mycppfiles
        au!
        au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C,c'
        au BufEnter *.cc let b:fswitchdst  = 'hh,hpp,h'
        au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/'
    augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips                                "
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir         = g:rootdir.'/UltiSnips/'

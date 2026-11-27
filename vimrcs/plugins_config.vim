"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" => coc.nvim（取代 YouCompleteMe，<leader>j* 键位保持不变）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-sh', 'coc-pyright',
            \ 'coc-clangd', 'coc-go', 'coc-rust-analyzer', 'coc-tsserver',
            \ 'coc-html', 'coc-css', 'coc-vimlsp', 'coc-snippets']
set updatetime=300
set signcolumn=yes

" Tab / S-Tab 选择补全，回车确认
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-@> coc#refresh()

nmap <leader>jj <Plug>(coc-definition)
nmap <leader>ji <Plug>(coc-definition)
nmap <leader>je <Plug>(coc-declaration)
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jr <Plug>(coc-references)
nnoremap <silent> <leader>jw :call CocActionAsync('doHover')<CR>
nmap <leader>ja <Plug>(coc-definition)
nnoremap <silent> <leader>jp :call CocActionAsync('showOutgoingCalls')<CR>
nmap <leader>jt <Plug>(coc-type-definition)
nnoremap <silent> <leader>jz :CocRestart<CR>
nmap <leader>jn <Plug>(coc-rename)
nmap <leader>jf <Plug>(coc-format)
nmap <leader>jx <Plug>(coc-fix-current)
nnoremap <silent> <leader>jc :CocList diagnostics<CR>
" 常用的标准键位
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-cursor)
nnoremap <silent> <leader>co :CocList outline<CR>
" K：有 LSP 时显示文档，否则查 man
function! ShowDocumentation()
    if exists('*CocAction') && CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        execute 'Man ' . expand('<cword>')
    endif
endfunction
nnoremap <silent> K :call ShowDocumentation()<CR>
autocmd CursorHold * silent! call CocActionAsync('highlight')

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
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

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

map <leader>fa :FzfRg <c-r><c-w><cr>
map <leader>fm :FzfMaps<cr>
map <leader>fk :FzfMarks<cr>
map <leader>fi :FzfCommits<cr>
map <leader>fb :FzfBCommits<cr>
map <leader>fh :FzfHistory<cr>
map <leader>fg :FzfGFiles?<cr>
map <leader>fe :FzfFiles?<cr>
map <leader>ft :FzfTags<cr>
map <leader>fl :FzfLines<cr>
map <leader>fo :FzfColors<cr>
map <leader>fc :FzfCommands<cr>
map <leader>fd :FzfRg<cr>
map <leader>fr :FzfRg<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-j> fzf#vim#complete#path('rg --files')
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
" => 代码片段（coc-snippets，兼容原 UltiSnips 片段与 ii 触发键）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap ii <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<right>'
let g:coc_snippet_prev = '<left>'
let g:coc_user_config = get(g:, 'coc_user_config', {})
let g:coc_user_config['snippets.ultisnips.directories'] = ['UltiSnips', expand('~/.vim_runtime/UltiSnips')]
nnoremap <silent> <leader>fs :CocList snippets<CR>

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
" => C/C++ 头文件/源文件切换（clangd）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>a :CocCommand clangd.switchSourceHeader<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* Activate autoupdate on exit
let g:tmux_navigator_save_on_switch = 1

"* Custom Key Bindings
let g:tmux_navigator_no_mappings = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
if executable('/opt/homebrew/bin/ctags')
    let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'   " universal-ctags（系统自带的 BSD ctags 不支持）
endif

nnoremap <Leader>tt :TagbarToggle<cr><c-w>=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nman（zsh 的 nman 函数调用；由 vim-man 提供 :Man）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=+ -complete=shellcmd Nman Man <args> | only

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
" 补全 / 跳转 / 文档交给 coc-go（gopls），vim-go 只负责运行、测试、覆盖率等命令
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
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
nmap <leader>pt <Esc>:%!python3 -m json.tool<CR><Esc>:set filetype=json<CR>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree Git Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

let g:android_sdk_path = expand('~/Library/Android/sdk')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rust_clip_command = has('mac') ? 'pbcopy' : 'xclip -selection clipboard'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => which-key：按 , 后稍等即弹出快捷键提示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set timeoutlen=500
nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>
let g:which_key_use_floating_win = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   最近文件'] },
            \ { 'type': 'dir',       'header': ['   当前目录 '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   会话'] },
            \ { 'type': 'bookmarks', 'header': ['   书签'] },
            \ ]

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 缩进参考线（Vim 9 leadmultispace，随 shiftwidth 变化）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set list
function! s:IndentGuides() abort
    let l:sw = max([shiftwidth(), 1])
    let &l:listchars = 'tab:│ ,trail:·,nbsp:␣,extends:›,precedes:‹,leadmultispace:│' . repeat(' ', l:sw - 1)
endfunction
augroup IndentGuides
    autocmd!
    autocmd OptionSet shiftwidth,tabstop,expandtab call s:IndentGuides()
    autocmd BufWinEnter,FileType * call s:IndentGuides()
    autocmd FileType startify,nerdtree,tagbar,help,fzf,man,undotree,diff,qf setlocal nolist
augroup END

" 参考线 / 行尾空格用低对比度颜色；只在当前窗口高亮光标行
augroup ModernUI
    autocmd!
    autocmd ColorScheme * highlight SpecialKey guifg=#45475a ctermfg=238 |
                \ highlight NonText guifg=#45475a ctermfg=238
    autocmd WinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
doautocmd ModernUI ColorScheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc 浮窗：圆角边框、行内诊断、图标
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_user_config = get(g:, 'coc_user_config', {})
call extend(g:coc_user_config, {
            \ 'suggest.floatConfig': {'border': v:true, 'rounded': v:true},
            \ 'suggest.pumFloatConfig': {'border': v:true, 'rounded': v:true},
            \ 'hover.floatConfig': {'border': v:true, 'rounded': v:true},
            \ 'signature.floatConfig': {'border': v:true, 'rounded': v:true},
            \ 'diagnostic.floatConfig': {'border': v:true, 'rounded': v:true},
            \ 'diagnostic.virtualText': v:true,
            \ 'diagnostic.virtualTextPrefix': ' ● ',
            \ 'diagnostic.errorSign': '',
            \ 'diagnostic.warningSign': '',
            \ 'diagnostic.infoSign': '',
            \ 'diagnostic.hintSign': '󰌶',
            \ 'inlayHint.enable': v:true,
            \ })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ,lg 打开 lazygit 浮窗
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:LazyGit() abort
    if !executable('lazygit')
        echohl ErrorMsg | echo 'lazygit 未安装：brew install lazygit' | echohl None
        return
    endif
    let l:dir = empty(expand('%:p:h')) ? getcwd() : expand('%:p:h')
    if has('nvim')
        execute 'tabnew | lcd ' . fnameescape(l:dir) . ' | terminal lazygit'
        startinsert
        return
    endif
    let l:buf = term_start('lazygit', {'hidden': 1, 'term_finish': 'close', 'cwd': l:dir,
                \ 'exit_cb': {j, s -> timer_start(20, {-> execute('silent! checktime')})}})
    let l:w = float2nr(&columns * 0.9)
    let l:h = float2nr(&lines * 0.85)
    call popup_create(l:buf, {
                \ 'minwidth': l:w, 'maxwidth': l:w, 'minheight': l:h, 'maxheight': l:h,
                \ 'border': [], 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
                \ 'borderhighlight': ['Function'], 'padding': [0, 1, 0, 1]})
endfunction
command! LazyGit call s:LazyGit()
nnoremap <silent> <leader>lg :LazyGit<CR>
" 文件被 lazygit 等外部程序修改后自动刷新
autocmd FocusGained,BufEnter * silent! checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 启动页
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header = map([
            \ '██╗   ██╗██╗███╗   ███╗',
            \ '██║   ██║██║████╗ ████║',
            \ '██║   ██║██║██╔████╔██║',
            \ '╚██╗ ██╔╝██║██║╚██╔╝██║',
            \ ' ╚████╔╝ ██║██║ ╚═╝ ██║',
            \ '  ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \ '',
            \ '  , 键稍等弹出快捷键提示',
            \ ], '"    " . v:val')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimux：把代码发到 tmux 旁边的 pane 执行（,v 前缀）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40%'
let g:VimuxUseNearest = 1                   " 优先复用已有的旁边 pane
nnoremap <silent> <leader>vp :VimuxPromptCommand<CR>
nnoremap <silent> <leader>vl :VimuxRunLastCommand<CR>
nnoremap <silent> <leader>vi :VimuxInspectRunner<CR>
nnoremap <silent> <leader>vz :VimuxZoomRunner<CR>
nnoremap <silent> <leader>vq :VimuxCloseRunner<CR>
nnoremap <silent> <leader>vc :VimuxInterruptRunner<CR>
nnoremap <silent> <leader>vs :call VimuxRunCommand(getline('.'))<CR>
xnoremap <silent> <leader>vs "vy:call VimuxRunCommand(@v)<CR>
" ,vr 运行当前文件
let s:runners = {'python': 'python3', 'sh': 'bash', 'zsh': 'zsh', 'javascript': 'node',
            \ 'typescript': 'npx tsx', 'go': 'go run', 'ruby': 'ruby', 'lua': 'lua', 'rust': 'cargo run'}
function! s:RunFile() abort
    update
    let l:cmd = get(s:runners, &filetype, '')
    if empty(l:cmd)
        echohl WarningMsg | echo '未配置 ' . &filetype . ' 的运行命令' | echohl None
        return
    endif
    call VimuxRunCommand(l:cmd . ' ' . shellescape(expand('%:p')))
endfunction
nnoremap <silent> <leader>vr :call <SID>RunFile()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test：测试在 vimux pane 里运行（,T 前缀）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = exists('$TMUX') ? 'vimux' : 'vimterminal'
nnoremap <silent> <leader>Tn :TestNearest<CR>
nnoremap <silent> <leader>Tf :TestFile<CR>
nnoremap <silent> <leader>Ts :TestSuite<CR>
nnoremap <silent> <leader>Tl :TestLast<CR>
nnoremap <silent> <leader>Tv :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 会话：,S 开始/停止记录（写入 ./Session.vim），无参数启动 vim 时自动恢复
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>S :Obsession<CR>
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 输入法：离开插入模式切英文，回到插入模式恢复上次的输入法（需要 macism）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('macism')
  let s:ime_english = 'com.apple.keylayout.USExtended'
  let s:ime_insert = s:ime_english
  function! s:ImeSet(id) abort
    if has('nvim') | call jobstart(['macism', a:id]) | else | call job_start(['macism', a:id]) | endif
  endfunction
  function! s:ImeLeaveInsert() abort
    let s:ime_insert = trim(system('macism'))
    if s:ime_insert !=# s:ime_english
      call s:ImeSet(s:ime_english)
    endif
  endfunction
  function! s:ImeEnterInsert() abort
    if s:ime_insert !=# s:ime_english
      call s:ImeSet(s:ime_insert)
    endif
  endfunction
  augroup ime_switch
    autocmd!
    autocmd InsertLeave * call s:ImeLeaveInsert()
    autocmd InsertEnter * call s:ImeEnterInsert()
    autocmd VimEnter,FocusGained * call s:ImeSet(s:ime_english)
  augroup END
endif

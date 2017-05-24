![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# The Ultimate vimrc

Over the last 10 years, I have used and tweaked Vim. This configuration is the ultimate vimrc (or at least my version of it).

There are two versions:

* **The Basic**: If you want something small just copy [basic.vim](https://github.com/leihuxi/vimrc/blob/master/vimrcs/basic.vim) into your ~/.vimrc and you will have a good basic setup
* **The Awesome**: Includes a ton of useful plugins, color schemes, and configurations

I would, of course, recommend using the awesome version.

## How to install the Awesome version?
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better. To install it simply do following from your terminal:

	git clone https://github.com/leihuxi/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

I also recommend using [the Hack font](http://sourcefoundry.org/hack/) (it's a free and awesome font designed for source code). The Awesome vimrc is already setup to try to use it.

## How to install the Basic version?
The basic version is just one file and no plugins. Just copy [basic.vim](https://github.com/leihuxi/vimrc/blob/master/vimrcs/basic.vim) and paste it into your vimrc.

The basic version is useful to install on remote servers where you don't need many plugins, and you don't do many edits.

	git clone git://github.com/leihuxi/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_basic_vimrc.sh


## How to install on Windows?

Use [msysgit](http://msysgit.github.com/) to checkout the repository and run the installation instructions above. No special instructions needed ;-)


## How to install on Linux

If you have vim aliased as `vi` instead of `vim`, make sure to either alias it: `alias vi=vim`. Otherwise, `apt-get install vim`

## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase


## Some screenshots

![Screenshot 1](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/find_function.png)
![Screenshot 2](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/startify.png)
![Screenshot 3](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/findfile.png)
![Screenshot 4](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/jump.png)
![Screenshot 5](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/looklike.png)
![Screenshot 6](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/map.png)
![Screenshot 7](https://raw.githubusercontent.com/wiki/leihuxi/vimrc/ycm_ale.png)


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [vim-plug](https://github.com/junegunn/vim-plug.git) : Minimalist Vim Plugin Manager
* [neoman](https://github.com/nhooyr/neoman.vim.git) : A modern man page plugin for vim
* [vim-cheat40](https://github.com/lifepillar/vim-cheat40.git) : A Vim cheat sheet that makes sense, inside Vim!
* [fzf](https://github.com/junegunn/fzf.git):A command-line fuzzy finder written in Go
* [fzf.vim](https://github.com/junegunn/fzf.vim.git) : fzf vim
* [vim-easymotion](https://github.com/easymotion/vim-easymotion.git) : Vim motions on speed
* [vim-surround](https://github.com/tpope/vim-surround.git):surround.vim: quoting/parenthesizing made simple
* [vim-searchindex](https://github.com/google/vim-searchindex.git):vim-searchindex: display number of search matches & index of a current match
* [undotree](https://github.com/mbbill/undotree.git):The ultimate undo history visualizer for VIM
* [matchit.zip](https://github.com/vim-scripts/matchit.zip.git):extended % matching for HTML, LaTeX, and many other languages
* [vim-startify](https://github.com/mhinz/vim-startify.git):The fancy start screen for Vim.
* [YankRing](https://github.com/vim-scripts/YankRing.vim.git):Maintains a history of previous yanks, changes and deletes
* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim, CTRL+N is remapped to CTRL+S (due to YankRing)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe.git):A code-completion engine for Vim
* [ListToggle](https://github.com/Valloric/ListToggle.git):A vim plugin for toggling the display of the quickfix list and the location-list.
* [YCM-Generator](https://github.com/rdnetto/YCM-Generator.git):Generates config files for YouCompleteMe
* [vim-clang-format](https://github.com/rhysd/vim-clang-format.git):Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, TypeScript and ProtoBuf
* [indexer.tar.gz](https://github.com/vim-scripts/indexer.tar.gz.git):indexing all files in project with ctags (can work as add-on for project.tar.gz) 
* [a.vim](https://github.com/vim-scripts/a.vim.git):Alternate Files quickly (.c --> .h etc)
* [tagbar](https://github.com/majutsushi/tagbar.git):Vim plugin that displays tags in a window, ordered by scope
* [Ale](https://github.com/w0rp/ale.git):Asynchronous Lint Engine
* [Conque-GDB](https://github.com/vim-scripts/Conque-GDB.git):GDB command line interface and terminal emulator in (G)Vim.
* [UltiSnips](https://github.com/SirVer/ultisnips.git):UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
* [vim-snippets](https://github.com/honza/vim-snippets.git):vim-snipmate default snippets (Previously snipmate-snippets)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter.git):A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
* [conflict-marker](https://github.com/rhysd/conflict-marker.vim.git):Weapon to fight against conflicts in Vim.
* [gv.vim](https://github.com/junegunn/gv.vim.git):A git commit browser

## Included color schemes

* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [molokai](https://github.com/tomasr/molokai.git): Molokai color scheme for Vim
* [rainbow](https://github.com/luochen1990/rainbow.git): Rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
* [vim-ariline](https://github.com/vim-airline/vim-airline.git):lean & mean status/tabline for vim that's light as air
* [vim-ariline-themes](https://github.com/vim-airline/vim-airline-themes.git):A collection of themes for vim-airline
* [color_coded](https://github.com/jeaye/color_coded.git):A vim plugin for libclang-based highlighting in C, C++, ObjC

## Included modes

* [vim-systemtap](https://github.com/nickhutchinson/vim-systemtap.git):Vim syntax files from the official Systemtap repo at git://sourceware.org/git/systemtap.git
* [nginx.vim](https://github.com/vim-scripts/nginx.vim): Highlights configuration files for nginx
* [vim-go](https://github.com/fatih/vim-go)
* [nginx-vim](https://github.com/evanmiller/nginx-vim-syntax.git):nginx vim syntax. 
* [httplog](https://github.com/vim-scripts/httplog.git):Highlight access log of Apache, nginx, etc
* [tern_for_vim](https://github.com/ternjs/tern_for_vim.git):Tern plugin for Vim
* [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2.git): Updated javacomplete plugin for vim.
* [python-mode](https://github.com/python-mode/python-mode.git): Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
* [vim-protobuf](https://github.com/uarun/vim-protobuf.git):Vim syntax highlighting for Google's Protocol Buffers
* [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator.git):Seamless navigation between tmux panes and vim splits
* [vim-tmux](https://github.com/tmux-plugins/vim-tmux.git):vim plugin for tmux.conf
* [vim-json](https://github.com/leshill/vim-json.git):Syntax highlighting for JSON in Vim


## How to include your own stuff?

After you have installed the setup, you can create **~/.vim_runtime/my_configs.vim** to fill in any configurations that are important for you. For instance, my **my_configs.vim** looks like this:

	~/.vim_runtime (master)> cat my_configs.vim
	map <leader>ct :cd ~/Desktop/Todoist/todoist<cr>
	map <leader>cw :cd ~/Desktop/Wedoist/wedoist<cr> 

You can also install your plugins, for instance, via pathogen you can install [vim-rails](https://github.com/tpope/vim-rails):

	cd ~/.vim_runtime
	git clone git://github.com/tpope/vim-rails.git plugged/vim-rails



## Key Mappings

***Notic: <leader>fm to check the key mapping.***

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.


### Plugin related mappings

[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>
[Fzf]:

    map <leader>f  :FZF<cr>
    map <leader>F  :FZF!<cr>
    map <leader>o  :FzfBuffers<cr>
    map <leader>fa :FzfAg <c-r><c-w><cr>
    map <leader>fm :FzfMaps<cr>
    map <leader>fk :FzfMarks<cr>
    map <leader>fc :FzfCommits<cr>
    map <leader>fh :FzfHistory<cr>
    map <leader>fs :FzfGFiles?<cr>

[Youcomplete]:

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

[ListToggle]:

    let g:lt_location_list_toggle_map = '<leader>L'
    let g:lt_quickfix_list_toggle_map = '<leader>Q'

[Easymotion]:

    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    map <Leader><leader>. <Plug>(easymotion-repeat)
    
    " Provides the equivalent of <Leader>s, which is forwards/backwards search for a
    " character.
    " has to be 'nmap', 'noremap' doesn't work
    nmap <leader>s <Plug>(easymotion-s)

[Nman]:

    nnoremap <silent>K :Nman <C-R><C-W><CR>

[YankRing]:

    nnoremap <leader>y :YRShow<CR>

[UndoTree]:

    nnoremap <leader>dt :UndotreeToggle<CR>

[A.vim]:

    nmap <leader>a :A<CR>


### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Map `<Space>` to `/` (search) and `<leader>+<Space>` to `?` (backwards search):
	
	map <space> /
	map <leader><space> ?
	map <silent> <leader><cr> :noh<cr>

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a"<esc>`<i"<esc>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

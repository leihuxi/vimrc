#!/bin/sh
# 安装 leihuxi/vimrc：可重复执行，非交互
set -e
cd ~/.vim_runtime

cat > ~/.vimrc <<'VIMRC'
set nocompatible
set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_install.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/modern.vim
source ~/.vim_runtime/my_configs.vim
catch
endtry
VIMRC

[ -f autoload/plug.vim ] || curl -fsSLo autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf '\033[32mInstalling plugins, it will take some time\033[0m\n'
vim -es -u ~/.vimrc -i NONE +'PlugInstall --sync' +qa || true

mkdir -p ~/.config
[ -e ~/.config/nvim ] || [ -L ~/.config/nvim ] || ln -s ~/.vim_runtime ~/.config/nvim
[ -e ~/.vim_runtime/init.vim ] || [ -L ~/.vim_runtime/init.vim ] || ln -s ~/.vimrc ~/.vim_runtime/init.vim
printf '\033[32mInstalled the Ultimate Vim configuration successfully! Enjoy :-)\033[0m\n'

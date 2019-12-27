#!/bin/sh
set -e

cd ~/.vim_runtime
cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
ln -s ~/.vim_runtime ~/.config/nvim
ln -s ~/.vimrc  ~/.vim_runtime/init.vim
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"

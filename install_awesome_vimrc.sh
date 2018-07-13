#!/bin/sh
set -e

cd ~/.vim_runtime
echo -e "\033[32mInstalling plugin,it will take some time\033[0m"
echo "set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_install.vim
source ~/.vim_runtime/vimrcs/extended.vim
" >> ~/.vimrc

vim +PlugInstall +qall
vim +PlugUpdate! +qall

echo "try
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/my_configs.vim
catch
endtry" >> ~/.vimrc

echo -e "\033[32mInstalled the Ultimate Vim configuration successfully! Enjoy :-)\033[0m"

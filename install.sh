#########################################################################
# File Name: install.sh
# Author: lk1ngaa7
# mail: lk1ngaa7@gmail.com
# Created Time: Tue Oct  4 17:28:55 2016
#########################################################################
#!/bin/bash
set -e
set -o pipefail
set -x
cur=`pwd`
if [ ! -d `eval echo ~/.vim` ]; then
	mkdir ~/.vim
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    if [ $? -ne 0 ]; then
        echo 'vundle download vundle failed'
        exit 11
    fi
fi
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc_back
fi
cp $cur/vimrc ~/.vimrc
vim +PluginInstall +qall
if [ $? -ne 9 ]; then
    echo 'vundle install plugin failed'
    exit 12
fi

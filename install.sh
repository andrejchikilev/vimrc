#!/bin/sh

set -e

if ! [ -d ~/.vim/ ]; then
   mkdir ~/.vim
else if ! [ -d ~/.vim/bundle/ ]; 
        then mkdir ~/.vim/bundle 
     fi
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if ! [ -f ~/.vimrc ]; then
    cp .vimrc ~/
else
    mv ~/.vimrc ~/.vimrc.backup
    cp .vimrc ~/
fi

vim +VundleInstall +qa!

#!/bin/sh

set -e

if ! [ -d ~/.vim/ ]; then
   mkdir ~/.vim
else if ! [ -d ~/.vim/bundle/ ]; 
        then mkdir ~/.vim/bundle 
     fi
fi

if ! [ -d ~/.vim/bundle/Vundle.vim/ ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
    
if ! [ -f ~/.vimrc ]; then
    cp .vimrc ~/
else
    mv ~/.vimrc ~/.vimrc.backup
    cp .vimrc ~/
fi

if ! [ -f ~/.ctags ]; then
    cp .ctags ~/
else
    mv ~/.ctags ~/.ctags.backup
    cp .ctags ~/
fi
vim +VundleInstall +qa!

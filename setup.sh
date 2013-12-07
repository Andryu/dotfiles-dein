#!/bin/sh
#yum -y install vim-enhanced
mkdir -p ~/.vim/bundle
mkdir  ~/.vim/compiler
mkdir  ~/.vim/snippets
git clone git://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
cp .vimrc ~/

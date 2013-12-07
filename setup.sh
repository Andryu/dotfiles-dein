#!/bin/sh
yum -y install vim-enhanced
mkdir -p ~/.vim/bundle
mkdir  ~/.vim/compiler
mkdir  ~/.vim/snippets
cp .vim/bundle/* ~/.vim/bundle
cp .vimrc ~/

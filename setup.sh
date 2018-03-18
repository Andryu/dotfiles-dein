#!/bin/sh
yum -y install vim-enhanced
mkdir -p ~/.vim/bundle
mkdir  ~/.vim/compiler
mkdir  ~/.vim/snippets
#git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
cp .vimrc ~/

# git ブランチ名補完
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.bash ~/.git-completion.bash

# プロンプトにブランチ表示
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh ~/.git-prompt.sh

# TODO 置き場所は後で
# deinを持ってくる
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git  ~/.vim/dein/repos/github.com/Shougo/dein.vim

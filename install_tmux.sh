#!/bin/bash

# 参考
#https://qiita.com/iitenkida7/items/938a21ce5b5b4f984088
sudo yum -y install gcc libevent-devel ncurses-devel

curl -kLO https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz 

tar -zxvf tmux-2.3.tar.gz

cd tmux-2.3
./configure
make
sudo make install

git clone https://github.com/nhdaly/tmux-better-mouse-mode ~/dotfiles-dein/tmux-plugins/

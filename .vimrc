" Neobundle 設定読み込み
if filereadable(expand('$HOME/dotfiles/.vim/neobundle.vim'))
    source $HOME/dotfiles/.vim/neobundle.vim
endif

" 分割した設定ファイルをすべて読み込む
set rtp+=$HOME/dotfiles/.vim
runtime! conf.d/*.vim

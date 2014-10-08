

"------------------------------------------------------------
"NeoBundle
"------------------------------------------------------------
set nocompatible
filetype off
if has('vim_starting')
  "neobundleの設置場所
  set runtimepath+=~/.vim/bundle/neobundle.vim
  "pluginの設置場所
  "  call neobundle#rc(expand('~/.vim/bundle'))
  call neobundle#begin(expand('~/.vim/bundle'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
  filetype plugin indent on
  "Installation check.
  if neobundle#exists_not_installed_bundles()
      echomsg 'Not installed bundles : ' .
              \ string(neobundle#get_not_installed_bundle_names())
      echomsg 'Please execute ":NeoBundleInstall" command.' "finish
  endif
endif

" 分割した設定ファイルをすべて読み込む
set rtp+=$HOME/dotfiles/
runtime! .vim/*.vim

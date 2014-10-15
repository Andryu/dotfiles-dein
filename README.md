# Dotfiles

install vim and setting vimrc

Please install vim-enhanced
ex) yum install vim-enhanced

# Usage

cd dotfiles
./set_up

vim

:NeoBundleInstall

## Notice
open vim and alert

```
Unfortunately, zencoding-vim was moved to emmet-vim, please use it.
```
mv ~/.vim/bundle/zencoding ~/.vim/bundle/emmet-vim


# History
* ver 1.0.0
  - defaultのsnipettは利用できなくなった
  - 以下を追記
  - NeoBundle "Shougo/neosnippet"
  - NeoBundle "Shougo/neosnippet-snippets"

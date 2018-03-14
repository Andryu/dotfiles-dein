" Neobundle 設定読み込み
"if filereadable(expand('$HOME/dotfiles/.vim/neobundle.vim'))
"    source $HOME/dotfiles/.vim/neobundle.vim
"endif
"
"" 分割した設定ファイルをすべて読み込む
"set rtp+=$HOME/dotfiles/.vim
"runtime! conf.d/*.vim

" reset augroup
"augroup MyAutoCmd
"  autocmd!
"augroup END

" ここからdein
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
"call dein#add('scrooloose/syntastic')

" (中略)
call map(dein#check_clean(), "delete(v:val, 'rf')")
call dein#end()

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()

endif

"End dein Scripts-------------------------


set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set number

set guifont=Ricty:h14

set showtabline=2

"パラメータ不明
"set termguicolors

" カラースキーマ
set background=dark
colorscheme solarized 
syntax on
set t_ut=

"パラメータ不明
"set transparency=15

" Syntax
" --------------------------------
" syntastic
" --------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" --------
" 'vim-syntastic/syntastic'の設定内容
" --------
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
"  \ 'ruby', 'javascript','coffee', 'scss', 'html', 'haml', 'slim', 'sh',
"  \ 'spec', 'vim', 'zsh', 'sass', 'eruby'] }
"
"let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_coffee_checkers = ['coffeelint']
"let g:syntastic_scss_checkers = ['scss_lint']
"let g:syntastic_ruby_checkers = ['rubocop']
"
"let g:syntastic_error_symbol='✗'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_warning_symbol = '⚠'
"
"
"" Rubocop
"let g:syntastic_mode_map = { 'mode': 'passive',
"           \ 'active_filetypes': ['ruby'] }
"let g:syntastic_ruby_checkers = ['rubocop']


" --------
" ALEの設定
" --------

let g:ale_linters = {
  \ 'ruby': ['rubocop'],
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
"highlight ALEWarning ctermbg=DarkMagenta

" For Vim8
" Macでvim8にversion upしたらbackspaceが機能しなくなった
set backspace=indent,eol,start

"let g:airline = {
"  \'active': {
"  \  'left': [
"  \    ['mode', 'paste'],
"  \    ['readonly', 'filename', 'modified', 'ale'],
"  \  ]
"  \},
"  \'component_function': {
"  \  'ale': 'ALEGetStatusLine'
"  \}
"\ }
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

set number
"if tab clicked is white space 4
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set cursorline
set title
set hlsearch


nmap <F7> :setfiletype html<Enter>
inoremap <C-d> $
inoremap <C-a> @
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>


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

"file manager
NeoBundle "https://github.com/Shougo/unite.vim.git"
"Code suport
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
" Log Color
NeoBundle 'vim-scripts/AnsiEsc.vim'

"HTML
NeoBundle "https://github.com/mattn/zencoding-vim.git"
"
NeoBundle "https://github.com/thinca/vim-quickrun.git"
"file Tree
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
"git
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/gregsexton/gitv.git'
" grep検索の実行時に    QuickFix list表示
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示
set statusline+=%{fugitive#statusline()}

" check program syntax
NeoBundle 'https://github.com/scrooloose/syntastic.git'
" javascript
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
autocmd FileType javascript :compiler gjslint
autocmd FileType javascript setl ts=2
autocmd QuickfixCmdPost make copen

" Ruby-end
NeoBundle 'tpope/vim-endwise'


if filereadable(expand('~/dotfiles/settings/color.vimrc'))
  source ~/dotfiles/settings/color.vimrc
endif

if filereadable(expand('~/dotfiles/settings/body.vimrc'))
  source ~/dotfiles/settings/body.vimrc
endif

if filereadable(expand('~/dotfiles/settings/status.vimrc'))
  source ~/dotfiles/settings/status.vimrc
endif
""------------------------------------------------------------
"neocomplcache
"------------------------------------------------------------
NeoBundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_ctags_arguments_list = {
    \ 'perl' : '-R -h ".pm"'
    \ }
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ 'html'       : $HOME . '/.vim/dict/javascript.dict'
    \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
     let g:neocomplcache_keyword_patterns = {}
endif
     let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"------------------------------------------------------------
"neosnippet
"------------------------------------------------------------
"old---------------------
"" Plugin key-mappings.
"imap <C-k>    <Plug>(neosnippet_expand_or_jump)
"smap <C-k>    <Plug>(neosnippet_expand_or_jump)
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/snippets'
"------------------------
" Plugin key-mappings.
imap <C-k>    <Plug>(neosnippet_expand_or_jump)
smap <C-k>    <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap  neosnippet#expandable_or_jumpable() ? "\(neosnippet_expand_or_jump)" : pumvisible() ? "\" : "\"
smap  neosnippet#expandable_or_jumpable() ?"\(neosnippet_expand_or_jump)" : "\"

"For snippet_complete marker.
if has('conceal')
      set conceallevel=2 concealcursor=i
endif
"Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets, ~/.vim/mysnippets'
"------------------------------------------------------------
"molokai
"------------------------------------------------------------
set t_Co=256
syntax on
"colorscheme molokai
set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast='high'
colorscheme solarized
"------------------------------------------------------------
"Zencoding <C-y> and [,]
"------------------------------------------------------------
let g:user_zen_settings = { 'indentation':'    ' }

"vim-fugitive
"------------------------------------------------------------
set statusline+=%{fugitive#statusline()}

"------------------------------------------------------------
"NERDTreeToggle
"------------------------------------------------------------
nmap <F9> :NERDTreeToggle<Enter>
"let g:NERDTreeShowHidden=1 "隠しファイル表示
"let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=25

"ruby
"NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = {
            \ 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers  = ['rubocop']

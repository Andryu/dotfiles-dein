" Basic support
"
set number
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set cursorline
set title
set hlsearch
set laststatus=2

nmap <F7> :setfiletype html<Enter>
inoremap <C-d> $
inoremap <C-a> @
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" Log Color
NeoBundle 'vim-scripts/AnsiEsc.vim'
" Quick run
NeoBundle "https://github.com/thinca/vim-quickrun.git"
"Git
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/gregsexton/gitv.git'
" grep検索の実行時に    QuickFix list表示
autocmd QuickFixCmdPost *grep* cwindow

" Neocomplcache
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
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


" Neosnippet 補完
NeoBundle 'Shougo/neocomplcache'
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


"NERDTreeToggle
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
nmap <F9> :NERDTreeToggle<Enter>
let g:NERDTreeShowHidden=1 "隠しファイル表示
"let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=25

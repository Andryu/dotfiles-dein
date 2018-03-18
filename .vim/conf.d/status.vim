" Status line and it's plugin design

" ステータス行に現在のgitブランチを表示
"set statusline+=%{fugitive#statusline()}

" Airline
set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
"let g:airline_theme             = 'powerlineish'
let g:airline_theme='badwolf'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_section_a = airline#section#create(['mode',' ','branch'])

" tab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
" /=Airline


" lightline
"NeoBundle 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"\u2b64":""}',
"      \ },
"      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
"      \ }
" /=lightline


"Unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>:Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" 新規タブで開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
" /=Unite.vim

"Color
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle "https://github.com/altercation/vim-colors-solarized.git"
NeoBundle 'https://github.com/tpope/vim-vividchalk.git'
NeoBundle 'https://github.com/Lokaltog/vim-distinguished.git'
NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'https://github.com/vim-scripts/candy.vim.git'
NeoBundle 'https://github.com/dandorman/vim-colors.git'
call neobundle#end()

" Color settings
set t_Co=256
syntax on
set background=dark
let g:solarized_termcolors=256
" コントラスト　デフォルトnormal
"let g:solarized_contrast='high'
" 強調表示だけど、よく分からない
"let g:solarized_hitrail=1
" 1にしないとターミナルによっては背景色がsolarized仕様にならない
let g:solarized_termtrans=1
" Solarizedを強制的に256色モードにするのをOFFにする
let g:solarized_degrade=0
colorscheme solarized


" Highlighting
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
highlight CursorLine term=none cterm=underline ctermfg=none ctermbg=none
" /=Hilighting


" ColorRoller
let ColorRoller = {}
let ColorRoller.colors = [
      \ 'molokai',
      \ 'vividchalk',
      \ 'distinguished',
      \ 'jellybeans',
      \ 'Mustang',
      \ 'Zenburn',
      \ 'Wombat',
      \ 'Tomorrow',
      \ 'github',
      \ 'grb256',
      \ 'ir_black',
      \ 'railscasts',
      \ 'twilight',
      \ ]

function! ColorRoller.change()
  let color = get(self.colors, 0)
  silent exe "colorscheme " . color
  redraw
  echo self.colors
endfunction

function! ColorRoller.roll()
  let item = remove(self.colors, 0)
  call insert(self.colors, item, len(self.colors))
  call self.change()
endfunction

function! ColorRoller.unroll()
  let item = remove(self.colors, -1)
  call insert(self.colors, item, 0)
  call self.change()
endfunction

nnoremap <silent><S-C>   :<C-u>call ColorRoller.roll()<CR>
nnoremap <silent><S-F9> :<C-u>call ColorRoller.unroll()<CR>


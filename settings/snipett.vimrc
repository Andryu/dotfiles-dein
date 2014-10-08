

"HTML
NeoBundle 'mattn/emmet-vim'
" check program syntax
NeoBundle 'https://github.com/scrooloose/syntastic.git'
" javascript
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
autocmd FileType javascript :compiler gjslint
autocmd FileType javascript setl ts=2
autocmd QuickfixCmdPost make copen


" Ruby
" Ruby-end
NeoBundle 'tpope/vim-endwise'

let g:syntastic_mode_map = {
            \ 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers  = ['rubocop']

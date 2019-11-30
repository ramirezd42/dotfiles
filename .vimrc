:let mapleader = " "

set number
set relativenumber

packadd minpac
call minpac#init()
call minpac#add('itchyny/lightline.vim')
call minpac#add('dracula/vim')
call minpac#add('neoclide/coc.nvim')
call minpac#add('kien/ctrlp.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('dyng/ctrlsf.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')

map <Leader>t :NERDTreeToggle<CR>
map <Leader>f :CtrlSF 
map <Leader>p :CtrlP

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

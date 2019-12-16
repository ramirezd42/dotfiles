:let mapleader = " "

set number
set relativenumber
set list

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

let g:ctrlp_dotfiles = 1
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
let g:ctrlsf_mapping = {
      \ 'next': '<C-9>',
      \ 'prev': '<C-0>',
      \ }

source $HOME/.config/vim/coc.vim

map <Leader>\ :NERDTreeToggle<CR>
map <Leader>t :tabnew<CR>
map <Leader>T :tab split<CR>
map <Leader>f :CtrlSF 
map <Leader>F :CtrlSFToggle<CR>
map <Leader>p :CtrlP<CR>

:let mapleader = " "

set number
set relativenumber
set list
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap

packadd minpac
call minpac#init()
call minpac#add('itchyny/lightline.vim')
call minpac#add('neoclide/coc.nvim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('dyng/ctrlsf.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('peitalin/vim-jsx-typescript')
call minpac#add('dracula/vim', {'name': 'dracula'})
call minpac#add('airblade/vim-rooter')
call minpac#add('junegunn/fzf.vim')
call minpac#add('liuchengxu/vista.vim')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('mhinz/vim-mix-format')

" add fzf to rtp
set rtp+=/usr/local/opt/fzf

" format elixir files on save
let g:mix_format_on_save = 1

" various dracula workarounds
" https://github.com/dracula/vim/issues/96
" https://github.com/dracula/vim/issues/143
 packadd! dracula
 let g:dracula_colorterm = 0

 colorscheme dracula

"I deleted these incase something broke
"/Users/dramirez/.vim/pack/minpac/start/syntastic
"/Users/dramirez/.vim/pack/minpac/start/typescript-vim
"/Users/dramirez/.vim/pack/minpac/start/vim
"/Users/dramirez/.vim/pack/minpac/start/vim-tsx
"/Users/dramirez/.vim/pack/minpac/start/vimproc.vim

let g:ctrlp_dotfiles = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set laststatus=2 "Used to correct the issue where lightline does not appear at the bottom
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" COC stfuff
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHold * silent call CocAction('runCommand', 'prettier.formatFile')
map <Leader>np :call CocAction('diagnosticNext')<CR>
map <Leader>pp :call CocAction('diagnosticPrevious')<CR>

source $HOME/.config/vim/coc.vim

map <Leader>t :tabnew<CR>
map <Leader>tx :tabclose<CR>
map <Leader>tc :tab split<CR>
map <Leader>\ :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
map <Leader>f :CtrlSF 
map <Leader>F :CtrlSFToggle<CR>
map <Leader>p :GFiles<CR>
map <Leader>P :Files<CR>
map <Leader>g :CtrlP<CR>
map <Leader>gs :tabnew<CR>:Gstatus<CR>

map <Leader>, :tabnew ~/.vimrc<CR>
map <Leader>< :source ~/.vimrc<CR>
map <Leader>mu :call minpac#update()<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

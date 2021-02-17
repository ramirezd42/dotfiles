:let mapleader = " "

set number
set relativenumber
set list
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set hlsearch
set incsearch
set inccommand=nosplit

packadd minpac
call minpac#init()
call minpac#add('itchyny/lightline.vim')
call minpac#add('neoclide/coc.nvim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('dyng/ctrlsf.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('peitalin/vim-jsx-typescript')
call minpac#add('dracula/vim', {'name': 'dracula'})
call minpac#add('airblade/vim-rooter')
call minpac#add('junegunn/fzf', {'do': 'fzf#install()'})
call minpac#add('junegunn/fzf.vim')
call minpac#add('liuchengxu/vista.vim')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('mhinz/vim-mix-format')
call minpac#add('mengelbrecht/lightline-bufferline')
call minpac#add('jeetsukumaran/vim-buffergator')
call minpac#add('sbdchd/neoformat')
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
call minpac#add('tyru/open-browser.vim')
call minpac#add('tyru/open-browser-github.vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('iamcco/markdown-preview.nvim', {'do': 'packloadall! | call mkdp#util#install()'})

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
let g:NERDTreeGitStatusShowIgnored = 1

" add fzf to rtp
set rtp+=/usr/local/opt/fzf

let g:buffergator_sort_regime = 'mru'
" format elixir files on save
" let g:mix_format_on_save = 1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

nnoremap <esc> :noh<return><esc>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>= :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>- :wincmd =<cr>

let g:ctrlsf_auto_close = {
    \ "normal" : 1,
    \ "compact": 0
    \}
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
let g:ctrlsf_auto_preview = 1

let g:buffergator_viewport_split_policy = 'B'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set laststatus=2 "Used to correct the issue where lightline does not appear at the bottom
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', '%f', 'filename', 'modified' ] ]
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

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" let g:neoformat_typescriptreact_prettier = {
"         \ 'exe': 'prettier',
"         \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
"         \ 'stdin': 1
"         \ }
" let g:neoformat_enabled_typescriptreact = ['tsfmt', 'prettier']
" augroup fmt
"   autocmd!
"   " Craziness to get around weird behavior after undoing https://github.com/sbdchd/neoformat/issues/134
"   au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
" augroup END

map <Leader>n :noh<CR>
map <Leader>ol :CocList outline<CR>
map <Leader>cf :CocFix<CR>
map <Leader>dn :call CocAction('diagnosticNext')<CR>
map <Leader>dp :call CocAction('diagnosticPrevious')<CR>

source $HOME/.config/vim/coc.vim

map <Leader>t :tabnew<CR>
map <Leader>tx :tabclose<CR>
map <Leader>tc :tab split<CR>
map <Leader>\ :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
map <Leader>nr :NERDTreeRefreshRoot<CR>
map <Leader>f :CtrlSF 
map <Leader>F :CtrlSFToggle<CR>
map <Leader>pP :Files<CR>
map <Leader>pp :GFiles<CR>

map <Leader>` :vsplit term://zsh -i<CR>
map <Leader>~ :vsplit term://zsh -i<CR>

map <Leader>y "+y

map <Leader>, :e ~/.vimrc<CR>
map <Leader>< :source ~/.vimrc<CR>
map <Leader>mu :call minpac#update()<CR>
map <silent><expr> <Leader><Leader> coc#refresh()
map <Leader>nh :noh<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Function to source only if file exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceIfExists('~/.vimrc.local')

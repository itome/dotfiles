" 不要なプラグインを停止
let g:loaded_gzip          = 1
let g:loaded_tar           = 1
let g:loaded_tarPlugin     = 1
let g:loaded_zip           = 1
let g:loaded_zipPlugin     = 1
let g:loaded_rrhelper      = 1
let g:loaded_2html_plugin  = 1
let g:loaded_vimball       = 1
let g:loaded_vimballPlugin = 1

" 各種基本設定
set nowritebackup
set updatetime=300
set cmdheight=2
set shortmess+=c
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,ico-2022-jp,sjis,euc-jp,latin1
set completeopt=menuone
set autoread
set t_ut=
set nohlsearch
set incsearch
set formatoptions+=mM
set display+=lastline
set ignorecase
set smartcase
set wrapscan
set showmatch
set showmode
set title
set ruler
set hidden
set nobackup
set number
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set wrap
set clipboard=unnamed
set laststatus=2
if ! isdirectory($HOME.'/.vim/swap')
  call mkdir($HOME.'/.vim/swap', 'p')
endif
set directory=~/.vim/swap
set ambiwidth=double
set wildmenu
set wildmode=longest,full
set noshowmode
set iminsert=0
set imsearch=0
set noimdisable
set noimcmdline
set backspace=indent,eol,start
set lazyredraw

" 起動時のメッセージ非表示
set shortmess& shortmess+=I

" ビープ音を消す
set vb t_vb=
set novisualbell

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-yaml'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-css'
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'html'] }
Plug 'leafgarland/typescript-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'wadackel/nvim-syntax-info'
Plug 'wadackel/vim-dogrun'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'

Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'

Plug 'luochen1990/rainbow'

Plug 'tpope/vim-fugitive'
Plug 'mattn/vim-goimports'
call plug#end()

" rainbow
let g:rainbow_active = 1

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

syntax on
colorscheme dogrun

" fern.vim
let g:fern#renderer = "nerdfont"

" lightline
let g:lightline = {
\ 'colorscheme': 'dogrun',
\ 'active': {
\   'left': [['mode', 'paste'],
\             ['branch', 'readonly', 'filename']],
\   'right': [['lineinfo'],
\             ['percent'],
\             ['cocstatus', 'cocwarning', 'cocerror'],
\             ['fileformat', 'fileencoding', 'filetype']],
\ },
\ 'component': {
\   'lineinfo': '%3l:%-2v ¶',
\ },
\ 'component_expand': {
\   'cocwarning': 'LightlineCocWarning',
\   'cocerror': 'LightlineCocError',
\ },
\ 'component_type': {
\   'cocwarning': 'warning',
\   'cocerror': 'error',
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename',
\   'branch': 'LightlineFugitive',
\   'readonly': 'LightlineReadonly',
\   'cocstatus': 'LightlineCocStatus',
\ },
\ 'separator': { 'left': '', 'right': ''},
\ 'subseparator': { 'left': '❯', 'right': '❮'}
\ }

" Keymap
let mapleader = "\<Space>"
nmap <silent> <leader>aa  <Plug>(coc-codeaction)
nmap <silent> <leader>=   <Plug>(coc-format-selected)
xmap <silent> <leader>=   <Plug>(coc-format-selected)
nmap <silent> <leader>rr  <Plug>(coc-rename)
nmap <silent> <leader>gg  <Plug>(coc-definition)

noremap <silent> <leader>fg  :GFiles .<CR>
noremap <silent> <leader>ff  :Files .<CR>
noremap <silent> <leader>bh  :History<CR>
noremap <silent> <leader>bb  :Buffers<CR>
noremap <silent> <leader>/   :Rg<CR>
noremap <silent> <leader><leader> :Commands<CR>

nnoremap <silent> <leader>ft :Fern . -width=40 -drawer -reveal=% -toggle<CR>

noremap <silent> <leader>ww <c-w>w
noremap <silent> <leader>fs :wa<CR>
noremap <silent> <leader>qq :qa!<CR>

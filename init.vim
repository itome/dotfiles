" Disable unused plugins
let g:loaded_gzip          = 1
let g:loaded_tar           = 1
let g:loaded_tarPlugin     = 1
let g:loaded_zip           = 1
let g:loaded_zipPlugin     = 1
let g:loaded_rrhelper      = 1
let g:loaded_2html_plugin  = 1
let g:loaded_vimball       = 1
let g:loaded_vimballPlugin = 1

" Basic preferences
set termguicolors
set updatetime=100
set shortmess+=c
set encoding=utf-8
set completeopt=menuone,noinsert
set nohls
set autoread
set incsearch
set formatoptions+=mM
set display+=lastline
set ignorecase
set smartcase
set wrapscan
set showmatch
set hidden
set nobackup
set nowritebackup
set number
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed
set laststatus=2
set wildmenu
set wildmode=longest,full
set noshowmode
set iminsert=0
set imsearch=0
set noimdisable
set noimcmdline
set nowrap
set backspace=indent,eol,start
set lazyredraw
set shortmess& shortmess+=I
set vb t_vb=
set signcolumn=yes
set novisualbell
set directory=~/.vim/swap
call mkdir($HOME.'/.vim/swap', 'p')

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dart-lang/dart-vim-plugin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'wadackel/vim-dogrun'
Plug 'itchyny/lightline.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'lambdalisue/fern-git-status.vim'

Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'airblade/vim-gitgutter'

Plug 'rust-lang/rust.vim'
Plug 'uarun/vim-protobuf'
Plug 'machakann/vim-sandwich'
call plug#end()

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
      \  'coc-flutter'
      \, 'coc-json'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-tsserver'
      \, 'coc-eslint'
      \, 'coc-go'
      \, 'coc-rust-analyzer'
      \, 'coc-snippets'
      \, 'coc-vetur'
      \, 'coc-clangd'
      \, 'coc-toml'
      \, 'coc-tailwindcss'
      \, 'coc-pairs'
      \, 'coc-tabnine'
      \, 'coc-yaml'
      \, 'coc-fzf-preview'
      \ ]

syntax enable
colorscheme dogrun

" git gutter
let g:gitgutter_realtime = 1
let g:gitgutter_sign_added = '│ '
let g:gitgutter_sign_modified = '│ '
let g:gitgutter_sign_removed = '│ '
let g:gitgutter_sign_removed_first_line = '│ '
let g:gitgutter_sign_removed_above_and_below = '│ '
let g:gitgutter_sign_modified_removed = '│ '

" rainbow
let g:rainbow_active = 1

" fern.vim
let g:fern#renderer = "devicons"

" fzf_preview
let g:fzf_preview_use_dev_icons = 0

" lightline
let g:lightline = {
\ 'colorscheme': 'dogrun'
\ }

" Golang
au FileType go setlocal sw=4 ts=4 sts=4 noet

" Prettier
au FileType typescript,typescriptreact,javascript,css,html nmap <silent><buffer> <leader>= <Plug>(Prettier)

" Dart
let g:dart_style_guide = 2

" Keymap
let mapleader = "\<Space>"
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-f> <right>
inoremap <C-b> <left>
nmap <silent> <leader>aa  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>=   <Plug>(coc-format)
xmap <silent> <leader>=   <Plug>(coc-format-selected)
nmap <silent> <leader>rr  <Plug>(coc-rename)
nmap <silent> <leader>gg  <Plug>(coc-definition)
nmap <silent> <leader>gd  <Plug>(coc-declaration)
nnoremap <silent> <leader>gr :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> <leader>gt :<C-u>CocCommand fzf-preview.CocTypeDefinitions<CR>
nnoremap <silent> <leader>gi :<C-u>CocCommand fzf-preview.CocImplementations<CR>
nnoremap <silent> <leader>gb :<C-u>CocCommand fzf-preview.Jumps<CR>

noremap <silent> <leader>fh  :<C-u>CocCommand fzf-preview.MruFiles<CR>
noremap <silent> <leader>fg  :<C-u>CocCommand fzf-preview.GitFiles<CR>
noremap <silent> <leader>ff  :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
noremap <silent> <leader>bb  :<C-u>CocCommand fzf-preview.AllBuffers<CR>
noremap <silent> <leader>/   :<C-u>Rg<CR>
noremap <silent> <leader><leader> :<C-u>CocCommand fzf-preview.CommandPalette<CR>
nnoremap <silent> <leader>el    :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
noremap <silent> <leader>gs  :<C-u>LazyGit<CR>

nnoremap <silent> <leader>ft :Fern . -width=40 -drawer -reveal=%<CR>

noremap <silent> <leader>ww <c-w>w
noremap <silent> <leader>wh <c-w>h
noremap <silent> <leader>wl <c-w>l
noremap <silent> <leader>wj <c-w>j
noremap <silent> <leader>wk <c-w>k
noremap <silent> <leader>wd <c-w>q
noremap <silent> <leader>w/ :vsplit<CR>
noremap <silent> <leader>w- :split<CR>
noremap <silent> <leader>fs :wa<CR>
noremap <silent> <leader>qq :qa!<CR>
inoremap <expr><C-j> pumvisible() ? "<Down>" : "<C-j>"
inoremap <expr><C-k> pumvisible() ? "<Up>" : "<C-k>"
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

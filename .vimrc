set nocompatible              " be iMproved, required
filetype off                  " required

colorscheme monokai

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'mileszs/ack.vim'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'shemerey/vim-peepopen'
" React/JS:
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
  "async syntax checking:
  " Plugin 'w0rp/ale'
  Plugin 'skywind3000/asyncrun.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

" let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:ackprg = 'ag --vimgrep'

syntax enable
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set relativenumber
set hlsearch
"for macvim font
set guifont=Menlo\ Regular:h16

" vim-indent-guides plugin settings
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

noremap j gj
noremap k gk
inoremap jj <Esc>`^

" Leader mappings
let mapleader = "\<Space>"
nnoremap <leader>f :Ack 
nnoremap <leader>y yiw
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>t <C-w>T

" Mappings
"   NerdTree
    map <C-n> :NERDTreeToggle<CR>

"Ale async syntax checks config
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

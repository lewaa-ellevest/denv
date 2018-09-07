set nocompatible              " be iMproved, required
set shell=/bin/bash
filetype off                  " required

colorscheme default

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

"line limit guide
set colorcolumn=120
hi ColorColumn ctermbg=darkgrey guibg=darkgrey

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Nerdtree is a file navigator. I have it mapped to ctrl + N below.
Plugin 'scrooloose/nerdtree'

" Autocomplete. Needs set up. cmake I think it is.
Plugin 'valloric/youcompleteme'

" Fuzzy search and nav
Plugin 'wincent/command-t' " Go to plugin dir and run the following command: rake make
Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --group --nocolor' " need: brew install the_silver_searcher
endif
" let g:ackprg = 'ag --vimgrep'
" I used to use:
  " Plugin 'https://github.com/ctrlpvim/ctrlp.vim'

" Commenting
Plugin 'tomtom/tcomment_vim'

" Surrounding things
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'

" Indent guides
Plugin 'nathanaelkane/vim-indent-guides.git'

" Rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" React/JS:
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Async syntax checking:
Plugin 'w0rp/ale'

" Run processes in bg async
" Plugin 'skywind3000/asyncrun.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

" vim-ruby:
let g:ruby_indent_assignment_style = 'variable'

" vim-indent-guides plugin settings
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

" Mappings
noremap j gj
noremap k gk
inoremap jj <Esc>`^

  " Leader mappings
  let mapleader = "\<Space>"
  nnoremap <leader>f :Ack!<Space>-i<Space>''<Left>
  nnoremap <leader>F :Ack!<Space>
  nnoremap <leader>y yiw
  nnoremap <leader>w :w<CR>
  nnoremap <leader>q :q<CR>
  nnoremap <leader>s :AV<CR>
  " nnoremap <leader>t <C-w>T
  " nmap <silent> <Leader>p <Plug>(CommandT)

  " NerdTree
  map <C-n> :NERDTreeToggle<CR>

"Ale async syntax checks config
let g:ale_sign_error = '>' " Less aggressive than the default '>>'
let g:ale_sign_warning = '-'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
  \  'ruby': ['brakeman', 'rails_best_practices', 'reek', 'rubocop', 'ruby'],
  \  'javascript': ['eslint', 'prettier']
  \}
let g:ale_fixers = {
  \  '*': ['remove_trailing_lines', 'trim_whitespace'],
  \  'ruby': ['rufo', 'rubocop']
  \}
autocmd BufWritePre * :%s/\s\+$//e
" let g:ale_javascript_eslint_options={ 'space-before-function-paren': ['error', { 'named': 'never' } ] }
" \  'javascript': ['eslint', 'prettier']
" augroup FiletypeGroup
"   autocmd!
"   au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END

" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

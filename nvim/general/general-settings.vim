set number relativenumber
set directory^=$HOME/.nvim/tmp//

" 2 spaced tab width
set tabstop=2
set shiftwidth=2
set expandtab

" case insensitive search
set ignorecase
set smartcase

" use mouse on vim
set mouse+=a

set nohlsearch
set scrolloff=8

let mapleader=' '

" Autoformat C and CPP files with astyle package
autocmd FileType c,cpp setlocal equalprg=clang-format

" Move code block up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

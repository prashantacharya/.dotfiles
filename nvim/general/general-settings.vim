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
set scrolloff=10

let mapleader=' '

" Autoformat C and CPP files with astyle package
autocmd FileType c,cpp setlocal equalprg=clang-format

"au TextYankPost * silent! lua vim.highlight.on_yank()
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000}

"Git Blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

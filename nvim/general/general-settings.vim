set number relativenumber
set directory^=$HOME/.nvim/tmp//

" 2 spaced tab width
set tabstop=2
set shiftwidth=2
set expandtab

" case insensitive search
set ignorecase

" use mouse on vim
set mouse+=a


" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" switch open buffers easily
nmap <silent> <c-j> :bnext<CR>
nmap <silent> <c-k> :bprevious<CR>

" Global search
nmap <silent> <c-F> :Rg<CR>

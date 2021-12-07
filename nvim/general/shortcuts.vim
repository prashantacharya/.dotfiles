" navigate split screens easily
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-J> :wincmd j<CR>
"nmap <silent> <c-K> :wincmd k<CR>
"nmap <silent> <c-l> :wincmd l<CR>

" switch open buffers 
nmap <silent> <c-J> :bnext<CR>
nmap <silent> <c-K> :bprevious<CR>

" Close current buffer
nmap <silent> <c-w> :bw<CR> 


"=====================================
"      ALLOW GLOBAL COPY PASTE
"=====================================


vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
